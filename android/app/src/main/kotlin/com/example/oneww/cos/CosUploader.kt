package com.example.oneww.cos

import android.content.Context
import android.util.Log
import com.tencent.cos.xml.CosXmlService
import com.tencent.cos.xml.CosXmlServiceConfig
import com.tencent.cos.xml.exception.CosXmlClientException
import com.tencent.cos.xml.exception.CosXmlServiceException
import com.tencent.cos.xml.listener.CosXmlProgressListener
import com.tencent.cos.xml.listener.CosXmlResultListener
import com.tencent.cos.xml.model.CosXmlRequest
import com.tencent.cos.xml.model.CosXmlResult
import com.tencent.cos.xml.model.`object`.PutObjectRequest
import com.tencent.cos.xml.model.`object`.UploadPartRequest
import com.tencent.qcloud.core.auth.QCloudCredentialProvider
import com.tencent.qcloud.core.auth.QCloudCredentials
import com.tencent.qcloud.core.auth.SessionQCloudCredentials
import java.io.File

class CosUploader(private val context: Context) {
    fun uploadFile(
        filePath: String,
        fileName: String?,
        config: CosUploadConfig,
        objectKey: String? = null,
        onProgress: ((Double) -> Unit)? = null
    ): String {
        val file = File(filePath)
        require(file.exists()) { "File does not exist: $filePath" }

        val finalObjectKey = if (!objectKey.isNullOrBlank()) {
            objectKey
        } else {
            buildObjectKey(fileName ?: file.name)
        }

        Log.d("wangling", "COS init - region: ${config.region}, bucket: ${config.bucket}, key: $finalObjectKey")

        val cosConfig = CosXmlServiceConfig.Builder()
            .setRegion(config.region)
            .isHttps(true)
            .builder()

        val credentialProvider = object : QCloudCredentialProvider {
            override fun getCredentials(): QCloudCredentials {
                return SessionQCloudCredentials(
                    config.secretId,
                    config.secretKey,
                    config.sessionToken,
                    System.currentTimeMillis() / 1000,
                    System.currentTimeMillis() / 1000 + 3600
                )
            }

            override fun refresh() {}
        }

        val cosService = CosXmlService(context, cosConfig, credentialProvider)

        val putRequest = PutObjectRequest(config.bucket, finalObjectKey, filePath)
        putRequest.setProgressListener(object : CosXmlProgressListener {
            override fun onProgress(complete: Long, target: Long) {
                val progress = if (target > 0) complete.toDouble() / target.toDouble() else 0.0
                onProgress?.invoke(progress)
                Log.d("wangling", "COS upload progress: ${(progress * 100).toInt()}%")
            }
        })

        val resultUrl = arrayOfNulls<String>(1)
        val exception = arrayOfNulls<Exception>(1)
        val lock = Object()

        cosService.putObjectAsync(putRequest, object : CosXmlResultListener {
            override fun onSuccess(request: CosXmlRequest, result: CosXmlResult) {
                val accessUrl = buildFileUrl(config.region, config.bucket, finalObjectKey)
                resultUrl[0] = accessUrl
                Log.d("wangling", "COS upload success: cosPath=$finalObjectKey, url=$accessUrl")
                synchronized(lock) { lock.notify() }
            }

            override fun onFail(request: CosXmlRequest, clientException: CosXmlClientException?, serviceException: CosXmlServiceException?) {
                val error = serviceException ?: clientException
                Log.e("wangling", "COS upload fail: cosErrorCode=${error?.message}", error)
                exception[0] = error as? Exception ?: RuntimeException("Upload failed")
                synchronized(lock) { lock.notify() }
            }
        })

        synchronized(lock) {
            try {
                lock.wait(60000)
            } catch (e: InterruptedException) {
                throw RuntimeException("Upload timeout", e)
            }
        }

        if (exception[0] != null) {
            throw exception[0]!!
        }

        return resultUrl[0] ?: throw RuntimeException("Upload result is null")
    }

    private fun buildObjectKey(originalName: String): String {
        val timestamp = System.currentTimeMillis()
        val safeName = originalName.replace(Regex("\\s+"), "_")
        val ext = safeName.substringAfterLast('.', "").lowercase()
        val folder = if (ext in listOf("mp4", "mov", "m4v", "avi")) {
            "circle/videos"
        } else {
            "circle/images"
        }
        return "$folder/$timestamp/$safeName"
    }

    private fun buildFileUrl(region: String, bucket: String, objectKey: String): String {
        return "https://$bucket.cos.$region.myqcloud.com/$objectKey"
    }
}
