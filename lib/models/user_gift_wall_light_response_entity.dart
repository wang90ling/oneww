import 'package:oneww/generated/json/base/json_field.dart';
import 'package:oneww/generated/json/user_gift_wall_light_response_entity.g.dart';
import 'dart:convert';
export 'package:oneww/generated/json/user_gift_wall_light_response_entity.g.dart';

@JsonSerializable()
class UserGiftWallLightResponseEntity {
	@JSONField(name: 'request_id')
	String requestId = '';
	int code = 0;
	String message = '';
	late UserGiftWallLightResponseData data;

	UserGiftWallLightResponseEntity();

	factory UserGiftWallLightResponseEntity.fromJson(Map<String, dynamic> json) => $UserGiftWallLightResponseEntityFromJson(json);

	Map<String, dynamic> toJson() => $UserGiftWallLightResponseEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UserGiftWallLightResponseData {
	int totalCount = 0;
	int litCount = 0;
	int unlitCount = 0;

	UserGiftWallLightResponseData();

	factory UserGiftWallLightResponseData.fromJson(Map<String, dynamic> json) => $UserGiftWallLightResponseDataFromJson(json);

	Map<String, dynamic> toJson() => $UserGiftWallLightResponseDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}