package com.example.oneww

import android.util.Log
import com.example.oneww.oss.OssUploader
import com.example.oneww.oss.StsConfig
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel
import kotlin.concurrent.thread

class MainActivity : FlutterFragmentActivity() {
    private companion object {
        const val UPLOAD_CHANNEL = "aliyun_oss_upload"
        const val PROGRESS_CHANNEL = "aliyun_oss_upload_progress"
    }

    private var progressSink: EventChannel.EventSink? = null
    private lateinit var ossUploader: OssUploader

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        ossUploader = OssUploader(applicationContext)

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
                        val path = call.argument<String>("path") as String
                        val fileName = call.argument<String>("fileName") as String
                        val secretId = call.argument<String>("secretId") as String
                        val accessKeySecret = call.argument<String>("accessKeySecret") as String
                        val securityToken = call.argument<String>("securityToken") as String
                        val endpoint = call.argument<String>("endpoint") as String
                        Log.d("wangling","secretId:"+secretId+",accessKeySecret:"+accessKeySecret+",securityToken:"+securityToken)

                        if (path.isNullOrBlank()) {
                            result.error("BAD_PATH", "path is empty", null)
                            return@setMethodCallHandler
                        }

                        thread(name = "oss-upload-thread") {
                            try {
                                postProgress(0.05)
                                val stsConfig = fetchStsConfig(secretId,accessKeySecret,securityToken,endpoint);
                                Log.d("wangling", "stsConfig:"+stsConfig.toString())
                                postProgress(0.2)

                                val url = ossUploader.uploadFile(
                                    filePath = path,
                                    fileName = fileName,
                                    config = stsConfig,
                                    onProgress = { progress -> postProgress(progress) }
                                )

                                postProgress(1.0)
                                runOnUiThread { result.success(url) }
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

    private fun fetchStsConfig(secretId: String,accessKeySecret: String,
                               securityToken: String,endpoint: String): StsConfig {
        // TODO 替换为真实后端接口返回的 STS 临时凭证
        return StsConfig(
            endpoint = "dianta-app-1334254576",
            bucketName = "ap-beijing",
            accessKeyId = secretId,
            accessKeySecret = accessKeySecret,
            securityToken = securityToken
        )
    }

    override fun onDestroy() {
        progressSink = null
        super.onDestroy()
    }
}
