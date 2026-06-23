import 'package:oneww/generated/json/base/json_convert_content.dart';
import 'package:oneww/models/accompany_category_detail_entity.dart';

AccompanyCategoryDetailEntity $AccompanyCategoryDetailEntityFromJson(
    Map<String, dynamic> json) {
  final AccompanyCategoryDetailEntity accompanyCategoryDetailEntity = AccompanyCategoryDetailEntity();
  final String? requestId = jsonConvert.convert<String>(json['request_id']);
  if (requestId != null) {
    accompanyCategoryDetailEntity.requestId = requestId;
  }
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    accompanyCategoryDetailEntity.code = code;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    accompanyCategoryDetailEntity.message = message;
  }
  final AccompanyCategoryDetailData? data = jsonConvert.convert<
      AccompanyCategoryDetailData>(json['data']);
  if (data != null) {
    accompanyCategoryDetailEntity.data = data;
  }
  return accompanyCategoryDetailEntity;
}

Map<String, dynamic> $AccompanyCategoryDetailEntityToJson(
    AccompanyCategoryDetailEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['request_id'] = entity.requestId;
  data['code'] = entity.code;
  data['message'] = entity.message;
  data['data'] = entity.data.toJson();
  return data;
}

extension AccompanyCategoryDetailEntityExtension on AccompanyCategoryDetailEntity {
  AccompanyCategoryDetailEntity copyWith({
    String? requestId,
    int? code,
    String? message,
    AccompanyCategoryDetailData? data,
  }) {
    return AccompanyCategoryDetailEntity()
      ..requestId = requestId ?? this.requestId
      ..code = code ?? this.code
      ..message = message ?? this.message
      ..data = data ?? this.data;
  }
}

