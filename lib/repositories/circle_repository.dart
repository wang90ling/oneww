import 'package:image_picker/image_picker.dart';

import '../core/helpers/app_logger.dart';
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

  String get fileUrlPrefix => 'https://$bucket.cos.$region.myqcloud.com/';

  String toFullUrl(String? objectKey) {
    if (objectKey == null || objectKey.isEmpty) return '';
    if (objectKey.startsWith('http://') || objectKey.startsWith('https://')) {
      return objectKey;
    }
    return '$fileUrlPrefix${objectKey.startsWith('/') ? objectKey.substring(1) : objectKey}';
  }

  String? extractObjectKey(String? url) {
    if (url == null || url.isEmpty) return null;
    if (!url.startsWith('http://') && !url.startsWith('https://')) {
      return url;
    }
    try {
      final uri = Uri.parse(url);
      final path = uri.path;
      if (path.startsWith('/')) {
        return path.substring(1);
      }
      return path;
    } catch (_) {
      return null;
    }
  }
}

///圈子接口对接
class CircleRepository {
  CircleRepository({CircleApiService? apiService}) : _circleApiService = apiService ?? CircleApiService();

  final CircleApiService _circleApiService;
  CosUploadConfig? _lastCosConfig;

  CosUploadConfig? get lastCosConfig => _lastCosConfig;

  String? get lastFileUrlPrefix => _lastCosConfig?.fileUrlPrefix;

  Future<List<PostListResponseData>> fetchLatestCircles({int pageNo = 1, int pageSize = 20}) async {
    if (_lastCosConfig == null) {
      try {
        final req = FormDataUploadRequestEntity(
          bucketType: 'ACCOMPANY',
          fileName: '',
        );
        await formDataUpload(req);
      } catch (e) {
        AppLogger.info('fetchLatestCircles: preload COS config failed: $e, will try with default config', tag: 'wangling');
        // 使用默认配置尝试加载列表
        _lastCosConfig = _createDefaultCosConfig();
      }
    }
    final response = await _circleApiService.getNewPostList(
      NewCircleRequest(
        pageNo: pageNo,
        pageSize: pageSize,
        endTime: '',
        postId: '',
      ),
    );
    AppLogger.info('fetchLatestCircles response: code=${response.code}, data.length=${response.data.length}', tag: 'wangling');
    for (final post in response.data.take(3)) {
      AppLogger.info('post.id=${post.id}, content=${post.content}, files=${post.files}, fileDetails=${post.fileDetails?.map((e) => e.fileUrl).toList()}', tag: 'wangling');
    }
    _enrichPostUrls(response.data);
    for (final post in response.data.take(3)) {
      AppLogger.info('after enrich - post.id=${post.id}, files=${post.files}, fileDetails=${post.fileDetails?.map((e) => e.fileUrl).toList()}', tag: 'wangling');
    }
    return response.data;
  }

  CosUploadConfig _createDefaultCosConfig() {
    return CosUploadConfig(
      secretId: '',
      secretKey: '',
      sessionToken: '',
      region: 'ap-beijing',
      bucket: 'dianta-app-1334254576',
      objectKey: null,
    );
  }

  void _enrichPostUrls(List<PostListResponseData> posts) {
    final config = _lastCosConfig;
    if (config == null) {
      AppLogger.info('_enrichPostUrls: _lastCosConfig is null, skip URL enrichment', tag: 'wangling');
      return;
    }
    for (final post in posts) {
      AppLogger.info('_enrichPostUrls processing post.id=${post.id}, fileDetails count=${post.fileDetails?.length}, files count=${post.files?.length}', tag: 'wangling');
      if (post.fileDetails != null && post.fileDetails!.isNotEmpty) {
        for (final detail in post.fileDetails!) {
          final originalUrl = detail.fileUrl;
          if (detail.fileUrl != null && detail.fileUrl!.isNotEmpty) {
            // 如果已经是完整 URL，跳过
            if (!detail.fileUrl!.startsWith('http://') && !detail.fileUrl!.startsWith('https://')) {
              detail.fileUrl = config.toFullUrl(detail.fileUrl);
              AppLogger.info('_enrichPostUrls: enriched fileUrl from "$originalUrl" to "${detail.fileUrl}"', tag: 'wangling');
            } else {
              AppLogger.info('_enrichPostUrls: fileUrl already full URL: "$originalUrl"', tag: 'wangling');
            }
          }
          if (detail.firstSnapshot != null && detail.firstSnapshot!.isNotEmpty) {
            if (!detail.firstSnapshot!.startsWith('http://') && !detail.firstSnapshot!.startsWith('https://')) {
              detail.firstSnapshot = config.toFullUrl(detail.firstSnapshot);
            }
          }
        }
      }
      if (post.files != null && post.files!.isNotEmpty) {
        post.files = post.files!.map((url) {
          if (url.startsWith('http://') || url.startsWith('https://')) {
            return url;
          }
          return config.toFullUrl(url);
        }).toList();
      }
    }
  }


  ///上传圈子图片和视频
  Future<FormDataUploadResponseEntity> formDataUpload(FormDataUploadRequestEntity req) async {
    final response = await _circleApiService.formDataUpload(req);
    AppLogger.info('formDataUpload 成功: code=${response.code}, message=${response.message}', tag: 'wangling');
    _lastCosConfig = toCosUploadConfig(response);
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
    final fullUrl = await TencentCosUploadService.uploadFile(
      path: file.path,
      fileName: file.name,
      config: config,
      objectKey: config.objectKey,
    );
    final objectKey = config.extractObjectKey(fullUrl) ?? config.objectKey ?? fullUrl;
    AppLogger.info('uploadMediaFile: fullUrl=$fullUrl, objectKey=$objectKey', tag: 'wangling');
    return objectKey;
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
