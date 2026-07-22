package com.example.oneww.file

import android.content.Context
import android.util.Log
import com.tencent.cos.xml.CosXmlService
import com.tencent.cos.xml.CosXmlServiceConfig
import com.tencent.cos.xml.exception.CosXmlClientException
import com.tencent.cos.xml.exception.CosXmlServiceException
import com.tencent.cos.xml.listener.CosXmlResultListener
import com.tencent.cos.xml.model.CosXmlRequest
import com.tencent.cos.xml.model.CosXmlResult
import com.tencent.cos.xml.model.`object`.PutObjectRequest
import com.tencent.cos.xml.transfer.TransferConfig
import com.tencent.cos.xml.transfer.TransferManager
import com.tencent.qcloud.core.auth.SessionQCloudCredentials
import kotlinx.coroutines.suspendCancellableCoroutine
import java.io.File
import kotlin.coroutines.resume
import kotlin.coroutines.resumeWithException

/**
 * 腾讯云 COS 上传工具类
 * 使用 Kotlin Coroutines 实现真正的异步上传
 */
class CosUploader(private val context: Context) {

    /**
     * 异步上传文件到腾讯云 COS
     * @param srcPath 本地文件路径
     * @param fileName 原始文件名（用于生成 COS 对象键）
     * @param response 从服务端获取的上传凭证
     * @param objectKey 自定义的对象存储路径（可选，如果提供则优先使用）
     * @param onProgress 进度回调 (0.0 ~ 1.0)
     * @return 上传成功后的文件访问 URL
     * @throws CosUploadException 上传失败时抛出异常
     */
    suspend fun uploadFile(
        srcPath: String,
        fileName: String?,
        response: FormDataUploadResponse,
        objectKey: String? = null,
        onProgress: ((Double) -> Unit)? = null
    ): String = suspendCancellableCoroutine { continuation ->
        val file = File(srcPath)
        val originalFileName = fileName ?: file.name
        val filename = (System.currentTimeMillis().toString() + (Math.random() * 1000).toInt()
            .toString()).substring(5) + "_" + file.name

        val cosPath = response.filePath + "/" + filename

        // 2、解析凭证
        val startTime = response.startTime.toLongOrNull() ?: (System.currentTimeMillis() / 1000)
        val expiredTime = response.expiredTime.toLongOrNull() ?: (startTime + 3600)
        val tmpSecretId = response.secretId ?: ""
        val tmpSecretKey = response.secretKey ?: ""
        val sessionToken = response.sessionToken ?: ""

        // 3、解析 endpoint 获取 bucket 和 region
        val (bucket, region) = parseEndpoint(response.endpoint)

        Log.d(TAG, "uploadFile: 开始上传")
        Log.d(TAG, "  - srcPath: $srcPath")
        Log.d(TAG, "  - cosPath: $cosPath")
        Log.d(TAG, "  - bucket: $bucket")
        Log.d(TAG, "  - region: $region")
        Log.d(TAG, "  - tmpSecretId: ${tmpSecretId.take(8)}...")
        Log.d(TAG, "  - sessionToken: ${sessionToken.take(8)}...")

        // 4、初始化 COS SDK
        val cosXmlServiceConfig = CosXmlServiceConfig.Builder()
            .setRegion(region)
            .isHttps(true)
            .builder()

        val cosXmlService = CosXmlService(context, cosXmlServiceConfig)
        val transferConfig = TransferConfig.Builder().build()
        val transferManager = TransferManager(cosXmlService, transferConfig)

        // 5、创建上传请求
        val putRequest = PutRequest(
            bucket,
            cosPath,
            srcPath,
            tmpSecretId,
            tmpSecretKey,
            sessionToken,
            startTime,
            expiredTime
        )

        // 6、执行上传
        val uploadTask = transferManager.upload(putRequest, null)

        // 7、设置上传进度回调
        uploadTask.setCosXmlProgressListener { complete, _ ->
            Log.d(TAG, "上传进度: ${(complete * 100).toInt()}%")
            onProgress?.invoke(complete.toDouble())
        }

        // 8、设置返回结果回调
        uploadTask.setCosXmlResultListener(object : CosXmlResultListener {
            override fun onSuccess(request: CosXmlRequest?, result: CosXmlResult?) {
                val uploadedUrl = buildResultUrl(bucket, region, cosPath)
                Log.d(TAG, "上传成功: $uploadedUrl")
                onProgress?.invoke(1.0)
                continuation.resume(uploadedUrl.replace("https://dianta-app-1334254576.cos.ap-beijing.myqcloud.com/",""))
            }

            override fun onFail(
                request: CosXmlRequest?,
                clientException: CosXmlClientException?,
                serviceException: CosXmlServiceException?
            ) {
                val errorMsg = when {
                    clientException != null -> "客户端错误: ${clientException.message}"
                    serviceException != null -> "服务端错误: ${serviceException.message}"
                    else -> "未知错误"
                }
                Log.e(TAG, "上传失败: $errorMsg")
                continuation.resumeWithException(CosUploadException(errorMsg))
            }
        })

        // 9、处理协程取消
        continuation.invokeOnCancellation {
            Log.d(TAG, "上传任务已取消")
            uploadTask.cancel()
        }
    }