AccompanyCategoryDetailData $AccompanyCategoryDetailDataFromJson(
    Map<String, dynamic> json) {
  final AccompanyCategoryDetailData accompanyCategoryDetailData = AccompanyCategoryDetailData();
  final int? categoryId = jsonConvert.convert<int>(json['categoryId']);
  if (categoryId != null) {
    accompanyCategoryDetailData.categoryId = categoryId;
  }
  final int? accompanyId = jsonConvert.convert<int>(json['accompanyId']);
  if (accompanyId != null) {
    accompanyCategoryDetailData.accompanyId = accompanyId;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    accompanyCategoryDetailData.userId = userId;
  }
  final String? userNo = jsonConvert.convert<String>(json['userNo']);
  if (userNo != null) {
    accompanyCategoryDetailData.userNo = userNo;
  }
  final String? luckyNo = jsonConvert.convert<String>(json['luckyNo']);
  if (luckyNo != null) {
    accompanyCategoryDetailData.luckyNo = luckyNo;
  }
  final String? avatar = jsonConvert.convert<String>(json['avatar']);
  if (avatar != null) {
    accompanyCategoryDetailData.avatar = avatar;
  }
  final String? nickName = jsonConvert.convert<String>(json['nickName']);
  if (nickName != null) {
    accompanyCategoryDetailData.nickName = nickName;
  }
  final String? sex = jsonConvert.convert<String>(json['sex']);
  if (sex != null) {
    accompanyCategoryDetailData.sex = sex;
  }
  final String? birthday = jsonConvert.convert<String>(json['birthday']);
  if (birthday != null) {
    accompanyCategoryDetailData.birthday = birthday;
  }
  final String? constellation = jsonConvert.convert<String>(
      json['constellation']);
  if (constellation != null) {
    accompanyCategoryDetailData.constellation = constellation;
  }
  final String? personalSignature = jsonConvert.convert<String>(
      json['personalSignature']);
  if (personalSignature != null) {
    accompanyCategoryDetailData.personalSignature = personalSignature;
  }
  final String? introduced = jsonConvert.convert<String>(json['introduced']);
  if (introduced != null) {
    accompanyCategoryDetailData.introduced = introduced;
  }
  final String? hometown = jsonConvert.convert<String>(json['hometown']);
  if (hometown != null) {
    accompanyCategoryDetailData.hometown = hometown;
  }
  final String? coverImage = jsonConvert.convert<String>(json['coverImage']);
  if (coverImage != null) {
    accompanyCategoryDetailData.coverImage = coverImage;
  }
  final List<
      AccompanyCategoryDetailDataUserLabels>? userLabels = (json['userLabels'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<AccompanyCategoryDetailDataUserLabels>(
          e) as AccompanyCategoryDetailDataUserLabels).toList();
  if (userLabels != null) {
    accompanyCategoryDetailData.userLabels = userLabels;
  }
  final int? level = jsonConvert.convert<int>(json['level']);
  if (level != null) {
    accompanyCategoryDetailData.level = level;
  }
  final int? onlineFlag = jsonConvert.convert<int>(json['onlineFlag']);
  if (onlineFlag != null) {
    accompanyCategoryDetailData.onlineFlag = onlineFlag;
  }
  final int? accompanyLevel = jsonConvert.convert<int>(json['accompanyLevel']);
  if (accompanyLevel != null) {
    accompanyCategoryDetailData.accompanyLevel = accompanyLevel;
  }
  final String? mainLabel = jsonConvert.convert<String>(json['mainLabel']);
  if (mainLabel != null) {
    accompanyCategoryDetailData.mainLabel = mainLabel;
  }
  final String? moduleAvatar = jsonConvert.convert<String>(
      json['moduleAvatar']);
  if (moduleAvatar != null) {
    accompanyCategoryDetailData.moduleAvatar = moduleAvatar;
  }
  final AccompanyCategoryDetailDataUserPropDetailDto? userPropDetailDto = jsonConvert
      .convert<AccompanyCategoryDetailDataUserPropDetailDto>(
      json['userPropDetailDto']);
  if (userPropDetailDto != null) {
    accompanyCategoryDetailData.userPropDetailDto = userPropDetailDto;
  }
  final String? customIdentityImage = jsonConvert.convert<String>(
      json['customIdentityImage']);
  if (customIdentityImage != null) {
    accompanyCategoryDetailData.customIdentityImage = customIdentityImage;
  }
  final AccompanyCategoryDetailDataPersonCategoryDto? personCategoryDto = jsonConvert
      .convert<AccompanyCategoryDetailDataPersonCategoryDto>(
      json['personCategoryDto']);
  if (personCategoryDto != null) {
    accompanyCategoryDetailData.personCategoryDto = personCategoryDto;
  }
  final List<
      AccompanyCategoryDetailDataEntryGroupDto>? entryGroupDto = (json['entryGroupDto'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<AccompanyCategoryDetailDataEntryGroupDto>(
          e) as AccompanyCategoryDetailDataEntryGroupDto).toList();
  if (entryGroupDto != null) {
    accompanyCategoryDetailData.entryGroupDto = entryGroupDto;
  }
  final List<
      AccompanyCategoryDetailDataAbilityLabelList>? abilityLabelList = (json['abilityLabelList'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<AccompanyCategoryDetailDataAbilityLabelList>(
          e) as AccompanyCategoryDetailDataAbilityLabelList).toList();
  if (abilityLabelList != null) {
    accompanyCategoryDetailData.abilityLabelList = abilityLabelList;
  }
  final String? lastLoginCity = jsonConvert.convert<String>(
      json['lastLoginCity']);
  if (lastLoginCity != null) {
    accompanyCategoryDetailData.lastLoginCity = lastLoginCity;
  }
  return accompanyCategoryDetailData;
}

Map<String, dynamic> $AccompanyCategoryDetailDataToJson(
    AccompanyCategoryDetailData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['categoryId'] = entity.categoryId;
  data['accompanyId'] = entity.accompanyId;
  data['userId'] = entity.userId;
  data['userNo'] = entity.userNo;
  data['luckyNo'] = entity.luckyNo;
  data['avatar'] = entity.avatar;
  data['nickName'] = entity.nickName;
  data['sex'] = entity.sex;
  data['birthday'] = entity.birthday;
  data['constellation'] = entity.constellation;
  data['personalSignature'] = entity.personalSignature;
  data['introduced'] = entity.introduced;
  data['hometown'] = entity.hometown;
  data['coverImage'] = entity.coverImage;
  data['userLabels'] = entity.userLabels.map((v) => v.toJson()).toList();
  data['level'] = entity.level;
  data['onlineFlag'] = entity.onlineFlag;
  data['accompanyLevel'] = entity.accompanyLevel;
  data['mainLabel'] = entity.mainLabel;
  data['moduleAvatar'] = entity.moduleAvatar;
  data['userPropDetailDto'] = entity.userPropDetailDto.toJson();
  data['customIdentityImage'] = entity.customIdentityImage;
  data['personCategoryDto'] = entity.personCategoryDto.toJson();
  data['entryGroupDto'] = entity.entryGroupDto.map((v) => v.toJson()).toList();
  data['abilityLabelList'] =
      entity.abilityLabelList.map((v) => v.toJson()).toList();
  data['lastLoginCity'] = entity.lastLoginCity;
  return data;
}

extension AccompanyCategoryDetailDataExtension on AccompanyCategoryDetailData {
  AccompanyCategoryDetailData copyWith({
    int? categoryId,
    int? accompanyId,
    int? userId,
    String? userNo,
    String? luckyNo,
    String? avatar,
    String? nickName,
    String? sex,
    String? birthday,
    String? constellation,
    String? personalSignature,
    String? introduced,
    String? hometown,
    String? coverImage,
    List<AccompanyCategoryDetailDataUserLabels>? userLabels,
    int? level,
    int? onlineFlag,
    int? accompanyLevel,
    String? mainLabel,
    String? moduleAvatar,
    AccompanyCategoryDetailDataUserPropDetailDto? userPropDetailDto,
    String? customIdentityImage,
    AccompanyCategoryDetailDataPersonCategoryDto? personCategoryDto,
    List<AccompanyCategoryDetailDataEntryGroupDto>? entryGroupDto,
    List<AccompanyCategoryDetailDataAbilityLabelList>? abilityLabelList,
    String? lastLoginCity,
  }) {
    return AccompanyCategoryDetailData()
      ..categoryId = categoryId ?? this.categoryId
      ..accompanyId = accompanyId ?? this.accompanyId
      ..userId = userId ?? this.userId
      ..userNo = userNo ?? this.userNo
      ..luckyNo = luckyNo ?? this.luckyNo
      ..avatar = avatar ?? this.avatar
      ..nickName = nickName ?? this.nickName
      ..sex = sex ?? this.sex
      ..birthday = birthday ?? this.birthday
      ..constellation = constellation ?? this.constellation
      ..personalSignature = personalSignature ?? this.personalSignature
      ..introduced = introduced ?? this.introduced
      ..hometown = hometown ?? this.hometown
      ..coverImage = coverImage ?? this.coverImage
      ..userLabels = userLabels ?? this.userLabels
      ..level = level ?? this.level
      ..onlineFlag = onlineFlag ?? this.onlineFlag
      ..accompanyLevel = accompanyLevel ?? this.accompanyLevel
      ..mainLabel = mainLabel ?? this.mainLabel
      ..moduleAvatar = moduleAvatar ?? this.moduleAvatar
      ..userPropDetailDto = userPropDetailDto ?? this.userPropDetailDto
      ..customIdentityImage = customIdentityImage ?? this.customIdentityImage
      ..personCategoryDto = personCategoryDto ?? this.personCategoryDto
      ..entryGroupDto = entryGroupDto ?? this.entryGroupDto
      ..abilityLabelList = abilityLabelList ?? this.abilityLabelList
      ..lastLoginCity = lastLoginCity ?? this.lastLoginCity;
  }
}

AccompanyCategoryDetailDataUserLabels $AccompanyCategoryDetailDataUserLabelsFromJson(
    Map<String, dynamic> json) {
  final AccompanyCategoryDetailDataUserLabels accompanyCategoryDetailDataUserLabels = AccompanyCategoryDetailDataUserLabels();
  final int? labelId = jsonConvert.convert<int>(json['labelId']);
  if (labelId != null) {
    accompanyCategoryDetailDataUserLabels.labelId = labelId;
  }
  final String? labelName = jsonConvert.convert<String>(json['labelName']);
  if (labelName != null) {
    accompanyCategoryDetailDataUserLabels.labelName = labelName;
  }
  final String? labelType = jsonConvert.convert<String>(json['labelType']);
  if (labelType != null) {
    accompanyCategoryDetailDataUserLabels.labelType = labelType;
  }
  return accompanyCategoryDetailDataUserLabels;
}

Map<String, dynamic> $AccompanyCategoryDetailDataUserLabelsToJson(
    AccompanyCategoryDetailDataUserLabels entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['labelId'] = entity.labelId;
  data['labelName'] = entity.labelName;
  data['labelType'] = entity.labelType;
  return data;
}

extension AccompanyCategoryDetailDataUserLabelsExtension on AccompanyCategoryDetailDataUserLabels {
  AccompanyCategoryDetailDataUserLabels copyWith({
    int? labelId,
    String? labelName,
    String? labelType,
  }) {
    return AccompanyCategoryDetailDataUserLabels()
      ..labelId = labelId ?? this.labelId
      ..labelName = labelName ?? this.labelName
      ..labelType = labelType ?? this.labelType;
  }
}

AccompanyCategoryDetailDataUserPropDetailDto $AccompanyCategoryDetailDataUserPropDetailDtoFromJson(
    Map<String, dynamic> json) {
  final AccompanyCategoryDetailDataUserPropDetailDto accompanyCategoryDetailDataUserPropDetailDto = AccompanyCategoryDetailDataUserPropDetailDto();
  final AccompanyCategoryDetailDataUserPropDetailDtoChatBubble? chatBubble = jsonConvert
      .convert<AccompanyCategoryDetailDataUserPropDetailDtoChatBubble>(
      json['chatBubble']);
  if (chatBubble != null) {
    accompanyCategoryDetailDataUserPropDetailDto.chatBubble = chatBubble;
  }
  final AccompanyCategoryDetailDataUserPropDetailDtoAvatarFrame? avatarFrame = jsonConvert
      .convert<AccompanyCategoryDetailDataUserPropDetailDtoAvatarFrame>(
      json['avatarFrame']);
  if (avatarFrame != null) {
    accompanyCategoryDetailDataUserPropDetailDto.avatarFrame = avatarFrame;
  }
  final AccompanyCategoryDetailDataUserPropDetailDtoLevelMedal? levelMedal = jsonConvert
      .convert<AccompanyCategoryDetailDataUserPropDetailDtoLevelMedal>(
      json['levelMedal']);
  if (levelMedal != null) {
    accompanyCategoryDetailDataUserPropDetailDto.levelMedal = levelMedal;
  }
  final AccompanyCategoryDetailDataUserPropDetailDtoEntranceEffect? entranceEffect = jsonConvert
      .convert<AccompanyCategoryDetailDataUserPropDetailDtoEntranceEffect>(
      json['entranceEffect']);
  if (entranceEffect != null) {
    accompanyCategoryDetailDataUserPropDetailDto.entranceEffect =
        entranceEffect;
  }
  final AccompanyCategoryDetailDataUserPropDetailDtoCustomNickname? customNickname = jsonConvert
      .convert<AccompanyCategoryDetailDataUserPropDetailDtoCustomNickname>(
      json['customNickname']);
  if (customNickname != null) {
    accompanyCategoryDetailDataUserPropDetailDto.customNickname =
        customNickname;
  }
  final AccompanyCategoryDetailDataUserPropDetailDtoHomepageEffect? homepageEffect = jsonConvert
      .convert<AccompanyCategoryDetailDataUserPropDetailDtoHomepageEffect>(
      json['homepageEffect']);
  if (homepageEffect != null) {
    accompanyCategoryDetailDataUserPropDetailDto.homepageEffect =
        homepageEffect;
  }
  final AccompanyCategoryDetailDataUserPropDetailDtoNameplate? nameplate = jsonConvert
      .convert<AccompanyCategoryDetailDataUserPropDetailDtoNameplate>(
      json['nameplate']);
  if (nameplate != null) {
    accompanyCategoryDetailDataUserPropDetailDto.nameplate = nameplate;
  }
  final AccompanyCategoryDetailDataUserPropDetailDtoMount? mount = jsonConvert
      .convert<AccompanyCategoryDetailDataUserPropDetailDtoMount>(
      json['mount']);
  if (mount != null) {
    accompanyCategoryDetailDataUserPropDetailDto.mount = mount;
  }
  final AccompanyCategoryDetailDataUserPropDetailDtoColorfulText? colorfulText = jsonConvert
      .convert<AccompanyCategoryDetailDataUserPropDetailDtoColorfulText>(
      json['colorfulText']);
  if (colorfulText != null) {
    accompanyCategoryDetailDataUserPropDetailDto.colorfulText = colorfulText;
  }
  final AccompanyCategoryDetailDataUserPropDetailDtoRoomWallpaper? roomWallpaper = jsonConvert
      .convert<AccompanyCategoryDetailDataUserPropDetailDtoRoomWallpaper>(
      json['roomWallpaper']);
  if (roomWallpaper != null) {
    accompanyCategoryDetailDataUserPropDetailDto.roomWallpaper = roomWallpaper;
  }
  final AccompanyCategoryDetailDataUserPropDetailDtoNobleCard? nobleCard = jsonConvert
      .convert<AccompanyCategoryDetailDataUserPropDetailDtoNobleCard>(
      json['nobleCard']);
  if (nobleCard != null) {
    accompanyCategoryDetailDataUserPropDetailDto.nobleCard = nobleCard;
  }
  return accompanyCategoryDetailDataUserPropDetailDto;
}

Map<String, dynamic> $AccompanyCategoryDetailDataUserPropDetailDtoToJson(
    AccompanyCategoryDetailDataUserPropDetailDto entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['chatBubble'] = entity.chatBubble.toJson();
  data['avatarFrame'] = entity.avatarFrame.toJson();
  data['levelMedal'] = entity.levelMedal.toJson();
  data['entranceEffect'] = entity.entranceEffect.toJson();
  data['customNickname'] = entity.customNickname.toJson();
  data['homepageEffect'] = entity.homepageEffect.toJson();
  data['nameplate'] = entity.nameplate.toJson();
  data['mount'] = entity.mount.toJson();
  data['colorfulText'] = entity.colorfulText.toJson();
  data['roomWallpaper'] = entity.roomWallpaper.toJson();
  data['nobleCard'] = entity.nobleCard.toJson();
  return data;
}

extension AccompanyCategoryDetailDataUserPropDetailDtoExtension on AccompanyCategoryDetailDataUserPropDetailDto {
  AccompanyCategoryDetailDataUserPropDetailDto copyWith({
    AccompanyCategoryDetailDataUserPropDetailDtoChatBubble? chatBubble,
    AccompanyCategoryDetailDataUserPropDetailDtoAvatarFrame? avatarFrame,
    AccompanyCategoryDetailDataUserPropDetailDtoLevelMedal? levelMedal,
    AccompanyCategoryDetailDataUserPropDetailDtoEntranceEffect? entranceEffect,
    AccompanyCategoryDetailDataUserPropDetailDtoCustomNickname? customNickname,
    AccompanyCategoryDetailDataUserPropDetailDtoHomepageEffect? homepageEffect,
    AccompanyCategoryDetailDataUserPropDetailDtoNameplate? nameplate,
    AccompanyCategoryDetailDataUserPropDetailDtoMount? mount,
    AccompanyCategoryDetailDataUserPropDetailDtoColorfulText? colorfulText,
    AccompanyCategoryDetailDataUserPropDetailDtoRoomWallpaper? roomWallpaper,
    AccompanyCategoryDetailDataUserPropDetailDtoNobleCard? nobleCard,
  }) {
    return AccompanyCategoryDetailDataUserPropDetailDto()
      ..chatBubble = chatBubble ?? this.chatBubble
      ..avatarFrame = avatarFrame ?? this.avatarFrame
      ..levelMedal = levelMedal ?? this.levelMedal
      ..entranceEffect = entranceEffect ?? this.entranceEffect
      ..customNickname = customNickname ?? this.customNickname
      ..homepageEffect = homepageEffect ?? this.homepageEffect
      ..nameplate = nameplate ?? this.nameplate
      ..mount = mount ?? this.mount
      ..colorfulText = colorfulText ?? this.colorfulText
      ..roomWallpaper = roomWallpaper ?? this.roomWallpaper
      ..nobleCard = nobleCard ?? this.nobleCard;
  }
}

AccompanyCategoryDetailDataUserPropDetailDtoChatBubble $AccompanyCategoryDetailDataUserPropDetailDtoChatBubbleFromJson(
    Map<String, dynamic> json) {
  final AccompanyCategoryDetailDataUserPropDetailDtoChatBubble accompanyCategoryDetailDataUserPropDetailDtoChatBubble = AccompanyCategoryDetailDataUserPropDetailDtoChatBubble();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    accompanyCategoryDetailDataUserPropDetailDtoChatBubble.id = id;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    accompanyCategoryDetailDataUserPropDetailDtoChatBubble.userId = userId;
  }
  final int? propId = jsonConvert.convert<int>(json['propId']);
  if (propId != null) {
    accompanyCategoryDetailDataUserPropDetailDtoChatBubble.propId = propId;
  }
  final String? propName = jsonConvert.convert<String>(json['propName']);
  if (propName != null) {
    accompanyCategoryDetailDataUserPropDetailDtoChatBubble.propName = propName;
  }
  final int? propType = jsonConvert.convert<int>(json['propType']);
  if (propType != null) {
    accompanyCategoryDetailDataUserPropDetailDtoChatBubble.propType = propType;
  }
  final String? propFormat = jsonConvert.convert<String>(json['propFormat']);
  if (propFormat != null) {
    accompanyCategoryDetailDataUserPropDetailDtoChatBubble.propFormat =
        propFormat;
  }
  final String? dynamicEffect = jsonConvert.convert<String>(
      json['dynamicEffect']);
  if (dynamicEffect != null) {
    accompanyCategoryDetailDataUserPropDetailDtoChatBubble.dynamicEffect =
        dynamicEffect;
  }
  final String? pcDynamicEffect = jsonConvert.convert<String>(
      json['pcDynamicEffect']);
  if (pcDynamicEffect != null) {
    accompanyCategoryDetailDataUserPropDetailDtoChatBubble.pcDynamicEffect =
        pcDynamicEffect;
  }
  final String? iosDynamicEffect = jsonConvert.convert<String>(
      json['iosDynamicEffect']);
  if (iosDynamicEffect != null) {
    accompanyCategoryDetailDataUserPropDetailDtoChatBubble.iosDynamicEffect =
        iosDynamicEffect;
  }
  final int? customFlag = jsonConvert.convert<int>(json['customFlag']);
  if (customFlag != null) {
    accompanyCategoryDetailDataUserPropDetailDtoChatBubble.customFlag =
        customFlag;
  }
  final String? customInfo = jsonConvert.convert<String>(json['customInfo']);
  if (customInfo != null) {
    accompanyCategoryDetailDataUserPropDetailDtoChatBubble.customInfo =
        customInfo;
  }
  final int? useFlag = jsonConvert.convert<int>(json['useFlag']);
  if (useFlag != null) {
    accompanyCategoryDetailDataUserPropDetailDtoChatBubble.useFlag = useFlag;
  }
  return accompanyCategoryDetailDataUserPropDetailDtoChatBubble;
}

Map<String,
    dynamic> $AccompanyCategoryDetailDataUserPropDetailDtoChatBubbleToJson(
    AccompanyCategoryDetailDataUserPropDetailDtoChatBubble entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['userId'] = entity.userId;
  data['propId'] = entity.propId;
  data['propName'] = entity.propName;
  data['propType'] = entity.propType;
  data['propFormat'] = entity.propFormat;
  data['dynamicEffect'] = entity.dynamicEffect;
  data['pcDynamicEffect'] = entity.pcDynamicEffect;
  data['iosDynamicEffect'] = entity.iosDynamicEffect;
  data['customFlag'] = entity.customFlag;
  data['customInfo'] = entity.customInfo;
  data['useFlag'] = entity.useFlag;
  return data;
}

extension AccompanyCategoryDetailDataUserPropDetailDtoChatBubbleExtension on AccompanyCategoryDetailDataUserPropDetailDtoChatBubble {
  AccompanyCategoryDetailDataUserPropDetailDtoChatBubble copyWith({
    int? id,
    int? userId,
    int? propId,
    String? propName,
    int? propType,
    String? propFormat,
    String? dynamicEffect,
    String? pcDynamicEffect,
    String? iosDynamicEffect,
    int? customFlag,
    String? customInfo,
    int? useFlag,
  }) {
    return AccompanyCategoryDetailDataUserPropDetailDtoChatBubble()
      ..id = id ?? this.id
      ..userId = userId ?? this.userId
      ..propId = propId ?? this.propId
      ..propName = propName ?? this.propName
      ..propType = propType ?? this.propType
      ..propFormat = propFormat ?? this.propFormat
      ..dynamicEffect = dynamicEffect ?? this.dynamicEffect
      ..pcDynamicEffect = pcDynamicEffect ?? this.pcDynamicEffect
      ..iosDynamicEffect = iosDynamicEffect ?? this.iosDynamicEffect
      ..customFlag = customFlag ?? this.customFlag
      ..customInfo = customInfo ?? this.customInfo
      ..useFlag = useFlag ?? this.useFlag;
  }
}

AccompanyCategoryDetailDataUserPropDetailDtoAvatarFrame $AccompanyCategoryDetailDataUserPropDetailDtoAvatarFrameFromJson(
    Map<String, dynamic> json) {
  final AccompanyCategoryDetailDataUserPropDetailDtoAvatarFrame accompanyCategoryDetailDataUserPropDetailDtoAvatarFrame = AccompanyCategoryDetailDataUserPropDetailDtoAvatarFrame();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    accompanyCategoryDetailDataUserPropDetailDtoAvatarFrame.id = id;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    accompanyCategoryDetailDataUserPropDetailDtoAvatarFrame.userId = userId;
  }
  final int? propId = jsonConvert.convert<int>(json['propId']);
  if (propId != null) {
    accompanyCategoryDetailDataUserPropDetailDtoAvatarFrame.propId = propId;
  }
  final String? propName = jsonConvert.convert<String>(json['propName']);
  if (propName != null) {
    accompanyCategoryDetailDataUserPropDetailDtoAvatarFrame.propName = propName;
  }
  final int? propType = jsonConvert.convert<int>(json['propType']);
  if (propType != null) {
    accompanyCategoryDetailDataUserPropDetailDtoAvatarFrame.propType = propType;
  }
  final String? propFormat = jsonConvert.convert<String>(json['propFormat']);
  if (propFormat != null) {
    accompanyCategoryDetailDataUserPropDetailDtoAvatarFrame.propFormat =
        propFormat;
  }
  final String? dynamicEffect = jsonConvert.convert<String>(
      json['dynamicEffect']);
  if (dynamicEffect != null) {
    accompanyCategoryDetailDataUserPropDetailDtoAvatarFrame.dynamicEffect =
        dynamicEffect;
  }
  final String? pcDynamicEffect = jsonConvert.convert<String>(
      json['pcDynamicEffect']);
  if (pcDynamicEffect != null) {
    accompanyCategoryDetailDataUserPropDetailDtoAvatarFrame.pcDynamicEffect =
        pcDynamicEffect;
  }
  final String? iosDynamicEffect = jsonConvert.convert<String>(
      json['iosDynamicEffect']);
  if (iosDynamicEffect != null) {
    accompanyCategoryDetailDataUserPropDetailDtoAvatarFrame.iosDynamicEffect =
        iosDynamicEffect;
  }
  final int? customFlag = jsonConvert.convert<int>(json['customFlag']);
  if (customFlag != null) {
    accompanyCategoryDetailDataUserPropDetailDtoAvatarFrame.customFlag =
        customFlag;
  }
  final String? customInfo = jsonConvert.convert<String>(json['customInfo']);
  if (customInfo != null) {
    accompanyCategoryDetailDataUserPropDetailDtoAvatarFrame.customInfo =
        customInfo;
  }
  final int? useFlag = jsonConvert.convert<int>(json['useFlag']);
  if (useFlag != null) {
    accompanyCategoryDetailDataUserPropDetailDtoAvatarFrame.useFlag = useFlag;
  }
  return accompanyCategoryDetailDataUserPropDetailDtoAvatarFrame;
}

Map<String,
    dynamic> $AccompanyCategoryDetailDataUserPropDetailDtoAvatarFrameToJson(
    AccompanyCategoryDetailDataUserPropDetailDtoAvatarFrame entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['userId'] = entity.userId;
  data['propId'] = entity.propId;
  data['propName'] = entity.propName;
  data['propType'] = entity.propType;
  data['propFormat'] = entity.propFormat;
  data['dynamicEffect'] = entity.dynamicEffect;
  data['pcDynamicEffect'] = entity.pcDynamicEffect;
  data['iosDynamicEffect'] = entity.iosDynamicEffect;
  data['customFlag'] = entity.customFlag;
  data['customInfo'] = entity.customInfo;
  data['useFlag'] = entity.useFlag;
  return data;
}

extension AccompanyCategoryDetailDataUserPropDetailDtoAvatarFrameExtension on AccompanyCategoryDetailDataUserPropDetailDtoAvatarFrame {
  AccompanyCategoryDetailDataUserPropDetailDtoAvatarFrame copyWith({
    int? id,
    int? userId,
    int? propId,
    String? propName,
    int? propType,
    String? propFormat,
    String? dynamicEffect,
    String? pcDynamicEffect,
    String? iosDynamicEffect,
    int? customFlag,
    String? customInfo,
    int? useFlag,
  }) {
    return AccompanyCategoryDetailDataUserPropDetailDtoAvatarFrame()
      ..id = id ?? this.id
      ..userId = userId ?? this.userId
      ..propId = propId ?? this.propId
      ..propName = propName ?? this.propName
      ..propType = propType ?? this.propType
      ..propFormat = propFormat ?? this.propFormat
      ..dynamicEffect = dynamicEffect ?? this.dynamicEffect
      ..pcDynamicEffect = pcDynamicEffect ?? this.pcDynamicEffect
      ..iosDynamicEffect = iosDynamicEffect ?? this.iosDynamicEffect
      ..customFlag = customFlag ?? this.customFlag
      ..customInfo = customInfo ?? this.customInfo
      ..useFlag = useFlag ?? this.useFlag;
  }
}

AccompanyCategoryDetailDataUserPropDetailDtoLevelMedal $AccompanyCategoryDetailDataUserPropDetailDtoLevelMedalFromJson(
    Map<String, dynamic> json) {
  final AccompanyCategoryDetailDataUserPropDetailDtoLevelMedal accompanyCategoryDetailDataUserPropDetailDtoLevelMedal = AccompanyCategoryDetailDataUserPropDetailDtoLevelMedal();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    accompanyCategoryDetailDataUserPropDetailDtoLevelMedal.id = id;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    accompanyCategoryDetailDataUserPropDetailDtoLevelMedal.userId = userId;
  }
  final int? propId = jsonConvert.convert<int>(json['propId']);
  if (propId != null) {
    accompanyCategoryDetailDataUserPropDetailDtoLevelMedal.propId = propId;
  }
  final String? propName = jsonConvert.convert<String>(json['propName']);
  if (propName != null) {
    accompanyCategoryDetailDataUserPropDetailDtoLevelMedal.propName = propName;
  }
  final int? propType = jsonConvert.convert<int>(json['propType']);
  if (propType != null) {
    accompanyCategoryDetailDataUserPropDetailDtoLevelMedal.propType = propType;
  }
  final String? propFormat = jsonConvert.convert<String>(json['propFormat']);
  if (propFormat != null) {
    accompanyCategoryDetailDataUserPropDetailDtoLevelMedal.propFormat =
        propFormat;
  }
  final String? dynamicEffect = jsonConvert.convert<String>(
      json['dynamicEffect']);
  if (dynamicEffect != null) {
    accompanyCategoryDetailDataUserPropDetailDtoLevelMedal.dynamicEffect =
        dynamicEffect;
  }
  final String? pcDynamicEffect = jsonConvert.convert<String>(
      json['pcDynamicEffect']);
  if (pcDynamicEffect != null) {
    accompanyCategoryDetailDataUserPropDetailDtoLevelMedal.pcDynamicEffect =
        pcDynamicEffect;
  }
  final String? iosDynamicEffect = jsonConvert.convert<String>(
      json['iosDynamicEffect']);
  if (iosDynamicEffect != null) {
    accompanyCategoryDetailDataUserPropDetailDtoLevelMedal.iosDynamicEffect =
        iosDynamicEffect;
  }
  final int? customFlag = jsonConvert.convert<int>(json['customFlag']);
  if (customFlag != null) {
    accompanyCategoryDetailDataUserPropDetailDtoLevelMedal.customFlag =
        customFlag;
  }
  final String? customInfo = jsonConvert.convert<String>(json['customInfo']);
  if (customInfo != null) {
    accompanyCategoryDetailDataUserPropDetailDtoLevelMedal.customInfo =
        customInfo;
  }
  final int? useFlag = jsonConvert.convert<int>(json['useFlag']);
  if (useFlag != null) {
    accompanyCategoryDetailDataUserPropDetailDtoLevelMedal.useFlag = useFlag;
  }
  return accompanyCategoryDetailDataUserPropDetailDtoLevelMedal;
}

