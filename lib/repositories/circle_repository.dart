import 'dart:io';

import 'package:image_picker/image_picker.dart';

import '../core/network/api_service.dart';
import '../models/new_circle_request.dart';
import '../models/post_list_response_entity.dart';

///圈子接口对接
class CircleRepository {
  CircleRepository({ApiService? apiService}) : _apiService = apiService ?? ApiService();

  final ApiService _apiService;

  Future<List<PostListResponseData>> fetchLatestCircles({int pageNo = 1, int pageSize = 20}) async {
    final response = await _apiService.getNewPostList(
      NewCircleRequest(
        pageNo: pageNo,
        pageSize: pageSize,
        endTime: '',
        postId: '',
      ),
    );
    return response.data;
  }

  Future<String> uploadMediaFile(XFile file) async {
    final uploaded = await _apiService.uploadMediaFile(file);
    return uploaded;
  }

  Future<String> createCirclePost({
    required String content,
    required List<String> mediaUrls,
    required int mediaType,
    required List<String> topicIds,
    required String visibility,
  }) async {
    return _apiService.createCirclePost(
      content: content,
      mediaUrls: mediaUrls,
      mediaType: mediaType,
      topicIds: topicIds,
      visibility: visibility,
    );
  }
}
