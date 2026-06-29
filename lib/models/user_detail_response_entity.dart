import 'package:oneww/generated/json/base/json_field.dart';
import 'package:oneww/generated/json/user_detail_response_entity.g.dart';
import 'dart:convert';
export 'package:oneww/generated/json/user_detail_response_entity.g.dart';

@JsonSerializable()
class UserDetailResponseEntity {
	@JSONField(name: 'request_id')
	String requestId = '';
	int code = 0;
	String message = '';
	late UserDetailResponseData data;

	UserDetailResponseEntity();

	factory UserDetailResponseEntity.fromJson(Map<String, dynamic> json) => $UserDetailResponseEntityFromJson(json);

	Map<String, dynamic> toJson() => $UserDetailResponseEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UserDetailResponseData {
	int userId = 0;
	String userNo = '';
	String luckyNo = '';
	String name = '';
	String avatar = '';
	String nickName = '';
	String sex = '';
	String phoneCountryCode = '';
	String telephone = '';
	String birthday = '';
	String constellation = '';
	String introduced = '';
	String hometown = '';
	String coverImage = '';
	int childMode = 0;
	String childPassword = '';
	int authFlag = 0;
	int certFlag = 0;
	int level = 0;
	int roomLevel = 0;
	late UserDetailResponseDataRoomLevelConfigDto roomLevelConfigDto;
	late UserDetailResponseDataNobleLevelDto nobleLevelDto;
	String accompanyLevel = '';
	int accompanyId = 0;
	int userType = 0;
	int currentTime = 0;
	List<UserDetailResponseDataInterestLabel> interestLabel = [];
	late UserDetailResponseDataUserPropDetailDto userPropDetailDto;
	late UserDetailResponseDataGuardianMedal guardianMedal;
	String mainLabelId = '';
	bool lastLoginFlag = false;
	String avatarExpireTime = '';
	String personality = '';
	String charmIcon = '';

	UserDetailResponseData();

	factory UserDetailResponseData.fromJson(Map<String, dynamic> json) => $UserDetailResponseDataFromJson(json);

	Map<String, dynamic> toJson() => $UserDetailResponseDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UserDetailResponseDataRoomLevelConfigDto {
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

	UserDetailResponseDataRoomLevelConfigDto();

	factory UserDetailResponseDataRoomLevelConfigDto.fromJson(Map<String, dynamic> json) => $UserDetailResponseDataRoomLevelConfigDtoFromJson(json);

	Map<String, dynamic> toJson() => $UserDetailResponseDataRoomLevelConfigDtoToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UserDetailResponseDataNobleLevelDto {
	late UserDetailResponseDataNobleLevelDtoUserCurrent userCurrent;
	late UserDetailResponseDataNobleLevelDtoLevelBase levelBase;
	late UserDetailResponseDataNobleLevelDtoPurchaseRecord purchaseRecord;
	List<UserDetailResponseDataNobleLevelDtoPrivileges> privileges = [];

	UserDetailResponseDataNobleLevelDto();

	factory UserDetailResponseDataNobleLevelDto.fromJson(Map<String, dynamic> json) => $UserDetailResponseDataNobleLevelDtoFromJson(json);

	Map<String, dynamic> toJson() => $UserDetailResponseDataNobleLevelDtoToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UserDetailResponseDataNobleLevelDtoUserCurrent {
	int userId = 0;
	int nobleLevelId = 0;
	String nobleName = '';
	int levelFlag = 0;
	String startTime = '';
	String endTime = '';
	int remainingDays = 0;

	UserDetailResponseDataNobleLevelDtoUserCurrent();

	factory UserDetailResponseDataNobleLevelDtoUserCurrent.fromJson(Map<String, dynamic> json) => $UserDetailResponseDataNobleLevelDtoUserCurrentFromJson(json);

	Map<String, dynamic> toJson() => $UserDetailResponseDataNobleLevelDtoUserCurrentToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UserDetailResponseDataNobleLevelDtoLevelBase {
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

	UserDetailResponseDataNobleLevelDtoLevelBase();

	factory UserDetailResponseDataNobleLevelDtoLevelBase.fromJson(Map<String, dynamic> json) => $UserDetailResponseDataNobleLevelDtoLevelBaseFromJson(json);

	Map<String, dynamic> toJson() => $UserDetailResponseDataNobleLevelDtoLevelBaseToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UserDetailResponseDataNobleLevelDtoPurchaseRecord {
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

	UserDetailResponseDataNobleLevelDtoPurchaseRecord();

	factory UserDetailResponseDataNobleLevelDtoPurchaseRecord.fromJson(Map<String, dynamic> json) => $UserDetailResponseDataNobleLevelDtoPurchaseRecordFromJson(json);

	Map<String, dynamic> toJson() => $UserDetailResponseDataNobleLevelDtoPurchaseRecordToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UserDetailResponseDataNobleLevelDtoPrivileges {
	int id = 0;
	String privilegeName = '';
	int privilegeType = 0;
	String privilegeFunction = '';
	String description = '';
	String imageUrl = '';
	bool enabled = false;

	UserDetailResponseDataNobleLevelDtoPrivileges();

	factory UserDetailResponseDataNobleLevelDtoPrivileges.fromJson(Map<String, dynamic> json) => $UserDetailResponseDataNobleLevelDtoPrivilegesFromJson(json);

	Map<String, dynamic> toJson() => $UserDetailResponseDataNobleLevelDtoPrivilegesToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UserDetailResponseDataInterestLabel {
	int labelId = 0;
	String labelName = '';
	String labelType = '';

	UserDetailResponseDataInterestLabel();

	factory UserDetailResponseDataInterestLabel.fromJson(Map<String, dynamic> json) => $UserDetailResponseDataInterestLabelFromJson(json);

	Map<String, dynamic> toJson() => $UserDetailResponseDataInterestLabelToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UserDetailResponseDataUserPropDetailDto {
	late UserDetailResponseDataUserPropDetailDtoChatBubble chatBubble;
	late UserDetailResponseDataUserPropDetailDtoAvatarFrame avatarFrame;
	late UserDetailResponseDataUserPropDetailDtoLevelMedal levelMedal;
	late UserDetailResponseDataUserPropDetailDtoEntranceEffect entranceEffect;
	late UserDetailResponseDataUserPropDetailDtoCustomNickname customNickname;
	late UserDetailResponseDataUserPropDetailDtoHomepageEffect homepageEffect;
	late UserDetailResponseDataUserPropDetailDtoNameplate nameplate;
	late UserDetailResponseDataUserPropDetailDtoMount mount;
	late UserDetailResponseDataUserPropDetailDtoColorfulText colorfulText;
	late UserDetailResponseDataUserPropDetailDtoRoomWallpaper roomWallpaper;
	late UserDetailResponseDataUserPropDetailDtoNobleCard nobleCard;

	UserDetailResponseDataUserPropDetailDto();

	factory UserDetailResponseDataUserPropDetailDto.fromJson(Map<String, dynamic> json) => $UserDetailResponseDataUserPropDetailDtoFromJson(json);

	Map<String, dynamic> toJson() => $UserDetailResponseDataUserPropDetailDtoToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UserDetailResponseDataUserPropDetailDtoChatBubble {
	int id = 0;
	int userId = 0;
	int propId = 0;
	String propName = '';
	int propType = 0;
	String propFormat = '';
	String dynamicEffect = '';
	String pcDynamicEffect = '';
	String iosDynamicEffect = '';
	int customFlag = 0;
	String customInfo = '';
	int useFlag = 0;

	UserDetailResponseDataUserPropDetailDtoChatBubble();

	factory UserDetailResponseDataUserPropDetailDtoChatBubble.fromJson(Map<String, dynamic> json) => $UserDetailResponseDataUserPropDetailDtoChatBubbleFromJson(json);

	Map<String, dynamic> toJson() => $UserDetailResponseDataUserPropDetailDtoChatBubbleToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UserDetailResponseDataUserPropDetailDtoAvatarFrame {
	int id = 0;
	int userId = 0;
	int propId = 0;
	String propName = '';
	int propType = 0;
	String propFormat = '';
	String dynamicEffect = '';
	String pcDynamicEffect = '';
	String iosDynamicEffect = '';
	int customFlag = 0;
	String customInfo = '';
	int useFlag = 0;

	UserDetailResponseDataUserPropDetailDtoAvatarFrame();

	factory UserDetailResponseDataUserPropDetailDtoAvatarFrame.fromJson(Map<String, dynamic> json) => $UserDetailResponseDataUserPropDetailDtoAvatarFrameFromJson(json);

	Map<String, dynamic> toJson() => $UserDetailResponseDataUserPropDetailDtoAvatarFrameToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UserDetailResponseDataUserPropDetailDtoLevelMedal {
	int id = 0;
	int userId = 0;
	int propId = 0;
	String propName = '';
	int propType = 0;
	String propFormat = '';
	String dynamicEffect = '';
	String pcDynamicEffect = '';
	String iosDynamicEffect = '';
	int customFlag = 0;
	String customInfo = '';
	int useFlag = 0;

	UserDetailResponseDataUserPropDetailDtoLevelMedal();

	factory UserDetailResponseDataUserPropDetailDtoLevelMedal.fromJson(Map<String, dynamic> json) => $UserDetailResponseDataUserPropDetailDtoLevelMedalFromJson(json);

	Map<String, dynamic> toJson() => $UserDetailResponseDataUserPropDetailDtoLevelMedalToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UserDetailResponseDataUserPropDetailDtoEntranceEffect {
	int id = 0;
	int userId = 0;
	int propId = 0;
	String propName = '';
	int propType = 0;
	String propFormat = '';
	String dynamicEffect = '';
	String pcDynamicEffect = '';
	String iosDynamicEffect = '';
	int customFlag = 0;
	String customInfo = '';
	int useFlag = 0;

	UserDetailResponseDataUserPropDetailDtoEntranceEffect();

	factory UserDetailResponseDataUserPropDetailDtoEntranceEffect.fromJson(Map<String, dynamic> json) => $UserDetailResponseDataUserPropDetailDtoEntranceEffectFromJson(json);

	Map<String, dynamic> toJson() => $UserDetailResponseDataUserPropDetailDtoEntranceEffectToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UserDetailResponseDataUserPropDetailDtoCustomNickname {
	int id = 0;
	int userId = 0;
	int propId = 0;
	String propName = '';
	int propType = 0;
	String propFormat = '';
	String dynamicEffect = '';
	String pcDynamicEffect = '';
	String iosDynamicEffect = '';
	int customFlag = 0;
	String customInfo = '';
	int useFlag = 0;

	UserDetailResponseDataUserPropDetailDtoCustomNickname();

	factory UserDetailResponseDataUserPropDetailDtoCustomNickname.fromJson(Map<String, dynamic> json) => $UserDetailResponseDataUserPropDetailDtoCustomNicknameFromJson(json);

	Map<String, dynamic> toJson() => $UserDetailResponseDataUserPropDetailDtoCustomNicknameToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UserDetailResponseDataUserPropDetailDtoHomepageEffect {
	int id = 0;
	int userId = 0;
	int propId = 0;
	String propName = '';
	int propType = 0;
	String propFormat = '';
	String dynamicEffect = '';
	String pcDynamicEffect = '';
	String iosDynamicEffect = '';
	int customFlag = 0;
	String customInfo = '';
	int useFlag = 0;

	UserDetailResponseDataUserPropDetailDtoHomepageEffect();

	factory UserDetailResponseDataUserPropDetailDtoHomepageEffect.fromJson(Map<String, dynamic> json) => $UserDetailResponseDataUserPropDetailDtoHomepageEffectFromJson(json);

	Map<String, dynamic> toJson() => $UserDetailResponseDataUserPropDetailDtoHomepageEffectToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UserDetailResponseDataUserPropDetailDtoNameplate {
	int id = 0;
	int userId = 0;
	int propId = 0;
	String propName = '';
	int propType = 0;
	String propFormat = '';
	String dynamicEffect = '';
	String pcDynamicEffect = '';
	String iosDynamicEffect = '';
	int customFlag = 0;
	String customInfo = '';
	int useFlag = 0;

	UserDetailResponseDataUserPropDetailDtoNameplate();

	factory UserDetailResponseDataUserPropDetailDtoNameplate.fromJson(Map<String, dynamic> json) => $UserDetailResponseDataUserPropDetailDtoNameplateFromJson(json);

	Map<String, dynamic> toJson() => $UserDetailResponseDataUserPropDetailDtoNameplateToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UserDetailResponseDataUserPropDetailDtoMount {
	int id = 0;
	int userId = 0;
	int propId = 0;
	String propName = '';
	int propType = 0;
	String propFormat = '';
	String dynamicEffect = '';
	String pcDynamicEffect = '';
	String iosDynamicEffect = '';
	int customFlag = 0;
	String customInfo = '';
	int useFlag = 0;

	UserDetailResponseDataUserPropDetailDtoMount();

	factory UserDetailResponseDataUserPropDetailDtoMount.fromJson(Map<String, dynamic> json) => $UserDetailResponseDataUserPropDetailDtoMountFromJson(json);

	Map<String, dynamic> toJson() => $UserDetailResponseDataUserPropDetailDtoMountToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UserDetailResponseDataUserPropDetailDtoColorfulText {
	int id = 0;
	int userId = 0;
	int propId = 0;
	String propName = '';
	int propType = 0;
	String propFormat = '';
	String dynamicEffect = '';
	String pcDynamicEffect = '';
	String iosDynamicEffect = '';
	int customFlag = 0;
	String customInfo = '';
	int useFlag = 0;

	UserDetailResponseDataUserPropDetailDtoColorfulText();

	factory UserDetailResponseDataUserPropDetailDtoColorfulText.fromJson(Map<String, dynamic> json) => $UserDetailResponseDataUserPropDetailDtoColorfulTextFromJson(json);

	Map<String, dynamic> toJson() => $UserDetailResponseDataUserPropDetailDtoColorfulTextToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UserDetailResponseDataUserPropDetailDtoRoomWallpaper {
	int id = 0;
	int userId = 0;
	int propId = 0;
	String propName = '';
	int propType = 0;
	String propFormat = '';
	String dynamicEffect = '';
	String pcDynamicEffect = '';
	String iosDynamicEffect = '';
	int customFlag = 0;
	String customInfo = '';
	int useFlag = 0;

	UserDetailResponseDataUserPropDetailDtoRoomWallpaper();

	factory UserDetailResponseDataUserPropDetailDtoRoomWallpaper.fromJson(Map<String, dynamic> json) => $UserDetailResponseDataUserPropDetailDtoRoomWallpaperFromJson(json);

	Map<String, dynamic> toJson() => $UserDetailResponseDataUserPropDetailDtoRoomWallpaperToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UserDetailResponseDataUserPropDetailDtoNobleCard {
	int id = 0;
	int userId = 0;
	int propId = 0;
	String propName = '';
	int propType = 0;
	String propFormat = '';
	String dynamicEffect = '';
	String pcDynamicEffect = '';
	String iosDynamicEffect = '';
	int customFlag = 0;
	String customInfo = '';
	int useFlag = 0;

	UserDetailResponseDataUserPropDetailDtoNobleCard();

	factory UserDetailResponseDataUserPropDetailDtoNobleCard.fromJson(Map<String, dynamic> json) => $UserDetailResponseDataUserPropDetailDtoNobleCardFromJson(json);

	Map<String, dynamic> toJson() => $UserDetailResponseDataUserPropDetailDtoNobleCardToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UserDetailResponseDataGuardianMedal {
	int guardianLevel = 0;
	String roomNamePrefix = '';
	String streamerTagPrefix = '';
	int roomId = 0;
	int streamerUserId = 0;
	bool isGold = false;

	UserDetailResponseDataGuardianMedal();

	factory UserDetailResponseDataGuardianMedal.fromJson(Map<String, dynamic> json) => $UserDetailResponseDataGuardianMedalFromJson(json);

	Map<String, dynamic> toJson() => $UserDetailResponseDataGuardianMedalToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}