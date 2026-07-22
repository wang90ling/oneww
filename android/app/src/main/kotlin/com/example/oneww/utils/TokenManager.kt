package com.example.oneww.utils

import android.content.Context
import android.content.SharedPreferences
import androidx.core.content.edit

/**
 * Token 管理类
 * 负责 Token 的存储、获取、刷新等操作
 *
 * 兼容旧代码：内部委托给 TokenStorage，TokenStorage 由 Flutter 通过 MethodChannel 同步 token
 */
class TokenManager private constructor(context: Context) {

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

    private val _context = context.applicationContext
    private val _prefs: SharedPreferences = _context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)

    /**
     * 获取/设置 Token（委托给 TokenStorage）
     */
    var token: String?
        get() = TokenStorage.getToken() ?: _prefs.getString(KEY_TOKEN, null)
        set(value) {
            TokenStorage.saveToken(value)
            _prefs.edit { putString(KEY_TOKEN, value) }
        }

    /**
     * 获取带 Bearer 前缀的 Authorization 头
     */
    fun getAuthorizationHeader(): String? = TokenStorage.getAuthorizationHeader()

    /**
     * 保存用户信息
     */
    fun saveUserInfo(userInfo: String) {
        TokenStorage.saveUserInfo(userInfo)
        _prefs.edit { putString(KEY_USER_INFO, userInfo) }
    }

    /**
     * 获取用户信息
     */
    fun getUserInfo(): String? = TokenStorage.getUserInfo() ?: _prefs.getString(KEY_USER_INFO, null)

    /**
     * 设置 Token 过期时间
     */
    fun setTokenExpireTime(expireTime: Long) {
        TokenStorage.setTokenExpireTime(expireTime)
        _prefs.edit { putLong(KEY_TOKEN_EXPIRE_TIME, expireTime) }
    }

    /**
     * 获取 Token 过期时间
     */
    fun getTokenExpireTime(): Long = TokenStorage.getTokenExpireTime()

    /**
     * Token 是否已过期
     */
    fun isTokenExpired(): Boolean = TokenStorage.isTokenExpired()

    /**
     * 是否有有效的 Token
     */
    fun hasValidToken(): Boolean = TokenStorage.hasValidToken()

    /**
     * 清除登录信息
     */
    fun clearSession() {
        TokenStorage.clearSession()
        _prefs.edit {
            remove(KEY_TOKEN)
            remove(KEY_USER_INFO)
            remove(KEY_TOKEN_EXPIRE_TIME)
        }
    }

    /**
     * 保存登录信息
     */
    fun saveLoginInfo(token: String, userInfo: String? = null, expireTime: Long? = null) {
        TokenStorage.saveLoginInfo(token, userInfo, expireTime)
        _prefs.edit {
            putString(KEY_TOKEN, token)
            userInfo?.let { putString(KEY_USER_INFO, it) }
            expireTime?.let { putLong(KEY_TOKEN_EXPIRE_TIME, it) }
        }
    }
}
