package com.example.oneww.utils

import android.content.Context
import android.content.SharedPreferences
import androidx.core.content.edit

/**
 * Token 管理类
 * 负责 Token 的存储、获取、刷新等操作
 */
class TokenManager private constructor(context: Context) {

    private val prefs: SharedPreferences = context.getSharedPreferences(
        PREFS_NAME, Context.MODE_PRIVATE
    )

    companion object {
        private const val PREFS_NAME = "auth_prefs"
        private const val KEY_TOKEN = "auth_token"
        private const val KEY_USER_INFO = "user_info"
        private const val KEY_TOKEN_EXPIRE_TIME = "token_expire_time"

        @Volatile
        private var instance: TokenManager? = null

        fun getInstance(context: Context): TokenManager {
            return instance ?: synchronized(this) {
                instance ?: TokenManager(context.applicationContext).also {
                    instance = it
                }
            }
        }
    }

    /**
     * 获取当前 Token
     * @return Token 字符串，如果不存在返回 null
     */
    var token: String?
        get() = prefs.getString(KEY_TOKEN, null)
        set(value) {
            prefs.edit { putString(KEY_TOKEN, value) }
        }

    /**
     * 获取带 Bearer 前缀的 Authorization 头
     */
    fun getAuthorizationHeader(): String? {
        val token = this.token
        return if (token.isNullOrBlank()) {
            null
        } else {
            if (token.startsWith("Bearer ")) token else "Bearer $token"
        }
    }

    /**
     * 保存用户信息
     */
    fun saveUserInfo(userInfo: String) {
        prefs.edit { putString(KEY_USER_INFO, userInfo) }
    }

    /**
     * 获取用户信息
     */
    fun getUserInfo(): String? {
        return prefs.getString(KEY_USER_INFO, null)
    }

    /**
     * 设置 Token 过期时间
     */
    fun setTokenExpireTime(expireTime: Long) {
        prefs.edit { putLong(KEY_TOKEN_EXPIRE_TIME, expireTime) }
    }

    /**
     * 获取 Token 过期时间
     */
    fun getTokenExpireTime(): Long {
        return prefs.getLong(KEY_TOKEN_EXPIRE_TIME, 0L)
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
        val token = this.token
        return !token.isNullOrBlank() && !isTokenExpired()
    }

    /**
     * 清除登录信息
     */
    fun clearSession() {
        prefs.edit {
            remove(KEY_TOKEN)
            remove(KEY_USER_INFO)
            remove(KEY_TOKEN_EXPIRE_TIME)
        }
    }

    /**
     * 保存登录信息
     * @param token 用户 Token
     * @param userInfo 用户信息 JSON 字符串（可选）
     * @param expireTime Token 过期时间戳（可选）
     */
    fun saveLoginInfo(token: String, userInfo: String? = null, expireTime: Long? = null) {
        prefs.edit {
            putString(KEY_TOKEN, token)
            userInfo?.let { putString(KEY_USER_INFO, it) }
            expireTime?.let { putLong(KEY_TOKEN_EXPIRE_TIME, it) }
        }
    }
}