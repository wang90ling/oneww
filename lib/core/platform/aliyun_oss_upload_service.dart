import 'package:flutter/services.dart';

import '../../repositories/circle_repository.dart';

class AliyunOssUploadService {
  AliyunOssUploadService._();

  static const MethodChannel _channel = MethodChannel('aliyun_oss_upload');

  static Future<String> uploadFile({
    required String path,
    required String fileName,
    required OssUploadConfig config,
  }) async {
    final result = await _channel.invokeMethod<dynamic>(
      'uploadFile',
      <String, dynamic>{
        'path': path,
        'fileName': fileName,
        'secretId': config.secretId,
        'accessKeyId': config.accessKeyId,
        'accessKeySecret': config.accessKeySecret,
        'securityToken': config.securityToken,
        'endpoint': config.endpoint,
        if (config.bucketName != null && config.bucketName!.isNotEmpty) 'bucketName': config.bucketName,
      },
    );

    final url = result?.toString().trim();
    if (url == null || url.isEmpty) {
      throw const FormatException('阿里云上传返回为空');
    }
    return url;
  }
}
