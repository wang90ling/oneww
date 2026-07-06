package com.example.oneww.oss

data class StsConfig(
    val endpoint: String,
    val bucketName: String,
    val accessKeyId: String,
    val accessKeySecret: String,
    val securityToken: String
)