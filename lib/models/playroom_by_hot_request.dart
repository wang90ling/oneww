import 'package:oneww/generated/json/base/json_field.dart';
import 'package:oneww/generated/json/playroom_by_hot_request.g.dart';
import 'dart:convert';
export 'package:oneww/generated/json/playroom_by_hot_request.g.dart';

///热门房间直播列表
@JsonSerializable()
class PlayroomByHotRequest {
	int? pageNo;
	int? pageSize;

	PlayroomByHotRequest({this.pageNo, this.pageSize});

	factory PlayroomByHotRequest.fromJson(Map<String, dynamic> json) => $PlayroomByHotRequestFromJson(json);

	Map<String, dynamic> toJson() => $PlayroomByHotRequestToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}
