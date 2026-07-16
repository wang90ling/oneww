package com.example.oneww

import android.util.Log
import com.example.oneww.file.CosUploadConfig
import com.example.oneww.file.CosUploader
import com.example.oneww.net.ApiService
import com.example.oneww.net.ApiState
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlin.concurrent.thread

class MainActivity : FlutterFragmentActivity() {
    private companion object {
        const val UPLOAD_CHANNEL = "tencent_cos_upload"
        const val PROGRESS_CHANNEL = "tencent_cos_upload_progress"
    }

    private var progressSink: EventChannel.EventSink? = null
    private lateinit var cosUploader: CosUploader

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        cosUploader = CosUploader(applicationContext)

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

        initCosUploader()

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, UPLOAD_CHANNEL)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "uploadFile" -> {
                        val path = call.argument<String>("path")
                        val fileName = call.argument<String>("fileName")
                        val secretId = call.argument<String>("secretId")
                        val secretKey = call.argument<String>("secretKey")
                        val sessionToken = call.argument<String>("sessionToken")
                        val region = call.argument<String>("region")
                        val bucket = call.argument<String>("bucket")
                        val objectKey = call.argument<String>("objectKey")

                        Log.d("wangling", "secretId=$secretId, secretKey=$secretKey, sessionToken=$sessionToken, region=$region, bucket=$bucket, objectKey=$objectKey")

                        if (path.isNullOrBlank() || fileName.isNullOrBlank() || secretId.isNullOrBlank() || secretKey.isNullOrBlank() || sessionToken.isNullOrBlank() || region.isNullOrBlank() || bucket.isNullOrBlank()) {
                            result.error("INVALID_ARGS", "Missing upload arguments", null)
                            return@setMethodCallHandler
                        }

                        thread(name = "cos-upload-thread") {
                            try {
                                postProgress(0.05)
                                val cosConfig = CosUploadConfig(
                                    secretId = secretId,
                                    secretKey = secretKey,
                                    sessionToken = sessionToken,
                                    region = region,
                                    bucket = bucket,
                                )
                                Log.d("wangling", "cosConfig=$cosConfig")
                                postProgress(0.2)

                                //首先获取上传资源的一些签名文件

                               /* val url = cosUploader.uploadFile(
                                    filePath = path,
                                    fileName = fileName,
                                    config = cosConfig,
                                    objectKey = objectKey,
                                    onProgress = { progress -> postProgress(progress) }
                                )*/

                                postProgress(1.0)
                                runOnUiThread { result.success("") }
                            } catch (e: Exception) {
                                runOnUiThread {
                                    result.error(
                                        "UPLOAD_FAILED",
                                        e.message ?: "upload failed",
                                        e.toString()
                                    )
                                }
                            }
                        }
                    }

                    else -> result.notImplemented()
                }
            }
    }

    private fun postProgress(value: Double) {
        progressSink?.success(value.coerceIn(0.0, 1.0))
    }

    //初始化腾讯cos文件上传逻辑
    fun initCosUploader(){
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val apiService = ApiService.getInstance(this@MainActivity)

                // 示例：获取用户信息
                val formDataUploadResult = apiService.formDataUpload()
                when (formDataUploadResult) {
                    is ApiState.Success -> {
                        val userData = formDataUploadResult.data
                        Log.d("wangling", "formDataUpload信息: $userData")
                    }
                    is ApiState.Error -> {
                        Log.e("wangling", "获取formDataUpload信息失败: ${formDataUploadResult.message}")
                    }
                    is ApiState.Exception -> {
                        Log.e("wangling", "获取formDataUpload信息异常: ${formDataUploadResult.throwable.message}")
                    }
                }

            } catch (e: Exception) {
                Log.e("Demo", "API 调用异常", e)
            }
        }
    }

    override fun onDestroy() {
        progressSink = null
        super.onDestroy()
    }
}
