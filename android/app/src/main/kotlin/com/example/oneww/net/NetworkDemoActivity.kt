package com.example.oneww.net

import android.os.Bundle
import android.util.Log
import androidx.appcompat.app.AppCompatActivity
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch

/**
 * 网络框架使用示例 Activity
 */
class NetworkDemoActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        // ==================== 使用示例 ====================

        // 1. 初始化 API Service（通常在 Application 中初始化一次）
        // ApiService.getInstance(this)

        // 2. 直接调用 API
        exampleDirectApiCall()
    }

    /**
     * 直接调用 API 示例
     */
    private fun exampleDirectApiCall() {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val apiService = ApiService.getInstance(this@NetworkDemoActivity)

                // 示例：获取用户信息
                val userResult = apiService.getUserInfo()
                when (userResult) {
                    is ApiState.Success -> {
                        val userData = userResult.data
                        Log.d("Demo", "用户信息: $userData")
                    }
                    is ApiState.Error -> {
                        Log.e("Demo", "获取用户信息失败: ${userResult.message}")
                    }
                    is ApiState.Exception -> {
                        Log.e("Demo", "获取用户信息异常: ${userResult.throwable.message}")
                    }
                }



                // 示例：获取帖子列表
                val postResult = apiService.getPostList(pageNo = 1, pageSize = 20)
                when (postResult) {
                    is ApiState.Success -> {
                        val posts = postResult.data
                        Log.d("Demo", "帖子列表: $posts")
                    }
                    is ApiState.Error -> {
                        Log.e("Demo", "获取帖子失败: ${postResult.message}")
                    }
                    is ApiState.Exception -> {
                        Log.e("Demo", "获取帖子异常: ${postResult.throwable.message}")
                    }
                }

                // 示例：发布帖子
                val createResult = apiService.createPost(
                    content = "这是一条测试动态",
                    mediaUrls = listOf("2026/7/15/test.jpg"),
                    mediaType = 1,
                    topicIds = listOf("1", "2"),
                    visibility = "all"
                )
                when (createResult) {
                    is ApiState.Success -> {
                        Log.d("Demo", "发布成功: ${createResult.data}")
                    }
                    is ApiState.Error -> {
                        Log.e("Demo", "发布失败: ${createResult.message}")
                    }
                    is ApiState.Exception -> {
                        Log.e("Demo", "发布异常: ${createResult.throwable.message}")
                    }
                }

            } catch (e: Exception) {
                Log.e("Demo", "API 调用异常", e)
            }
        }
    }
}
