package com.example.oneww.utils

import android.content.Context
import android.content.SharedPreferences
import android.util.Log
import androidx.core.content.edit

/**
 * Token 存储管理类
 * 负责 Android Native 端的 Token 存储，支持 Flutter 通过 MethodChannel 同步 token
 *
 * 问题背景：
 * - Flutter 登录后 token 存在 Flutter SharedPreferences
 * - Android Native 端无法直接读取 Flutter 的存储
 * - 需要通过 TokenChannel 主动同步 token
 */
object TokenStorage {
    private const val PREFS_NAME = "auth_prefs"
    private const val KEY_TOKEN = "auth_token"
    private const val KEY_USER_INFO = "user_info"
    private const val KEY_TOKEN_EXPIRE_TIME = "token_expire_time"
    private const val TAG = "TokenStorage"

    private var prefs: SharedPreferences? = null

    fun init(context: Context) {
        prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
        Log.d(TAG, "TokenStorage initialized")
    }

    /**
     * 保存 Token
     */
    fun saveToken(token: String?) {
        prefs?.edit { putString(KEY_TOKEN, token) }
        Log.d(TAG, "Token saved: ${token?.take(10)}...")
    }

    /**
     * 获取 Token
     */
    fun getToken(): String? {
        return prefs?.getString(KEY_TOKEN, null)
    }

    /**
     * 获取带 Bearer 前缀的 Authorization 头
     */
    fun getAuthorizationHeader(): String? {
        val token = getToken()
        return if (token.isNullOrBlank()) {
            null
        } else {
            if (token.startsWith("Bearer ")) token else "$token"
        }
    }

    /**
     * 保存用户信息
     */
    fun saveUserInfo(userInfo: String?) {
        prefs?.edit { putString(KEY_USER_INFO, userInfo) }
    }

    /**
     * 获取用户信息
     */
    fun getUserInfo(): String? {
        return prefs?.getString(KEY_USER_INFO, null)
    }

    /**
     * 设置 Token 过期时间
     */
    fun setTokenExpireTime(expireTime: Long) {
        prefs?.edit { putLong(KEY_TOKEN_EXPIRE_TIME, expireTime) }
    }

    /**
     * 获取 Token 过期时间
     */
    fun getTokenExpireTime(): Long {
        return prefs?.getLong(KEY_TOKEN_EXPIRE_TIME, 0L) ?: 0L
    }

    /**
     * Token 是否已过期
     */
    fun isTokenExpired(): Boolean {
        val expireTime = getTokenExpireTime()
        return expireTime > 0 && System.currentTimeMillis() > expireTime
    }

    /**
     * 是否有有效的 Token
     */
    fun hasValidToken(): Boolean {
        val token = getToken()
        return !token.isNullOrBlank() && !isTokenExpired()
    }

    /**
     * 清除登录信息
     */
    fun clearSession() {
        prefs?.edit {
            remove(KEY_TOKEN)
            remove(KEY_USER_INFO)
            remove(KEY_TOKEN_EXPIRE_TIME)
        }
        Log.d(TAG, "Session cleared")
    }

    /**
     * 保存登录信息
     */
    fun saveLoginInfo(token: String, userInfo: String? = null, expireTime: Long? = null) {
        prefs?.edit {
            putString(KEY_TOKEN, token)
            userInfo?.let { putString(KEY_USER_INFO, it) }
            expireTime?.let { putLong(KEY_TOKEN_EXPIRE_TIME, it) }
        }
    }
}
