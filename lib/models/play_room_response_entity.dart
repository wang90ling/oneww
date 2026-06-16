import 'dart:convert';

import 'package:oneww/generated/json/base/json_field.dart';
import 'package:oneww/generated/json/play_room_response_entity.g.dart';

export 'package:oneww/generated/json/play_room_response_entity.g.dart';

@JsonSerializable()
class PlayRoomResponseEntity {
	@JSONField(name: 'request_id')
	String? requestId;
	int? code;
	String? message;
	PlayRoomResponseData? data;

	// 兼容生成文件里 PlayRoomResponseEntity(data: []) 的调用方式
	PlayRoomResponseEntity({dynamic data}) {
		if (data is PlayRoomResponseData) {
			this.data = data;
		}
	}

	factory PlayRoomResponseEntity.fromJson(Map<String, dynamic> json) =>
			$PlayRoomResponseEntityFromJson(json);

	Map<String, dynamic> toJson() => $PlayRoomResponseEntityToJson(this);

	@override
	String toString() => jsonEncode(this);
}

@JsonSerializable()
class PlayRoomResponseData {
	int? pageNo;
	int? pageSize;
	int? total;
	int? pages;
	List<PlayRoomResponseDataRecords> records = <PlayRoomResponseDataRecords>[];

	PlayRoomResponseData();

	factory PlayRoomResponseData.fromJson(Map<String, dynamic> json) =>
			$PlayRoomResponseDataFromJson(json);

	Map<String, dynamic> toJson() => $PlayRoomResponseDataToJson(this);

	@override
	String toString() => jsonEncode(this);
}

@JsonSerializable()
class PlayRoomResponseDataRecords {
	int? id;
	int? moduleId;
	String? moduleName;
	String? mainLabel;
	String? moduleAvatar;
	int? roomNo;
	String? roomName;
	String? roomAvatar;
	int? roomType;
	String? roomTypeName;
	int? roomStatus;
	int? display;
	int? openStatus;
	String? announcement;
	String? welcomeMsg;
	int? heatValue;
	String? heatValueStr;
	int? followStatus;
	int? onlineCount;
	int? withdrawalSettings;
	int? passwordSettings;
	int? roomOwner;
	int? wallpaperPropId;
	String? wallpaperWearTime;
	int? wearStatus;
	PlayRoomResponseDataRecordsWallpaperPropInfo? wallpaperPropInfo;
	int? defaultWallpaperPropId;
	PlayRoomResponseDataRecordsDefaultWallpaperPropInfo? defaultWallpaperPropInfo;
	int? guildId;
	String? userName;
	String? userAvatar;
	int? otherType;
	String? otherBusinessId;
	String? otherValue;
	String? otherAvatar;
	int? kolId;
	int? businessRoomType;
	List<PlayRoomResponseDataRecordsMicUsers> micUsers =
	<PlayRoomResponseDataRecordsMicUsers>[];
	String? gloryBorder;

	PlayRoomResponseDataRecords();

	factory PlayRoomResponseDataRecords.fromJson(Map<String, dynamic> json) {
		final entity = $PlayRoomResponseDataRecordsFromJson(json);
		entity.roomName = _sanitizeText(entity.roomName);
		entity.moduleName = _sanitizeText(entity.moduleName);
		entity.mainLabel = _sanitizeText(entity.mainLabel);
		entity.userName = _sanitizeText(entity.userName);
		entity.otherValue = _sanitizeText(entity.otherValue);
		entity.announcement = _sanitizeText(entity.announcement);
		entity.welcomeMsg = _sanitizeText(entity.welcomeMsg);
		entity.heatValueStr = _sanitizeText(entity.heatValueStr);
		return entity;
	}

	static String? _sanitizeText(String? value) {
		if (value == null) return null;
		return value.replaceAll('\u0000', '').trim();
	}

	Map<String, dynamic> toJson() => $PlayRoomResponseDataRecordsToJson(this);

	@override
	String toString() => jsonEncode(this);
}

@JsonSerializable()
class PlayRoomResponseDataRecordsWallpaperPropInfo {
	int? userId;
	int? propId;
	String? propName;
	int? propType;
	String? propFormat;
	String? dynamicEffect;
	String? pcDynamicEffect;
	String? iosDynamicEffect;
	String? vapJson;
	String? vapText;

	PlayRoomResponseDataRecordsWallpaperPropInfo();

	factory PlayRoomResponseDataRecordsWallpaperPropInfo.fromJson(
			Map<String, dynamic> json) =>
			$PlayRoomResponseDataRecordsWallpaperPropInfoFromJson(json);

	Map<String, dynamic> toJson() =>
			$PlayRoomResponseDataRecordsWallpaperPropInfoToJson(this);

	@override
	String toString() => jsonEncode(this);
}

@JsonSerializable()
class PlayRoomResponseDataRecordsDefaultWallpaperPropInfo {
	int? userId;
	int? propId;
	String? propName;
	int? propType;
	String? propFormat;
	String? dynamicEffect;
	String? pcDynamicEffect;
	String? iosDynamicEffect;
	String? vapJson;
	String? vapText;

	PlayRoomResponseDataRecordsDefaultWallpaperPropInfo();

	factory PlayRoomResponseDataRecordsDefaultWallpaperPropInfo.fromJson(
			Map<String, dynamic> json) =>
			$PlayRoomResponseDataRecordsDefaultWallpaperPropInfoFromJson(json);

	Map<String, dynamic> toJson() =>
			$PlayRoomResponseDataRecordsDefaultWallpaperPropInfoToJson(this);

	@override
	String toString() => jsonEncode(this);
}

@JsonSerializable()
class PlayRoomResponseDataRecordsMicUsers {
	int? id;
	String? userNo;
	String? luckyNo;
	String? sex;
	String? name;
	String? nickName;
	String? avatar;
	String? phoneCountryCode;
	String? telephone;
	String? avatarId;
	int? accompanyId;
	String? introduced;
	int? level;
	int? roomLevel;
	String? accompanyLevel;
	int? childMode;
	int? onlineFlag;
	String? onlineTime;
	String? identityNumber;
	int? userType;
	String? customIdentityImage;
	int? authFlag;
	String? registerTime;
	String? birthday;
	int? enterRoomInvisibleFlag;
	String? mainLabelId;
	String? mainLabel;
	String? moduleAvatar;
	int? robotFlag;

	PlayRoomResponseDataRecordsMicUsers();

	factory PlayRoomResponseDataRecordsMicUsers.fromJson(
			Map<String, dynamic> json) =>
			$PlayRoomResponseDataRecordsMicUsersFromJson(json);

	Map<String, dynamic> toJson() => $PlayRoomResponseDataRecordsMicUsersToJson(this);

	@override
	String toString() => jsonEncode(this);
}
