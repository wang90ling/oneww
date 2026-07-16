package com.example.oneww.config

/**
 * API 配置类
 * 统一管理 API 的基础 URL、请求头、超时时间等配置
 */
object ApiConfig {

    // 基础 URL
    const val BASE_URL = "https://apitest.dianta.pw/app"

    // 是否开启 Debug 模式
    const val DEBUG = true

    // 请求头 Key
    const val HEADER_CONTENT_TYPE = "Content-Type"
    const val HEADER_ACCEPT = "Accept"
    const val HEADER_X_DEVICE = "x-device"
    const val HEADER_AUTHORIZATION = "Authorization"

    // 请求头默认值
    const val CONTENT_TYPE_JSON = "application/json"
    const val DEVICE_APP = "APP"

    // 超时时间配置（毫秒）
    const val CONNECT_TIMEOUT = 30_000L  // 30秒
    const val READ_TIMEOUT = 30_000L     // 30秒
    const val WRITE_TIMEOUT = 30_000L    // 30秒

    // 日志 Tag
    const val TAG = "ApiClient"
}