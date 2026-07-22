package com.example.oneww.net

import android.content.Context
import android.media.tv.interactive.AppLinkInfo
import android.util.Log
import com.example.oneww.config.ApiConfig
import com.example.oneww.utils.TokenStorage
import org.json.JSONObject

/**
 * API 服务接口
 * 提供所有业务接口的统一调用入口
 */
class ApiService private constructor(context: Context) {

    private val httpClient = HttpClient.getInstance(context)
    private val baseUrl = ApiConfig.BASE_URL

    companion object {
        @Volatile
        private var instance: ApiService? = null

        fun getInstance(context: Context): ApiService {
            return instance ?: synchronized(this) {
                instance ?: ApiService(context.applicationContext).also {
                    instance = it
                }
            }
        }
    }

    // ==================== 用户相关接口 ====================

    /**
     * 获取用户详情
     */
    suspend fun getUserInfo(): ApiState<JSONObject?> {
        val url = "$baseUrl/user/detail"
        val result = httpClient.get(url, null, null) { json ->
            json.optJSONObject("data")
        }
        @Suppress("UNCHECKED_CAST")
        return result as ApiState<JSONObject?>
    }

    // ==================== 文件上传相关接口 ====================

    /**
     * 获取文件上传凭证（FormData上传）
     * @param bucketType 存储桶类型
     * @param fileName 文件名
     */
    suspend fun formDataUpload(
        bucketType: String = "ACCOMPANY",
    ): ApiState<JSONObject?> {
        val url = "$baseUrl/file/formDataUpload"
        val params = mapOf(
            "bucketType" to bucketType,
        )

        // 从 TokenStorage 读取 token 并构建请求头，与 Flutter 端保持一致
        val token = TokenStorage.getAuthorizationHeader()
        Log.d("wangling", "formDataUpload token: "+token)
        val headers = buildAppHeaders(token)
        Log.d("wangling", "formDataUpload headers: "+headers)

        val result = httpClient.postJson(url, params, headers) { json ->
            json.optJSONObject("data")
        }
        @Suppress("UNCHECKED_CAST")
        return result as ApiState<JSONObject?>
    }

    /**
     * 构建应用请求头（与 Flutter 端 headers 保持一致）
     * @param token 认证 token（可选）
     */
    private fun buildAppHeaders(token: String?): Map<String, String> {
        return buildMap {
            put(ApiConfig.HEADER_CONTENT_TYPE, ApiConfig.CONTENT_TYPE_JSON)
            put(ApiConfig.HEADER_ACCEPT, "application/json")
            put(ApiConfig.HEADER_X_DEVICE, ApiConfig.DEVICE_APP)
            if (!token.isNullOrBlank()) {
                put(ApiConfig.HEADER_AUTHORIZATION, token)
            }
        }
    }
}