    /**
     * 构建 COS 对象存储路径
     * 优先级：objectKey > (filePath + 自动生成文件名) > 自动生成文件名
     */
    private fun buildCosPath(basePath: String?, originalFileName: String, customKey: String?): String {
        // 如果有自定义路径，直接使用
        if (!customKey.isNullOrBlank()) {
            return customKey.removePrefix("/")
        }

        // 生成文件名：时间戳_随机数_原文件名
        val timestamp = System.currentTimeMillis()
        val randomSuffix = (Math.random() * 1000).toInt()
        val extension = originalFileName.substringAfterLast('.', "")
        val baseName = originalFileName.substringBeforeLast('.', originalFileName)
        val generatedFileName = "${timestamp}_${randomSuffix}_$baseName${if (extension.isNotEmpty()) ".$extension" else ""}"

        // 拼接完整路径
        return if (basePath.isNullOrBlank()) {
            generatedFileName
        } else {
            "${basePath.removeSuffix("/")}/$generatedFileName"
        }
    }

    /**
     * 解析 endpoint 获取 bucket 和 region
     * endpoint 格式: https://bucketname.cos.region.myqcloud.com
     */
    private fun parseEndpoint(endpoint: String): Pair<String, String> {
        return try {
            val withoutScheme = endpoint.removePrefix("https://").removePrefix("http://")
            val parts = withoutScheme.split(".")
            if (parts.size >= 3) {
                Pair(parts[0], parts[2])
            } else {
                Log.w(TAG, "parseEndpoint: 无法解析 endpoint: $endpoint，使用默认值")
                Pair(DEFAULT_BUCKET, DEFAULT_REGION)
            }
        } catch (e: Exception) {
            Log.e(TAG, "parseEndpoint: 解析失败: ${e.message}")
            Pair(DEFAULT_BUCKET, DEFAULT_REGION)
        }
    }

    /**
     * 构建最终的文件访问 URL
     */
    private fun buildResultUrl(bucket: String, region: String, cosPath: String): String {
        return "https://$bucket.cos.$region.myqcloud.com/$cosPath"
    }

    companion object {
        private const val TAG = "CosUploader"
        private const val DEFAULT_BUCKET = "dianta-app-1334254576"
        private const val DEFAULT_REGION = "ap-beijing"
    }
}

/**
 * 扩展 PutObjectRequest，添加临时凭证支持
 */
private class PutRequest(
    bucket: String,
    cosPath: String,
    srcPath: String,
    secretId: String,
    secretKey: String,
    sessionToken: String,
    startTime: Long,
    expiredTime: Long
) : PutObjectRequest(bucket, cosPath, srcPath) {
    init {
        val credentials = SessionQCloudCredentials(
            secretId,
            secretKey,
            sessionToken,
            startTime,
            expiredTime
        )
        setCredential(credentials)
    }
}

/**
 * COS 上传异常
 */
class CosUploadException(message: String) : Exception(message)
