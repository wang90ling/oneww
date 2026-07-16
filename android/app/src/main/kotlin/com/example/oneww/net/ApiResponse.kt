package com.example.oneww.net

import org.json.JSONObject

/**
 * API 响应状态
 */
sealed class ApiState<out T> {
    data class Success<T>(val data: T) : ApiState<T>()
    data class Error(val code: Int, val message: String, val rawData: String? = null) : ApiState<Nothing>()
    data class Exception(val throwable: Throwable) : ApiState<Nothing>()

    val isSuccess: Boolean get() = this is Success
    val isError: Boolean get() = this is Error
    val isException: Boolean get() = this is Exception
}

/**
 * API 响应数据类
 */
data class ApiResponse<T>(
    val code: Int,
    val message: String,
    val data: T?,
    val requestId: String? = null
) {
    val isSuccess: Boolean get() = code == 0 || code == 200

    companion object {
        fun <T> success(data: T, code: Int = 0, message: String = "success"): ApiResponse<T> {
            return ApiResponse(code, message, data)
        }

        fun <T> error(code: Int, message: String): ApiResponse<T> {
            return ApiResponse(code, message, null)
        }

        /**
         * 从 JSON 字符串解析响应
         */
        fun <T> fromJson(jsonString: String, parser: (JSONObject) -> T?): ApiResponse<T> {
            return try {
                val json = JSONObject(jsonString)
                val code = json.optInt("code", -1)
                val message = json.optString("message", "")
                val requestId = json.optString("request_id", null)
                val dataJson = json.optJSONObject("data") ?: json.optJSONArray("data")
                val data = dataJson?.let { parser(JSONObject(jsonString)) }
                ApiResponse(code, message, data, requestId)
            } catch (e: Exception) {
                ApiResponse(-1, "解析失败: ${e.message}", null)
            }
        }
    }
}

/**
 * 分页数据响应
 */
data class PageResponse<T>(
    val pageNo: Int,
    val pageSize: Int,
    val totalCount: Int,
    val totalPages: Int,
    val list: List<T>
) {
    val hasNextPage: Boolean get() = pageNo < totalPages
    val hasPreviousPage: Boolean get() = pageNo > 1

    companion object {
        fun <T> empty(): PageResponse<T> {
            return PageResponse(1, 20, 0, 0, emptyList())
        }

        fun <T> fromJson(jsonString: String, parser: (JSONObject) -> T?): PageResponse<T> {
            return try {
                val json = JSONObject(jsonString)
                val pageNo = json.optInt("pageNo", 1)
                val pageSize = json.optInt("pageSize", 20)
                val totalCount = json.optInt("totalCount", 0)
                val totalPages = json.optInt("totalPages", 0)
                val dataArray = json.optJSONArray("list") ?: json.optJSONArray("data")
                val list = mutableListOf<T>()
                dataArray?.let { array ->
                    for (i in 0 until array.length()) {
                        val item = array.optJSONObject(i)
                        item?.let { parser(it)?.let { it1 -> list.add(it1) } }
                    }
                }
                PageResponse(pageNo, pageSize, totalCount, totalPages, list)
            } catch (e: Exception) {
                empty()
            }
        }
    }
}

/**
 * 网络异常类型
 */
object ApiError {
    const val UNKNOWN = -1
    const val NETWORK_ERROR = -2
    const val TIMEOUT_ERROR = -3
    const val PARSE_ERROR = -4
    const val AUTH_ERROR = 401
    const val SERVER_ERROR = 500

    fun getMessage(code: Int): String {
        return when (code) {
            NETWORK_ERROR -> "网络连接失败，请检查网络"
            TIMEOUT_ERROR -> "请求超时，请稍后重试"
            PARSE_ERROR -> "数据解析失败"
            AUTH_ERROR -> "登录已过期，请重新登录"
            SERVER_ERROR -> "服务器异常，请稍后重试"
            else -> "请求失败 (code: $code)"
        }
    }
}
