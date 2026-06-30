import 'package:oneww/generated/json/base/json_field.dart';
import 'package:oneww/generated/json/user_gift_wall_response_entity.g.dart';
import 'dart:convert';
export 'package:oneww/generated/json/user_gift_wall_response_entity.g.dart';

@JsonSerializable()
class UserGiftWallResponseEntity {
	@JSONField(name: 'request_id')
	String requestId = '';
	int code = 0;
	String message = '';
	late UserGiftWallResponseData data;

	UserGiftWallResponseEntity();

	factory UserGiftWallResponseEntity.fromJson(Map<String, dynamic> json) => $UserGiftWallResponseEntityFromJson(json);

	Map<String, dynamic> toJson() => $UserGiftWallResponseEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UserGiftWallResponseData {
	int pageNo = 0;
	int pageSize = 0;
	int total = 0;
	int pages = 0;
	List<UserGiftWallResponseDataRecords> records = [];

	UserGiftWallResponseData();

	factory UserGiftWallResponseData.fromJson(Map<String, dynamic> json) => $UserGiftWallResponseDataFromJson(json);

	Map<String, dynamic> toJson() => $UserGiftWallResponseDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UserGiftWallResponseDataRecords {
	int id = 0;
	String giftName = '';
	int rechargeType = 0;
	String showImage = '';
	String staticEffect = '';
	String dynamicEffect = '';
	int giftPrice = 0;
	int giftCount = 0;
	String giveTime = '';
	int isLight = 0;
	late UserGiftWallResponseDataRecordsGiveUser giveUser;

	UserGiftWallResponseDataRecords();

	factory UserGiftWallResponseDataRecords.fromJson(Map<String, dynamic> json) => $UserGiftWallResponseDataRecordsFromJson(json);

	Map<String, dynamic> toJson() => $UserGiftWallResponseDataRecordsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UserGiftWallResponseDataRecordsGiveUser {
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
	late UserGiftWallResponseDataRecordsGiveUserRoomLevelConfigDto roomLevelConfigDto;
	late UserGiftWallResponseDataRecordsGiveUserNobleLevelDto nobleLevelDto;
	String accompanyLevel = '';
	String onlineTime = '';
	String customIdentityImage = '';
	List<String> customIdentityImageList = [];
	int userMic = 0;
	String birthday = '';
	String mainLabelId = '';
	String mainLabel = '';
	String moduleAvatar = '';

	UserGiftWallResponseDataRecordsGiveUser();

	factory UserGiftWallResponseDataRecordsGiveUser.fromJson(Map<String, dynamic> json) => $UserGiftWallResponseDataRecordsGiveUserFromJson(json);

	Map<String, dynamic> toJson() => $UserGiftWallResponseDataRecordsGiveUserToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UserGiftWallResponseDataRecordsGiveUserRoomLevelConfigDto {
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

	UserGiftWallResponseDataRecordsGiveUserRoomLevelConfigDto();

	factory UserGiftWallResponseDataRecordsGiveUserRoomLevelConfigDto.fromJson(Map<String, dynamic> json) => $UserGiftWallResponseDataRecordsGiveUserRoomLevelConfigDtoFromJson(json);

	Map<String, dynamic> toJson() => $UserGiftWallResponseDataRecordsGiveUserRoomLevelConfigDtoToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UserGiftWallResponseDataRecordsGiveUserNobleLevelDto {
	late UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoUserCurrent userCurrent;
	late UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoLevelBase levelBase;
	late UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoPurchaseRecord purchaseRecord;
	List<UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoPrivileges> privileges = [];

	UserGiftWallResponseDataRecordsGiveUserNobleLevelDto();

	factory UserGiftWallResponseDataRecordsGiveUserNobleLevelDto.fromJson(Map<String, dynamic> json) => $UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoFromJson(json);

	Map<String, dynamic> toJson() => $UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoUserCurrent {
	int userId = 0;
	int nobleLevelId = 0;
	String nobleName = '';
	int levelFlag = 0;
	String startTime = '';
	String endTime = '';
	int remainingDays = 0;

	UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoUserCurrent();

	factory UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoUserCurrent.fromJson(Map<String, dynamic> json) => $UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoUserCurrentFromJson(json);

	Map<String, dynamic> toJson() => $UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoUserCurrentToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoLevelBase {
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

	UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoLevelBase();

	factory UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoLevelBase.fromJson(Map<String, dynamic> json) => $UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoLevelBaseFromJson(json);

	Map<String, dynamic> toJson() => $UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoLevelBaseToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoPurchaseRecord {
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

	UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoPurchaseRecord();

	factory UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoPurchaseRecord.fromJson(Map<String, dynamic> json) => $UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoPurchaseRecordFromJson(json);

	Map<String, dynamic> toJson() => $UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoPurchaseRecordToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoPrivileges {
	int id = 0;
	String privilegeName = '';
	int privilegeType = 0;
	String privilegeFunction = '';
	String description = '';
	String imageUrl = '';
	bool enabled = false;

	UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoPrivileges();

	factory UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoPrivileges.fromJson(Map<String, dynamic> json) => $UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoPrivilegesFromJson(json);

	Map<String, dynamic> toJson() => $UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoPrivilegesToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}