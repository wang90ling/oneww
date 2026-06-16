import '../core/network/api_service.dart';
import '../models/play_room_response_entity.dart';
import '../models/playroom_by_hot_request.dart';

class RoomLiveRepository {
  RoomLiveRepository({ApiService? apiService}) : _apiService = apiService ?? ApiService();

  final ApiService _apiService;

  Future<List<PlayRoomResponseDataRecords>> fetchHotRooms({
    int pageNo = 1,
    int pageSize = 20,
  }) async {
    final response = await _apiService.getPlayRoomByHot(
      PlayroomByHotRequest(pageNo: pageNo, pageSize: pageSize),
    );
    return response.data?.records ?? <PlayRoomResponseDataRecords>[];
  }
}
