package com.example.oneww.cos

import android.content.Context
import android.util.Log
import com.tencent.cos.xml.CosXmlService
import com.tencent.cos.xml.CosXmlServiceConfig
import com.tencent.cos.xml.model.`object`.PutObjectRequest
import com.tencent.qcloud.core.auth.QCloudCredentialProvider
import com.tencent.qcloud.core.auth.QCloudCredentials
import com.tencent.qcloud.core.auth.SessionQCloudCredentials
import java.io.File

/**
 * @author wangling
 * @date 2026/7/7 14:49
 * @description 腾讯云cos图片和视频上传功能实现
 */
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

        val cosXmlService = CosXmlService(context, cosConfig, credentialProvider)

        val request = PutObjectRequest(config.bucket, finalObjectKey, filePath)

        onProgress?.invoke(0.3)
        val result = cosXmlService.putObject(request)
        onProgress?.invoke(0.95)

        val accessUrl = buildFileUrl(config.region, config.bucket, finalObjectKey)
        Log.d("wangling", "COS upload success, eTag=${result.eTag}, url=$accessUrl")
        return accessUrl
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
