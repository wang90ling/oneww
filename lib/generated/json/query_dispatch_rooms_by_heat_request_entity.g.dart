import 'package:oneww/generated/json/base/json_convert_content.dart';
import 'package:oneww/models/query_dispatch_rooms_by_heat_request_entity.dart';

QueryDispatchRoomsByHeatRequestEntity $QueryDispatchRoomsByHeatRequestEntityFromJson(
    Map<String, dynamic> json) {
  final QueryDispatchRoomsByHeatRequestEntity queryDispatchRoomsByHeatRequestEntity = QueryDispatchRoomsByHeatRequestEntity();
  final int? pageNo = jsonConvert.convert<int>(json['pageNo']);
  if (pageNo != null) {
    queryDispatchRoomsByHeatRequestEntity.pageNo = pageNo;
  }
  final int? pageSize = jsonConvert.convert<int>(json['pageSize']);
  if (pageSize != null) {
    queryDispatchRoomsByHeatRequestEntity.pageSize = pageSize;
  }
  return queryDispatchRoomsByHeatRequestEntity;
}

Map<String, dynamic> $QueryDispatchRoomsByHeatRequestEntityToJson(
    QueryDispatchRoomsByHeatRequestEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['pageNo'] = entity.pageNo;
  data['pageSize'] = entity.pageSize;
  return data;
}

extension QueryDispatchRoomsByHeatRequestEntityExtension on QueryDispatchRoomsByHeatRequestEntity {
  QueryDispatchRoomsByHeatRequestEntity copyWith({
    int? pageNo,
    int? pageSize,
  }) {
    return QueryDispatchRoomsByHeatRequestEntity()
      ..pageNo = pageNo ?? this.pageNo
      ..pageSize = pageSize ?? this.pageSize;
  }
}