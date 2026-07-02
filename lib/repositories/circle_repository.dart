import 'dart:io';

import 'package:image_picker/image_picker.dart';

import '../core/helpers/app_logger.dart';
import '../core/network/api_service.dart';
import '../core/network/circle_api_service.dart';
import '../models/form_data_upload_request_entity.dart';
import '../models/form_data_upload_response_entity.dart';
import '../models/new_circle_request.dart';
import '../models/post_list_response_entity.dart';

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


  Future<String> uploadMediaFile(XFile file) async {
    final uploaded = await _circleApiService.uploadMediaFile(file);
    return uploaded;
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
