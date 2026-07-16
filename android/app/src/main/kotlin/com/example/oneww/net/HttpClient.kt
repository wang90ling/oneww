package com.example.oneww.net

import android.content.Context
import android.util.Log
import com.example.oneww.config.ApiConfig
import com.example.oneww.utils.TokenManager
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import okhttp3.*
import okhttp3.MediaType.Companion.toMediaType
import okhttp3.RequestBody.Companion.toRequestBody
import org.json.JSONArray
import org.json.JSONObject
import okio.Buffer
import java.io.IOException
import java.util.concurrent.TimeUnit

/**
 * HTTP 客户端封装类
 * 提供 GET、POST 请求方法，自动处理 Token 注入和响应解析
 */
class HttpClient private constructor(context: Context) {

    private val tokenManager = TokenManager.getInstance(context)
    private val okHttpClient: OkHttpClient
    private val jsonMediaType = "application/json; charset=utf-8".toMediaType()

    init {
        okHttpClient = OkHttpClient.Builder()
            .connectTimeout(ApiConfig.CONNECT_TIMEOUT, TimeUnit.MILLISECONDS)
            .readTimeout(ApiConfig.READ_TIMEOUT, TimeUnit.MILLISECONDS)
            .writeTimeout(ApiConfig.WRITE_TIMEOUT, TimeUnit.MILLISECONDS)
            .addInterceptor(LogInterceptor())
            .addInterceptor(AuthInterceptor())
            .retryOnConnectionFailure(true)
            .build()
    }

    companion object {
        @Volatile
        private var instance: HttpClient? = null

        fun getInstance(context: Context): HttpClient {
            return instance ?: synchronized(this) {
                instance ?: HttpClient(context.applicationContext).also {
                    instance = it
                }
            }
        }
    }

    /**
     * GET 请求
     * @param parser 解析回调，返回需要的数据
     */
    suspend fun get(
        url: String,
        params: Map<String, Any?>? = null,
        headers: Map<String, String>? = null,
        parser: (JSONObject) -> Any?
    ): ApiState<Any?> = withContext(Dispatchers.IO) {
        try {
            val requestUrl = buildUrl(url, params)
            val request = buildRequest(requestUrl, null, headers, HttpMethod.GET)

            if (ApiConfig.DEBUG) {
                Log.d(ApiConfig.TAG, "GET Request: $requestUrl")
            }

            okHttpClient.newCall(request).execute().use { response ->
                parseResponse(response, parser)
            }
        } catch (e: IOException) {
            Log.e(ApiConfig.TAG, "GET 请求失败", e)
            ApiState.Exception(e)
        } catch (e: Exception) {
            Log.e(ApiConfig.TAG, "GET 请求异常", e)
            ApiState.Exception(e)
        }
    }

    /**
     * POST 请求（JSON Body）
     * @param parser 解析回调，返回需要的数据
     */
    suspend fun postJson(
        url: String,
        body: Map<String, Any?>? = null,
        headers: Map<String, String>? = null,
        parser: (JSONObject) -> Any?
    ): ApiState<Any?> = withContext(Dispatchers.IO) {
        try {
            val jsonBody = body?.let { mapToJson(it) }
            val requestBody = jsonBody?.toRequestBody(jsonMediaType)
            val request = buildRequest(url, requestBody, headers, HttpMethod.POST)

            if (ApiConfig.DEBUG) {
                Log.d(ApiConfig.TAG, "POST Request: $url, Body: $jsonBody")
            }

            okHttpClient.newCall(request).execute().use { response ->
                parseResponse(response, parser)
            }
        } catch (e: IOException) {
            Log.e(ApiConfig.TAG, "POST 请求失败", e)
            ApiState.Exception(e)
        } catch (e: Exception) {
            Log.e(ApiConfig.TAG, "POST 请求异常", e)
            ApiState.Exception(e)
        }
    }

