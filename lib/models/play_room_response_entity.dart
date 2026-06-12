import 'package:oneww/generated/json/base/json_field.dart';
import 'package:oneww/generated/json/play_room_response_entity.g.dart';
import 'dart:convert';
export 'package:oneww/generated/json/play_room_response_entity.g.dart';

@JsonSerializable()
class PlayRoomResponseEntity {
	@JSONField(name: 'request_id')
	String? requestId;
	int? code;
	String? message;
	PlayRoomResponseData? data = PlayRoomResponseData();

	PlayRoomResponseEntity({required List<dynamic> data});

	factory PlayRoomResponseEntity.fromJson(Map<String, dynamic> json) => $PlayRoomResponseEntityFromJson(json);

	Map<String, dynamic> toJson() => $PlayRoomResponseEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PlayRoomResponseData {
	late int? pageNo;
	late int? pageSize;
	late int? total;
	late int? pages;
	late List<PlayRoomResponseDataRecords>? records;

	PlayRoomResponseData();

	factory PlayRoomResponseData.fromJson(Map<String, dynamic> json) => $PlayRoomResponseDataFromJson(json);

	Map<String, dynamic> toJson() => $PlayRoomResponseDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PlayRoomResponseDataRecords {
	late int? id;
	late int? moduleId;
	late String? moduleName;
	late String? mainLabel;
	late String? moduleAvatar;
	late int? roomNo;
	late String? roomName;
	late String? roomAvatar;
	late int? roomType;
	late String? roomTypeName;
	late int? roomStatus;
	late int? display;
	late int? openStatus;
	late String? announcement;
	late String? welcomeMsg;
	late int? heatValue;
	late String? heatValueStr;
	late int? followStatus;
	late int? onlineCount;
	late int? withdrawalSettings;
	late int? passwordSettings;
	late int? roomOwner;
	late int? wallpaperPropId;
	late String? wallpaperWearTime;
	late int? wearStatus;
	late PlayRoomResponseDataRecordsWallpaperPropInfo? wallpaperPropInfo;
	late int? defaultWallpaperPropId;
	late PlayRoomResponseDataRecordsDefaultWallpaperPropInfo? defaultWallpaperPropInfo;
	late int? guildId;
	late String? userName;
	late String? userAvatar;
	late int? otherType;
	late String? otherBusinessId;
	late String? otherValue;
	late String? otherAvatar;
	late int? kolId;
	late int? businessRoomType;
	late List<PlayRoomResponseDataRecordsMicUsers>? micUsers;
	late String? gloryBorder;

	PlayRoomResponseDataRecords();

	factory PlayRoomResponseDataRecords.fromJson(Map<String, dynamic> json) => $PlayRoomResponseDataRecordsFromJson(json);

	Map<String, dynamic> toJson() => $PlayRoomResponseDataRecordsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PlayRoomResponseDataRecordsWallpaperPropInfo {
	late int? userId;
	late int? propId;
	late String? propName;
	late int? propType;
	late String? propFormat;
	late String? dynamicEffect;
	late String? pcDynamicEffect;
	late String? iosDynamicEffect;
	late String? vapJson;
	late String? vapText;

	PlayRoomResponseDataRecordsWallpaperPropInfo();

	factory PlayRoomResponseDataRecordsWallpaperPropInfo.fromJson(Map<String, dynamic> json) => $PlayRoomResponseDataRecordsWallpaperPropInfoFromJson(json);

	Map<String, dynamic> toJson() => $PlayRoomResponseDataRecordsWallpaperPropInfoToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PlayRoomResponseDataRecordsDefaultWallpaperPropInfo {
	late int? userId;
	late int? propId;
	late String? propName;
	late int? propType;
	late String? propFormat;
	late String? dynamicEffect;
	late String? pcDynamicEffect;
	late String? iosDynamicEffect;
	late String? vapJson;
	late String? vapText;

	PlayRoomResponseDataRecordsDefaultWallpaperPropInfo();

	factory PlayRoomResponseDataRecordsDefaultWallpaperPropInfo.fromJson(Map<String, dynamic> json) => $PlayRoomResponseDataRecordsDefaultWallpaperPropInfoFromJson(json);

	Map<String, dynamic> toJson() => $PlayRoomResponseDataRecordsDefaultWallpaperPropInfoToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PlayRoomResponseDataRecordsMicUsers {
	late int? id;
	late String? userNo;
	late String? luckyNo;
	late String? sex;
	late String? name;
	late String? nickName;
	late String? avatar;
	late String? phoneCountryCode;
	late String? telephone;
	late String? avatarId;
	late int? accompanyId;
	late String? introduced;
	late int? level;
	late int? roomLevel;
	late String? accompanyLevel;
	late int? childMode;
	late int? onlineFlag;
	late String? onlineTime;
	late String? identityNumber;
	late int? userType;
	late String? customIdentityImage;
	late int? authFlag;
	late String? registerTime;
	late String? birthday;
	late int? enterRoomInvisibleFlag;
	late String? mainLabelId;
	late String? mainLabel;
	late String? moduleAvatar;
	late int? robotFlag;

	PlayRoomResponseDataRecordsMicUsers();

	factory PlayRoomResponseDataRecordsMicUsers.fromJson(Map<String, dynamic> json) => $PlayRoomResponseDataRecordsMicUsersFromJson(json);

	Map<String, dynamic> toJson() => $PlayRoomResponseDataRecordsMicUsersToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}