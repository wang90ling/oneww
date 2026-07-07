package com.example.oneww

import android.util.Log
import com.example.oneww.cos.CosUploadConfig
import com.example.oneww.cos.CosUploader
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel
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

                                val url = cosUploader.uploadFile(
                                    filePath = path,
                                    fileName = fileName,
                                    config = cosConfig,
                                    objectKey = objectKey,
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

    override fun onDestroy() {
        progressSink = null
        super.onDestroy()
    }
}
