import 'package:flutter/services.dart';

import '../../repositories/circle_repository.dart';

/**
 * 腾讯云cos图片/视频资源上传
 * wangling
 */
class TencentCosUploadService {
  TencentCosUploadService._();

  static const MethodChannel _channel = MethodChannel('tencent_cos_upload');

  static Future<String> uploadFile({
    required String path,
    required String fileName,
    required CosUploadConfig config,
    String? objectKey,
  }) async {
    final result = await _channel.invokeMethod<dynamic>(
      'uploadFile',
      <String, dynamic>{
        'path': path,
        'fileName': fileName,
        'secretId': config.secretId,
        'secretKey': config.secretKey,
        'sessionToken': config.sessionToken,
        'region': config.region,
        if (config.bucket != null && config.bucket!.isNotEmpty) 'bucket': config.bucket,
        if (objectKey != null && objectKey.isNotEmpty) 'objectKey': objectKey,
      },
    );

    final url = result?.toString().trim();
    if (url == null || url.isEmpty) {
      throw const FormatException('腾讯 COS 上传返回为空');
    }
    return url;
  }
}