Map<String,
    dynamic> $AccompanyCategoryDetailDataUserPropDetailDtoLevelMedalToJson(
    AccompanyCategoryDetailDataUserPropDetailDtoLevelMedal entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['userId'] = entity.userId;
  data['propId'] = entity.propId;
  data['propName'] = entity.propName;
  data['propType'] = entity.propType;
  data['propFormat'] = entity.propFormat;
  data['dynamicEffect'] = entity.dynamicEffect;
  data['pcDynamicEffect'] = entity.pcDynamicEffect;
  data['iosDynamicEffect'] = entity.iosDynamicEffect;
  data['customFlag'] = entity.customFlag;
  data['customInfo'] = entity.customInfo;
  data['useFlag'] = entity.useFlag;
  return data;
}

extension AccompanyCategoryDetailDataUserPropDetailDtoLevelMedalExtension on AccompanyCategoryDetailDataUserPropDetailDtoLevelMedal {
  AccompanyCategoryDetailDataUserPropDetailDtoLevelMedal copyWith({
    int? id,
    int? userId,
    int? propId,
    String? propName,
    int? propType,
    String? propFormat,
    String? dynamicEffect,
    String? pcDynamicEffect,
    String? iosDynamicEffect,
    int? customFlag,
    String? customInfo,
    int? useFlag,
  }) {
    return AccompanyCategoryDetailDataUserPropDetailDtoLevelMedal()
      ..id = id ?? this.id
      ..userId = userId ?? this.userId
      ..propId = propId ?? this.propId
      ..propName = propName ?? this.propName
      ..propType = propType ?? this.propType
      ..propFormat = propFormat ?? this.propFormat
      ..dynamicEffect = dynamicEffect ?? this.dynamicEffect
      ..pcDynamicEffect = pcDynamicEffect ?? this.pcDynamicEffect
      ..iosDynamicEffect = iosDynamicEffect ?? this.iosDynamicEffect
      ..customFlag = customFlag ?? this.customFlag
      ..customInfo = customInfo ?? this.customInfo
      ..useFlag = useFlag ?? this.useFlag;
  }
}

AccompanyCategoryDetailDataUserPropDetailDtoEntranceEffect $AccompanyCategoryDetailDataUserPropDetailDtoEntranceEffectFromJson(
    Map<String, dynamic> json) {
  final AccompanyCategoryDetailDataUserPropDetailDtoEntranceEffect accompanyCategoryDetailDataUserPropDetailDtoEntranceEffect = AccompanyCategoryDetailDataUserPropDetailDtoEntranceEffect();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    accompanyCategoryDetailDataUserPropDetailDtoEntranceEffect.id = id;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    accompanyCategoryDetailDataUserPropDetailDtoEntranceEffect.userId = userId;
  }
  final int? propId = jsonConvert.convert<int>(json['propId']);
  if (propId != null) {
    accompanyCategoryDetailDataUserPropDetailDtoEntranceEffect.propId = propId;
  }
  final String? propName = jsonConvert.convert<String>(json['propName']);
  if (propName != null) {
    accompanyCategoryDetailDataUserPropDetailDtoEntranceEffect.propName =
        propName;
  }
  final int? propType = jsonConvert.convert<int>(json['propType']);
  if (propType != null) {
    accompanyCategoryDetailDataUserPropDetailDtoEntranceEffect.propType =
        propType;
  }
  final String? propFormat = jsonConvert.convert<String>(json['propFormat']);
  if (propFormat != null) {
    accompanyCategoryDetailDataUserPropDetailDtoEntranceEffect.propFormat =
        propFormat;
  }
  final String? dynamicEffect = jsonConvert.convert<String>(
      json['dynamicEffect']);
  if (dynamicEffect != null) {
    accompanyCategoryDetailDataUserPropDetailDtoEntranceEffect.dynamicEffect =
        dynamicEffect;
  }
  final String? pcDynamicEffect = jsonConvert.convert<String>(
      json['pcDynamicEffect']);
  if (pcDynamicEffect != null) {
    accompanyCategoryDetailDataUserPropDetailDtoEntranceEffect.pcDynamicEffect =
        pcDynamicEffect;
  }
  final String? iosDynamicEffect = jsonConvert.convert<String>(
      json['iosDynamicEffect']);
  if (iosDynamicEffect != null) {
    accompanyCategoryDetailDataUserPropDetailDtoEntranceEffect
        .iosDynamicEffect = iosDynamicEffect;
  }
  final int? customFlag = jsonConvert.convert<int>(json['customFlag']);
  if (customFlag != null) {
    accompanyCategoryDetailDataUserPropDetailDtoEntranceEffect.customFlag =
        customFlag;
  }
  final String? customInfo = jsonConvert.convert<String>(json['customInfo']);
  if (customInfo != null) {
    accompanyCategoryDetailDataUserPropDetailDtoEntranceEffect.customInfo =
        customInfo;
  }
  final int? useFlag = jsonConvert.convert<int>(json['useFlag']);
  if (useFlag != null) {
    accompanyCategoryDetailDataUserPropDetailDtoEntranceEffect.useFlag =
        useFlag;
  }
  return accompanyCategoryDetailDataUserPropDetailDtoEntranceEffect;
}

