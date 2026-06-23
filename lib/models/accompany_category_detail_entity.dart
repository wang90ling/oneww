import 'package:oneww/generated/json/base/json_field.dart';
import 'package:oneww/generated/json/accompany_category_detail_entity.g.dart';
import 'dart:convert';
export 'package:oneww/generated/json/accompany_category_detail_entity.g.dart';

@JsonSerializable()
class AccompanyCategoryDetailEntity {
	@JSONField(name: 'request_id')
	String requestId = '';
	int code = 0;
	String message = '';
	late AccompanyCategoryDetailData data;

	AccompanyCategoryDetailEntity();

	factory AccompanyCategoryDetailEntity.fromJson(Map<String, dynamic> json) => $AccompanyCategoryDetailEntityFromJson(json);

	Map<String, dynamic> toJson() => $AccompanyCategoryDetailEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AccompanyCategoryDetailData {
	int categoryId = 0;
	int accompanyId = 0;
	int userId = 0;
	String userNo = '';
	String luckyNo = '';
	String avatar = '';
	String nickName = '';
	String sex = '';
	String birthday = '';
	String constellation = '';
	String personalSignature = '';
	String introduced = '';
	String hometown = '';
	String coverImage = '';
	List<AccompanyCategoryDetailDataUserLabels> userLabels = [];
	int level = 0;
	int onlineFlag = 0;
	int accompanyLevel = 0;
	String mainLabel = '';
	String moduleAvatar = '';
	late AccompanyCategoryDetailDataUserPropDetailDto userPropDetailDto;
	String customIdentityImage = '';
	late AccompanyCategoryDetailDataPersonCategoryDto personCategoryDto;
	List<AccompanyCategoryDetailDataEntryGroupDto> entryGroupDto = [];
	List<AccompanyCategoryDetailDataAbilityLabelList> abilityLabelList = [];
	String lastLoginCity = '';

	AccompanyCategoryDetailData();

	factory AccompanyCategoryDetailData.fromJson(Map<String, dynamic> json) => $AccompanyCategoryDetailDataFromJson(json);

	Map<String, dynamic> toJson() => $AccompanyCategoryDetailDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AccompanyCategoryDetailDataUserLabels {
	int labelId = 0;
	String labelName = '';
	String labelType = '';

	AccompanyCategoryDetailDataUserLabels();

	factory AccompanyCategoryDetailDataUserLabels.fromJson(Map<String, dynamic> json) => $AccompanyCategoryDetailDataUserLabelsFromJson(json);

	Map<String, dynamic> toJson() => $AccompanyCategoryDetailDataUserLabelsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AccompanyCategoryDetailDataUserPropDetailDto {
	late AccompanyCategoryDetailDataUserPropDetailDtoChatBubble chatBubble;
	late AccompanyCategoryDetailDataUserPropDetailDtoAvatarFrame avatarFrame;
	late AccompanyCategoryDetailDataUserPropDetailDtoLevelMedal levelMedal;
	late AccompanyCategoryDetailDataUserPropDetailDtoEntranceEffect entranceEffect;
	late AccompanyCategoryDetailDataUserPropDetailDtoCustomNickname customNickname;
	late AccompanyCategoryDetailDataUserPropDetailDtoHomepageEffect homepageEffect;
	late AccompanyCategoryDetailDataUserPropDetailDtoNameplate nameplate;
	late AccompanyCategoryDetailDataUserPropDetailDtoMount mount;
	late AccompanyCategoryDetailDataUserPropDetailDtoColorfulText colorfulText;
	late AccompanyCategoryDetailDataUserPropDetailDtoRoomWallpaper roomWallpaper;
	late AccompanyCategoryDetailDataUserPropDetailDtoNobleCard nobleCard;

	AccompanyCategoryDetailDataUserPropDetailDto();

	factory AccompanyCategoryDetailDataUserPropDetailDto.fromJson(Map<String, dynamic> json) => $AccompanyCategoryDetailDataUserPropDetailDtoFromJson(json);

	Map<String, dynamic> toJson() => $AccompanyCategoryDetailDataUserPropDetailDtoToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AccompanyCategoryDetailDataUserPropDetailDtoChatBubble {
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

	AccompanyCategoryDetailDataUserPropDetailDtoChatBubble();

	factory AccompanyCategoryDetailDataUserPropDetailDtoChatBubble.fromJson(Map<String, dynamic> json) => $AccompanyCategoryDetailDataUserPropDetailDtoChatBubbleFromJson(json);

	Map<String, dynamic> toJson() => $AccompanyCategoryDetailDataUserPropDetailDtoChatBubbleToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AccompanyCategoryDetailDataUserPropDetailDtoAvatarFrame {
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

	AccompanyCategoryDetailDataUserPropDetailDtoAvatarFrame();

	factory AccompanyCategoryDetailDataUserPropDetailDtoAvatarFrame.fromJson(Map<String, dynamic> json) => $AccompanyCategoryDetailDataUserPropDetailDtoAvatarFrameFromJson(json);

	Map<String, dynamic> toJson() => $AccompanyCategoryDetailDataUserPropDetailDtoAvatarFrameToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AccompanyCategoryDetailDataUserPropDetailDtoLevelMedal {
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

	AccompanyCategoryDetailDataUserPropDetailDtoLevelMedal();

	factory AccompanyCategoryDetailDataUserPropDetailDtoLevelMedal.fromJson(Map<String, dynamic> json) => $AccompanyCategoryDetailDataUserPropDetailDtoLevelMedalFromJson(json);

	Map<String, dynamic> toJson() => $AccompanyCategoryDetailDataUserPropDetailDtoLevelMedalToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AccompanyCategoryDetailDataUserPropDetailDtoEntranceEffect {
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

	AccompanyCategoryDetailDataUserPropDetailDtoEntranceEffect();

	factory AccompanyCategoryDetailDataUserPropDetailDtoEntranceEffect.fromJson(Map<String, dynamic> json) => $AccompanyCategoryDetailDataUserPropDetailDtoEntranceEffectFromJson(json);

	Map<String, dynamic> toJson() => $AccompanyCategoryDetailDataUserPropDetailDtoEntranceEffectToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AccompanyCategoryDetailDataUserPropDetailDtoCustomNickname {
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

	AccompanyCategoryDetailDataUserPropDetailDtoCustomNickname();

	factory AccompanyCategoryDetailDataUserPropDetailDtoCustomNickname.fromJson(Map<String, dynamic> json) => $AccompanyCategoryDetailDataUserPropDetailDtoCustomNicknameFromJson(json);

	Map<String, dynamic> toJson() => $AccompanyCategoryDetailDataUserPropDetailDtoCustomNicknameToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AccompanyCategoryDetailDataUserPropDetailDtoHomepageEffect {
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

	AccompanyCategoryDetailDataUserPropDetailDtoHomepageEffect();

	factory AccompanyCategoryDetailDataUserPropDetailDtoHomepageEffect.fromJson(Map<String, dynamic> json) => $AccompanyCategoryDetailDataUserPropDetailDtoHomepageEffectFromJson(json);

	Map<String, dynamic> toJson() => $AccompanyCategoryDetailDataUserPropDetailDtoHomepageEffectToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AccompanyCategoryDetailDataUserPropDetailDtoNameplate {
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

	AccompanyCategoryDetailDataUserPropDetailDtoNameplate();

	factory AccompanyCategoryDetailDataUserPropDetailDtoNameplate.fromJson(Map<String, dynamic> json) => $AccompanyCategoryDetailDataUserPropDetailDtoNameplateFromJson(json);

	Map<String, dynamic> toJson() => $AccompanyCategoryDetailDataUserPropDetailDtoNameplateToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AccompanyCategoryDetailDataUserPropDetailDtoMount {
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

	AccompanyCategoryDetailDataUserPropDetailDtoMount();

	factory AccompanyCategoryDetailDataUserPropDetailDtoMount.fromJson(Map<String, dynamic> json) => $AccompanyCategoryDetailDataUserPropDetailDtoMountFromJson(json);

	Map<String, dynamic> toJson() => $AccompanyCategoryDetailDataUserPropDetailDtoMountToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AccompanyCategoryDetailDataUserPropDetailDtoColorfulText {
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

	AccompanyCategoryDetailDataUserPropDetailDtoColorfulText();

	factory AccompanyCategoryDetailDataUserPropDetailDtoColorfulText.fromJson(Map<String, dynamic> json) => $AccompanyCategoryDetailDataUserPropDetailDtoColorfulTextFromJson(json);

	Map<String, dynamic> toJson() => $AccompanyCategoryDetailDataUserPropDetailDtoColorfulTextToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AccompanyCategoryDetailDataUserPropDetailDtoRoomWallpaper {
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

	AccompanyCategoryDetailDataUserPropDetailDtoRoomWallpaper();

	factory AccompanyCategoryDetailDataUserPropDetailDtoRoomWallpaper.fromJson(Map<String, dynamic> json) => $AccompanyCategoryDetailDataUserPropDetailDtoRoomWallpaperFromJson(json);

	Map<String, dynamic> toJson() => $AccompanyCategoryDetailDataUserPropDetailDtoRoomWallpaperToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AccompanyCategoryDetailDataUserPropDetailDtoNobleCard {
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

	AccompanyCategoryDetailDataUserPropDetailDtoNobleCard();

	factory AccompanyCategoryDetailDataUserPropDetailDtoNobleCard.fromJson(Map<String, dynamic> json) => $AccompanyCategoryDetailDataUserPropDetailDtoNobleCardFromJson(json);

	Map<String, dynamic> toJson() => $AccompanyCategoryDetailDataUserPropDetailDtoNobleCardToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AccompanyCategoryDetailDataPersonCategoryDto {
	int categoryId = 0;
	String categoryName = '';
	String introduced = '';
	int receiveStatus = 0;
	int commissionRate = 0;
	String maxStandard = '';
	List<AccompanyCategoryDetailDataPersonCategoryDtoFileList> fileList = [];
	List<AccompanyCategoryDetailDataPersonCategoryDtoPriceList> priceList = [];
	late AccompanyCategoryDetailDataPersonCategoryDtoMinPriceDto minPriceDto;

	AccompanyCategoryDetailDataPersonCategoryDto();

	factory AccompanyCategoryDetailDataPersonCategoryDto.fromJson(Map<String, dynamic> json) => $AccompanyCategoryDetailDataPersonCategoryDtoFromJson(json);

	Map<String, dynamic> toJson() => $AccompanyCategoryDetailDataPersonCategoryDtoToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AccompanyCategoryDetailDataPersonCategoryDtoFileList {
	int accompanyCategoryId = 0;
	String fileId = '';
	String fileUrl = '';
	String fileType = '';
	int audioDuration = 0;
	int sort = 0;

	AccompanyCategoryDetailDataPersonCategoryDtoFileList();

	factory AccompanyCategoryDetailDataPersonCategoryDtoFileList.fromJson(Map<String, dynamic> json) => $AccompanyCategoryDetailDataPersonCategoryDtoFileListFromJson(json);

	Map<String, dynamic> toJson() => $AccompanyCategoryDetailDataPersonCategoryDtoFileListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AccompanyCategoryDetailDataPersonCategoryDtoPriceList {
	int skuId = 0;
	String skuName = '';
	String showName = '';
	String accompanyStandard = '';
	int receiveStatus = 0;
	int minPrice = 0;
	int maxPrice = 0;
	int price = 0;
	String priceUnit = '';
	String icon = '';
	int shopId = 0;

	AccompanyCategoryDetailDataPersonCategoryDtoPriceList();

	factory AccompanyCategoryDetailDataPersonCategoryDtoPriceList.fromJson(Map<String, dynamic> json) => $AccompanyCategoryDetailDataPersonCategoryDtoPriceListFromJson(json);

	Map<String, dynamic> toJson() => $AccompanyCategoryDetailDataPersonCategoryDtoPriceListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AccompanyCategoryDetailDataPersonCategoryDtoMinPriceDto {
	int skuId = 0;
	String skuName = '';
	String showName = '';
	String accompanyStandard = '';
	int receiveStatus = 0;
	int minPrice = 0;
	int maxPrice = 0;
	int price = 0;
	String priceUnit = '';
	String icon = '';
	int shopId = 0;

	AccompanyCategoryDetailDataPersonCategoryDtoMinPriceDto();

	factory AccompanyCategoryDetailDataPersonCategoryDtoMinPriceDto.fromJson(Map<String, dynamic> json) => $AccompanyCategoryDetailDataPersonCategoryDtoMinPriceDtoFromJson(json);

	Map<String, dynamic> toJson() => $AccompanyCategoryDetailDataPersonCategoryDtoMinPriceDtoToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AccompanyCategoryDetailDataEntryGroupDto {
	int type = 0;
	String typeName = '';
	List<AccompanyCategoryDetailDataEntryGroupDtoEntries> entries = [];

	AccompanyCategoryDetailDataEntryGroupDto();

	factory AccompanyCategoryDetailDataEntryGroupDto.fromJson(Map<String, dynamic> json) => $AccompanyCategoryDetailDataEntryGroupDtoFromJson(json);

	Map<String, dynamic> toJson() => $AccompanyCategoryDetailDataEntryGroupDtoToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AccompanyCategoryDetailDataEntryGroupDtoEntries {
	int id = 0;
	int categoryId = 0;
	int type = 0;
	String code = '';
	String labelName = '';
	String content = '';
	int weighted = 0;
	int usableFlag = 0;
	String createTime = '';

	AccompanyCategoryDetailDataEntryGroupDtoEntries();

	factory AccompanyCategoryDetailDataEntryGroupDtoEntries.fromJson(Map<String, dynamic> json) => $AccompanyCategoryDetailDataEntryGroupDtoEntriesFromJson(json);

	Map<String, dynamic> toJson() => $AccompanyCategoryDetailDataEntryGroupDtoEntriesToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AccompanyCategoryDetailDataAbilityLabelList {
	int categoryLabelId = 0;
	String labelName = '';
	int weighted = 0;
	List<AccompanyCategoryDetailDataAbilityLabelListItems> items = [];

	AccompanyCategoryDetailDataAbilityLabelList();

	factory AccompanyCategoryDetailDataAbilityLabelList.fromJson(Map<String, dynamic> json) => $AccompanyCategoryDetailDataAbilityLabelListFromJson(json);

	Map<String, dynamic> toJson() => $AccompanyCategoryDetailDataAbilityLabelListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AccompanyCategoryDetailDataAbilityLabelListItems {
	int id = 0;
	String labelName = '';
	bool selected = false;

	AccompanyCategoryDetailDataAbilityLabelListItems();

	factory AccompanyCategoryDetailDataAbilityLabelListItems.fromJson(Map<String, dynamic> json) => $AccompanyCategoryDetailDataAbilityLabelListItemsFromJson(json);

	Map<String, dynamic> toJson() => $AccompanyCategoryDetailDataAbilityLabelListItemsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}