package com.example.oneww.oss

import android.content.Context
import android.util.Log
import com.alibaba.sdk.android.oss.ClientConfiguration
import com.alibaba.sdk.android.oss.OSSClient
import com.alibaba.sdk.android.oss.common.auth.OSSStsTokenCredentialProvider
import com.alibaba.sdk.android.oss.model.PutObjectRequest
import java.io.File
import java.util.Locale

/**
 * @author wangling
 * @date 2026/7/6 15:26
 * @description 阿里云oss图片/视频上传到阿里云
 */
class OssUploader(private val context: Context) {
    fun uploadFile(
        filePath: String,
        fileName: String?,
        config: StsConfig,
        onProgress: ((Double) -> Unit)? = null
    ): String {
        val file = File(filePath)
        require(file.exists()) { "File does not exist: $filePath" }

        val objectKey = buildObjectKey(fileName ?: file.name)
        val credentialProvider = OSSStsTokenCredentialProvider(
            config.accessKeyId,
            config.accessKeySecret,
            config.securityToken
        )

        val clientConfig = ClientConfiguration().apply {
            connectionTimeout = 15_000
            socketTimeout = 15_000
            maxConcurrentRequest = 5
            maxErrorRetry = 2
        }

        val ossClient = OSSClient(context, config.endpoint, credentialProvider, clientConfig)
        val request = PutObjectRequest(config.bucketName, objectKey, filePath)
        Log.d("wangling","PutObjectRequest request:"+request.toString())

        onProgress?.invoke(0.35)
        ossClient.putObject(request)
        onProgress?.invoke(0.95)

        return buildFileUrl(config.endpoint, config.bucketName, objectKey)
    }

    private fun buildObjectKey(originalName: String): String {
        val timestamp = System.currentTimeMillis()
        val safeName = originalName.replace(Regex("\\s+"), "_")
        val ext = safeName.substringAfterLast('.', "").lowercase(Locale.getDefault())
        val folder = if (ext in listOf("mp4", "mov", "m4v", "avi")) {
            "circle/videos"
        } else {
            "circle/images"
        }

        return "$folder/$timestamp/$safeName"
    }

    private fun buildFileUrl(endpoint: String, bucketName: String, objectKey: String): String {
        val normalizedEndpoint = endpoint
            .removePrefix("https://")
            .removePrefix("http://")
        return "https://$bucketName.$normalizedEndpoint/$objectKey"
    }
}
