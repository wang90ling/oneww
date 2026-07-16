package com.example.oneww.file

import android.content.Context
import android.util.Log
import com.example.oneww.bean.FormDataUploadRequest
import com.tencent.cos.xml.CosXmlService
import com.tencent.cos.xml.CosXmlServiceConfig
import com.tencent.cos.xml.exception.CosXmlClientException
import com.tencent.cos.xml.exception.CosXmlServiceException
import com.tencent.cos.xml.listener.CosXmlResultListener
import com.tencent.cos.xml.model.CosXmlRequest
import com.tencent.cos.xml.model.CosXmlResult
import com.tencent.cos.xml.model.`object`.PutObjectRequest
import com.tencent.cos.xml.transfer.TransferConfig
import com.tencent.cos.xml.transfer.TransferManager
import com.tencent.qcloud.core.auth.SessionQCloudCredentials
import java.io.File

class CosUploader(private val context: Context) {

    fun uploadFile(
        srcPath: String,
        fileName: String?,
        response: FormDataUploadResponse,
        objectKey: String? = null,
        onProgress: ((Double) -> Unit)? = null
    ): String {
        val file = File(srcPath)
        val filename = (System.currentTimeMillis().toString() + (Math.random() * 1000).toInt()
            .toString()).substring(5) + "_" + file.name
        // 1、从服务端请求上传和签名信息
        val startTime = response.startTime
        val expiredTime = response.expiredTime
        val cosPath = response.filePath + "/" + filename
        val tmpSecretId = response.secretId
        val tmpSecretKey = response.secretKey
        val sessionToken = response.sessionToken
        val splitArray1 = response.endpoint.split("https://")
        val splitArray2 = splitArray1[1].split(".")
        val bucket = splitArray2[0]
        val region = splitArray2[2]
        // 2、初始化 COS SDK: CosXmlService 和 TransferManager
        // 创建 CosXmlServiceConfig 对象，根据需要修改默认的配置参数
        val cosXmlServiceConfig = CosXmlServiceConfig.Builder().setRegion(region)
            .isHttps(true) // 使用 HTTPS 请求, 默认为 HTTP 请求
            .builder()
        // 初始化一个 CosXmlService 的实例，可以不设置临时密钥回调
        val cosXmlService = CosXmlService(context, cosXmlServiceConfig)
        // 初始化 TransferConfig，这里使用默认配置，如果需要定制，请参考 SDK 接口文档
        val transferConfig = TransferConfig.Builder().build()
        // 初始化 TransferManager
        val transferManager = TransferManager(cosXmlService, transferConfig)
        // 3、进行上传
        val putRequest = PutObjectRequest(bucket, cosPath, srcPath)
        val sessionQCloudCredentials = SessionQCloudCredentials(
            tmpSecretId, tmpSecretKey, sessionToken, startTime.toLong(), expiredTime.toLong()
        )
        putRequest.setCredential(sessionQCloudCredentials)
        //log所有参数
        Log.d("wangling", "uploadFile: "+"上传文件 srcPath = $srcPath 到 cosPath = $cosPath 临时密钥 tmpSecretId = $tmpSecretId tmpSecretKey = $tmpSecretKey sessionToken = $sessionToken startTime = $startTime expiredTime = $expiredTime bucket = $bucket region = $region")
        val uploadTask = transferManager.upload(putRequest, null)
        // 设置上传进度回调
        uploadTask.setCosXmlProgressListener { complete, target ->
            // todo Do something to update progress...
        }
        // 设置返回结果回调
        uploadTask.setCosXmlResultListener(object : CosXmlResultListener {
            override fun onSuccess(request: CosXmlRequest?, result: CosXmlResult?) {

            }

            override fun onFail(
                request: CosXmlRequest?,
                clientException: CosXmlClientException?,
                serviceException: CosXmlServiceException?
            ) {

            }
        })

        return ""
    }
}
