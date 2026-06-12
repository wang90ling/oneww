import '../core/network/api_service.dart';
import '../models/play_room_response_entity.dart';
import '../models/playroom_by_hot_request.dart';
import 'base_list_view_model.dart';

class RoomLiveListViewModel extends BaseListViewModel<PlayRoomResponseDataRecords> {
  RoomLiveListViewModel({ApiService? apiService}) : _apiService = apiService ?? ApiService();

  final ApiService _apiService;

  @override
  Future<List<PlayRoomResponseDataRecords>> fetchPage(int page) async {
    final response = await _apiService.getPlayRoomByHot(
      PlayroomByHotRequest(
        pageNo: page,
        pageSize: 20,
      ),
    );
    return response.data?.records ?? <PlayRoomResponseDataRecords>[];
  }
}
