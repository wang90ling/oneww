import 'package:flutter/services.dart';

import '../../repositories/circle_repository.dart';
import '../../models/form_data_upload_response_entity.dart';

/**
 * 腾讯云 COS 图片/视频资源上传服务
 *
 * 通过 MethodChannel 与 Android Native 交互
 * 使用 Flutter 端获取的凭证进行上传
 */
class TencentCosUploadService {
  TencentCosUploadService._();

  static const MethodChannel _channel = MethodChannel('tencent_cos_upload');

  /**
   * 上传文件到腾讯云 COS
   *
   * @param path 本地文件路径
   * @param fileName 文件名
   * @param config COS 上传配置（包含凭证信息）
   * @param objectKey 自定义的对象存储路径（可选）
   * @return 上传成功后的完整文件 URL
   */
  static Future<String> uploadFile({
    required String path,
    required String fileName,
    required CosUploadConfig config,
    String? objectKey,
  }) async {
    // 解析 region 和 bucket
    final region = config.region;
    final bucket = config.bucket;
    final endpoint = config.endpoint;
    final filePath = config.objectKey;

    final result = await _channel.invokeMethod<String>(
      'uploadFile',
      <String, dynamic>{
        'path': path,
        'fileName': fileName,
        // 传递完整的凭证信息给 Android
        'secretId': config.secretId,
        'secretKey': config.secretKey,
        'sessionToken': config.sessionToken,
        'region': region,
        'bucket': bucket,
        'endpoint': endpoint,
        'filePath': filePath,
        'startTime': config.startTime.toString(),
        'expiredTime': config.expiredTime.toString(),
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
