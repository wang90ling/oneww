import 'dart:io';

import 'package:image_picker/image_picker.dart';

import '../core/helpers/app_logger.dart';
import '../core/network/api_service.dart';
import '../core/network/circle_api_service.dart';
import '../core/platform/tencent_cos_upload_service.dart';
import '../models/form_data_upload_request_entity.dart';
import '../models/form_data_upload_response_entity.dart';
import '../models/new_circle_request.dart';
import '../models/post_list_response_entity.dart';

class CosUploadConfig {
  const CosUploadConfig({
    required this.secretId,
    required this.secretKey,
    required this.sessionToken,
    required this.region,
    required this.bucket,
    this.objectKey,
  });

  final String secretId;
  final String secretKey;
  final String sessionToken;
  final String region;
  final String bucket;
  final String? objectKey;
}

///圈子接口对接
class CircleRepository {
  CircleRepository({CircleApiService? apiService}) : _circleApiService = apiService ?? CircleApiService();

  final CircleApiService _circleApiService;

  Future<List<PostListResponseData>> fetchLatestCircles({int pageNo = 1, int pageSize = 20}) async {
    final response = await _circleApiService.getNewPostList(
      NewCircleRequest(
        pageNo: pageNo,
        pageSize: pageSize,
        endTime: '',
        postId: '',
      ),
    );
    return response.data;
  }


  ///上传圈子图片和视频
  Future<FormDataUploadResponseEntity> formDataUpload(FormDataUploadRequestEntity req) async {
    final response = await _circleApiService.formDataUpload(req);
    AppLogger.info('formDataUpload 成功: code=${response.code}, message=${response.message}', tag: 'wangling');
    return response;
  }

  CosUploadConfig toCosUploadConfig(FormDataUploadResponseEntity response) {
    final data = response.data;
    final secretKey = data.secretKey.isNotEmpty ? data.secretKey : data.secretId;

    final endpointRaw = data.endpoint.replaceAll(',', '').trim();
    final uri = Uri.tryParse(endpointRaw);
    String bucketName = 'dianta-app-1334254576';
    if (uri != null && uri.host.isNotEmpty) {
      final parts = uri.host.split('.');
      if (parts.isNotEmpty) {
        bucketName = parts.first;
      }
    }

    final objectKey = data.filePath.isNotEmpty ? data.filePath : null;

    return CosUploadConfig(
      secretId: data.secretId,
      secretKey: secretKey,
      sessionToken: data.sessionToken,
      region: _extractCosRegion(data.endpoint),
      bucket: bucketName,
      objectKey: objectKey,
    );
  }

  Future<String> uploadMediaFile(XFile file, {required CosUploadConfig config}) async {
    return TencentCosUploadService.uploadFile(
      path: file.path,
      fileName: file.name,
      config: config,
      objectKey: config.objectKey,
    );
  }

  String _extractCosRegion(String endpoint) {
    final cleaned = endpoint.trim();
    if (cleaned.isEmpty) {
      return 'ap-beijing';
    }
    final withoutScheme = cleaned.replaceFirst(RegExp(r'^https?://'), '');
    if (withoutScheme.contains('.cos.')) {
      final region = withoutScheme.split('.cos.').last.split('.').first;
      if (region.isNotEmpty) return region;
    }
    if (withoutScheme.contains('cos-')) {
      final match = RegExp(r'cos-([a-z0-9-]+)').firstMatch(withoutScheme);
      if (match != null && match.group(1) != null) return match.group(1)!;
    }
    return withoutScheme;
  }

  Future<String> createCirclePost({
    required String content,
    required List<String> mediaUrls,
    required int mediaType,
    required List<String> topicIds,
    required String visibility,
  }) async {
    return _circleApiService.createCirclePost(
      content: content,
      mediaUrls: mediaUrls,
      mediaType: mediaType,
      topicIds: topicIds,
      visibility: visibility,
    );
  }
}