    /**
     * POST 请求（Form 表单）
     * @param parser 解析回调，返回需要的数据
     */
    suspend fun postForm(
        url: String,
        params: Map<String, Any?>? = null,
        headers: Map<String, String>? = null,
        parser: (JSONObject) -> Any?
    ): ApiState<Any?> = withContext(Dispatchers.IO) {
        try {
            val formBuilder = FormBody.Builder()
            params?.forEach { (key, value) ->
                value?.let { formBuilder.add(key, it.toString()) }
            }
            val requestBody = formBuilder.build()
            val request = buildRequest(url, requestBody, headers, HttpMethod.POST)

            if (ApiConfig.DEBUG) {
                Log.d(ApiConfig.TAG, "POST Form Request: $url, Params: $params")
            }

            okHttpClient.newCall(request).execute().use { response ->
                parseResponse(response, parser)
            }
        } catch (e: IOException) {
            Log.e(ApiConfig.TAG, "POST Form 请求失败", e)
            ApiState.Exception(e)
        } catch (e: Exception) {
            Log.e(ApiConfig.TAG, "POST Form 请求异常", e)
            ApiState.Exception(e)
        }
    }

    /**
     * 构建完整 URL
     */
    private fun buildUrl(baseUrl: String, params: Map<String, Any?>?): String {
        if (params.isNullOrEmpty()) return baseUrl

        val queryString = params.entries
            .filter { it.value != null }
            .joinToString("&") { (key, value) ->
                "$key=${value.toString().encodeUrl()}"
            }

        return if (baseUrl.contains("?")) {
            "$baseUrl&$queryString"
        } else {
            "$baseUrl?$queryString"
        }
    }

    /**
     * 构建 Request 对象
     */
    private fun buildRequest(
        url: String,
        body: RequestBody?,
        headers: Map<String, String>?,
        method: String
    ): Request {
        val builder = Request.Builder().url(url)

        // 添加默认请求头
        builder.addHeader(ApiConfig.HEADER_CONTENT_TYPE, ApiConfig.CONTENT_TYPE_JSON)
        builder.addHeader(ApiConfig.HEADER_ACCEPT, "application/json")
        builder.addHeader(ApiConfig.HEADER_X_DEVICE, ApiConfig.DEVICE_APP)

        // 添加自定义请求头
        headers?.forEach { (key, value) ->
            builder.addHeader(key, value)
        }

        return when (method) {
            HttpMethod.GET -> builder.get().build()
            HttpMethod.POST -> builder.post(body ?: "".toRequestBody(jsonMediaType)).build()
            else -> builder.post(body ?: "".toRequestBody(jsonMediaType)).build()
        }
    }

    /**
     * 解析响应
     */
    private fun parseResponse(response: Response, parser: (JSONObject) -> Any?): ApiState<Any?> {
        if (!response.isSuccessful) {
            return when (response.code) {
                401 -> ApiState.Error(response.code, "认证失败，请重新登录")
                else -> ApiState.Error(response.code, "服务器错误: ${response.code}")
            }
        }

        return try {
            val body = response.body?.string()
            if (body.isNullOrBlank()) {
                return ApiState.Error(response.code, "响应数据为空")
            }

            if (ApiConfig.DEBUG) {
                Log.d(ApiConfig.TAG, "Response: $body")
            }

            val json = JSONObject(body)
            val code = json.optInt("code", -1)
            val message = json.optString("message", "")

            // 如果 code 不为 0 或 200，视为错误
            if (code != 0 && code != 200) {
                return ApiState.Error(code, message, body)
            }

            // 使用解析器解析数据
            val result = parser(json)
            ApiState.Success(result)
        } catch (e: Exception) {
            Log.e(ApiConfig.TAG, "响应解析失败", e)
            ApiState.Exception(e)
        }
    }

