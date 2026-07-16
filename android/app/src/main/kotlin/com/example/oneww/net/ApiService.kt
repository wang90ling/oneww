package com.example.oneww.net

import android.content.Context
import com.example.oneww.config.ApiConfig
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


    // ==================== 圈子相关接口 ====================

    /**
     * 获取圈子动态列表
     * @param pageNo 页码
     * @param pageSize 每页数量
     * @param endTime 结束时间（用于分页）
     * @param postId 帖子ID（用于分页）
     */
    suspend fun getPostList(
        pageNo: Int = 1,
        pageSize: Int = 20,
        endTime: String = "",
        postId: String = ""
    ): ApiState<JSONObject?> {
        val url = "$baseUrl/post/newPostList"
        val params = mapOf(
            "pageNo" to pageNo,
            "pageSize" to pageSize,
            "endTime" to endTime,
            "postId" to postId
        )
        val result = httpClient.postJson(url, params, null) { json ->
            json.optJSONObject("data")
        }
        @Suppress("UNCHECKED_CAST")
        return result as ApiState<JSONObject?>
    }

    /**
     * 发布圈子动态
     * @param content 内容
     * @param mediaUrls 媒体URL列表
     * @param mediaType 媒体类型：0-无，1-图片，2-视频
     * @param topicIds 话题ID列表
     * @param visibility 可见范围
     */
    suspend fun createPost(
        content: String,
        mediaUrls: List<String> = emptyList(),
        mediaType: Int = 0,
        topicIds: List<String> = emptyList(),
        visibility: String = "all"
    ): ApiState<JSONObject?> {
        val url = "$baseUrl/post/create"
        val params = mapOf(
            "content" to content,
            "mediaUrls" to mediaUrls,
            "mediaType" to mediaType,
            "postType" to mediaType,
            "topicIds" to topicIds,
            "visibility" to visibility
        )
        val result = httpClient.postJson(url, params, null) { json ->
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
        fileName: String = ""
    ): ApiState<JSONObject?> {
        val url = "$baseUrl/file/formDataUpload"
        val params = mapOf(
            "bucketType" to bucketType,
            "fileName" to fileName
        )
        val result = httpClient.postJson(url, params, null) { json ->
            json.optJSONObject("data")
        }
        @Suppress("UNCHECKED_CAST")
        return result as ApiState<JSONObject?>
    }

}
