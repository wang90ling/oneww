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

            } catch (e: Exception) {
                Log.e("Demo", "API 调用异常", e)
            }
        }
    }
}
