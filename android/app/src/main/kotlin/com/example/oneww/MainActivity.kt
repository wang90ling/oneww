package com.example.oneww

import android.util.Log
import com.example.oneww.file.CosUploadException
import com.example.oneww.file.CosUploadConfig
import com.example.oneww.file.CosUploader
import com.example.oneww.file.FormDataUploadResponse
import com.example.oneww.net.ApiService
import com.example.oneww.net.ApiState
import com.example.oneww.net.TokenChannel
import com.example.oneww.utils.TokenStorage
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import org.json.JSONObject
import kotlin.concurrent.thread

class MainActivity : FlutterFragmentActivity() {
    private companion object {
        const val UPLOAD_CHANNEL = "tencent_cos_upload"
        const val PROGRESS_CHANNEL = "tencent_cos_upload_progress"
    }

    // 使用 SupervisorJob 确保子协程异常不会影响父协程
    private val activityScope = CoroutineScope(SupervisorJob() + Dispatchers.Main)

    private var progressSink: EventChannel.EventSink? = null
    private lateinit var cosUploader: CosUploader

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        cosUploader = CosUploader(applicationContext)

        // 初始化 Token 同步通道（接收 Flutter 同步的登录 token）
        TokenChannel(flutterEngine)

        EventChannel(flutterEngine.dartExecutor.binaryMessenger, PROGRESS_CHANNEL)
            .setStreamHandler(
                object : EventChannel.StreamHandler {
                    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                        progressSink = events
                    }

                    override fun onCancel(arguments: Any?) {
                        progressSink = null
                    }
                }
            )

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, UPLOAD_CHANNEL)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "uploadFile" -> {
                        val path = call.argument<String>("path")
                        val fileName = call.argument<String>("fileName")
                        val objectKey = call.argument<String>("objectKey")

                        Log.d("MainActivity", "uploadFile 请求: path=$path, fileName=$fileName, objectKey=$objectKey")

                        if (path.isNullOrBlank()) {
                            result.error("INVALID_ARGS", "文件路径不能为空", null)
                            return@setMethodCallHandler
                        }

                        // 启动协程执行上传
                        activityScope.launch {
                            try {
                                postProgress(0.05f)

                                // 1、获取上传凭证
                                postProgress(0.1f)
                                Log.d("MainActivity", "开始获取上传凭证...")

                                val formDataUploadData = getFormDataUploadResponse()
                                if (formDataUploadData == null) {
                                    result.error("GET_CREDENTIAL_FAILED", "获取上传凭证失败", null)
                                    return@launch
                                }

                                Log.d("MainActivity", "获取上传凭证成功: endpoint=${formDataUploadData.endpoint}")

                                // 2、执行文件上传
                                postProgress(0.3f)
                                Log.d("MainActivity", "开始上传文件...")

                                val uploadedUrl = uploadFileToCos(
                                    srcPath = path,
                                    fileName = fileName,
                                    response = formDataUploadData,
                                    objectKey = objectKey
                                )

                                // 3、上传成功
                                postProgress(1.0f)
                                Log.d("MainActivity", "上传成功: $uploadedUrl")
                                result.success(uploadedUrl)

                            } catch (e: CosUploadException) {
                                Log.e("MainActivity", "上传失败: ${e.message}")
                                result.error("UPLOAD_FAILED", e.message, null)

                            } catch (e: Exception) {
                                Log.e("MainActivity", "上传异常: ${e.message}", e)
                                result.error("UPLOAD_EXCEPTION", e.message ?: "未知错误", e.toString())
                            }
                        }
                    }

                    "getUploadCredential" -> {
                        // 仅获取上传凭证（不执行上传）
                        activityScope.launch {
                            try {
                                postProgress(0.5f)
                                val formDataUploadData = getFormDataUploadResponse()
                                postProgress(1.0f)

                                if (formDataUploadData != null) {
                                    // 将凭证转换为 Map 返回给 Flutter
                                    val credentialMap = mapOf(
                                        "endpoint" to formDataUploadData.endpoint,
                                        "filePath" to formDataUploadData.filePath,
                                        "secretId" to formDataUploadData.secretId,
                                        "secretKey" to formDataUploadData.secretKey,
                                        "sessionToken" to formDataUploadData.sessionToken,
                                        "startTime" to formDataUploadData.startTime,
                                        "expiredTime" to formDataUploadData.expiredTime
                                    )
                                    result.success(credentialMap)
                                } else {
                                    result.error("GET_CREDENTIAL_FAILED", "获取上传凭证失败", null)
                                }
                            } catch (e: Exception) {
                                result.error("GET_CREDENTIAL_EXCEPTION", e.message, null)
                            }
                        }
                    }

                    else -> result.notImplemented()
                }
            }
    }

    /**
     * 获取文件上传凭证
     */
    private suspend fun getFormDataUploadResponse(): FormDataUploadResponse? {
        return withContext(Dispatchers.IO) {
            try {
                val apiService = ApiService.getInstance(this@MainActivity)
                val result = apiService.formDataUpload()

                when (result) {
                    is ApiState.Success -> {
                        val jsonObject = result.data
                        if (jsonObject != null) {
                            parseFormDataUploadResponse(jsonObject)
                        } else {
                            Log.e("MainActivity", "getFormDataUploadResponse: 返回数据为空")
                            null
                        }
                    }
                    is ApiState.Error -> {
                        Log.e("MainActivity", "getFormDataUploadResponse: API错误 ${result.code} - ${result.message}")
                        null
                    }
                    is ApiState.Exception -> {
                        Log.e("MainActivity", "getFormDataUploadResponse: 异常 ${result.throwable?.message}")
                        null
                    }
                }
            } catch (e: Exception) {
                Log.e("MainActivity", "getFormDataUploadResponse: 捕获异常", e)
                null
            }
        }
    }

    /**
     * 将 JSONObject 解析为 FormDataUploadResponse
     */
    private fun parseFormDataUploadResponse(json: JSONObject): FormDataUploadResponse {
        return FormDataUploadResponse(
            accessKeyId = json.optString("accessKeyId", "").takeIf { it.isNotBlank() },
            endpoint = json.optString("endpoint", ""),
            expiredTime = json.optString("expiredTime", ""),
            filePath = json.optString("filePath", "").takeIf { it.isNotBlank() },
            policy = json.optString("policy", "").takeIf { it.isNotBlank() },
            requestId = json.optString("requestId", "").takeIf { it.isNotBlank() },
            secretId = json.optString("secretId", "").takeIf { it.isNotBlank() },
            secretKey = json.optString("secretKey", "").takeIf { it.isNotBlank() },
            sessionToken = json.optString("sessionToken", "").takeIf { it.isNotBlank() },
            signMap = json.optString("signMap", "").takeIf { it.isNotBlank() },
            signature = json.optString("signature", "").takeIf { it.isNotBlank() },
            startTime = json.optString("startTime", "")
        )
    }

    /**
     * 执行文件上传到腾讯云 COS
     */
    private suspend fun uploadFileToCos(
        srcPath: String,
        fileName: String?,
        response: FormDataUploadResponse,
        objectKey: String?
    ): String {
        return cosUploader.uploadFile(
            srcPath = srcPath,
            fileName = fileName,
            response = response,
            objectKey = objectKey,
            onProgress = { progress ->
                // 将进度转换到 0.3~1.0 范围（保留 0.1~0.3 给获取凭证阶段）
                val adjustedProgress = 0.3f + (progress.toFloat() * 0.7f)
                postProgress(adjustedProgress)
            }
        )
    }

    /**
     * 发送上传进度到 Flutter
     */
    private fun postProgress(value: Float) {
        activityScope.launch {
            progressSink?.success(value.coerceIn(0.0F, 1.0F).toDouble())
        }
    }

    override fun onDestroy() {
        progressSink = null
        super.onDestroy()
    }
}
