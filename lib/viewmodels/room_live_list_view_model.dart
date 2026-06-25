import '../core/network/api_service.dart';
import '../models/play_room_response_entity.dart';
import '../models/playroom_by_hot_request.dart';
import '../models/query_dispatch_rooms_by_heat_response_entity.dart';
import '../repositories/room_live_repository.dart';
import 'base_list_view_model.dart';

class RoomLiveListViewModel extends BaseListViewModel<PlayRoomResponseDataRecords> {
  RoomLiveListViewModel({RoomLiveRepository? repository})
      : _repository = repository ?? RoomLiveRepository();

  final RoomLiveRepository _repository;

  ///热门房间列表
  @override
  Future<List<PlayRoomResponseDataRecords>> fetchPage(int page) async {
    return _repository.fetchHotRooms(pageNo: page, pageSize: 20);
  }

  ///派单厅列表
  @override
  Future<List<QueryDispatchRoomsByHeatResponseDataRecords>> fetchDispatchRooms(int page) async {
    return _repository.fetchDispatchRooms(pageNo: page, pageSize: 20);
  }
}