Map<String,
    dynamic> $AccompanyCategoryDetailDataUserPropDetailDtoEntranceEffectToJson(
    AccompanyCategoryDetailDataUserPropDetailDtoEntranceEffect entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['userId'] = entity.userId;
  data['propId'] = entity.propId;
  data['propName'] = entity.propName;
  data['propType'] = entity.propType;
  data['propFormat'] = entity.propFormat;
  data['dynamicEffect'] = entity.dynamicEffect;
  data['pcDynamicEffect'] = entity.pcDynamicEffect;
  data['iosDynamicEffect'] = entity.iosDynamicEffect;
  data['customFlag'] = entity.customFlag;
  data['customInfo'] = entity.customInfo;
  data['useFlag'] = entity.useFlag;
  return data;
}

extension AccompanyCategoryDetailDataUserPropDetailDtoEntranceEffectExtension on AccompanyCategoryDetailDataUserPropDetailDtoEntranceEffect {
  AccompanyCategoryDetailDataUserPropDetailDtoEntranceEffect copyWith({
    int? id,
    int? userId,
    int? propId,
    String? propName,
    int? propType,
    String? propFormat,
    String? dynamicEffect,
    String? pcDynamicEffect,
    String? iosDynamicEffect,
    int? customFlag,
    String? customInfo,
    int? useFlag,
  }) {
    return AccompanyCategoryDetailDataUserPropDetailDtoEntranceEffect()
      ..id = id ?? this.id
      ..userId = userId ?? this.userId
      ..propId = propId ?? this.propId
      ..propName = propName ?? this.propName
      ..propType = propType ?? this.propType
      ..propFormat = propFormat ?? this.propFormat
      ..dynamicEffect = dynamicEffect ?? this.dynamicEffect
      ..pcDynamicEffect = pcDynamicEffect ?? this.pcDynamicEffect
      ..iosDynamicEffect = iosDynamicEffect ?? this.iosDynamicEffect
      ..customFlag = customFlag ?? this.customFlag
      ..customInfo = customInfo ?? this.customInfo
      ..useFlag = useFlag ?? this.useFlag;
  }
}

AccompanyCategoryDetailDataUserPropDetailDtoCustomNickname $AccompanyCategoryDetailDataUserPropDetailDtoCustomNicknameFromJson(
    Map<String, dynamic> json) {
  final AccompanyCategoryDetailDataUserPropDetailDtoCustomNickname accompanyCategoryDetailDataUserPropDetailDtoCustomNickname = AccompanyCategoryDetailDataUserPropDetailDtoCustomNickname();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    accompanyCategoryDetailDataUserPropDetailDtoCustomNickname.id = id;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    accompanyCategoryDetailDataUserPropDetailDtoCustomNickname.userId = userId;
  }
  final int? propId = jsonConvert.convert<int>(json['propId']);
  if (propId != null) {
    accompanyCategoryDetailDataUserPropDetailDtoCustomNickname.propId = propId;
  }
  final String? propName = jsonConvert.convert<String>(json['propName']);
  if (propName != null) {
    accompanyCategoryDetailDataUserPropDetailDtoCustomNickname.propName =
        propName;
  }
  final int? propType = jsonConvert.convert<int>(json['propType']);
  if (propType != null) {
    accompanyCategoryDetailDataUserPropDetailDtoCustomNickname.propType =
        propType;
  }
  final String? propFormat = jsonConvert.convert<String>(json['propFormat']);
  if (propFormat != null) {
    accompanyCategoryDetailDataUserPropDetailDtoCustomNickname.propFormat =
        propFormat;
  }
  final String? dynamicEffect = jsonConvert.convert<String>(
      json['dynamicEffect']);
  if (dynamicEffect != null) {
    accompanyCategoryDetailDataUserPropDetailDtoCustomNickname.dynamicEffect =
        dynamicEffect;
  }
  final String? pcDynamicEffect = jsonConvert.convert<String>(
      json['pcDynamicEffect']);
  if (pcDynamicEffect != null) {
    accompanyCategoryDetailDataUserPropDetailDtoCustomNickname.pcDynamicEffect =
        pcDynamicEffect;
  }
  final String? iosDynamicEffect = jsonConvert.convert<String>(
      json['iosDynamicEffect']);
  if (iosDynamicEffect != null) {
    accompanyCategoryDetailDataUserPropDetailDtoCustomNickname
        .iosDynamicEffect = iosDynamicEffect;
  }
  final int? customFlag = jsonConvert.convert<int>(json['customFlag']);
  if (customFlag != null) {
    accompanyCategoryDetailDataUserPropDetailDtoCustomNickname.customFlag =
        customFlag;
  }
  final String? customInfo = jsonConvert.convert<String>(json['customInfo']);
  if (customInfo != null) {
    accompanyCategoryDetailDataUserPropDetailDtoCustomNickname.customInfo =
        customInfo;
  }
  final int? useFlag = jsonConvert.convert<int>(json['useFlag']);
  if (useFlag != null) {
    accompanyCategoryDetailDataUserPropDetailDtoCustomNickname.useFlag =
        useFlag;
  }
  return accompanyCategoryDetailDataUserPropDetailDtoCustomNickname;
}

Map<String,
    dynamic> $AccompanyCategoryDetailDataUserPropDetailDtoCustomNicknameToJson(
    AccompanyCategoryDetailDataUserPropDetailDtoCustomNickname entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['userId'] = entity.userId;
  data['propId'] = entity.propId;
  data['propName'] = entity.propName;
  data['propType'] = entity.propType;
  data['propFormat'] = entity.propFormat;
  data['dynamicEffect'] = entity.dynamicEffect;
  data['pcDynamicEffect'] = entity.pcDynamicEffect;
  data['iosDynamicEffect'] = entity.iosDynamicEffect;
  data['customFlag'] = entity.customFlag;
  data['customInfo'] = entity.customInfo;
  data['useFlag'] = entity.useFlag;
  return data;
}

extension AccompanyCategoryDetailDataUserPropDetailDtoCustomNicknameExtension on AccompanyCategoryDetailDataUserPropDetailDtoCustomNickname {
  AccompanyCategoryDetailDataUserPropDetailDtoCustomNickname copyWith({
    int? id,
    int? userId,
    int? propId,
    String? propName,
    int? propType,
    String? propFormat,
    String? dynamicEffect,
    String? pcDynamicEffect,
    String? iosDynamicEffect,
    int? customFlag,
    String? customInfo,
    int? useFlag,
  }) {
    return AccompanyCategoryDetailDataUserPropDetailDtoCustomNickname()
      ..id = id ?? this.id
      ..userId = userId ?? this.userId
      ..propId = propId ?? this.propId
      ..propName = propName ?? this.propName
      ..propType = propType ?? this.propType
      ..propFormat = propFormat ?? this.propFormat
      ..dynamicEffect = dynamicEffect ?? this.dynamicEffect
      ..pcDynamicEffect = pcDynamicEffect ?? this.pcDynamicEffect
      ..iosDynamicEffect = iosDynamicEffect ?? this.iosDynamicEffect
      ..customFlag = customFlag ?? this.customFlag
      ..customInfo = customInfo ?? this.customInfo
      ..useFlag = useFlag ?? this.useFlag;
  }
}

AccompanyCategoryDetailDataUserPropDetailDtoHomepageEffect $AccompanyCategoryDetailDataUserPropDetailDtoHomepageEffectFromJson(
    Map<String, dynamic> json) {
  final AccompanyCategoryDetailDataUserPropDetailDtoHomepageEffect accompanyCategoryDetailDataUserPropDetailDtoHomepageEffect = AccompanyCategoryDetailDataUserPropDetailDtoHomepageEffect();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    accompanyCategoryDetailDataUserPropDetailDtoHomepageEffect.id = id;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    accompanyCategoryDetailDataUserPropDetailDtoHomepageEffect.userId = userId;
  }
  final int? propId = jsonConvert.convert<int>(json['propId']);
  if (propId != null) {
    accompanyCategoryDetailDataUserPropDetailDtoHomepageEffect.propId = propId;
  }
  final String? propName = jsonConvert.convert<String>(json['propName']);
  if (propName != null) {
    accompanyCategoryDetailDataUserPropDetailDtoHomepageEffect.propName =
        propName;
  }
  final int? propType = jsonConvert.convert<int>(json['propType']);
  if (propType != null) {
    accompanyCategoryDetailDataUserPropDetailDtoHomepageEffect.propType =
        propType;
  }
  final String? propFormat = jsonConvert.convert<String>(json['propFormat']);
  if (propFormat != null) {
    accompanyCategoryDetailDataUserPropDetailDtoHomepageEffect.propFormat =
        propFormat;
  }
  final String? dynamicEffect = jsonConvert.convert<String>(
      json['dynamicEffect']);
  if (dynamicEffect != null) {
    accompanyCategoryDetailDataUserPropDetailDtoHomepageEffect.dynamicEffect =
        dynamicEffect;
  }
  final String? pcDynamicEffect = jsonConvert.convert<String>(
      json['pcDynamicEffect']);
  if (pcDynamicEffect != null) {
    accompanyCategoryDetailDataUserPropDetailDtoHomepageEffect.pcDynamicEffect =
        pcDynamicEffect;
  }
  final String? iosDynamicEffect = jsonConvert.convert<String>(
      json['iosDynamicEffect']);
  if (iosDynamicEffect != null) {
    accompanyCategoryDetailDataUserPropDetailDtoHomepageEffect
        .iosDynamicEffect = iosDynamicEffect;
  }
  final int? customFlag = jsonConvert.convert<int>(json['customFlag']);
  if (customFlag != null) {
    accompanyCategoryDetailDataUserPropDetailDtoHomepageEffect.customFlag =
        customFlag;
  }
  final String? customInfo = jsonConvert.convert<String>(json['customInfo']);
  if (customInfo != null) {
    accompanyCategoryDetailDataUserPropDetailDtoHomepageEffect.customInfo =
        customInfo;
  }
  final int? useFlag = jsonConvert.convert<int>(json['useFlag']);
  if (useFlag != null) {
    accompanyCategoryDetailDataUserPropDetailDtoHomepageEffect.useFlag =
        useFlag;
  }
  return accompanyCategoryDetailDataUserPropDetailDtoHomepageEffect;
}

Map<String,
    dynamic> $AccompanyCategoryDetailDataUserPropDetailDtoHomepageEffectToJson(
    AccompanyCategoryDetailDataUserPropDetailDtoHomepageEffect entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['userId'] = entity.userId;
  data['propId'] = entity.propId;
  data['propName'] = entity.propName;
  data['propType'] = entity.propType;
  data['propFormat'] = entity.propFormat;
  data['dynamicEffect'] = entity.dynamicEffect;
  data['pcDynamicEffect'] = entity.pcDynamicEffect;
  data['iosDynamicEffect'] = entity.iosDynamicEffect;
  data['customFlag'] = entity.customFlag;
  data['customInfo'] = entity.customInfo;
  data['useFlag'] = entity.useFlag;
  return data;
}

extension AccompanyCategoryDetailDataUserPropDetailDtoHomepageEffectExtension on AccompanyCategoryDetailDataUserPropDetailDtoHomepageEffect {
  AccompanyCategoryDetailDataUserPropDetailDtoHomepageEffect copyWith({
    int? id,
    int? userId,
    int? propId,
    String? propName,
    int? propType,
    String? propFormat,
    String? dynamicEffect,
    String? pcDynamicEffect,
    String? iosDynamicEffect,
    int? customFlag,
    String? customInfo,
    int? useFlag,
  }) {
    return AccompanyCategoryDetailDataUserPropDetailDtoHomepageEffect()
      ..id = id ?? this.id
      ..userId = userId ?? this.userId
      ..propId = propId ?? this.propId
      ..propName = propName ?? this.propName
      ..propType = propType ?? this.propType
      ..propFormat = propFormat ?? this.propFormat
      ..dynamicEffect = dynamicEffect ?? this.dynamicEffect
      ..pcDynamicEffect = pcDynamicEffect ?? this.pcDynamicEffect
      ..iosDynamicEffect = iosDynamicEffect ?? this.iosDynamicEffect
      ..customFlag = customFlag ?? this.customFlag
      ..customInfo = customInfo ?? this.customInfo
      ..useFlag = useFlag ?? this.useFlag;
  }
}

