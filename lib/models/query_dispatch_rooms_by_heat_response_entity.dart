import 'package:oneww/generated/json/base/json_field.dart';
import 'package:oneww/generated/json/query_dispatch_rooms_by_heat_response_entity.g.dart';
import 'dart:convert';
export 'package:oneww/generated/json/query_dispatch_rooms_by_heat_response_entity.g.dart';

@JsonSerializable()
class QueryDispatchRoomsByHeatResponseEntity {
	@JSONField(name: 'request_id')
	String requestId = '';
	int code = 0;
	String message = '';
	QueryDispatchRoomsByHeatResponseData data = QueryDispatchRoomsByHeatResponseData();

	QueryDispatchRoomsByHeatResponseEntity();

	factory QueryDispatchRoomsByHeatResponseEntity.fromJson(Map<String, dynamic> json) => $QueryDispatchRoomsByHeatResponseEntityFromJson(json);

	Map<String, dynamic> toJson() => $QueryDispatchRoomsByHeatResponseEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class QueryDispatchRoomsByHeatResponseData {
	int pageNo = 0;
	int pageSize = 0;
	int total = 0;
	int pages = 0;
	List<QueryDispatchRoomsByHeatResponseDataRecords> records = [];

	QueryDispatchRoomsByHeatResponseData();

	factory QueryDispatchRoomsByHeatResponseData.fromJson(Map<String, dynamic> json) => $QueryDispatchRoomsByHeatResponseDataFromJson(json);

	Map<String, dynamic> toJson() => $QueryDispatchRoomsByHeatResponseDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class QueryDispatchRoomsByHeatResponseDataRecords {
	int id = 0;
	int channelId = 0;
	int groupId = 0;
	String roomNo = '';
	String roomName = '';
	String roomAvatar = '';
	int roomOwner = 0;
	int roomType = 0;
	int roomMode = 0;
	String announcement = '';
	String welcomeMsg = '';
	QueryDispatchRoomsByHeatResponseDataRecordsPreside preside = QueryDispatchRoomsByHeatResponseDataRecordsPreside();
	QueryDispatchRoomsByHeatResponseDataRecordsOwner owner = QueryDispatchRoomsByHeatResponseDataRecordsOwner();
	int status = 0;
	int openStatus = 0;
	int queueCnt = 0;
	int onlineMemberCount = 0;
	int heatValue = 0;
	int passwordSettings = 0;
	int kolId = 0;

	QueryDispatchRoomsByHeatResponseDataRecords();

	factory QueryDispatchRoomsByHeatResponseDataRecords.fromJson(Map<String, dynamic> json) => $QueryDispatchRoomsByHeatResponseDataRecordsFromJson(json);

	Map<String, dynamic> toJson() => $QueryDispatchRoomsByHeatResponseDataRecordsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class QueryDispatchRoomsByHeatResponseDataRecordsPreside {
	int id = 0;
	String userNo = '';
	String sex = '';
	String nickName = '';
	String avatar = '';
	int onlineFlag = 0;
	int accompanyId = 0;
	String introduced = '';
	int level = 0;
	int roomLevel = 0;
	QueryDispatchRoomsByHeatResponseDataRecordsPresideRoomLevelConfigDto roomLevelConfigDto = QueryDispatchRoomsByHeatResponseDataRecordsPresideRoomLevelConfigDto();
	QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDto nobleLevelDto = QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDto();
	String accompanyLevel = '';
	String onlineTime = '';
	String customIdentityImage = '';
	List<String> customIdentityImageList = [];
	int userMic = 0;
	String birthday = '';
	String mainLabelId = '';
	String mainLabel = '';
	String moduleAvatar = '';

	QueryDispatchRoomsByHeatResponseDataRecordsPreside();

	factory QueryDispatchRoomsByHeatResponseDataRecordsPreside.fromJson(Map<String, dynamic> json) => $QueryDispatchRoomsByHeatResponseDataRecordsPresideFromJson(json);

	Map<String, dynamic> toJson() => $QueryDispatchRoomsByHeatResponseDataRecordsPresideToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class QueryDispatchRoomsByHeatResponseDataRecordsPresideRoomLevelConfigDto {
	int id = 0;
	String levelName = '';
	String icon = '';
	String backdrop = '';
	String medal = '';
	String homeBackdrop = '';
	String pcMedal = '';
	String pcIcon = '';
	int level = 0;
	int startPoints = 0;
	int endPoints = 0;
	int medalUsable = 0;
	int recommendUsable = 0;
	int recommendRate = 0;
	int giftUsable = 0;
	int avatarUsable = 0;
	int avatarConfigId = 0;
	int animationUsable = 0;
	int animationConfigId = 0;
	int nickColorUsable = 0;
	int nickColorConfigId = 0;
	int textColorUsable = 0;
	int textColorConfigId = 0;
	int birthdayUsable = 0;
	int birthdayRightsPackageId = 0;
	int invisibleRankUsable = 0;
	String invisibleRankNick = '';
	int invisibleRoomUsable = 0;
	int supportUsable = 0;
	int productCreateUsable = 0;

	QueryDispatchRoomsByHeatResponseDataRecordsPresideRoomLevelConfigDto();

	factory QueryDispatchRoomsByHeatResponseDataRecordsPresideRoomLevelConfigDto.fromJson(Map<String, dynamic> json) => $QueryDispatchRoomsByHeatResponseDataRecordsPresideRoomLevelConfigDtoFromJson(json);

	Map<String, dynamic> toJson() => $QueryDispatchRoomsByHeatResponseDataRecordsPresideRoomLevelConfigDtoToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDto {
	QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoUserCurrent userCurrent = QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoUserCurrent();
	QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoLevelBase levelBase = QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoLevelBase();
	QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoPurchaseRecord purchaseRecord = QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoPurchaseRecord();
	List<QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoPrivileges> privileges = [];

	QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDto();

	factory QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDto.fromJson(Map<String, dynamic> json) => $QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoFromJson(json);

	Map<String, dynamic> toJson() => $QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoUserCurrent {
	int userId = 0;
	int nobleLevelId = 0;
	String nobleName = '';
	int levelFlag = 0;
	String startTime = '';
	String endTime = '';
	int remainingDays = 0;

	QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoUserCurrent();

	factory QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoUserCurrent.fromJson(Map<String, dynamic> json) => $QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoUserCurrentFromJson(json);

	Map<String, dynamic> toJson() => $QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoUserCurrentToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoLevelBase {
	int id = 0;
	int goodsId = 0;
	int propId = 0;
	String levelName = '';
	int levelFlag = 0;
	String mainImageUrl = '';
	String badgeImageUrl = '';
	String middleImageUrl = '';
	String description = '';
	int purchaseType = 0;
	int firstPrice = 0;
	int renewPrice = 0;
	int firstSkuId = 0;
	int renewSkuId = 0;
	int firstGiftType = 0;
	int firstGiftId = 0;
	String firstGiftName = '';
	String firstGiftUrl = '';
	int firstGiftAmount = 0;
	int firstGiftPurchaseType = 0;
	int firstGiftPrice = 0;
	bool directPurchase = false;
	int purchaseDuration = 0;

	QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoLevelBase();

	factory QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoLevelBase.fromJson(Map<String, dynamic> json) => $QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoLevelBaseFromJson(json);

	Map<String, dynamic> toJson() => $QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoLevelBaseToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoPurchaseRecord {
	int id = 0;
	int userId = 0;
	int nobleLevelId = 0;
	String nobleLevelName = '';
	int purchaseType = 0;
	int price = 0;
	int purchaseFlag = 0;
	int durationDays = 0;
	String purchaseTime = '';
	int roomId = 0;
	int orderId = 0;
	String orderNo = '';

	QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoPurchaseRecord();

	factory QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoPurchaseRecord.fromJson(Map<String, dynamic> json) => $QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoPurchaseRecordFromJson(json);

	Map<String, dynamic> toJson() => $QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoPurchaseRecordToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoPrivileges {
	int id = 0;
	String privilegeName = '';
	int privilegeType = 0;
	String privilegeFunction = '';
	String description = '';
	String imageUrl = '';
	bool enabled = false;

	QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoPrivileges();

	factory QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoPrivileges.fromJson(Map<String, dynamic> json) => $QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoPrivilegesFromJson(json);

	Map<String, dynamic> toJson() => $QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoPrivilegesToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class QueryDispatchRoomsByHeatResponseDataRecordsOwner {
	int id = 0;
	String userNo = '';
	String sex = '';
	String nickName = '';
	String avatar = '';
	int onlineFlag = 0;
	int accompanyId = 0;
	String introduced = '';
	int level = 0;
	int roomLevel = 0;
	QueryDispatchRoomsByHeatResponseDataRecordsOwnerRoomLevelConfigDto roomLevelConfigDto = QueryDispatchRoomsByHeatResponseDataRecordsOwnerRoomLevelConfigDto();
	QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDto nobleLevelDto = QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDto();
	String accompanyLevel = '';
	String onlineTime = '';
	String customIdentityImage = '';
	List<String> customIdentityImageList = [];
	int userMic = 0;
	String birthday = '';
	String mainLabelId = '';
	String mainLabel = '';
	String moduleAvatar = '';

	QueryDispatchRoomsByHeatResponseDataRecordsOwner();

	factory QueryDispatchRoomsByHeatResponseDataRecordsOwner.fromJson(Map<String, dynamic> json) => $QueryDispatchRoomsByHeatResponseDataRecordsOwnerFromJson(json);

	Map<String, dynamic> toJson() => $QueryDispatchRoomsByHeatResponseDataRecordsOwnerToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class QueryDispatchRoomsByHeatResponseDataRecordsOwnerRoomLevelConfigDto {
	int id = 0;
	String levelName = '';
	String icon = '';
	String backdrop = '';
	String medal = '';
	String homeBackdrop = '';
	String pcMedal = '';
	String pcIcon = '';
	int level = 0;
	int startPoints = 0;
	int endPoints = 0;
	int medalUsable = 0;
	int recommendUsable = 0;
	int recommendRate = 0;
	int giftUsable = 0;
	int avatarUsable = 0;
	int avatarConfigId = 0;
	int animationUsable = 0;
	int animationConfigId = 0;
	int nickColorUsable = 0;
	int nickColorConfigId = 0;
	int textColorUsable = 0;
	int textColorConfigId = 0;
	int birthdayUsable = 0;
	int birthdayRightsPackageId = 0;
	int invisibleRankUsable = 0;
	String invisibleRankNick = '';
	int invisibleRoomUsable = 0;
	int supportUsable = 0;
	int productCreateUsable = 0;

	QueryDispatchRoomsByHeatResponseDataRecordsOwnerRoomLevelConfigDto();

	factory QueryDispatchRoomsByHeatResponseDataRecordsOwnerRoomLevelConfigDto.fromJson(Map<String, dynamic> json) => $QueryDispatchRoomsByHeatResponseDataRecordsOwnerRoomLevelConfigDtoFromJson(json);

	Map<String, dynamic> toJson() => $QueryDispatchRoomsByHeatResponseDataRecordsOwnerRoomLevelConfigDtoToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDto {
	QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoUserCurrent userCurrent = QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoUserCurrent();
	QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoLevelBase levelBase = QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoLevelBase();
	QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoPurchaseRecord purchaseRecord = QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoPurchaseRecord();
	List<QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoPrivileges> privileges = [];

	QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDto();

	factory QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDto.fromJson(Map<String, dynamic> json) => $QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoFromJson(json);

	Map<String, dynamic> toJson() => $QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoUserCurrent {
	int userId = 0;
	int nobleLevelId = 0;
	String nobleName = '';
	int levelFlag = 0;
	String startTime = '';
	String endTime = '';
	int remainingDays = 0;

	QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoUserCurrent();

	factory QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoUserCurrent.fromJson(Map<String, dynamic> json) => $QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoUserCurrentFromJson(json);

	Map<String, dynamic> toJson() => $QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoUserCurrentToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoLevelBase {
	int id = 0;
	int goodsId = 0;
	int propId = 0;
	String levelName = '';
	int levelFlag = 0;
	String mainImageUrl = '';
	String badgeImageUrl = '';
	String middleImageUrl = '';
	String description = '';
	int purchaseType = 0;
	int firstPrice = 0;
	int renewPrice = 0;
	int firstSkuId = 0;
	int renewSkuId = 0;
	int firstGiftType = 0;
	int firstGiftId = 0;
	String firstGiftName = '';
	String firstGiftUrl = '';
	int firstGiftAmount = 0;
	int firstGiftPurchaseType = 0;
	int firstGiftPrice = 0;
	bool directPurchase = false;
	int purchaseDuration = 0;

	QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoLevelBase();

	factory QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoLevelBase.fromJson(Map<String, dynamic> json) => $QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoLevelBaseFromJson(json);

	Map<String, dynamic> toJson() => $QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoLevelBaseToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoPurchaseRecord {
	int id = 0;
	int userId = 0;
	int nobleLevelId = 0;
	String nobleLevelName = '';
	int purchaseType = 0;
	int price = 0;
	int purchaseFlag = 0;
	int durationDays = 0;
	String purchaseTime = '';
	int roomId = 0;
	int orderId = 0;
	String orderNo = '';

	QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoPurchaseRecord();

	factory QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoPurchaseRecord.fromJson(Map<String, dynamic> json) => $QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoPurchaseRecordFromJson(json);

	Map<String, dynamic> toJson() => $QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoPurchaseRecordToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoPrivileges {
	int id = 0;
	String privilegeName = '';
	int privilegeType = 0;
	String privilegeFunction = '';
	String description = '';
	String imageUrl = '';
	bool enabled = false;

	QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoPrivileges();

	factory QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoPrivileges.fromJson(Map<String, dynamic> json) => $QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoPrivilegesFromJson(json);

	Map<String, dynamic> toJson() => $QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoPrivilegesToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}