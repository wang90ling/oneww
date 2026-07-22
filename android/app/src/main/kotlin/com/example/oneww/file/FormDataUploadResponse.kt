package com.example.oneww.file

data class FormDataUploadResponse(
    val accessKeyId: String?,
    val endpoint: String,
    val expiredTime: String,
    val filePath: String?,
    val policy: String?,
    val requestId: String?,
    val secretId: String?,
    val secretKey: String?,
    val sessionToken: String?,
    val signMap: String?,
    val signature: String?,
    val startTime: String
)