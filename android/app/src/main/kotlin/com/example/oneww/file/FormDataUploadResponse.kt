package com.example.oneww.file

data class FormDataUploadResponse(
    val secretId: String,
    val endpoint: String,
    val expiredTime: String,
    val filePath: String,
    val sessionToken: String,
    val secretKey: String,
    val startTime: String
)