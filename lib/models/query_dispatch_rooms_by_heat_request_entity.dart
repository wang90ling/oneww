import 'package:oneww/generated/json/base/json_field.dart';
import 'package:oneww/generated/json/query_dispatch_rooms_by_heat_request_entity.g.dart';
import 'dart:convert';
export 'package:oneww/generated/json/query_dispatch_rooms_by_heat_request_entity.g.dart';

@JsonSerializable()
class QueryDispatchRoomsByHeatRequestEntity {
	int pageNo = 1;
	int pageSize = 20;

	QueryDispatchRoomsByHeatRequestEntity({required int pageNo, required int pageSize});

	factory QueryDispatchRoomsByHeatRequestEntity.fromJson(Map<String, dynamic> json) => $QueryDispatchRoomsByHeatRequestEntityFromJson(json);

	Map<String, dynamic> toJson() => $QueryDispatchRoomsByHeatRequestEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}