    /**
     * Map 转 JSON 字符串
     */
    private fun mapToJson(map: Map<String, Any?>): String {
        val json = JSONObject()
        map.forEach { (key, value) ->
            when (value) {
                null -> json.put(key, JSONObject.NULL)
                is String -> json.put(key, value)
                is Number -> json.put(key, value)
                is Boolean -> json.put(key, value)
                is List<*> -> json.put(key, value.toJsonArray())
                is Map<*, *> -> json.put(key, (value as Map<String, Any?>).toJsonObject())
                else -> json.put(key, value.toString())
            }
        }
        return json.toString()
    }

    /**
     * List 转 JSONArray
     */
    private fun List<*>.toJsonArray(): JSONArray {
        val array = JSONArray()
        forEach { item ->
            when (item) {
                null -> array.put(JSONObject.NULL)
                is String -> array.put(item)
                is Number -> array.put(item)
                is Boolean -> array.put(item)
                is List<*> -> array.put(item.toJsonArray())
                is Map<*, *> -> array.put((item as Map<String, Any?>).toJsonObject())
                else -> array.put(item.toString())
            }
        }
        return array
    }

    /**
     * Map 转 JSONObject
     */
    private fun Map<String, Any?>.toJsonObject(): JSONObject {
        val json = JSONObject()
        forEach { (key, value) ->
            when (value) {
                null -> json.put(key, JSONObject.NULL)
                is String -> json.put(key, value)
                is Number -> json.put(key, value)
                is Boolean -> json.put(key, value)
                is List<*> -> json.put(key, value.toJsonArray())
                is Map<*, *> -> json.put(key, (value as Map<String, Any?>).toJsonObject())
                else -> json.put(key, value.toString())
            }
        }
        return json
    }

    /**
     * URL 编码
     */
    private fun String.encodeUrl(): String {
        return java.net.URLEncoder.encode(this, "UTF-8")
    }
}

/**
 * HTTP 方法枚举
 */
object HttpMethod {
    const val GET = "GET"
    const val POST = "POST"
    const val PUT = "PUT"
    const val DELETE = "DELETE"
}

/**
 * 日志拦截器
 */
internal class LogInterceptor : Interceptor {
    override fun intercept(chain: Interceptor.Chain): Response {
        val request = chain.request()
        val startTime = System.nanoTime()

        if (ApiConfig.DEBUG) {
            Log.d(ApiConfig.TAG, "==> ${request.method} ${request.url}")
            request.body?.let { body ->
                val buffer = Buffer()
                body.writeTo(buffer)
                Log.d(ApiConfig.TAG, "Request Body: ${buffer.readUtf8()}")
            }
        }

        val response = chain.proceed(request)
        val endTime = System.nanoTime()
        val duration = (endTime - startTime) / 1_000_000

        if (ApiConfig.DEBUG) {
            Log.d(ApiConfig.TAG, "<== ${response.code} (${duration}ms) ${request.url}")
        }

        return response
    }
}

/**
 * 认证拦截器
 * 自动注入 Token 到请求头
 */
internal class AuthInterceptor : Interceptor {
    override fun intercept(chain: Interceptor.Chain): Response {
        val originalRequest = chain.request()
        val tokenManager = TokenManager.getInstance(AppContextProvider.get())

        val token = tokenManager.getAuthorizationHeader()

        if (token.isNullOrBlank()) {
            return chain.proceed(originalRequest)
        }

        val authenticatedRequest = originalRequest.newBuilder()
            .header(ApiConfig.HEADER_AUTHORIZATION, token)
            .build()

        return chain.proceed(authenticatedRequest)
    }
}

/**
 * Application Context Provider
 * 用于在非 Activity/Fragment 环境获取 Context
 */
object AppContextProvider {
    private var context: Context? = null

    fun init(context: Context) {
        this.context = context.applicationContext
    }

    fun get(): Context {
        return context ?: throw IllegalStateException("ApplicationContext not initialized")
    }
}
