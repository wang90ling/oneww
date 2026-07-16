package com.example.oneww

import android.app.Application
import android.util.Log
import com.example.oneww.config.ApiConfig
import com.example.oneww.net.AppContextProvider

/**
 * 应用 Application 类
 * 初始化网络框架等全局组件
 */
class AppApplication : Application() {

    override fun onCreate() {
        super.onCreate()

        // 初始化 Context Provider
        AppContextProvider.init(this)

        // 初始化日志
        Log.d(ApiConfig.TAG, "Application initialized")
    }

    override fun onTerminate() {
        super.onTerminate()
        // 清理资源
    }
}