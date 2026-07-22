package com.example.oneww.net

import android.util.Log
import com.example.oneww.utils.TokenStorage
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

/**
 * Token 同步通道
 * 负责处理 Flutter 与 Android Native 之间的 token 同步
 *
 * Flutter 登录后 token 存在 Flutter SharedPreferences，Android 无法直接读取。
 * 通过此通道，Flutter 在登录成功后主动将 token 同步到 Android 端。
 */
class TokenChannel(flutterEngine: FlutterEngine) {

    companion object {
        private const val CHANNEL_NAME = "auth_token_channel"
        private const val TAG = "TokenChannel"
    }

    init {
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL_NAME)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "syncToken" -> {
                        val token = call.argument<String>("token")
                        if (token.isNullOrBlank()) {
                            Log.w(TAG, "syncToken: token is null or blank")
                            result.success(false)
                            return@setMethodCallHandler
                        }
                        TokenStorage.saveToken(token)
                        Log.d(TAG, "Token synced from Flutter: ${token.take(10)}...")
                        result.success(true)
                    }
                    "clearToken" -> {
                        TokenStorage.clearSession()
                        Log.d(TAG, "Token cleared")
                        result.success(true)
                    }
                    "hasToken" -> {
                        val hasToken = TokenStorage.hasValidToken()
                        result.success(hasToken)
                    }
                    else -> {
                        result.notImplemented()
                    }
                }
            }
    }
}
