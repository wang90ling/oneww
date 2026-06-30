import 'package:oneww/generated/json/base/json_field.dart';
import 'package:oneww/generated/json/user_gift_wall_request_entity.g.dart';
import 'dart:convert';
export 'package:oneww/generated/json/user_gift_wall_request_entity.g.dart';

@JsonSerializable()
class UserGiftWallRequestEntity {
	int lightType = 0;
	int pageNo = 0;
	int pageSize = 0;
	String userId = '';

	UserGiftWallRequestEntity({
		required this.lightType,
		required this.pageNo,
		required this.pageSize,
		required this.userId,
	});

	factory UserGiftWallRequestEntity.fromJson(Map<String, dynamic> json) => $UserGiftWallRequestEntityFromJson(json);

	Map<String, dynamic> toJson() => $UserGiftWallRequestEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}