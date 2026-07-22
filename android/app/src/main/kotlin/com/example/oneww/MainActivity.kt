package com.example.oneww

import android.util.Log
import com.example.oneww.file.CosUploadException
import com.example.oneww.file.CosUploader
import com.example.oneww.file.FormDataUploadResponse
import com.example.oneww.net.TokenChannel
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.launch
import kotlin.coroutines.resume
import kotlin.coroutines.suspendCoroutine

class MainActivity : FlutterFragmentActivity() {
    private companion object {
        const val UPLOAD_CHANNEL = "tencent_cos_upload"
        const val PROGRESS_CHANNEL = "tencent_cos_upload_progress"
        const val TAG = "MainActivity"
    }

    // 使用 SupervisorJob 确保子协程异常不会影响父协程
    private val activityScope = CoroutineScope(SupervisorJob() + Dispatchers.Main)

    private var progressSink: EventChannel.EventSink? = null
    private lateinit var cosUploader: CosUploader

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        cosUploader = CosUploader(applicationContext)

        // 初始化 Token 同步通道（接收 Flutter 同步的登录 token）
        TokenChannel(flutterEngine)

        EventChannel(flutterEngine.dartExecutor.binaryMessenger, PROGRESS_CHANNEL)
            .setStreamHandler(
                object : EventChannel.StreamHandler {
                    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                        progressSink = events
                    }

                    override fun onCancel(arguments: Any?) {
                        progressSink = null
                    }
                }
            )

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, UPLOAD_CHANNEL)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "uploadFile" -> {
                        // 从 Flutter 端获取凭证和文件信息
                        val path = call.argument<String>("path")
                        val fileName = call.argument<String>("fileName")
                        val secretId = call.argument<String>("secretId")
                        val secretKey = call.argument<String>("secretKey")
                        val sessionToken = call.argument<String>("sessionToken")
                        val region = call.argument<String>("region")
                        val bucket = call.argument<String>("bucket")
                        val endpoint = call.argument<String>("endpoint")
                        val filePath = call.argument<String>("filePath")
                        val startTime = call.argument<String>("startTime")
                        val expiredTime = call.argument<String>("expiredTime")
                        val objectKey = call.argument<String>("objectKey")

                        Log.d(TAG, "uploadFile 请求: path=$path, fileName=$fileName")
                        Log.d(TAG, "凭证信息: secretId=${secretId?.take(8)}..., region=$region, bucket=$bucket")

                        // 参数校验
                        if (path.isNullOrBlank()) {
                            result.error("INVALID_ARGS", "文件路径不能为空", null)
                            return@setMethodCallHandler
                        }

                        if (secretId.isNullOrBlank() || secretKey.isNullOrBlank() || sessionToken.isNullOrBlank()) {
                            result.error("INVALID_ARGS", "上传凭证不完整", null)
                            return@setMethodCallHandler
                        }

                        if (region.isNullOrBlank() || bucket.isNullOrBlank() || endpoint.isNullOrBlank()) {
                            result.error("INVALID_ARGS", "COS 配置不完整", null)
                            return@setMethodCallHandler
                        }

                        // 构建 FormDataUploadResponse（Flutter 已获取凭证，直接使用）
                        val formDataResponse = FormDataUploadResponse(
                            accessKeyId = null,
                            endpoint = endpoint,
                            expiredTime = expiredTime ?: "",
                            filePath = filePath,
                            policy = null,
                            requestId = null,
                            secretId = secretId,
                            secretKey = secretKey,
                            sessionToken = sessionToken,
                            signMap = null,
                            signature = null,
                            startTime = startTime ?: ""
                        )

                        // 启动协程执行上传
                        activityScope.launch {
                            try {
                                postProgress(0.1)

                                Log.d(TAG, "开始上传文件到 COS...")

                                // 执行文件上传
                                val uploadedUrl = uploadFileToCos(
                                    srcPath = path,
                                    fileName = fileName,
                                    response = formDataResponse,
                                    objectKey = objectKey
                                )

                                // 上传成功
                                postProgress(1.0)
                                Log.d(TAG, "上传成功: $uploadedUrl")
                                result.success(uploadedUrl)

                            } catch (e: CosUploadException) {
                                Log.e(TAG, "上传失败: ${e.message}")
                                result.error("UPLOAD_FAILED", e.message, null)

                            } catch (e: Exception) {
                                Log.e(TAG, "上传异常: ${e.message}", e)
                                result.error("UPLOAD_EXCEPTION", e.message ?: "未知错误", e.toString())
                            }
                        }
                    }

                    "getUploadCredential" -> {
                        // 仅获取上传凭证（保留用于不需要 Flutter 传凭证的场景）
                        activityScope.launch {
                            try {
                                postProgress(0.5)
                                val formDataUploadData = getFormDataUploadResponse()
                                postProgress(1.0)

                                if (formDataUploadData != null) {
                                    val credentialMap = mapOf(
                                        "endpoint" to formDataUploadData.endpoint,
                                        "filePath" to formDataUploadData.filePath,
                                        "secretId" to formDataUploadData.secretId,
                                        "secretKey" to formDataUploadData.secretKey,
                                        "sessionToken" to formDataUploadData.sessionToken,
                                        "startTime" to formDataUploadData.startTime,
                                        "expiredTime" to formDataUploadData.expiredTime
                                    )
                                    result.success(credentialMap)
                                } else {
                                    result.error("GET_CREDENTIAL_FAILED", "获取上传凭证失败", null)
                                }
                            } catch (e: Exception) {
                                result.error("GET_CREDENTIAL_EXCEPTION", e.message, null)
                            }
                        }
                    }

                    else -> result.notImplemented()
                }
            }
    }

    /**
     * 获取文件上传凭证（Android 端自己获取，仅在特殊场景使用）
     */
    private suspend fun getFormDataUploadResponse(): FormDataUploadResponse? {
        return suspendCoroutine { continuation ->
            // 由于 Android 端无法直接调用 API 获取凭证，这里返回 null
            // 正常流程应该由 Flutter 端获取凭证后传递给 Android
            continuation.resume(null)
        }
    }

    /**
     * 执行文件上传到腾讯云 COS
     */
    private suspend fun uploadFileToCos(
        srcPath: String,
        fileName: String?,
        response: FormDataUploadResponse,
        objectKey: String?
    ): String {
        return cosUploader.uploadFile(
            srcPath = srcPath,
            fileName = fileName,
            response = response,
            objectKey = objectKey,
            onProgress = { progress ->
                // 将进度转换到 0.1~1.0 范围
                val adjustedProgress = 0.1 + (progress * 0.9)
                postProgress(adjustedProgress)
            }
        )
    }

    /**
     * 发送上传进度到 Flutter
     */
    private fun postProgress(value: Double) {
        activityScope.launch {
            progressSink?.success(value.coerceIn(0.0, 1.0))
        }
    }

    override fun onDestroy() {
        progressSink = null
        super.onDestroy()
    }
}
