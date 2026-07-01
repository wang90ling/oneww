import 'package:oneww/generated/json/base/json_field.dart';
import 'package:oneww/generated/json/banner_respose_entity.g.dart';
import 'dart:convert';
export 'package:oneww/generated/json/banner_respose_entity.g.dart';

@JsonSerializable()
class BannerResposeEntity {
	@JSONField(name: 'request_id')
	String requestId = '';
	int code = 0;
	String message = '';
	List<BannerResposeData> data = [];

	BannerResposeEntity();

	factory BannerResposeEntity.fromJson(Map<String, dynamic> json) => $BannerResposeEntityFromJson(json);

	Map<String, dynamic> toJson() => $BannerResposeEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class BannerResposeData {
	int id = 0;
	String recommendName = '';
	String showPosition = '';
	String jumpType = '';
	String jumpUrl = '';
	String jumpPosition = '';
	String jumpArgs = '';
	String showType = '';
	String fileName = '';
	String fileUrl = '';
	int sort = 0;
	int weighted = 0;
	String createTime = '';

	BannerResposeData();

	factory BannerResposeData.fromJson(Map<String, dynamic> json) => $BannerResposeDataFromJson(json);

	Map<String, dynamic> toJson() => $BannerResposeDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}