import '../core/network/api_service.dart';
import '../models/new_circle_request.dart';
import '../models/post_list_response_entity.dart';

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
}