AccompanyCategoryDetailDataUserPropDetailDtoNameplate $AccompanyCategoryDetailDataUserPropDetailDtoNameplateFromJson(
    Map<String, dynamic> json) {
  final AccompanyCategoryDetailDataUserPropDetailDtoNameplate accompanyCategoryDetailDataUserPropDetailDtoNameplate = AccompanyCategoryDetailDataUserPropDetailDtoNameplate();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    accompanyCategoryDetailDataUserPropDetailDtoNameplate.id = id;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    accompanyCategoryDetailDataUserPropDetailDtoNameplate.userId = userId;
  }
  final int? propId = jsonConvert.convert<int>(json['propId']);
  if (propId != null) {
    accompanyCategoryDetailDataUserPropDetailDtoNameplate.propId = propId;
  }
  final String? propName = jsonConvert.convert<String>(json['propName']);
  if (propName != null) {
    accompanyCategoryDetailDataUserPropDetailDtoNameplate.propName = propName;
  }
  final int? propType = jsonConvert.convert<int>(json['propType']);
  if (propType != null) {
    accompanyCategoryDetailDataUserPropDetailDtoNameplate.propType = propType;
  }
  final String? propFormat = jsonConvert.convert<String>(json['propFormat']);
  if (propFormat != null) {
    accompanyCategoryDetailDataUserPropDetailDtoNameplate.propFormat =
        propFormat;
  }
  final String? dynamicEffect = jsonConvert.convert<String>(
      json['dynamicEffect']);
  if (dynamicEffect != null) {
    accompanyCategoryDetailDataUserPropDetailDtoNameplate.dynamicEffect =
        dynamicEffect;
  }
  final String? pcDynamicEffect = jsonConvert.convert<String>(
      json['pcDynamicEffect']);
  if (pcDynamicEffect != null) {
    accompanyCategoryDetailDataUserPropDetailDtoNameplate.pcDynamicEffect =
        pcDynamicEffect;
  }
  final String? iosDynamicEffect = jsonConvert.convert<String>(
      json['iosDynamicEffect']);
  if (iosDynamicEffect != null) {
    accompanyCategoryDetailDataUserPropDetailDtoNameplate.iosDynamicEffect =
        iosDynamicEffect;
  }
  final int? customFlag = jsonConvert.convert<int>(json['customFlag']);
  if (customFlag != null) {
    accompanyCategoryDetailDataUserPropDetailDtoNameplate.customFlag =
        customFlag;
  }
  final String? customInfo = jsonConvert.convert<String>(json['customInfo']);
  if (customInfo != null) {
    accompanyCategoryDetailDataUserPropDetailDtoNameplate.customInfo =
        customInfo;
  }
  final int? useFlag = jsonConvert.convert<int>(json['useFlag']);
  if (useFlag != null) {
    accompanyCategoryDetailDataUserPropDetailDtoNameplate.useFlag = useFlag;
  }
  return accompanyCategoryDetailDataUserPropDetailDtoNameplate;
}

Map<String,
    dynamic> $AccompanyCategoryDetailDataUserPropDetailDtoNameplateToJson(
    AccompanyCategoryDetailDataUserPropDetailDtoNameplate entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['userId'] = entity.userId;
  data['propId'] = entity.propId;
  data['propName'] = entity.propName;
  data['propType'] = entity.propType;
  data['propFormat'] = entity.propFormat;
  data['dynamicEffect'] = entity.dynamicEffect;
  data['pcDynamicEffect'] = entity.pcDynamicEffect;
  data['iosDynamicEffect'] = entity.iosDynamicEffect;
  data['customFlag'] = entity.customFlag;
  data['customInfo'] = entity.customInfo;
  data['useFlag'] = entity.useFlag;
  return data;
}

extension AccompanyCategoryDetailDataUserPropDetailDtoNameplateExtension on AccompanyCategoryDetailDataUserPropDetailDtoNameplate {
  AccompanyCategoryDetailDataUserPropDetailDtoNameplate copyWith({
    int? id,
    int? userId,
    int? propId,
    String? propName,
    int? propType,
    String? propFormat,
    String? dynamicEffect,
    String? pcDynamicEffect,
    String? iosDynamicEffect,
    int? customFlag,
    String? customInfo,
    int? useFlag,
  }) {
    return AccompanyCategoryDetailDataUserPropDetailDtoNameplate()
      ..id = id ?? this.id
      ..userId = userId ?? this.userId
      ..propId = propId ?? this.propId
      ..propName = propName ?? this.propName
      ..propType = propType ?? this.propType
      ..propFormat = propFormat ?? this.propFormat
      ..dynamicEffect = dynamicEffect ?? this.dynamicEffect
      ..pcDynamicEffect = pcDynamicEffect ?? this.pcDynamicEffect
      ..iosDynamicEffect = iosDynamicEffect ?? this.iosDynamicEffect
      ..customFlag = customFlag ?? this.customFlag
      ..customInfo = customInfo ?? this.customInfo
      ..useFlag = useFlag ?? this.useFlag;
  }
}

AccompanyCategoryDetailDataUserPropDetailDtoMount $AccompanyCategoryDetailDataUserPropDetailDtoMountFromJson(
    Map<String, dynamic> json) {
  final AccompanyCategoryDetailDataUserPropDetailDtoMount accompanyCategoryDetailDataUserPropDetailDtoMount = AccompanyCategoryDetailDataUserPropDetailDtoMount();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    accompanyCategoryDetailDataUserPropDetailDtoMount.id = id;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    accompanyCategoryDetailDataUserPropDetailDtoMount.userId = userId;
  }
  final int? propId = jsonConvert.convert<int>(json['propId']);
  if (propId != null) {
    accompanyCategoryDetailDataUserPropDetailDtoMount.propId = propId;
  }
  final String? propName = jsonConvert.convert<String>(json['propName']);
  if (propName != null) {
    accompanyCategoryDetailDataUserPropDetailDtoMount.propName = propName;
  }
  final int? propType = jsonConvert.convert<int>(json['propType']);
  if (propType != null) {
    accompanyCategoryDetailDataUserPropDetailDtoMount.propType = propType;
  }
  final String? propFormat = jsonConvert.convert<String>(json['propFormat']);
  if (propFormat != null) {
    accompanyCategoryDetailDataUserPropDetailDtoMount.propFormat = propFormat;
  }
  final String? dynamicEffect = jsonConvert.convert<String>(
      json['dynamicEffect']);
  if (dynamicEffect != null) {
    accompanyCategoryDetailDataUserPropDetailDtoMount.dynamicEffect =
        dynamicEffect;
  }
  final String? pcDynamicEffect = jsonConvert.convert<String>(
      json['pcDynamicEffect']);
  if (pcDynamicEffect != null) {
    accompanyCategoryDetailDataUserPropDetailDtoMount.pcDynamicEffect =
        pcDynamicEffect;
  }
  final String? iosDynamicEffect = jsonConvert.convert<String>(
      json['iosDynamicEffect']);
  if (iosDynamicEffect != null) {
    accompanyCategoryDetailDataUserPropDetailDtoMount.iosDynamicEffect =
        iosDynamicEffect;
  }
  final int? customFlag = jsonConvert.convert<int>(json['customFlag']);
  if (customFlag != null) {
    accompanyCategoryDetailDataUserPropDetailDtoMount.customFlag = customFlag;
  }
  final String? customInfo = jsonConvert.convert<String>(json['customInfo']);
  if (customInfo != null) {
    accompanyCategoryDetailDataUserPropDetailDtoMount.customInfo = customInfo;
  }
  final int? useFlag = jsonConvert.convert<int>(json['useFlag']);
  if (useFlag != null) {
    accompanyCategoryDetailDataUserPropDetailDtoMount.useFlag = useFlag;
  }
  return accompanyCategoryDetailDataUserPropDetailDtoMount;
}

Map<String, dynamic> $AccompanyCategoryDetailDataUserPropDetailDtoMountToJson(
    AccompanyCategoryDetailDataUserPropDetailDtoMount entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['userId'] = entity.userId;
  data['propId'] = entity.propId;
  data['propName'] = entity.propName;
  data['propType'] = entity.propType;
  data['propFormat'] = entity.propFormat;
  data['dynamicEffect'] = entity.dynamicEffect;
  data['pcDynamicEffect'] = entity.pcDynamicEffect;
  data['iosDynamicEffect'] = entity.iosDynamicEffect;
  data['customFlag'] = entity.customFlag;
  data['customInfo'] = entity.customInfo;
  data['useFlag'] = entity.useFlag;
  return data;
}

extension AccompanyCategoryDetailDataUserPropDetailDtoMountExtension on AccompanyCategoryDetailDataUserPropDetailDtoMount {
  AccompanyCategoryDetailDataUserPropDetailDtoMount copyWith({
    int? id,
    int? userId,
    int? propId,
    String? propName,
    int? propType,
    String? propFormat,
    String? dynamicEffect,
    String? pcDynamicEffect,
    String? iosDynamicEffect,
    int? customFlag,
    String? customInfo,
    int? useFlag,
  }) {
    return AccompanyCategoryDetailDataUserPropDetailDtoMount()
      ..id = id ?? this.id
      ..userId = userId ?? this.userId
      ..propId = propId ?? this.propId
      ..propName = propName ?? this.propName
      ..propType = propType ?? this.propType
      ..propFormat = propFormat ?? this.propFormat
      ..dynamicEffect = dynamicEffect ?? this.dynamicEffect
      ..pcDynamicEffect = pcDynamicEffect ?? this.pcDynamicEffect
      ..iosDynamicEffect = iosDynamicEffect ?? this.iosDynamicEffect
      ..customFlag = customFlag ?? this.customFlag
      ..customInfo = customInfo ?? this.customInfo
      ..useFlag = useFlag ?? this.useFlag;
  }
}

AccompanyCategoryDetailDataUserPropDetailDtoColorfulText $AccompanyCategoryDetailDataUserPropDetailDtoColorfulTextFromJson(
    Map<String, dynamic> json) {
  final AccompanyCategoryDetailDataUserPropDetailDtoColorfulText accompanyCategoryDetailDataUserPropDetailDtoColorfulText = AccompanyCategoryDetailDataUserPropDetailDtoColorfulText();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    accompanyCategoryDetailDataUserPropDetailDtoColorfulText.id = id;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    accompanyCategoryDetailDataUserPropDetailDtoColorfulText.userId = userId;
  }
  final int? propId = jsonConvert.convert<int>(json['propId']);
  if (propId != null) {
    accompanyCategoryDetailDataUserPropDetailDtoColorfulText.propId = propId;
  }
  final String? propName = jsonConvert.convert<String>(json['propName']);
  if (propName != null) {
    accompanyCategoryDetailDataUserPropDetailDtoColorfulText.propName =
        propName;
  }
  final int? propType = jsonConvert.convert<int>(json['propType']);
  if (propType != null) {
    accompanyCategoryDetailDataUserPropDetailDtoColorfulText.propType =
        propType;
  }
  final String? propFormat = jsonConvert.convert<String>(json['propFormat']);
  if (propFormat != null) {
    accompanyCategoryDetailDataUserPropDetailDtoColorfulText.propFormat =
        propFormat;
  }
  final String? dynamicEffect = jsonConvert.convert<String>(
      json['dynamicEffect']);
  if (dynamicEffect != null) {
    accompanyCategoryDetailDataUserPropDetailDtoColorfulText.dynamicEffect =
        dynamicEffect;
  }
  final String? pcDynamicEffect = jsonConvert.convert<String>(
      json['pcDynamicEffect']);
  if (pcDynamicEffect != null) {
    accompanyCategoryDetailDataUserPropDetailDtoColorfulText.pcDynamicEffect =
        pcDynamicEffect;
  }
  final String? iosDynamicEffect = jsonConvert.convert<String>(
      json['iosDynamicEffect']);
  if (iosDynamicEffect != null) {
    accompanyCategoryDetailDataUserPropDetailDtoColorfulText.iosDynamicEffect =
        iosDynamicEffect;
  }
  final int? customFlag = jsonConvert.convert<int>(json['customFlag']);
  if (customFlag != null) {
    accompanyCategoryDetailDataUserPropDetailDtoColorfulText.customFlag =
        customFlag;
  }
  final String? customInfo = jsonConvert.convert<String>(json['customInfo']);
  if (customInfo != null) {
    accompanyCategoryDetailDataUserPropDetailDtoColorfulText.customInfo =
        customInfo;
  }
  final int? useFlag = jsonConvert.convert<int>(json['useFlag']);
  if (useFlag != null) {
    accompanyCategoryDetailDataUserPropDetailDtoColorfulText.useFlag = useFlag;
  }
  return accompanyCategoryDetailDataUserPropDetailDtoColorfulText;
}

