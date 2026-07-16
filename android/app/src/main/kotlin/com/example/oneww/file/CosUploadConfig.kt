package com.example.oneww.file

data class CosUploadConfig(
    val secretId: String,
    val secretKey: String,
    val sessionToken: String,
    val region: String,
    val bucket: String,
)
