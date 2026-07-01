import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import '../../utils/network_endpoints.dart';
import '../helpers/auth_storage.dart';
import 'network_client.dart';

class CircleApiService {
  CircleApiService({NetworkClient? client}) : _client = client ?? NetworkClient();

  final NetworkClient _client;

  Future<String?> _resolveToken() async {
    final token = await AuthStorage.getToken();
    if (token == null || token.isEmpty) return null;
    return token.startsWith('Bearer ') ? token : '$token';
  }

  Map<String, String> _buildAppHeaders(String? token) {
    return <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'x-device': 'APP',
      if (token != null && token.isNotEmpty) 'authorization': token,
    };
  }

  ///上传图片使用的阿里云服务（存储上传的图片和视频，上传成功，阿里云服务会返回图片/视频的资源路径）



  ///上传图片/视频
  Future<String> uploadMediaFile(XFile file) async {
    final token = await _resolveToken();
    final uri = Uri.parse('${NetworkEndpoints.appBaseUrl}${NetworkEndpoints.uploadMedia}');
    final request = http.MultipartRequest('POST', uri)
      ..headers.addAll(_buildMultipartHeaders(token));

    final bytes = await file.readAsBytes();
    request.files.add(
      http.MultipartFile.fromBytes(
        'file',
        bytes,
        filename: file.name.isNotEmpty ? file.name : 'media_file',
      ),
    );

    final streamed = await request.send();
    final response = await http.Response.fromStream(streamed);
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw http.ClientException('Upload failed with status ${response.statusCode}', uri);
    }

    final decoded = jsonDecode(utf8.decode(response.bodyBytes, allowMalformed: true));
    if (decoded is Map<String, dynamic>) {
      final data = decoded['data'];
      final uploadedUrl = _extractUploadedUrl(data) ?? _extractUploadedUrl(decoded);
      if (uploadedUrl != null && uploadedUrl.isNotEmpty) {
        return uploadedUrl;
      }
    } else if (decoded is String && decoded.isNotEmpty) {
      return decoded;
    }

    throw const FormatException('Invalid upload response');
  }

  ///发布圈子动态
  Future<String> createCirclePost({
    required String content,
    required List<String> mediaUrls,
    required int mediaType,
    required List<String> topicIds,
    required String visibility,
  }) async {
    final token = await _resolveToken();
    final uri = Uri.parse('${NetworkEndpoints.appBaseUrl}${NetworkEndpoints.createCirclePost}');
    final response = await _client.postJson(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'x-device': 'APP',
        if (token != null && token.isNotEmpty) 'authorization': token,
      },
      body: <String, dynamic>{
        'content': content,
        'mediaUrls': mediaUrls,
        'mediaType': mediaType,
        'topicIds': topicIds,
        'visibility': visibility,
      },
    );

    final message = response['message']?.toString();
    if (message != null && message.isNotEmpty) return message;
    final data = response['data'];
    if (data is Map<String, dynamic>) {
      final text = data['message']?.toString() ?? data['msg']?.toString() ?? data['id']?.toString();
      if (text != null && text.isNotEmpty) return text;
    }
    return 'success';
  }

  Map<String, String> _buildMultipartHeaders(String? token) {
    return <String, String>{
      'Accept': 'application/json',
      'x-device': 'APP',
      if (token != null && token.isNotEmpty) 'authorization': token,
    };
  }

  String? _extractUploadedUrl(dynamic data) {
    if (data is String) return data.trim().isEmpty ? null : data.trim();
    if (data is Map<String, dynamic>) {
      const keys = <String>['url', 'fileUrl', 'path', 'fullUrl', 'src', 'location'];
      for (final key in keys) {
        final value = data[key]?.toString().trim() ?? '';
        if (value.isNotEmpty) return value;
      }
      final nested = data['data'];
      final nestedUrl = _extractUploadedUrl(nested);
      if (nestedUrl != null && nestedUrl.isNotEmpty) return nestedUrl;
    }
    return null;
  }

  static String? _sanitizeText(String? value) {
    if (value == null) return null;
    return value.replaceAll('\u0000', '').trim();
  }
}
