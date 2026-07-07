package com.example.oneww.cos

data class CosUploadConfig(
    val secretId: String,
    val secretKey: String,
    val sessionToken: String,
    val region: String,
    val bucket: String,
)