Map<String,
    dynamic> $AccompanyCategoryDetailDataUserPropDetailDtoColorfulTextToJson(
    AccompanyCategoryDetailDataUserPropDetailDtoColorfulText entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['userId'] = entity.userId;
  data['propId'] = entity.propId;
  data['propName'] = entity.propName;
  data['propType'] = entity.propType;
  data['propFormat'] = entity.propFormat;
  data['dynamicEffect'] = entity.dynamicEffect;
  data['pcDynamicEffect'] = entity.pcDynamicEffect;
  data['iosDynamicEffect'] = entity.iosDynamicEffect;
  data['customFlag'] = entity.customFlag;
  data['customInfo'] = entity.customInfo;
  data['useFlag'] = entity.useFlag;
  return data;
}

extension AccompanyCategoryDetailDataUserPropDetailDtoColorfulTextExtension on AccompanyCategoryDetailDataUserPropDetailDtoColorfulText {
  AccompanyCategoryDetailDataUserPropDetailDtoColorfulText copyWith({
    int? id,
    int? userId,
    int? propId,
    String? propName,
    int? propType,
    String? propFormat,
    String? dynamicEffect,
    String? pcDynamicEffect,
    String? iosDynamicEffect,
    int? customFlag,
    String? customInfo,
    int? useFlag,
  }) {
    return AccompanyCategoryDetailDataUserPropDetailDtoColorfulText()
      ..id = id ?? this.id
      ..userId = userId ?? this.userId
      ..propId = propId ?? this.propId
      ..propName = propName ?? this.propName
      ..propType = propType ?? this.propType
      ..propFormat = propFormat ?? this.propFormat
      ..dynamicEffect = dynamicEffect ?? this.dynamicEffect
      ..pcDynamicEffect = pcDynamicEffect ?? this.pcDynamicEffect
      ..iosDynamicEffect = iosDynamicEffect ?? this.iosDynamicEffect
      ..customFlag = customFlag ?? this.customFlag
      ..customInfo = customInfo ?? this.customInfo
      ..useFlag = useFlag ?? this.useFlag;
  }
}

AccompanyCategoryDetailDataUserPropDetailDtoRoomWallpaper $AccompanyCategoryDetailDataUserPropDetailDtoRoomWallpaperFromJson(
    Map<String, dynamic> json) {
  final AccompanyCategoryDetailDataUserPropDetailDtoRoomWallpaper accompanyCategoryDetailDataUserPropDetailDtoRoomWallpaper = AccompanyCategoryDetailDataUserPropDetailDtoRoomWallpaper();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    accompanyCategoryDetailDataUserPropDetailDtoRoomWallpaper.id = id;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    accompanyCategoryDetailDataUserPropDetailDtoRoomWallpaper.userId = userId;
  }
  final int? propId = jsonConvert.convert<int>(json['propId']);
  if (propId != null) {
    accompanyCategoryDetailDataUserPropDetailDtoRoomWallpaper.propId = propId;
  }
  final String? propName = jsonConvert.convert<String>(json['propName']);
  if (propName != null) {
    accompanyCategoryDetailDataUserPropDetailDtoRoomWallpaper.propName =
        propName;
  }
  final int? propType = jsonConvert.convert<int>(json['propType']);
  if (propType != null) {
    accompanyCategoryDetailDataUserPropDetailDtoRoomWallpaper.propType =
        propType;
  }
  final String? propFormat = jsonConvert.convert<String>(json['propFormat']);
  if (propFormat != null) {
    accompanyCategoryDetailDataUserPropDetailDtoRoomWallpaper.propFormat =
        propFormat;
  }
  final String? dynamicEffect = jsonConvert.convert<String>(
      json['dynamicEffect']);
  if (dynamicEffect != null) {
    accompanyCategoryDetailDataUserPropDetailDtoRoomWallpaper.dynamicEffect =
        dynamicEffect;
  }
  final String? pcDynamicEffect = jsonConvert.convert<String>(
      json['pcDynamicEffect']);
  if (pcDynamicEffect != null) {
    accompanyCategoryDetailDataUserPropDetailDtoRoomWallpaper.pcDynamicEffect =
        pcDynamicEffect;
  }
  final String? iosDynamicEffect = jsonConvert.convert<String>(
      json['iosDynamicEffect']);
  if (iosDynamicEffect != null) {
    accompanyCategoryDetailDataUserPropDetailDtoRoomWallpaper.iosDynamicEffect =
        iosDynamicEffect;
  }
  final int? customFlag = jsonConvert.convert<int>(json['customFlag']);
  if (customFlag != null) {
    accompanyCategoryDetailDataUserPropDetailDtoRoomWallpaper.customFlag =
        customFlag;
  }
  final String? customInfo = jsonConvert.convert<String>(json['customInfo']);
  if (customInfo != null) {
    accompanyCategoryDetailDataUserPropDetailDtoRoomWallpaper.customInfo =
        customInfo;
  }
  final int? useFlag = jsonConvert.convert<int>(json['useFlag']);
  if (useFlag != null) {
    accompanyCategoryDetailDataUserPropDetailDtoRoomWallpaper.useFlag = useFlag;
  }
  return accompanyCategoryDetailDataUserPropDetailDtoRoomWallpaper;
}

Map<String,
    dynamic> $AccompanyCategoryDetailDataUserPropDetailDtoRoomWallpaperToJson(
    AccompanyCategoryDetailDataUserPropDetailDtoRoomWallpaper entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['userId'] = entity.userId;
  data['propId'] = entity.propId;
  data['propName'] = entity.propName;
  data['propType'] = entity.propType;
  data['propFormat'] = entity.propFormat;
  data['dynamicEffect'] = entity.dynamicEffect;
  data['pcDynamicEffect'] = entity.pcDynamicEffect;
  data['iosDynamicEffect'] = entity.iosDynamicEffect;
  data['customFlag'] = entity.customFlag;
  data['customInfo'] = entity.customInfo;
  data['useFlag'] = entity.useFlag;
  return data;
}

extension AccompanyCategoryDetailDataUserPropDetailDtoRoomWallpaperExtension on AccompanyCategoryDetailDataUserPropDetailDtoRoomWallpaper {
  AccompanyCategoryDetailDataUserPropDetailDtoRoomWallpaper copyWith({
    int? id,
    int? userId,
    int? propId,
    String? propName,
    int? propType,
    String? propFormat,
    String? dynamicEffect,
    String? pcDynamicEffect,
    String? iosDynamicEffect,
    int? customFlag,
    String? customInfo,
    int? useFlag,
  }) {
    return AccompanyCategoryDetailDataUserPropDetailDtoRoomWallpaper()
      ..id = id ?? this.id
      ..userId = userId ?? this.userId
      ..propId = propId ?? this.propId
      ..propName = propName ?? this.propName
      ..propType = propType ?? this.propType
      ..propFormat = propFormat ?? this.propFormat
      ..dynamicEffect = dynamicEffect ?? this.dynamicEffect
      ..pcDynamicEffect = pcDynamicEffect ?? this.pcDynamicEffect
      ..iosDynamicEffect = iosDynamicEffect ?? this.iosDynamicEffect
      ..customFlag = customFlag ?? this.customFlag
      ..customInfo = customInfo ?? this.customInfo
      ..useFlag = useFlag ?? this.useFlag;
  }
}

AccompanyCategoryDetailDataUserPropDetailDtoNobleCard $AccompanyCategoryDetailDataUserPropDetailDtoNobleCardFromJson(
    Map<String, dynamic> json) {
  final AccompanyCategoryDetailDataUserPropDetailDtoNobleCard accompanyCategoryDetailDataUserPropDetailDtoNobleCard = AccompanyCategoryDetailDataUserPropDetailDtoNobleCard();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    accompanyCategoryDetailDataUserPropDetailDtoNobleCard.id = id;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    accompanyCategoryDetailDataUserPropDetailDtoNobleCard.userId = userId;
  }
  final int? propId = jsonConvert.convert<int>(json['propId']);
  if (propId != null) {
    accompanyCategoryDetailDataUserPropDetailDtoNobleCard.propId = propId;
  }
  final String? propName = jsonConvert.convert<String>(json['propName']);
  if (propName != null) {
    accompanyCategoryDetailDataUserPropDetailDtoNobleCard.propName = propName;
  }
  final int? propType = jsonConvert.convert<int>(json['propType']);
  if (propType != null) {
    accompanyCategoryDetailDataUserPropDetailDtoNobleCard.propType = propType;
  }
  final String? propFormat = jsonConvert.convert<String>(json['propFormat']);
  if (propFormat != null) {
    accompanyCategoryDetailDataUserPropDetailDtoNobleCard.propFormat =
        propFormat;
  }
  final String? dynamicEffect = jsonConvert.convert<String>(
      json['dynamicEffect']);
  if (dynamicEffect != null) {
    accompanyCategoryDetailDataUserPropDetailDtoNobleCard.dynamicEffect =
        dynamicEffect;
  }
  final String? pcDynamicEffect = jsonConvert.convert<String>(
      json['pcDynamicEffect']);
  if (pcDynamicEffect != null) {
    accompanyCategoryDetailDataUserPropDetailDtoNobleCard.pcDynamicEffect =
        pcDynamicEffect;
  }
  final String? iosDynamicEffect = jsonConvert.convert<String>(
      json['iosDynamicEffect']);
  if (iosDynamicEffect != null) {
    accompanyCategoryDetailDataUserPropDetailDtoNobleCard.iosDynamicEffect =
        iosDynamicEffect;
  }
  final int? customFlag = jsonConvert.convert<int>(json['customFlag']);
  if (customFlag != null) {
    accompanyCategoryDetailDataUserPropDetailDtoNobleCard.customFlag =
        customFlag;
  }
  final String? customInfo = jsonConvert.convert<String>(json['customInfo']);
  if (customInfo != null) {
    accompanyCategoryDetailDataUserPropDetailDtoNobleCard.customInfo =
        customInfo;
  }
  final int? useFlag = jsonConvert.convert<int>(json['useFlag']);
  if (useFlag != null) {
    accompanyCategoryDetailDataUserPropDetailDtoNobleCard.useFlag = useFlag;
  }
  return accompanyCategoryDetailDataUserPropDetailDtoNobleCard;
}

Map<String,
    dynamic> $AccompanyCategoryDetailDataUserPropDetailDtoNobleCardToJson(
    AccompanyCategoryDetailDataUserPropDetailDtoNobleCard entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['userId'] = entity.userId;
  data['propId'] = entity.propId;
  data['propName'] = entity.propName;
  data['propType'] = entity.propType;
  data['propFormat'] = entity.propFormat;
  data['dynamicEffect'] = entity.dynamicEffect;
  data['pcDynamicEffect'] = entity.pcDynamicEffect;
  data['iosDynamicEffect'] = entity.iosDynamicEffect;
  data['customFlag'] = entity.customFlag;
  data['customInfo'] = entity.customInfo;
  data['useFlag'] = entity.useFlag;
  return data;
}

extension AccompanyCategoryDetailDataUserPropDetailDtoNobleCardExtension on AccompanyCategoryDetailDataUserPropDetailDtoNobleCard {
  AccompanyCategoryDetailDataUserPropDetailDtoNobleCard copyWith({
    int? id,
    int? userId,
    int? propId,
    String? propName,
    int? propType,
    String? propFormat,
    String? dynamicEffect,
    String? pcDynamicEffect,
    String? iosDynamicEffect,
    int? customFlag,
    String? customInfo,
    int? useFlag,
  }) {
    return AccompanyCategoryDetailDataUserPropDetailDtoNobleCard()
      ..id = id ?? this.id
      ..userId = userId ?? this.userId
      ..propId = propId ?? this.propId
      ..propName = propName ?? this.propName
      ..propType = propType ?? this.propType
      ..propFormat = propFormat ?? this.propFormat
      ..dynamicEffect = dynamicEffect ?? this.dynamicEffect
      ..pcDynamicEffect = pcDynamicEffect ?? this.pcDynamicEffect
      ..iosDynamicEffect = iosDynamicEffect ?? this.iosDynamicEffect
      ..customFlag = customFlag ?? this.customFlag
      ..customInfo = customInfo ?? this.customInfo
      ..useFlag = useFlag ?? this.useFlag;
  }
}

