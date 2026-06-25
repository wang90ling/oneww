import '../core/network/api_service.dart';
import '../models/play_room_response_entity.dart';
import '../models/playroom_by_hot_request.dart';
import '../models/query_dispatch_rooms_by_heat_request_entity.dart';
import '../models/query_dispatch_rooms_by_heat_response_entity.dart';

///房间语音房接口对接
class RoomLiveRepository {
  RoomLiveRepository({ApiService? apiService}) : _apiService = apiService ?? ApiService();

  final ApiService _apiService;

  ///热门房间查询列表
  Future<List<PlayRoomResponseDataRecords>> fetchHotRooms({
    int pageNo = 1,
    int pageSize = 20,
  }) async {
    final response = await _apiService.getPlayRoomByHot(
      PlayroomByHotRequest(pageNo: pageNo, pageSize: pageSize),
    );
    return response.data?.records ?? <PlayRoomResponseDataRecords>[];
  }


  ///派单厅查询列表
  Future<List<QueryDispatchRoomsByHeatResponseDataRecords>> fetchDispatchRooms({
    int pageNo = 1,
    int pageSize = 20,
  }) async {
    final response = await _apiService.queryDispatchRoomsByHeat(
      QueryDispatchRoomsByHeatRequestEntity(pageNo: pageNo, pageSize: pageSize),
    );
    return response.data?.records ?? <QueryDispatchRoomsByHeatResponseDataRecords>[];
  }
}
