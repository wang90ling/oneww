import 'package:oneww/generated/json/base/json_field.dart';
import 'package:oneww/generated/json/home_new_recommend_entity.g.dart';
import 'dart:convert';
export 'package:oneww/generated/json/home_new_recommend_entity.g.dart';

@JsonSerializable()
class HomeNewRecommendEntity {
	@JSONField(name: 'request_id')
	String requestId = '';
	int code = 0;
	String message = '';
	late HomeNewRecommendData data;

	HomeNewRecommendEntity();

	factory HomeNewRecommendEntity.fromJson(Map<String, dynamic> json) => $HomeNewRecommendEntityFromJson(json);

	Map<String, dynamic> toJson() => $HomeNewRecommendEntityToJson(this);

	List<HomeNewRecommendDataRecords> get records => data.records;
	String get pageNo => data.pageNo.toString();
	String get pageSize => data.pageSize.toString();
	String get pages => data.pages.toString();
	String get total => data.total.toString();

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class HomeNewRecommendData {
	int pageNo = 0;
	int pageSize = 0;
	int total = 0;
	int pages = 0;
	List<HomeNewRecommendDataRecords> records = [];

	HomeNewRecommendData();

	factory HomeNewRecommendData.fromJson(Map<String, dynamic> json) => $HomeNewRecommendDataFromJson(json);

	Map<String, dynamic> toJson() => $HomeNewRecommendDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class HomeNewRecommendDataRecords {
	int userId = 0;
	String userNo = '';
	String luckyNo = '';
	int categoryId = 0;
	String nickName = '';
	String avatar = '';
	String sex = '';
	int age = 0;
	String introduced = '';
	String coverImage = '';
	String grade = '';
	int scoreAvg = 0;
	int orderAmount = 0;
	int level = 0;
	int roomLevel = 0;
	late HomeNewRecommendDataRecordsRoomLevelConfigDto roomLevelConfigDto;
	late HomeNewRecommendDataRecordsNobleLevelDto nobleLevelDto;
	int accompanyLevel = 0;
	int onlineFlag = 0;
	List<HomeNewRecommendDataRecordsCategoryList> categoryList = [];
	late HomeNewRecommendDataRecordsUserPropDetailDto userPropDetailDto;

	HomeNewRecommendDataRecords();

	factory HomeNewRecommendDataRecords.fromJson(Map<String, dynamic> json) => $HomeNewRecommendDataRecordsFromJson(json);

	Map<String, dynamic> toJson() => $HomeNewRecommendDataRecordsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class HomeNewRecommendDataRecordsRoomLevelConfigDto {
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

	HomeNewRecommendDataRecordsRoomLevelConfigDto();

	factory HomeNewRecommendDataRecordsRoomLevelConfigDto.fromJson(Map<String, dynamic> json) => $HomeNewRecommendDataRecordsRoomLevelConfigDtoFromJson(json);

	Map<String, dynamic> toJson() => $HomeNewRecommendDataRecordsRoomLevelConfigDtoToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class HomeNewRecommendDataRecordsNobleLevelDto {
	late HomeNewRecommendDataRecordsNobleLevelDtoUserCurrent userCurrent;
	late HomeNewRecommendDataRecordsNobleLevelDtoLevelBase levelBase;
	late HomeNewRecommendDataRecordsNobleLevelDtoPurchaseRecord purchaseRecord;
	List<HomeNewRecommendDataRecordsNobleLevelDtoPrivileges> privileges = [];

	HomeNewRecommendDataRecordsNobleLevelDto();

	factory HomeNewRecommendDataRecordsNobleLevelDto.fromJson(Map<String, dynamic> json) => $HomeNewRecommendDataRecordsNobleLevelDtoFromJson(json);

	Map<String, dynamic> toJson() => $HomeNewRecommendDataRecordsNobleLevelDtoToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class HomeNewRecommendDataRecordsNobleLevelDtoUserCurrent {
	int userId = 0;
	int nobleLevelId = 0;
	String nobleName = '';
	int levelFlag = 0;
	String startTime = '';
	String endTime = '';
	int remainingDays = 0;

	HomeNewRecommendDataRecordsNobleLevelDtoUserCurrent();

	factory HomeNewRecommendDataRecordsNobleLevelDtoUserCurrent.fromJson(Map<String, dynamic> json) => $HomeNewRecommendDataRecordsNobleLevelDtoUserCurrentFromJson(json);

	Map<String, dynamic> toJson() => $HomeNewRecommendDataRecordsNobleLevelDtoUserCurrentToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class HomeNewRecommendDataRecordsNobleLevelDtoLevelBase {
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

	HomeNewRecommendDataRecordsNobleLevelDtoLevelBase();

	factory HomeNewRecommendDataRecordsNobleLevelDtoLevelBase.fromJson(Map<String, dynamic> json) => $HomeNewRecommendDataRecordsNobleLevelDtoLevelBaseFromJson(json);

	Map<String, dynamic> toJson() => $HomeNewRecommendDataRecordsNobleLevelDtoLevelBaseToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class HomeNewRecommendDataRecordsNobleLevelDtoPurchaseRecord {
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

	HomeNewRecommendDataRecordsNobleLevelDtoPurchaseRecord();

	factory HomeNewRecommendDataRecordsNobleLevelDtoPurchaseRecord.fromJson(Map<String, dynamic> json) => $HomeNewRecommendDataRecordsNobleLevelDtoPurchaseRecordFromJson(json);

	Map<String, dynamic> toJson() => $HomeNewRecommendDataRecordsNobleLevelDtoPurchaseRecordToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class HomeNewRecommendDataRecordsNobleLevelDtoPrivileges {
	int id = 0;
	String privilegeName = '';
	int privilegeType = 0;
	String privilegeFunction = '';
	String description = '';
	String imageUrl = '';
	bool enabled = false;

	HomeNewRecommendDataRecordsNobleLevelDtoPrivileges();

	factory HomeNewRecommendDataRecordsNobleLevelDtoPrivileges.fromJson(Map<String, dynamic> json) => $HomeNewRecommendDataRecordsNobleLevelDtoPrivilegesFromJson(json);

	Map<String, dynamic> toJson() => $HomeNewRecommendDataRecordsNobleLevelDtoPrivilegesToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class HomeNewRecommendDataRecordsCategoryList {
	int id = 0;
	int userId = 0;
	int categoryId = 0;
	String categoryName = '';
	String introduced = '';
	String maxStandard = '';
	int receiveStatus = 0;
	String categoryFileUrl = '';
	String categoryCoverImageUrl = '';
	String backgroundFileUrl = '';
	String voiceIntroduced = '';
	List<HomeNewRecommendDataRecordsCategoryListFileList> fileList = [];
	List<HomeNewRecommendDataRecordsCategoryListFieldList> fieldList = [];
	String field1 = '';
	String field2 = '';
	String field3 = '';
	String field4 = '';
	String field5 = '';
	String field6 = '';
	String field7 = '';
	String field8 = '';
	String field9 = '';
	String field10 = '';
	String field11 = '';
	String field12 = '';
	String field13 = '';
	String field14 = '';
	String field15 = '';
	List<HomeNewRecommendDataRecordsCategoryListPriceList> priceList = [];
	int roomLevel = 0;
	late HomeNewRecommendDataRecordsCategoryListRoomLevelConfigDto roomLevelConfigDto;

	HomeNewRecommendDataRecordsCategoryList();

	factory HomeNewRecommendDataRecordsCategoryList.fromJson(Map<String, dynamic> json) => $HomeNewRecommendDataRecordsCategoryListFromJson(json);

	Map<String, dynamic> toJson() => $HomeNewRecommendDataRecordsCategoryListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class HomeNewRecommendDataRecordsCategoryListFileList {
	int accompanyCategoryId = 0;
	int audioDuration = 0;
	String fileId = '';
	String fileUrl = '';
	String fileType = '';
	int sort = 0;

	HomeNewRecommendDataRecordsCategoryListFileList();

	factory HomeNewRecommendDataRecordsCategoryListFileList.fromJson(Map<String, dynamic> json) => $HomeNewRecommendDataRecordsCategoryListFileListFromJson(json);

	Map<String, dynamic> toJson() => $HomeNewRecommendDataRecordsCategoryListFileListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class HomeNewRecommendDataRecordsCategoryListFieldList {
	late HomeNewRecommendDataRecordsCategoryListFieldListAdditionalProp1 additionalProp1;
	late HomeNewRecommendDataRecordsCategoryListFieldListAdditionalProp2 additionalProp2;
	late HomeNewRecommendDataRecordsCategoryListFieldListAdditionalProp3 additionalProp3;

	HomeNewRecommendDataRecordsCategoryListFieldList();

	factory HomeNewRecommendDataRecordsCategoryListFieldList.fromJson(Map<String, dynamic> json) => $HomeNewRecommendDataRecordsCategoryListFieldListFromJson(json);

	Map<String, dynamic> toJson() => $HomeNewRecommendDataRecordsCategoryListFieldListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class HomeNewRecommendDataRecordsCategoryListFieldListAdditionalProp1 {


	HomeNewRecommendDataRecordsCategoryListFieldListAdditionalProp1();

	factory HomeNewRecommendDataRecordsCategoryListFieldListAdditionalProp1.fromJson(Map<String, dynamic> json) => $HomeNewRecommendDataRecordsCategoryListFieldListAdditionalProp1FromJson(json);

	Map<String, dynamic> toJson() => $HomeNewRecommendDataRecordsCategoryListFieldListAdditionalProp1ToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class HomeNewRecommendDataRecordsCategoryListFieldListAdditionalProp2 {


	HomeNewRecommendDataRecordsCategoryListFieldListAdditionalProp2();

	factory HomeNewRecommendDataRecordsCategoryListFieldListAdditionalProp2.fromJson(Map<String, dynamic> json) => $HomeNewRecommendDataRecordsCategoryListFieldListAdditionalProp2FromJson(json);

	Map<String, dynamic> toJson() => $HomeNewRecommendDataRecordsCategoryListFieldListAdditionalProp2ToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class HomeNewRecommendDataRecordsCategoryListFieldListAdditionalProp3 {


	HomeNewRecommendDataRecordsCategoryListFieldListAdditionalProp3();

	factory HomeNewRecommendDataRecordsCategoryListFieldListAdditionalProp3.fromJson(Map<String, dynamic> json) => $HomeNewRecommendDataRecordsCategoryListFieldListAdditionalProp3FromJson(json);

	Map<String, dynamic> toJson() => $HomeNewRecommendDataRecordsCategoryListFieldListAdditionalProp3ToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class HomeNewRecommendDataRecordsCategoryListPriceList {
	int minPrice = 0;
	int maxPrice = 0;
	int price = 0;
	String priceUnit = '';
	int skuId = 0;
	String skuName = '';
	String showName = '';
	String accompanyStandard = '';
	int receiveStatus = 0;
	String icon = '';

	HomeNewRecommendDataRecordsCategoryListPriceList();

	factory HomeNewRecommendDataRecordsCategoryListPriceList.fromJson(Map<String, dynamic> json) => $HomeNewRecommendDataRecordsCategoryListPriceListFromJson(json);

	Map<String, dynamic> toJson() => $HomeNewRecommendDataRecordsCategoryListPriceListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class HomeNewRecommendDataRecordsCategoryListRoomLevelConfigDto {
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

	HomeNewRecommendDataRecordsCategoryListRoomLevelConfigDto();

	factory HomeNewRecommendDataRecordsCategoryListRoomLevelConfigDto.fromJson(Map<String, dynamic> json) => $HomeNewRecommendDataRecordsCategoryListRoomLevelConfigDtoFromJson(json);

	Map<String, dynamic> toJson() => $HomeNewRecommendDataRecordsCategoryListRoomLevelConfigDtoToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class HomeNewRecommendDataRecordsUserPropDetailDto {
	late HomeNewRecommendDataRecordsUserPropDetailDtoChatBubble chatBubble;
	late HomeNewRecommendDataRecordsUserPropDetailDtoAvatarFrame avatarFrame;
	late HomeNewRecommendDataRecordsUserPropDetailDtoLevelMedal levelMedal;
	late HomeNewRecommendDataRecordsUserPropDetailDtoEntranceEffect entranceEffect;
	late HomeNewRecommendDataRecordsUserPropDetailDtoCustomNickname customNickname;
	late HomeNewRecommendDataRecordsUserPropDetailDtoHomepageEffect homepageEffect;
	late HomeNewRecommendDataRecordsUserPropDetailDtoNameplate nameplate;
	late HomeNewRecommendDataRecordsUserPropDetailDtoMount mount;
	late HomeNewRecommendDataRecordsUserPropDetailDtoColorfulText colorfulText;
	late HomeNewRecommendDataRecordsUserPropDetailDtoRoomWallpaper roomWallpaper;
	late HomeNewRecommendDataRecordsUserPropDetailDtoNobleCard nobleCard;

	HomeNewRecommendDataRecordsUserPropDetailDto();

	factory HomeNewRecommendDataRecordsUserPropDetailDto.fromJson(Map<String, dynamic> json) => $HomeNewRecommendDataRecordsUserPropDetailDtoFromJson(json);

	Map<String, dynamic> toJson() => $HomeNewRecommendDataRecordsUserPropDetailDtoToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class HomeNewRecommendDataRecordsUserPropDetailDtoChatBubble {
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

	HomeNewRecommendDataRecordsUserPropDetailDtoChatBubble();

	factory HomeNewRecommendDataRecordsUserPropDetailDtoChatBubble.fromJson(Map<String, dynamic> json) => $HomeNewRecommendDataRecordsUserPropDetailDtoChatBubbleFromJson(json);

	Map<String, dynamic> toJson() => $HomeNewRecommendDataRecordsUserPropDetailDtoChatBubbleToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class HomeNewRecommendDataRecordsUserPropDetailDtoAvatarFrame {
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

	HomeNewRecommendDataRecordsUserPropDetailDtoAvatarFrame();

	factory HomeNewRecommendDataRecordsUserPropDetailDtoAvatarFrame.fromJson(Map<String, dynamic> json) => $HomeNewRecommendDataRecordsUserPropDetailDtoAvatarFrameFromJson(json);

	Map<String, dynamic> toJson() => $HomeNewRecommendDataRecordsUserPropDetailDtoAvatarFrameToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class HomeNewRecommendDataRecordsUserPropDetailDtoLevelMedal {
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

	HomeNewRecommendDataRecordsUserPropDetailDtoLevelMedal();

	factory HomeNewRecommendDataRecordsUserPropDetailDtoLevelMedal.fromJson(Map<String, dynamic> json) => $HomeNewRecommendDataRecordsUserPropDetailDtoLevelMedalFromJson(json);

	Map<String, dynamic> toJson() => $HomeNewRecommendDataRecordsUserPropDetailDtoLevelMedalToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class HomeNewRecommendDataRecordsUserPropDetailDtoEntranceEffect {
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

	HomeNewRecommendDataRecordsUserPropDetailDtoEntranceEffect();

	factory HomeNewRecommendDataRecordsUserPropDetailDtoEntranceEffect.fromJson(Map<String, dynamic> json) => $HomeNewRecommendDataRecordsUserPropDetailDtoEntranceEffectFromJson(json);

	Map<String, dynamic> toJson() => $HomeNewRecommendDataRecordsUserPropDetailDtoEntranceEffectToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class HomeNewRecommendDataRecordsUserPropDetailDtoCustomNickname {
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

	HomeNewRecommendDataRecordsUserPropDetailDtoCustomNickname();

	factory HomeNewRecommendDataRecordsUserPropDetailDtoCustomNickname.fromJson(Map<String, dynamic> json) => $HomeNewRecommendDataRecordsUserPropDetailDtoCustomNicknameFromJson(json);

	Map<String, dynamic> toJson() => $HomeNewRecommendDataRecordsUserPropDetailDtoCustomNicknameToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class HomeNewRecommendDataRecordsUserPropDetailDtoHomepageEffect {
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

	HomeNewRecommendDataRecordsUserPropDetailDtoHomepageEffect();

	factory HomeNewRecommendDataRecordsUserPropDetailDtoHomepageEffect.fromJson(Map<String, dynamic> json) => $HomeNewRecommendDataRecordsUserPropDetailDtoHomepageEffectFromJson(json);

	Map<String, dynamic> toJson() => $HomeNewRecommendDataRecordsUserPropDetailDtoHomepageEffectToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class HomeNewRecommendDataRecordsUserPropDetailDtoNameplate {
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

	HomeNewRecommendDataRecordsUserPropDetailDtoNameplate();

	factory HomeNewRecommendDataRecordsUserPropDetailDtoNameplate.fromJson(Map<String, dynamic> json) => $HomeNewRecommendDataRecordsUserPropDetailDtoNameplateFromJson(json);

	Map<String, dynamic> toJson() => $HomeNewRecommendDataRecordsUserPropDetailDtoNameplateToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class HomeNewRecommendDataRecordsUserPropDetailDtoMount {
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

	HomeNewRecommendDataRecordsUserPropDetailDtoMount();

	factory HomeNewRecommendDataRecordsUserPropDetailDtoMount.fromJson(Map<String, dynamic> json) => $HomeNewRecommendDataRecordsUserPropDetailDtoMountFromJson(json);

	Map<String, dynamic> toJson() => $HomeNewRecommendDataRecordsUserPropDetailDtoMountToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class HomeNewRecommendDataRecordsUserPropDetailDtoColorfulText {
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

	HomeNewRecommendDataRecordsUserPropDetailDtoColorfulText();

	factory HomeNewRecommendDataRecordsUserPropDetailDtoColorfulText.fromJson(Map<String, dynamic> json) => $HomeNewRecommendDataRecordsUserPropDetailDtoColorfulTextFromJson(json);

	Map<String, dynamic> toJson() => $HomeNewRecommendDataRecordsUserPropDetailDtoColorfulTextToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class HomeNewRecommendDataRecordsUserPropDetailDtoRoomWallpaper {
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

	HomeNewRecommendDataRecordsUserPropDetailDtoRoomWallpaper();

	factory HomeNewRecommendDataRecordsUserPropDetailDtoRoomWallpaper.fromJson(Map<String, dynamic> json) => $HomeNewRecommendDataRecordsUserPropDetailDtoRoomWallpaperFromJson(json);

	Map<String, dynamic> toJson() => $HomeNewRecommendDataRecordsUserPropDetailDtoRoomWallpaperToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class HomeNewRecommendDataRecordsUserPropDetailDtoNobleCard {
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

	HomeNewRecommendDataRecordsUserPropDetailDtoNobleCard();

	factory HomeNewRecommendDataRecordsUserPropDetailDtoNobleCard.fromJson(Map<String, dynamic> json) => $HomeNewRecommendDataRecordsUserPropDetailDtoNobleCardFromJson(json);

	Map<String, dynamic> toJson() => $HomeNewRecommendDataRecordsUserPropDetailDtoNobleCardToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}