AccompanyCategoryDetailDataPersonCategoryDto $AccompanyCategoryDetailDataPersonCategoryDtoFromJson(
    Map<String, dynamic> json) {
  final AccompanyCategoryDetailDataPersonCategoryDto accompanyCategoryDetailDataPersonCategoryDto = AccompanyCategoryDetailDataPersonCategoryDto();
  final int? categoryId = jsonConvert.convert<int>(json['categoryId']);
  if (categoryId != null) {
    accompanyCategoryDetailDataPersonCategoryDto.categoryId = categoryId;
  }
  final String? categoryName = jsonConvert.convert<String>(
      json['categoryName']);
  if (categoryName != null) {
    accompanyCategoryDetailDataPersonCategoryDto.categoryName = categoryName;
  }
  final String? introduced = jsonConvert.convert<String>(json['introduced']);
  if (introduced != null) {
    accompanyCategoryDetailDataPersonCategoryDto.introduced = introduced;
  }
  final int? receiveStatus = jsonConvert.convert<int>(json['receiveStatus']);
  if (receiveStatus != null) {
    accompanyCategoryDetailDataPersonCategoryDto.receiveStatus = receiveStatus;
  }
  final int? commissionRate = jsonConvert.convert<int>(json['commissionRate']);
  if (commissionRate != null) {
    accompanyCategoryDetailDataPersonCategoryDto.commissionRate =
        commissionRate;
  }
  final String? maxStandard = jsonConvert.convert<String>(json['maxStandard']);
  if (maxStandard != null) {
    accompanyCategoryDetailDataPersonCategoryDto.maxStandard = maxStandard;
  }
  final List<
      AccompanyCategoryDetailDataPersonCategoryDtoFileList>? fileList = (json['fileList'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<
          AccompanyCategoryDetailDataPersonCategoryDtoFileList>(
          e) as AccompanyCategoryDetailDataPersonCategoryDtoFileList).toList();
  if (fileList != null) {
    accompanyCategoryDetailDataPersonCategoryDto.fileList = fileList;
  }
  final List<
      AccompanyCategoryDetailDataPersonCategoryDtoPriceList>? priceList = (json['priceList'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<
          AccompanyCategoryDetailDataPersonCategoryDtoPriceList>(
          e) as AccompanyCategoryDetailDataPersonCategoryDtoPriceList).toList();
  if (priceList != null) {
    accompanyCategoryDetailDataPersonCategoryDto.priceList = priceList;
  }
  final AccompanyCategoryDetailDataPersonCategoryDtoMinPriceDto? minPriceDto = jsonConvert
      .convert<AccompanyCategoryDetailDataPersonCategoryDtoMinPriceDto>(
      json['minPriceDto']);
  if (minPriceDto != null) {
    accompanyCategoryDetailDataPersonCategoryDto.minPriceDto = minPriceDto;
  }
  return accompanyCategoryDetailDataPersonCategoryDto;
}

Map<String, dynamic> $AccompanyCategoryDetailDataPersonCategoryDtoToJson(
    AccompanyCategoryDetailDataPersonCategoryDto entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['categoryId'] = entity.categoryId;
  data['categoryName'] = entity.categoryName;
  data['introduced'] = entity.introduced;
  data['receiveStatus'] = entity.receiveStatus;
  data['commissionRate'] = entity.commissionRate;
  data['maxStandard'] = entity.maxStandard;
  data['fileList'] = entity.fileList.map((v) => v.toJson()).toList();
  data['priceList'] = entity.priceList.map((v) => v.toJson()).toList();
  data['minPriceDto'] = entity.minPriceDto.toJson();
  return data;
}

extension AccompanyCategoryDetailDataPersonCategoryDtoExtension on AccompanyCategoryDetailDataPersonCategoryDto {
  AccompanyCategoryDetailDataPersonCategoryDto copyWith({
    int? categoryId,
    String? categoryName,
    String? introduced,
    int? receiveStatus,
    int? commissionRate,
    String? maxStandard,
    List<AccompanyCategoryDetailDataPersonCategoryDtoFileList>? fileList,
    List<AccompanyCategoryDetailDataPersonCategoryDtoPriceList>? priceList,
    AccompanyCategoryDetailDataPersonCategoryDtoMinPriceDto? minPriceDto,
  }) {
    return AccompanyCategoryDetailDataPersonCategoryDto()
      ..categoryId = categoryId ?? this.categoryId
      ..categoryName = categoryName ?? this.categoryName
      ..introduced = introduced ?? this.introduced
      ..receiveStatus = receiveStatus ?? this.receiveStatus
      ..commissionRate = commissionRate ?? this.commissionRate
      ..maxStandard = maxStandard ?? this.maxStandard
      ..fileList = fileList ?? this.fileList
      ..priceList = priceList ?? this.priceList
      ..minPriceDto = minPriceDto ?? this.minPriceDto;
  }
}

AccompanyCategoryDetailDataPersonCategoryDtoFileList $AccompanyCategoryDetailDataPersonCategoryDtoFileListFromJson(
    Map<String, dynamic> json) {
  final AccompanyCategoryDetailDataPersonCategoryDtoFileList accompanyCategoryDetailDataPersonCategoryDtoFileList = AccompanyCategoryDetailDataPersonCategoryDtoFileList();
  final int? accompanyCategoryId = jsonConvert.convert<int>(
      json['accompanyCategoryId']);
  if (accompanyCategoryId != null) {
    accompanyCategoryDetailDataPersonCategoryDtoFileList.accompanyCategoryId =
        accompanyCategoryId;
  }
  final String? fileId = jsonConvert.convert<String>(json['fileId']);
  if (fileId != null) {
    accompanyCategoryDetailDataPersonCategoryDtoFileList.fileId = fileId;
  }
  final String? fileUrl = jsonConvert.convert<String>(json['fileUrl']);
  if (fileUrl != null) {
    accompanyCategoryDetailDataPersonCategoryDtoFileList.fileUrl = fileUrl;
  }
  final String? fileType = jsonConvert.convert<String>(json['fileType']);
  if (fileType != null) {
    accompanyCategoryDetailDataPersonCategoryDtoFileList.fileType = fileType;
  }
  final int? audioDuration = jsonConvert.convert<int>(json['audioDuration']);
  if (audioDuration != null) {
    accompanyCategoryDetailDataPersonCategoryDtoFileList.audioDuration =
        audioDuration;
  }
  final int? sort = jsonConvert.convert<int>(json['sort']);
  if (sort != null) {
    accompanyCategoryDetailDataPersonCategoryDtoFileList.sort = sort;
  }
  return accompanyCategoryDetailDataPersonCategoryDtoFileList;
}

Map<String,
    dynamic> $AccompanyCategoryDetailDataPersonCategoryDtoFileListToJson(
    AccompanyCategoryDetailDataPersonCategoryDtoFileList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['accompanyCategoryId'] = entity.accompanyCategoryId;
  data['fileId'] = entity.fileId;
  data['fileUrl'] = entity.fileUrl;
  data['fileType'] = entity.fileType;
  data['audioDuration'] = entity.audioDuration;
  data['sort'] = entity.sort;
  return data;
}

extension AccompanyCategoryDetailDataPersonCategoryDtoFileListExtension on AccompanyCategoryDetailDataPersonCategoryDtoFileList {
  AccompanyCategoryDetailDataPersonCategoryDtoFileList copyWith({
    int? accompanyCategoryId,
    String? fileId,
    String? fileUrl,
    String? fileType,
    int? audioDuration,
    int? sort,
  }) {
    return AccompanyCategoryDetailDataPersonCategoryDtoFileList()
      ..accompanyCategoryId = accompanyCategoryId ?? this.accompanyCategoryId
      ..fileId = fileId ?? this.fileId
      ..fileUrl = fileUrl ?? this.fileUrl
      ..fileType = fileType ?? this.fileType
      ..audioDuration = audioDuration ?? this.audioDuration
      ..sort = sort ?? this.sort;
  }
}

AccompanyCategoryDetailDataPersonCategoryDtoPriceList $AccompanyCategoryDetailDataPersonCategoryDtoPriceListFromJson(
    Map<String, dynamic> json) {
  final AccompanyCategoryDetailDataPersonCategoryDtoPriceList accompanyCategoryDetailDataPersonCategoryDtoPriceList = AccompanyCategoryDetailDataPersonCategoryDtoPriceList();
  final int? skuId = jsonConvert.convert<int>(json['skuId']);
  if (skuId != null) {
    accompanyCategoryDetailDataPersonCategoryDtoPriceList.skuId = skuId;
  }
  final String? skuName = jsonConvert.convert<String>(json['skuName']);
  if (skuName != null) {
    accompanyCategoryDetailDataPersonCategoryDtoPriceList.skuName = skuName;
  }
  final String? showName = jsonConvert.convert<String>(json['showName']);
  if (showName != null) {
    accompanyCategoryDetailDataPersonCategoryDtoPriceList.showName = showName;
  }
  final String? accompanyStandard = jsonConvert.convert<String>(
      json['accompanyStandard']);
  if (accompanyStandard != null) {
    accompanyCategoryDetailDataPersonCategoryDtoPriceList.accompanyStandard =
        accompanyStandard;
  }
  final int? receiveStatus = jsonConvert.convert<int>(json['receiveStatus']);
  if (receiveStatus != null) {
    accompanyCategoryDetailDataPersonCategoryDtoPriceList.receiveStatus =
        receiveStatus;
  }
  final int? minPrice = jsonConvert.convert<int>(json['minPrice']);
  if (minPrice != null) {
    accompanyCategoryDetailDataPersonCategoryDtoPriceList.minPrice = minPrice;
  }
  final int? maxPrice = jsonConvert.convert<int>(json['maxPrice']);
  if (maxPrice != null) {
    accompanyCategoryDetailDataPersonCategoryDtoPriceList.maxPrice = maxPrice;
  }
  final int? price = jsonConvert.convert<int>(json['price']);
  if (price != null) {
    accompanyCategoryDetailDataPersonCategoryDtoPriceList.price = price;
  }
  final String? priceUnit = jsonConvert.convert<String>(json['priceUnit']);
  if (priceUnit != null) {
    accompanyCategoryDetailDataPersonCategoryDtoPriceList.priceUnit = priceUnit;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    accompanyCategoryDetailDataPersonCategoryDtoPriceList.icon = icon;
  }
  final int? shopId = jsonConvert.convert<int>(json['shopId']);
  if (shopId != null) {
    accompanyCategoryDetailDataPersonCategoryDtoPriceList.shopId = shopId;
  }
  return accompanyCategoryDetailDataPersonCategoryDtoPriceList;
}

Map<String,
    dynamic> $AccompanyCategoryDetailDataPersonCategoryDtoPriceListToJson(
    AccompanyCategoryDetailDataPersonCategoryDtoPriceList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['skuId'] = entity.skuId;
  data['skuName'] = entity.skuName;
  data['showName'] = entity.showName;
  data['accompanyStandard'] = entity.accompanyStandard;
  data['receiveStatus'] = entity.receiveStatus;
  data['minPrice'] = entity.minPrice;
  data['maxPrice'] = entity.maxPrice;
  data['price'] = entity.price;
  data['priceUnit'] = entity.priceUnit;
  data['icon'] = entity.icon;
  data['shopId'] = entity.shopId;
  return data;
}

extension AccompanyCategoryDetailDataPersonCategoryDtoPriceListExtension on AccompanyCategoryDetailDataPersonCategoryDtoPriceList {
  AccompanyCategoryDetailDataPersonCategoryDtoPriceList copyWith({
    int? skuId,
    String? skuName,
    String? showName,
    String? accompanyStandard,
    int? receiveStatus,
    int? minPrice,
    int? maxPrice,
    int? price,
    String? priceUnit,
    String? icon,
    int? shopId,
  }) {
    return AccompanyCategoryDetailDataPersonCategoryDtoPriceList()
      ..skuId = skuId ?? this.skuId
      ..skuName = skuName ?? this.skuName
      ..showName = showName ?? this.showName
      ..accompanyStandard = accompanyStandard ?? this.accompanyStandard
      ..receiveStatus = receiveStatus ?? this.receiveStatus
      ..minPrice = minPrice ?? this.minPrice
      ..maxPrice = maxPrice ?? this.maxPrice
      ..price = price ?? this.price
      ..priceUnit = priceUnit ?? this.priceUnit
      ..icon = icon ?? this.icon
      ..shopId = shopId ?? this.shopId;
  }
}

AccompanyCategoryDetailDataPersonCategoryDtoMinPriceDto $AccompanyCategoryDetailDataPersonCategoryDtoMinPriceDtoFromJson(
    Map<String, dynamic> json) {
  final AccompanyCategoryDetailDataPersonCategoryDtoMinPriceDto accompanyCategoryDetailDataPersonCategoryDtoMinPriceDto = AccompanyCategoryDetailDataPersonCategoryDtoMinPriceDto();
  final int? skuId = jsonConvert.convert<int>(json['skuId']);
  if (skuId != null) {
    accompanyCategoryDetailDataPersonCategoryDtoMinPriceDto.skuId = skuId;
  }
  final String? skuName = jsonConvert.convert<String>(json['skuName']);
  if (skuName != null) {
    accompanyCategoryDetailDataPersonCategoryDtoMinPriceDto.skuName = skuName;
  }
  final String? showName = jsonConvert.convert<String>(json['showName']);
  if (showName != null) {
    accompanyCategoryDetailDataPersonCategoryDtoMinPriceDto.showName = showName;
  }
  final String? accompanyStandard = jsonConvert.convert<String>(
      json['accompanyStandard']);
  if (accompanyStandard != null) {
    accompanyCategoryDetailDataPersonCategoryDtoMinPriceDto.accompanyStandard =
        accompanyStandard;
  }
  final int? receiveStatus = jsonConvert.convert<int>(json['receiveStatus']);
  if (receiveStatus != null) {
    accompanyCategoryDetailDataPersonCategoryDtoMinPriceDto.receiveStatus =
        receiveStatus;
  }
  final int? minPrice = jsonConvert.convert<int>(json['minPrice']);
  if (minPrice != null) {
    accompanyCategoryDetailDataPersonCategoryDtoMinPriceDto.minPrice = minPrice;
  }
  final int? maxPrice = jsonConvert.convert<int>(json['maxPrice']);
  if (maxPrice != null) {
    accompanyCategoryDetailDataPersonCategoryDtoMinPriceDto.maxPrice = maxPrice;
  }
  final int? price = jsonConvert.convert<int>(json['price']);
  if (price != null) {
    accompanyCategoryDetailDataPersonCategoryDtoMinPriceDto.price = price;
  }
  final String? priceUnit = jsonConvert.convert<String>(json['priceUnit']);
  if (priceUnit != null) {
    accompanyCategoryDetailDataPersonCategoryDtoMinPriceDto.priceUnit =
        priceUnit;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    accompanyCategoryDetailDataPersonCategoryDtoMinPriceDto.icon = icon;
  }
  final int? shopId = jsonConvert.convert<int>(json['shopId']);
  if (shopId != null) {
    accompanyCategoryDetailDataPersonCategoryDtoMinPriceDto.shopId = shopId;
  }
  return accompanyCategoryDetailDataPersonCategoryDtoMinPriceDto;
}

Map<String,
    dynamic> $AccompanyCategoryDetailDataPersonCategoryDtoMinPriceDtoToJson(
    AccompanyCategoryDetailDataPersonCategoryDtoMinPriceDto entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['skuId'] = entity.skuId;
  data['skuName'] = entity.skuName;
  data['showName'] = entity.showName;
  data['accompanyStandard'] = entity.accompanyStandard;
  data['receiveStatus'] = entity.receiveStatus;
  data['minPrice'] = entity.minPrice;
  data['maxPrice'] = entity.maxPrice;
  data['price'] = entity.price;
  data['priceUnit'] = entity.priceUnit;
  data['icon'] = entity.icon;
  data['shopId'] = entity.shopId;
  return data;
}

extension AccompanyCategoryDetailDataPersonCategoryDtoMinPriceDtoExtension on AccompanyCategoryDetailDataPersonCategoryDtoMinPriceDto {
  AccompanyCategoryDetailDataPersonCategoryDtoMinPriceDto copyWith({
    int? skuId,
    String? skuName,
    String? showName,
    String? accompanyStandard,
    int? receiveStatus,
    int? minPrice,
    int? maxPrice,
    int? price,
    String? priceUnit,
    String? icon,
    int? shopId,
  }) {
    return AccompanyCategoryDetailDataPersonCategoryDtoMinPriceDto()
      ..skuId = skuId ?? this.skuId
      ..skuName = skuName ?? this.skuName
      ..showName = showName ?? this.showName
      ..accompanyStandard = accompanyStandard ?? this.accompanyStandard
      ..receiveStatus = receiveStatus ?? this.receiveStatus
      ..minPrice = minPrice ?? this.minPrice
      ..maxPrice = maxPrice ?? this.maxPrice
      ..price = price ?? this.price
      ..priceUnit = priceUnit ?? this.priceUnit
      ..icon = icon ?? this.icon
      ..shopId = shopId ?? this.shopId;
  }
}

AccompanyCategoryDetailDataEntryGroupDto $AccompanyCategoryDetailDataEntryGroupDtoFromJson(
    Map<String, dynamic> json) {
  final AccompanyCategoryDetailDataEntryGroupDto accompanyCategoryDetailDataEntryGroupDto = AccompanyCategoryDetailDataEntryGroupDto();
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    accompanyCategoryDetailDataEntryGroupDto.type = type;
  }
  final String? typeName = jsonConvert.convert<String>(json['typeName']);
  if (typeName != null) {
    accompanyCategoryDetailDataEntryGroupDto.typeName = typeName;
  }
  final List<
      AccompanyCategoryDetailDataEntryGroupDtoEntries>? entries = (json['entries'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<
          AccompanyCategoryDetailDataEntryGroupDtoEntries>(
          e) as AccompanyCategoryDetailDataEntryGroupDtoEntries).toList();
  if (entries != null) {
    accompanyCategoryDetailDataEntryGroupDto.entries = entries;
  }
  return accompanyCategoryDetailDataEntryGroupDto;
}

Map<String, dynamic> $AccompanyCategoryDetailDataEntryGroupDtoToJson(
    AccompanyCategoryDetailDataEntryGroupDto entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['type'] = entity.type;
  data['typeName'] = entity.typeName;
  data['entries'] = entity.entries.map((v) => v.toJson()).toList();
  return data;
}

extension AccompanyCategoryDetailDataEntryGroupDtoExtension on AccompanyCategoryDetailDataEntryGroupDto {
  AccompanyCategoryDetailDataEntryGroupDto copyWith({
    int? type,
    String? typeName,
    List<AccompanyCategoryDetailDataEntryGroupDtoEntries>? entries,
  }) {
    return AccompanyCategoryDetailDataEntryGroupDto()
      ..type = type ?? this.type
      ..typeName = typeName ?? this.typeName
      ..entries = entries ?? this.entries;
  }
}

AccompanyCategoryDetailDataEntryGroupDtoEntries $AccompanyCategoryDetailDataEntryGroupDtoEntriesFromJson(
    Map<String, dynamic> json) {
  final AccompanyCategoryDetailDataEntryGroupDtoEntries accompanyCategoryDetailDataEntryGroupDtoEntries = AccompanyCategoryDetailDataEntryGroupDtoEntries();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    accompanyCategoryDetailDataEntryGroupDtoEntries.id = id;
  }
  final int? categoryId = jsonConvert.convert<int>(json['categoryId']);
  if (categoryId != null) {
    accompanyCategoryDetailDataEntryGroupDtoEntries.categoryId = categoryId;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    accompanyCategoryDetailDataEntryGroupDtoEntries.type = type;
  }
  final String? code = jsonConvert.convert<String>(json['code']);
  if (code != null) {
    accompanyCategoryDetailDataEntryGroupDtoEntries.code = code;
  }
  final String? labelName = jsonConvert.convert<String>(json['labelName']);
  if (labelName != null) {
    accompanyCategoryDetailDataEntryGroupDtoEntries.labelName = labelName;
  }
  final String? content = jsonConvert.convert<String>(json['content']);
  if (content != null) {
    accompanyCategoryDetailDataEntryGroupDtoEntries.content = content;
  }
  final int? weighted = jsonConvert.convert<int>(json['weighted']);
  if (weighted != null) {
    accompanyCategoryDetailDataEntryGroupDtoEntries.weighted = weighted;
  }
  final int? usableFlag = jsonConvert.convert<int>(json['usableFlag']);
  if (usableFlag != null) {
    accompanyCategoryDetailDataEntryGroupDtoEntries.usableFlag = usableFlag;
  }
  final String? createTime = jsonConvert.convert<String>(json['createTime']);
  if (createTime != null) {
    accompanyCategoryDetailDataEntryGroupDtoEntries.createTime = createTime;
  }
  return accompanyCategoryDetailDataEntryGroupDtoEntries;
}

Map<String, dynamic> $AccompanyCategoryDetailDataEntryGroupDtoEntriesToJson(
    AccompanyCategoryDetailDataEntryGroupDtoEntries entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['categoryId'] = entity.categoryId;
  data['type'] = entity.type;
  data['code'] = entity.code;
  data['labelName'] = entity.labelName;
  data['content'] = entity.content;
  data['weighted'] = entity.weighted;
  data['usableFlag'] = entity.usableFlag;
  data['createTime'] = entity.createTime;
  return data;
}

extension AccompanyCategoryDetailDataEntryGroupDtoEntriesExtension on AccompanyCategoryDetailDataEntryGroupDtoEntries {
  AccompanyCategoryDetailDataEntryGroupDtoEntries copyWith({
    int? id,
    int? categoryId,
    int? type,
    String? code,
    String? labelName,
    String? content,
    int? weighted,
    int? usableFlag,
    String? createTime,
  }) {
    return AccompanyCategoryDetailDataEntryGroupDtoEntries()
      ..id = id ?? this.id
      ..categoryId = categoryId ?? this.categoryId
      ..type = type ?? this.type
      ..code = code ?? this.code
      ..labelName = labelName ?? this.labelName
      ..content = content ?? this.content
      ..weighted = weighted ?? this.weighted
      ..usableFlag = usableFlag ?? this.usableFlag
      ..createTime = createTime ?? this.createTime;
  }
}

AccompanyCategoryDetailDataAbilityLabelList $AccompanyCategoryDetailDataAbilityLabelListFromJson(
    Map<String, dynamic> json) {
  final AccompanyCategoryDetailDataAbilityLabelList accompanyCategoryDetailDataAbilityLabelList = AccompanyCategoryDetailDataAbilityLabelList();
  final int? categoryLabelId = jsonConvert.convert<int>(
      json['categoryLabelId']);
  if (categoryLabelId != null) {
    accompanyCategoryDetailDataAbilityLabelList.categoryLabelId =
        categoryLabelId;
  }
  final String? labelName = jsonConvert.convert<String>(json['labelName']);
  if (labelName != null) {
    accompanyCategoryDetailDataAbilityLabelList.labelName = labelName;
  }
  final int? weighted = jsonConvert.convert<int>(json['weighted']);
  if (weighted != null) {
    accompanyCategoryDetailDataAbilityLabelList.weighted = weighted;
  }
  final List<
      AccompanyCategoryDetailDataAbilityLabelListItems>? items = (json['items'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<
          AccompanyCategoryDetailDataAbilityLabelListItems>(
          e) as AccompanyCategoryDetailDataAbilityLabelListItems).toList();
  if (items != null) {
    accompanyCategoryDetailDataAbilityLabelList.items = items;
  }
  return accompanyCategoryDetailDataAbilityLabelList;
}

Map<String, dynamic> $AccompanyCategoryDetailDataAbilityLabelListToJson(
    AccompanyCategoryDetailDataAbilityLabelList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['categoryLabelId'] = entity.categoryLabelId;
  data['labelName'] = entity.labelName;
  data['weighted'] = entity.weighted;
  data['items'] = entity.items.map((v) => v.toJson()).toList();
  return data;
}

extension AccompanyCategoryDetailDataAbilityLabelListExtension on AccompanyCategoryDetailDataAbilityLabelList {
  AccompanyCategoryDetailDataAbilityLabelList copyWith({
    int? categoryLabelId,
    String? labelName,
    int? weighted,
    List<AccompanyCategoryDetailDataAbilityLabelListItems>? items,
  }) {
    return AccompanyCategoryDetailDataAbilityLabelList()
      ..categoryLabelId = categoryLabelId ?? this.categoryLabelId
      ..labelName = labelName ?? this.labelName
      ..weighted = weighted ?? this.weighted
      ..items = items ?? this.items;
  }
}

AccompanyCategoryDetailDataAbilityLabelListItems $AccompanyCategoryDetailDataAbilityLabelListItemsFromJson(
    Map<String, dynamic> json) {
  final AccompanyCategoryDetailDataAbilityLabelListItems accompanyCategoryDetailDataAbilityLabelListItems = AccompanyCategoryDetailDataAbilityLabelListItems();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    accompanyCategoryDetailDataAbilityLabelListItems.id = id;
  }
  final String? labelName = jsonConvert.convert<String>(json['labelName']);
  if (labelName != null) {
    accompanyCategoryDetailDataAbilityLabelListItems.labelName = labelName;
  }
  final bool? selected = jsonConvert.convert<bool>(json['selected']);
  if (selected != null) {
    accompanyCategoryDetailDataAbilityLabelListItems.selected = selected;
  }
  return accompanyCategoryDetailDataAbilityLabelListItems;
}

Map<String, dynamic> $AccompanyCategoryDetailDataAbilityLabelListItemsToJson(
    AccompanyCategoryDetailDataAbilityLabelListItems entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['labelName'] = entity.labelName;
  data['selected'] = entity.selected;
  return data;
}

extension AccompanyCategoryDetailDataAbilityLabelListItemsExtension on AccompanyCategoryDetailDataAbilityLabelListItems {
  AccompanyCategoryDetailDataAbilityLabelListItems copyWith({
    int? id,
    String? labelName,
    bool? selected,
  }) {
    return AccompanyCategoryDetailDataAbilityLabelListItems()
      ..id = id ?? this.id
      ..labelName = labelName ?? this.labelName
      ..selected = selected ?? this.selected;
  }
}