import 'package:oneww/generated/json/base/json_convert_content.dart';
import 'package:oneww/models/user_gift_wall_response_entity.dart';

UserGiftWallResponseEntity $UserGiftWallResponseEntityFromJson(
    Map<String, dynamic> json) {
  final UserGiftWallResponseEntity userGiftWallResponseEntity = UserGiftWallResponseEntity();
  final String? requestId = jsonConvert.convert<String>(json['request_id']);
  if (requestId != null) {
    userGiftWallResponseEntity.requestId = requestId;
  }
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    userGiftWallResponseEntity.code = code;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    userGiftWallResponseEntity.message = message;
  }
  final UserGiftWallResponseData? data = jsonConvert.convert<
      UserGiftWallResponseData>(json['data']);
  if (data != null) {
    userGiftWallResponseEntity.data = data;
  }
  return userGiftWallResponseEntity;
}

Map<String, dynamic> $UserGiftWallResponseEntityToJson(
    UserGiftWallResponseEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['request_id'] = entity.requestId;
  data['code'] = entity.code;
  data['message'] = entity.message;
  data['data'] = entity.data.toJson();
  return data;
}

extension UserGiftWallResponseEntityExtension on UserGiftWallResponseEntity {
  UserGiftWallResponseEntity copyWith({
    String? requestId,
    int? code,
    String? message,
    UserGiftWallResponseData? data,
  }) {
    return UserGiftWallResponseEntity()
      ..requestId = requestId ?? this.requestId
      ..code = code ?? this.code
      ..message = message ?? this.message
      ..data = data ?? this.data;
  }
}

UserGiftWallResponseData $UserGiftWallResponseDataFromJson(
    Map<String, dynamic> json) {
  final UserGiftWallResponseData userGiftWallResponseData = UserGiftWallResponseData();
  final int? pageNo = jsonConvert.convert<int>(json['pageNo']);
  if (pageNo != null) {
    userGiftWallResponseData.pageNo = pageNo;
  }
  final int? pageSize = jsonConvert.convert<int>(json['pageSize']);
  if (pageSize != null) {
    userGiftWallResponseData.pageSize = pageSize;
  }
  final int? total = jsonConvert.convert<int>(json['total']);
  if (total != null) {
    userGiftWallResponseData.total = total;
  }
  final int? pages = jsonConvert.convert<int>(json['pages']);
  if (pages != null) {
    userGiftWallResponseData.pages = pages;
  }
  final List<
      UserGiftWallResponseDataRecords>? records = (json['records'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<UserGiftWallResponseDataRecords>(
          e) as UserGiftWallResponseDataRecords).toList();
  if (records != null) {
    userGiftWallResponseData.records = records;
  }
  return userGiftWallResponseData;
}

Map<String, dynamic> $UserGiftWallResponseDataToJson(
    UserGiftWallResponseData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['pageNo'] = entity.pageNo;
  data['pageSize'] = entity.pageSize;
  data['total'] = entity.total;
  data['pages'] = entity.pages;
  data['records'] = entity.records.map((v) => v.toJson()).toList();
  return data;
}

extension UserGiftWallResponseDataExtension on UserGiftWallResponseData {
  UserGiftWallResponseData copyWith({
    int? pageNo,
    int? pageSize,
    int? total,
    int? pages,
    List<UserGiftWallResponseDataRecords>? records,
  }) {
    return UserGiftWallResponseData()
      ..pageNo = pageNo ?? this.pageNo
      ..pageSize = pageSize ?? this.pageSize
      ..total = total ?? this.total
      ..pages = pages ?? this.pages
      ..records = records ?? this.records;
  }
}

UserGiftWallResponseDataRecords $UserGiftWallResponseDataRecordsFromJson(
    Map<String, dynamic> json) {
  final UserGiftWallResponseDataRecords userGiftWallResponseDataRecords = UserGiftWallResponseDataRecords();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    userGiftWallResponseDataRecords.id = id;
  }
  final String? giftName = jsonConvert.convert<String>(json['giftName']);
  if (giftName != null) {
    userGiftWallResponseDataRecords.giftName = giftName;
  }
  final int? rechargeType = jsonConvert.convert<int>(json['rechargeType']);
  if (rechargeType != null) {
    userGiftWallResponseDataRecords.rechargeType = rechargeType;
  }
  final String? showImage = jsonConvert.convert<String>(json['showImage']);
  if (showImage != null) {
    userGiftWallResponseDataRecords.showImage = showImage;
  }
  final String? staticEffect = jsonConvert.convert<String>(
      json['staticEffect']);
  if (staticEffect != null) {
    userGiftWallResponseDataRecords.staticEffect = staticEffect;
  }
  final String? dynamicEffect = jsonConvert.convert<String>(
      json['dynamicEffect']);
  if (dynamicEffect != null) {
    userGiftWallResponseDataRecords.dynamicEffect = dynamicEffect;
  }
  final int? giftPrice = jsonConvert.convert<int>(json['giftPrice']);
  if (giftPrice != null) {
    userGiftWallResponseDataRecords.giftPrice = giftPrice;
  }
  final int? giftCount = jsonConvert.convert<int>(json['giftCount']);
  if (giftCount != null) {
    userGiftWallResponseDataRecords.giftCount = giftCount;
  }
  final String? giveTime = jsonConvert.convert<String>(json['giveTime']);
  if (giveTime != null) {
    userGiftWallResponseDataRecords.giveTime = giveTime;
  }
  final int? isLight = jsonConvert.convert<int>(json['isLight']);
  if (isLight != null) {
    userGiftWallResponseDataRecords.isLight = isLight;
  }
  final UserGiftWallResponseDataRecordsGiveUser? giveUser = jsonConvert.convert<
      UserGiftWallResponseDataRecordsGiveUser>(json['giveUser']);
  if (giveUser != null) {
    userGiftWallResponseDataRecords.giveUser = giveUser;
  }
  return userGiftWallResponseDataRecords;
}

Map<String, dynamic> $UserGiftWallResponseDataRecordsToJson(
    UserGiftWallResponseDataRecords entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['giftName'] = entity.giftName;
  data['rechargeType'] = entity.rechargeType;
  data['showImage'] = entity.showImage;
  data['staticEffect'] = entity.staticEffect;
  data['dynamicEffect'] = entity.dynamicEffect;
  data['giftPrice'] = entity.giftPrice;
  data['giftCount'] = entity.giftCount;
  data['giveTime'] = entity.giveTime;
  data['isLight'] = entity.isLight;
  data['giveUser'] = entity.giveUser.toJson();
  return data;
}

extension UserGiftWallResponseDataRecordsExtension on UserGiftWallResponseDataRecords {
  UserGiftWallResponseDataRecords copyWith({
    int? id,
    String? giftName,
    int? rechargeType,
    String? showImage,
    String? staticEffect,
    String? dynamicEffect,
    int? giftPrice,
    int? giftCount,
    String? giveTime,
    int? isLight,
    UserGiftWallResponseDataRecordsGiveUser? giveUser,
  }) {
    return UserGiftWallResponseDataRecords()
      ..id = id ?? this.id
      ..giftName = giftName ?? this.giftName
      ..rechargeType = rechargeType ?? this.rechargeType
      ..showImage = showImage ?? this.showImage
      ..staticEffect = staticEffect ?? this.staticEffect
      ..dynamicEffect = dynamicEffect ?? this.dynamicEffect
      ..giftPrice = giftPrice ?? this.giftPrice
      ..giftCount = giftCount ?? this.giftCount
      ..giveTime = giveTime ?? this.giveTime
      ..isLight = isLight ?? this.isLight
      ..giveUser = giveUser ?? this.giveUser;
  }
}

UserGiftWallResponseDataRecordsGiveUser $UserGiftWallResponseDataRecordsGiveUserFromJson(
    Map<String, dynamic> json) {
  final UserGiftWallResponseDataRecordsGiveUser userGiftWallResponseDataRecordsGiveUser = UserGiftWallResponseDataRecordsGiveUser();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    userGiftWallResponseDataRecordsGiveUser.id = id;
  }
  final String? userNo = jsonConvert.convert<String>(json['userNo']);
  if (userNo != null) {
    userGiftWallResponseDataRecordsGiveUser.userNo = userNo;
  }
  final String? sex = jsonConvert.convert<String>(json['sex']);
  if (sex != null) {
    userGiftWallResponseDataRecordsGiveUser.sex = sex;
  }
  final String? nickName = jsonConvert.convert<String>(json['nickName']);
  if (nickName != null) {
    userGiftWallResponseDataRecordsGiveUser.nickName = nickName;
  }
  final String? avatar = jsonConvert.convert<String>(json['avatar']);
  if (avatar != null) {
    userGiftWallResponseDataRecordsGiveUser.avatar = avatar;
  }
  final int? onlineFlag = jsonConvert.convert<int>(json['onlineFlag']);
  if (onlineFlag != null) {
    userGiftWallResponseDataRecordsGiveUser.onlineFlag = onlineFlag;
  }
  final int? accompanyId = jsonConvert.convert<int>(json['accompanyId']);
  if (accompanyId != null) {
    userGiftWallResponseDataRecordsGiveUser.accompanyId = accompanyId;
  }
  final String? introduced = jsonConvert.convert<String>(json['introduced']);
  if (introduced != null) {
    userGiftWallResponseDataRecordsGiveUser.introduced = introduced;
  }
  final int? level = jsonConvert.convert<int>(json['level']);
  if (level != null) {
    userGiftWallResponseDataRecordsGiveUser.level = level;
  }
  final int? roomLevel = jsonConvert.convert<int>(json['roomLevel']);
  if (roomLevel != null) {
    userGiftWallResponseDataRecordsGiveUser.roomLevel = roomLevel;
  }
  final UserGiftWallResponseDataRecordsGiveUserRoomLevelConfigDto? roomLevelConfigDto = jsonConvert
      .convert<UserGiftWallResponseDataRecordsGiveUserRoomLevelConfigDto>(
      json['roomLevelConfigDto']);
  if (roomLevelConfigDto != null) {
    userGiftWallResponseDataRecordsGiveUser.roomLevelConfigDto =
        roomLevelConfigDto;
  }
  final UserGiftWallResponseDataRecordsGiveUserNobleLevelDto? nobleLevelDto = jsonConvert
      .convert<UserGiftWallResponseDataRecordsGiveUserNobleLevelDto>(
      json['nobleLevelDto']);
  if (nobleLevelDto != null) {
    userGiftWallResponseDataRecordsGiveUser.nobleLevelDto = nobleLevelDto;
  }
  final String? accompanyLevel = jsonConvert.convert<String>(
      json['accompanyLevel']);
  if (accompanyLevel != null) {
    userGiftWallResponseDataRecordsGiveUser.accompanyLevel = accompanyLevel;
  }
  final String? onlineTime = jsonConvert.convert<String>(json['onlineTime']);
  if (onlineTime != null) {
    userGiftWallResponseDataRecordsGiveUser.onlineTime = onlineTime;
  }
  final String? customIdentityImage = jsonConvert.convert<String>(
      json['customIdentityImage']);
  if (customIdentityImage != null) {
    userGiftWallResponseDataRecordsGiveUser.customIdentityImage =
        customIdentityImage;
  }
  final List<
      String>? customIdentityImageList = (json['customIdentityImageList'] as List<
      dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (customIdentityImageList != null) {
    userGiftWallResponseDataRecordsGiveUser.customIdentityImageList =
        customIdentityImageList;
  }
  final int? userMic = jsonConvert.convert<int>(json['userMic']);
  if (userMic != null) {
    userGiftWallResponseDataRecordsGiveUser.userMic = userMic;
  }
  final String? birthday = jsonConvert.convert<String>(json['birthday']);
  if (birthday != null) {
    userGiftWallResponseDataRecordsGiveUser.birthday = birthday;
  }
  final String? mainLabelId = jsonConvert.convert<String>(json['mainLabelId']);
  if (mainLabelId != null) {
    userGiftWallResponseDataRecordsGiveUser.mainLabelId = mainLabelId;
  }
  final String? mainLabel = jsonConvert.convert<String>(json['mainLabel']);
  if (mainLabel != null) {
    userGiftWallResponseDataRecordsGiveUser.mainLabel = mainLabel;
  }
  final String? moduleAvatar = jsonConvert.convert<String>(
      json['moduleAvatar']);
  if (moduleAvatar != null) {
    userGiftWallResponseDataRecordsGiveUser.moduleAvatar = moduleAvatar;
  }
  return userGiftWallResponseDataRecordsGiveUser;
}

Map<String, dynamic> $UserGiftWallResponseDataRecordsGiveUserToJson(
    UserGiftWallResponseDataRecordsGiveUser entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['userNo'] = entity.userNo;
  data['sex'] = entity.sex;
  data['nickName'] = entity.nickName;
  data['avatar'] = entity.avatar;
  data['onlineFlag'] = entity.onlineFlag;
  data['accompanyId'] = entity.accompanyId;
  data['introduced'] = entity.introduced;
  data['level'] = entity.level;
  data['roomLevel'] = entity.roomLevel;
  data['roomLevelConfigDto'] = entity.roomLevelConfigDto.toJson();
  data['nobleLevelDto'] = entity.nobleLevelDto.toJson();
  data['accompanyLevel'] = entity.accompanyLevel;
  data['onlineTime'] = entity.onlineTime;
  data['customIdentityImage'] = entity.customIdentityImage;
  data['customIdentityImageList'] = entity.customIdentityImageList;
  data['userMic'] = entity.userMic;
  data['birthday'] = entity.birthday;
  data['mainLabelId'] = entity.mainLabelId;
  data['mainLabel'] = entity.mainLabel;
  data['moduleAvatar'] = entity.moduleAvatar;
  return data;
}

extension UserGiftWallResponseDataRecordsGiveUserExtension on UserGiftWallResponseDataRecordsGiveUser {
  UserGiftWallResponseDataRecordsGiveUser copyWith({
    int? id,
    String? userNo,
    String? sex,
    String? nickName,
    String? avatar,
    int? onlineFlag,
    int? accompanyId,
    String? introduced,
    int? level,
    int? roomLevel,
    UserGiftWallResponseDataRecordsGiveUserRoomLevelConfigDto? roomLevelConfigDto,
    UserGiftWallResponseDataRecordsGiveUserNobleLevelDto? nobleLevelDto,
    String? accompanyLevel,
    String? onlineTime,
    String? customIdentityImage,
    List<String>? customIdentityImageList,
    int? userMic,
    String? birthday,
    String? mainLabelId,
    String? mainLabel,
    String? moduleAvatar,
  }) {
    return UserGiftWallResponseDataRecordsGiveUser()
      ..id = id ?? this.id
      ..userNo = userNo ?? this.userNo
      ..sex = sex ?? this.sex
      ..nickName = nickName ?? this.nickName
      ..avatar = avatar ?? this.avatar
      ..onlineFlag = onlineFlag ?? this.onlineFlag
      ..accompanyId = accompanyId ?? this.accompanyId
      ..introduced = introduced ?? this.introduced
      ..level = level ?? this.level
      ..roomLevel = roomLevel ?? this.roomLevel
      ..roomLevelConfigDto = roomLevelConfigDto ?? this.roomLevelConfigDto
      ..nobleLevelDto = nobleLevelDto ?? this.nobleLevelDto
      ..accompanyLevel = accompanyLevel ?? this.accompanyLevel
      ..onlineTime = onlineTime ?? this.onlineTime
      ..customIdentityImage = customIdentityImage ?? this.customIdentityImage
      ..customIdentityImageList = customIdentityImageList ??
          this.customIdentityImageList
      ..userMic = userMic ?? this.userMic
      ..birthday = birthday ?? this.birthday
      ..mainLabelId = mainLabelId ?? this.mainLabelId
      ..mainLabel = mainLabel ?? this.mainLabel
      ..moduleAvatar = moduleAvatar ?? this.moduleAvatar;
  }
}

UserGiftWallResponseDataRecordsGiveUserRoomLevelConfigDto $UserGiftWallResponseDataRecordsGiveUserRoomLevelConfigDtoFromJson(
    Map<String, dynamic> json) {
  final UserGiftWallResponseDataRecordsGiveUserRoomLevelConfigDto userGiftWallResponseDataRecordsGiveUserRoomLevelConfigDto = UserGiftWallResponseDataRecordsGiveUserRoomLevelConfigDto();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    userGiftWallResponseDataRecordsGiveUserRoomLevelConfigDto.id = id;
  }
  final String? levelName = jsonConvert.convert<String>(json['levelName']);
  if (levelName != null) {
    userGiftWallResponseDataRecordsGiveUserRoomLevelConfigDto.levelName =
        levelName;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    userGiftWallResponseDataRecordsGiveUserRoomLevelConfigDto.icon = icon;
  }
  final String? backdrop = jsonConvert.convert<String>(json['backdrop']);
  if (backdrop != null) {
    userGiftWallResponseDataRecordsGiveUserRoomLevelConfigDto.backdrop =
        backdrop;
  }
  final String? medal = jsonConvert.convert<String>(json['medal']);
  if (medal != null) {
    userGiftWallResponseDataRecordsGiveUserRoomLevelConfigDto.medal = medal;
  }
  final String? homeBackdrop = jsonConvert.convert<String>(
      json['homeBackdrop']);
  if (homeBackdrop != null) {
    userGiftWallResponseDataRecordsGiveUserRoomLevelConfigDto.homeBackdrop =
        homeBackdrop;
  }
  final String? pcMedal = jsonConvert.convert<String>(json['pcMedal']);
  if (pcMedal != null) {
    userGiftWallResponseDataRecordsGiveUserRoomLevelConfigDto.pcMedal = pcMedal;
  }
  final String? pcIcon = jsonConvert.convert<String>(json['pcIcon']);
  if (pcIcon != null) {
    userGiftWallResponseDataRecordsGiveUserRoomLevelConfigDto.pcIcon = pcIcon;
  }
  final int? level = jsonConvert.convert<int>(json['level']);
  if (level != null) {
    userGiftWallResponseDataRecordsGiveUserRoomLevelConfigDto.level = level;
  }
  final int? startPoints = jsonConvert.convert<int>(json['startPoints']);
  if (startPoints != null) {
    userGiftWallResponseDataRecordsGiveUserRoomLevelConfigDto.startPoints =
        startPoints;
  }
  final int? endPoints = jsonConvert.convert<int>(json['endPoints']);
  if (endPoints != null) {
    userGiftWallResponseDataRecordsGiveUserRoomLevelConfigDto.endPoints =
        endPoints;
  }
  final int? medalUsable = jsonConvert.convert<int>(json['medalUsable']);
  if (medalUsable != null) {
    userGiftWallResponseDataRecordsGiveUserRoomLevelConfigDto.medalUsable =
        medalUsable;
  }
  final int? recommendUsable = jsonConvert.convert<int>(
      json['recommendUsable']);
  if (recommendUsable != null) {
    userGiftWallResponseDataRecordsGiveUserRoomLevelConfigDto.recommendUsable =
        recommendUsable;
  }
  final int? recommendRate = jsonConvert.convert<int>(json['recommendRate']);
  if (recommendRate != null) {
    userGiftWallResponseDataRecordsGiveUserRoomLevelConfigDto.recommendRate =
        recommendRate;
  }
  final int? giftUsable = jsonConvert.convert<int>(json['giftUsable']);
  if (giftUsable != null) {
    userGiftWallResponseDataRecordsGiveUserRoomLevelConfigDto.giftUsable =
        giftUsable;
  }
  final int? avatarUsable = jsonConvert.convert<int>(json['avatarUsable']);
  if (avatarUsable != null) {
    userGiftWallResponseDataRecordsGiveUserRoomLevelConfigDto.avatarUsable =
        avatarUsable;
  }
  final int? avatarConfigId = jsonConvert.convert<int>(json['avatarConfigId']);
  if (avatarConfigId != null) {
    userGiftWallResponseDataRecordsGiveUserRoomLevelConfigDto.avatarConfigId =
        avatarConfigId;
  }
  final int? animationUsable = jsonConvert.convert<int>(
      json['animationUsable']);
  if (animationUsable != null) {
    userGiftWallResponseDataRecordsGiveUserRoomLevelConfigDto.animationUsable =
        animationUsable;
  }
  final int? animationConfigId = jsonConvert.convert<int>(
      json['animationConfigId']);
  if (animationConfigId != null) {
    userGiftWallResponseDataRecordsGiveUserRoomLevelConfigDto
        .animationConfigId = animationConfigId;
  }
  final int? nickColorUsable = jsonConvert.convert<int>(
      json['nickColorUsable']);
  if (nickColorUsable != null) {
    userGiftWallResponseDataRecordsGiveUserRoomLevelConfigDto.nickColorUsable =
        nickColorUsable;
  }
  final int? nickColorConfigId = jsonConvert.convert<int>(
      json['nickColorConfigId']);
  if (nickColorConfigId != null) {
    userGiftWallResponseDataRecordsGiveUserRoomLevelConfigDto
        .nickColorConfigId = nickColorConfigId;
  }
  final int? textColorUsable = jsonConvert.convert<int>(
      json['textColorUsable']);
  if (textColorUsable != null) {
    userGiftWallResponseDataRecordsGiveUserRoomLevelConfigDto.textColorUsable =
        textColorUsable;
  }
  final int? textColorConfigId = jsonConvert.convert<int>(
      json['textColorConfigId']);
  if (textColorConfigId != null) {
    userGiftWallResponseDataRecordsGiveUserRoomLevelConfigDto
        .textColorConfigId = textColorConfigId;
  }
  final int? birthdayUsable = jsonConvert.convert<int>(json['birthdayUsable']);
  if (birthdayUsable != null) {
    userGiftWallResponseDataRecordsGiveUserRoomLevelConfigDto.birthdayUsable =
        birthdayUsable;
  }
  final int? birthdayRightsPackageId = jsonConvert.convert<int>(
      json['birthdayRightsPackageId']);
  if (birthdayRightsPackageId != null) {
    userGiftWallResponseDataRecordsGiveUserRoomLevelConfigDto
        .birthdayRightsPackageId = birthdayRightsPackageId;
  }
  final int? invisibleRankUsable = jsonConvert.convert<int>(
      json['invisibleRankUsable']);
  if (invisibleRankUsable != null) {
    userGiftWallResponseDataRecordsGiveUserRoomLevelConfigDto
        .invisibleRankUsable = invisibleRankUsable;
  }
  final String? invisibleRankNick = jsonConvert.convert<String>(
      json['invisibleRankNick']);
  if (invisibleRankNick != null) {
    userGiftWallResponseDataRecordsGiveUserRoomLevelConfigDto
        .invisibleRankNick = invisibleRankNick;
  }
  final int? invisibleRoomUsable = jsonConvert.convert<int>(
      json['invisibleRoomUsable']);
  if (invisibleRoomUsable != null) {
    userGiftWallResponseDataRecordsGiveUserRoomLevelConfigDto
        .invisibleRoomUsable = invisibleRoomUsable;
  }
  final int? supportUsable = jsonConvert.convert<int>(json['supportUsable']);
  if (supportUsable != null) {
    userGiftWallResponseDataRecordsGiveUserRoomLevelConfigDto.supportUsable =
        supportUsable;
  }
  final int? productCreateUsable = jsonConvert.convert<int>(
      json['productCreateUsable']);
  if (productCreateUsable != null) {
    userGiftWallResponseDataRecordsGiveUserRoomLevelConfigDto
        .productCreateUsable = productCreateUsable;
  }
  return userGiftWallResponseDataRecordsGiveUserRoomLevelConfigDto;
}

Map<String,
    dynamic> $UserGiftWallResponseDataRecordsGiveUserRoomLevelConfigDtoToJson(
    UserGiftWallResponseDataRecordsGiveUserRoomLevelConfigDto entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['levelName'] = entity.levelName;
  data['icon'] = entity.icon;
  data['backdrop'] = entity.backdrop;
  data['medal'] = entity.medal;
  data['homeBackdrop'] = entity.homeBackdrop;
  data['pcMedal'] = entity.pcMedal;
  data['pcIcon'] = entity.pcIcon;
  data['level'] = entity.level;
  data['startPoints'] = entity.startPoints;
  data['endPoints'] = entity.endPoints;
  data['medalUsable'] = entity.medalUsable;
  data['recommendUsable'] = entity.recommendUsable;
  data['recommendRate'] = entity.recommendRate;
  data['giftUsable'] = entity.giftUsable;
  data['avatarUsable'] = entity.avatarUsable;
  data['avatarConfigId'] = entity.avatarConfigId;
  data['animationUsable'] = entity.animationUsable;
  data['animationConfigId'] = entity.animationConfigId;
  data['nickColorUsable'] = entity.nickColorUsable;
  data['nickColorConfigId'] = entity.nickColorConfigId;
  data['textColorUsable'] = entity.textColorUsable;
  data['textColorConfigId'] = entity.textColorConfigId;
  data['birthdayUsable'] = entity.birthdayUsable;
  data['birthdayRightsPackageId'] = entity.birthdayRightsPackageId;
  data['invisibleRankUsable'] = entity.invisibleRankUsable;
  data['invisibleRankNick'] = entity.invisibleRankNick;
  data['invisibleRoomUsable'] = entity.invisibleRoomUsable;
  data['supportUsable'] = entity.supportUsable;
  data['productCreateUsable'] = entity.productCreateUsable;
  return data;
}

extension UserGiftWallResponseDataRecordsGiveUserRoomLevelConfigDtoExtension on UserGiftWallResponseDataRecordsGiveUserRoomLevelConfigDto {
  UserGiftWallResponseDataRecordsGiveUserRoomLevelConfigDto copyWith({
    int? id,
    String? levelName,
    String? icon,
    String? backdrop,
    String? medal,
    String? homeBackdrop,
    String? pcMedal,
    String? pcIcon,
    int? level,
    int? startPoints,
    int? endPoints,
    int? medalUsable,
    int? recommendUsable,
    int? recommendRate,
    int? giftUsable,
    int? avatarUsable,
    int? avatarConfigId,
    int? animationUsable,
    int? animationConfigId,
    int? nickColorUsable,
    int? nickColorConfigId,
    int? textColorUsable,
    int? textColorConfigId,
    int? birthdayUsable,
    int? birthdayRightsPackageId,
    int? invisibleRankUsable,
    String? invisibleRankNick,
    int? invisibleRoomUsable,
    int? supportUsable,
    int? productCreateUsable,
  }) {
    return UserGiftWallResponseDataRecordsGiveUserRoomLevelConfigDto()
      ..id = id ?? this.id
      ..levelName = levelName ?? this.levelName
      ..icon = icon ?? this.icon
      ..backdrop = backdrop ?? this.backdrop
      ..medal = medal ?? this.medal
      ..homeBackdrop = homeBackdrop ?? this.homeBackdrop
      ..pcMedal = pcMedal ?? this.pcMedal
      ..pcIcon = pcIcon ?? this.pcIcon
      ..level = level ?? this.level
      ..startPoints = startPoints ?? this.startPoints
      ..endPoints = endPoints ?? this.endPoints
      ..medalUsable = medalUsable ?? this.medalUsable
      ..recommendUsable = recommendUsable ?? this.recommendUsable
      ..recommendRate = recommendRate ?? this.recommendRate
      ..giftUsable = giftUsable ?? this.giftUsable
      ..avatarUsable = avatarUsable ?? this.avatarUsable
      ..avatarConfigId = avatarConfigId ?? this.avatarConfigId
      ..animationUsable = animationUsable ?? this.animationUsable
      ..animationConfigId = animationConfigId ?? this.animationConfigId
      ..nickColorUsable = nickColorUsable ?? this.nickColorUsable
      ..nickColorConfigId = nickColorConfigId ?? this.nickColorConfigId
      ..textColorUsable = textColorUsable ?? this.textColorUsable
      ..textColorConfigId = textColorConfigId ?? this.textColorConfigId
      ..birthdayUsable = birthdayUsable ?? this.birthdayUsable
      ..birthdayRightsPackageId = birthdayRightsPackageId ??
          this.birthdayRightsPackageId
      ..invisibleRankUsable = invisibleRankUsable ?? this.invisibleRankUsable
      ..invisibleRankNick = invisibleRankNick ?? this.invisibleRankNick
      ..invisibleRoomUsable = invisibleRoomUsable ?? this.invisibleRoomUsable
      ..supportUsable = supportUsable ?? this.supportUsable
      ..productCreateUsable = productCreateUsable ?? this.productCreateUsable;
  }
}

UserGiftWallResponseDataRecordsGiveUserNobleLevelDto $UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoFromJson(
    Map<String, dynamic> json) {
  final UserGiftWallResponseDataRecordsGiveUserNobleLevelDto userGiftWallResponseDataRecordsGiveUserNobleLevelDto = UserGiftWallResponseDataRecordsGiveUserNobleLevelDto();
  final UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoUserCurrent? userCurrent = jsonConvert
      .convert<UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoUserCurrent>(
      json['userCurrent']);
  if (userCurrent != null) {
    userGiftWallResponseDataRecordsGiveUserNobleLevelDto.userCurrent =
        userCurrent;
  }
  final UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoLevelBase? levelBase = jsonConvert
      .convert<UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoLevelBase>(
      json['levelBase']);
  if (levelBase != null) {
    userGiftWallResponseDataRecordsGiveUserNobleLevelDto.levelBase = levelBase;
  }
  final UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoPurchaseRecord? purchaseRecord = jsonConvert
      .convert<
      UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoPurchaseRecord>(
      json['purchaseRecord']);
  if (purchaseRecord != null) {
    userGiftWallResponseDataRecordsGiveUserNobleLevelDto.purchaseRecord =
        purchaseRecord;
  }
  final List<
      UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoPrivileges>? privileges = (json['privileges'] as List<
      dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<
          UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoPrivileges>(
          e) as UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoPrivileges)
      .toList();
  if (privileges != null) {
    userGiftWallResponseDataRecordsGiveUserNobleLevelDto.privileges =
        privileges;
  }
  return userGiftWallResponseDataRecordsGiveUserNobleLevelDto;
}

Map<String,
    dynamic> $UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoToJson(
    UserGiftWallResponseDataRecordsGiveUserNobleLevelDto entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['userCurrent'] = entity.userCurrent.toJson();
  data['levelBase'] = entity.levelBase.toJson();
  data['purchaseRecord'] = entity.purchaseRecord.toJson();
  data['privileges'] = entity.privileges.map((v) => v.toJson()).toList();
  return data;
}

extension UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoExtension on UserGiftWallResponseDataRecordsGiveUserNobleLevelDto {
  UserGiftWallResponseDataRecordsGiveUserNobleLevelDto copyWith({
    UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoUserCurrent? userCurrent,
    UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoLevelBase? levelBase,
    UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoPurchaseRecord? purchaseRecord,
    List<
        UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoPrivileges>? privileges,
  }) {
    return UserGiftWallResponseDataRecordsGiveUserNobleLevelDto()
      ..userCurrent = userCurrent ?? this.userCurrent
      ..levelBase = levelBase ?? this.levelBase
      ..purchaseRecord = purchaseRecord ?? this.purchaseRecord
      ..privileges = privileges ?? this.privileges;
  }
}

UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoUserCurrent $UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoUserCurrentFromJson(
    Map<String, dynamic> json) {
  final UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoUserCurrent userGiftWallResponseDataRecordsGiveUserNobleLevelDtoUserCurrent = UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoUserCurrent();
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    userGiftWallResponseDataRecordsGiveUserNobleLevelDtoUserCurrent.userId =
        userId;
  }
  final int? nobleLevelId = jsonConvert.convert<int>(json['nobleLevelId']);
  if (nobleLevelId != null) {
    userGiftWallResponseDataRecordsGiveUserNobleLevelDtoUserCurrent
        .nobleLevelId = nobleLevelId;
  }
  final String? nobleName = jsonConvert.convert<String>(json['nobleName']);
  if (nobleName != null) {
    userGiftWallResponseDataRecordsGiveUserNobleLevelDtoUserCurrent.nobleName =
        nobleName;
  }
  final int? levelFlag = jsonConvert.convert<int>(json['levelFlag']);
  if (levelFlag != null) {
    userGiftWallResponseDataRecordsGiveUserNobleLevelDtoUserCurrent.levelFlag =
        levelFlag;
  }
  final String? startTime = jsonConvert.convert<String>(json['startTime']);
  if (startTime != null) {
    userGiftWallResponseDataRecordsGiveUserNobleLevelDtoUserCurrent.startTime =
        startTime;
  }
  final String? endTime = jsonConvert.convert<String>(json['endTime']);
  if (endTime != null) {
    userGiftWallResponseDataRecordsGiveUserNobleLevelDtoUserCurrent.endTime =
        endTime;
  }
  final int? remainingDays = jsonConvert.convert<int>(json['remainingDays']);
  if (remainingDays != null) {
    userGiftWallResponseDataRecordsGiveUserNobleLevelDtoUserCurrent
        .remainingDays = remainingDays;
  }
  return userGiftWallResponseDataRecordsGiveUserNobleLevelDtoUserCurrent;
}

Map<String,
    dynamic> $UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoUserCurrentToJson(
    UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoUserCurrent entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['userId'] = entity.userId;
  data['nobleLevelId'] = entity.nobleLevelId;
  data['nobleName'] = entity.nobleName;
  data['levelFlag'] = entity.levelFlag;
  data['startTime'] = entity.startTime;
  data['endTime'] = entity.endTime;
  data['remainingDays'] = entity.remainingDays;
  return data;
}

extension UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoUserCurrentExtension on UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoUserCurrent {
  UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoUserCurrent copyWith({
    int? userId,
    int? nobleLevelId,
    String? nobleName,
    int? levelFlag,
    String? startTime,
    String? endTime,
    int? remainingDays,
  }) {
    return UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoUserCurrent()
      ..userId = userId ?? this.userId
      ..nobleLevelId = nobleLevelId ?? this.nobleLevelId
      ..nobleName = nobleName ?? this.nobleName
      ..levelFlag = levelFlag ?? this.levelFlag
      ..startTime = startTime ?? this.startTime
      ..endTime = endTime ?? this.endTime
      ..remainingDays = remainingDays ?? this.remainingDays;
  }
}

UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoLevelBase $UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoLevelBaseFromJson(
    Map<String, dynamic> json) {
  final UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoLevelBase userGiftWallResponseDataRecordsGiveUserNobleLevelDtoLevelBase = UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoLevelBase();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    userGiftWallResponseDataRecordsGiveUserNobleLevelDtoLevelBase.id = id;
  }
  final int? goodsId = jsonConvert.convert<int>(json['goodsId']);
  if (goodsId != null) {
    userGiftWallResponseDataRecordsGiveUserNobleLevelDtoLevelBase.goodsId =
        goodsId;
  }
  final int? propId = jsonConvert.convert<int>(json['propId']);
  if (propId != null) {
    userGiftWallResponseDataRecordsGiveUserNobleLevelDtoLevelBase.propId =
        propId;
  }
  final String? levelName = jsonConvert.convert<String>(json['levelName']);
  if (levelName != null) {
    userGiftWallResponseDataRecordsGiveUserNobleLevelDtoLevelBase.levelName =
        levelName;
  }
  final int? levelFlag = jsonConvert.convert<int>(json['levelFlag']);
  if (levelFlag != null) {
    userGiftWallResponseDataRecordsGiveUserNobleLevelDtoLevelBase.levelFlag =
        levelFlag;
  }
  final String? mainImageUrl = jsonConvert.convert<String>(
      json['mainImageUrl']);
  if (mainImageUrl != null) {
    userGiftWallResponseDataRecordsGiveUserNobleLevelDtoLevelBase.mainImageUrl =
        mainImageUrl;
  }
  final String? badgeImageUrl = jsonConvert.convert<String>(
      json['badgeImageUrl']);
  if (badgeImageUrl != null) {
    userGiftWallResponseDataRecordsGiveUserNobleLevelDtoLevelBase
        .badgeImageUrl = badgeImageUrl;
  }
  final String? middleImageUrl = jsonConvert.convert<String>(
      json['middleImageUrl']);
  if (middleImageUrl != null) {
    userGiftWallResponseDataRecordsGiveUserNobleLevelDtoLevelBase
        .middleImageUrl = middleImageUrl;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    userGiftWallResponseDataRecordsGiveUserNobleLevelDtoLevelBase.description =
        description;
  }
  final int? purchaseType = jsonConvert.convert<int>(json['purchaseType']);
  if (purchaseType != null) {
    userGiftWallResponseDataRecordsGiveUserNobleLevelDtoLevelBase.purchaseType =
        purchaseType;
  }
  final int? firstPrice = jsonConvert.convert<int>(json['firstPrice']);
  if (firstPrice != null) {
    userGiftWallResponseDataRecordsGiveUserNobleLevelDtoLevelBase.firstPrice =
        firstPrice;
  }
  final int? renewPrice = jsonConvert.convert<int>(json['renewPrice']);
  if (renewPrice != null) {
    userGiftWallResponseDataRecordsGiveUserNobleLevelDtoLevelBase.renewPrice =
        renewPrice;
  }
  final int? firstSkuId = jsonConvert.convert<int>(json['firstSkuId']);
  if (firstSkuId != null) {
    userGiftWallResponseDataRecordsGiveUserNobleLevelDtoLevelBase.firstSkuId =
        firstSkuId;
  }
  final int? renewSkuId = jsonConvert.convert<int>(json['renewSkuId']);
  if (renewSkuId != null) {
    userGiftWallResponseDataRecordsGiveUserNobleLevelDtoLevelBase.renewSkuId =
        renewSkuId;
  }
  final int? firstGiftType = jsonConvert.convert<int>(json['firstGiftType']);
  if (firstGiftType != null) {
    userGiftWallResponseDataRecordsGiveUserNobleLevelDtoLevelBase
        .firstGiftType = firstGiftType;
  }
  final int? firstGiftId = jsonConvert.convert<int>(json['firstGiftId']);
  if (firstGiftId != null) {
    userGiftWallResponseDataRecordsGiveUserNobleLevelDtoLevelBase.firstGiftId =
        firstGiftId;
  }
  final String? firstGiftName = jsonConvert.convert<String>(
      json['firstGiftName']);
  if (firstGiftName != null) {
    userGiftWallResponseDataRecordsGiveUserNobleLevelDtoLevelBase
        .firstGiftName = firstGiftName;
  }
  final String? firstGiftUrl = jsonConvert.convert<String>(
      json['firstGiftUrl']);
  if (firstGiftUrl != null) {
    userGiftWallResponseDataRecordsGiveUserNobleLevelDtoLevelBase.firstGiftUrl =
        firstGiftUrl;
  }
  final int? firstGiftAmount = jsonConvert.convert<int>(
      json['firstGiftAmount']);
  if (firstGiftAmount != null) {
    userGiftWallResponseDataRecordsGiveUserNobleLevelDtoLevelBase
        .firstGiftAmount = firstGiftAmount;
  }
  final int? firstGiftPurchaseType = jsonConvert.convert<int>(
      json['firstGiftPurchaseType']);
  if (firstGiftPurchaseType != null) {
    userGiftWallResponseDataRecordsGiveUserNobleLevelDtoLevelBase
        .firstGiftPurchaseType = firstGiftPurchaseType;
  }
  final int? firstGiftPrice = jsonConvert.convert<int>(json['firstGiftPrice']);
  if (firstGiftPrice != null) {
    userGiftWallResponseDataRecordsGiveUserNobleLevelDtoLevelBase
        .firstGiftPrice = firstGiftPrice;
  }
  final bool? directPurchase = jsonConvert.convert<bool>(
      json['directPurchase']);
  if (directPurchase != null) {
    userGiftWallResponseDataRecordsGiveUserNobleLevelDtoLevelBase
        .directPurchase = directPurchase;
  }
  final int? purchaseDuration = jsonConvert.convert<int>(
      json['purchaseDuration']);
  if (purchaseDuration != null) {
    userGiftWallResponseDataRecordsGiveUserNobleLevelDtoLevelBase
        .purchaseDuration = purchaseDuration;
  }
  return userGiftWallResponseDataRecordsGiveUserNobleLevelDtoLevelBase;
}

Map<String,
    dynamic> $UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoLevelBaseToJson(
    UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoLevelBase entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['goodsId'] = entity.goodsId;
  data['propId'] = entity.propId;
  data['levelName'] = entity.levelName;
  data['levelFlag'] = entity.levelFlag;
  data['mainImageUrl'] = entity.mainImageUrl;
  data['badgeImageUrl'] = entity.badgeImageUrl;
  data['middleImageUrl'] = entity.middleImageUrl;
  data['description'] = entity.description;
  data['purchaseType'] = entity.purchaseType;
  data['firstPrice'] = entity.firstPrice;
  data['renewPrice'] = entity.renewPrice;
  data['firstSkuId'] = entity.firstSkuId;
  data['renewSkuId'] = entity.renewSkuId;
  data['firstGiftType'] = entity.firstGiftType;
  data['firstGiftId'] = entity.firstGiftId;
  data['firstGiftName'] = entity.firstGiftName;
  data['firstGiftUrl'] = entity.firstGiftUrl;
  data['firstGiftAmount'] = entity.firstGiftAmount;
  data['firstGiftPurchaseType'] = entity.firstGiftPurchaseType;
  data['firstGiftPrice'] = entity.firstGiftPrice;
  data['directPurchase'] = entity.directPurchase;
  data['purchaseDuration'] = entity.purchaseDuration;
  return data;
}

extension UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoLevelBaseExtension on UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoLevelBase {
  UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoLevelBase copyWith({
    int? id,
    int? goodsId,
    int? propId,
    String? levelName,
    int? levelFlag,
    String? mainImageUrl,
    String? badgeImageUrl,
    String? middleImageUrl,
    String? description,
    int? purchaseType,
    int? firstPrice,
    int? renewPrice,
    int? firstSkuId,
    int? renewSkuId,
    int? firstGiftType,
    int? firstGiftId,
    String? firstGiftName,
    String? firstGiftUrl,
    int? firstGiftAmount,
    int? firstGiftPurchaseType,
    int? firstGiftPrice,
    bool? directPurchase,
    int? purchaseDuration,
  }) {
    return UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoLevelBase()
      ..id = id ?? this.id
      ..goodsId = goodsId ?? this.goodsId
      ..propId = propId ?? this.propId
      ..levelName = levelName ?? this.levelName
      ..levelFlag = levelFlag ?? this.levelFlag
      ..mainImageUrl = mainImageUrl ?? this.mainImageUrl
      ..badgeImageUrl = badgeImageUrl ?? this.badgeImageUrl
      ..middleImageUrl = middleImageUrl ?? this.middleImageUrl
      ..description = description ?? this.description
      ..purchaseType = purchaseType ?? this.purchaseType
      ..firstPrice = firstPrice ?? this.firstPrice
      ..renewPrice = renewPrice ?? this.renewPrice
      ..firstSkuId = firstSkuId ?? this.firstSkuId
      ..renewSkuId = renewSkuId ?? this.renewSkuId
      ..firstGiftType = firstGiftType ?? this.firstGiftType
      ..firstGiftId = firstGiftId ?? this.firstGiftId
      ..firstGiftName = firstGiftName ?? this.firstGiftName
      ..firstGiftUrl = firstGiftUrl ?? this.firstGiftUrl
      ..firstGiftAmount = firstGiftAmount ?? this.firstGiftAmount
      ..firstGiftPurchaseType = firstGiftPurchaseType ??
          this.firstGiftPurchaseType
      ..firstGiftPrice = firstGiftPrice ?? this.firstGiftPrice
      ..directPurchase = directPurchase ?? this.directPurchase
      ..purchaseDuration = purchaseDuration ?? this.purchaseDuration;
  }
}

UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoPurchaseRecord $UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoPurchaseRecordFromJson(
    Map<String, dynamic> json) {
  final UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoPurchaseRecord userGiftWallResponseDataRecordsGiveUserNobleLevelDtoPurchaseRecord = UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoPurchaseRecord();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    userGiftWallResponseDataRecordsGiveUserNobleLevelDtoPurchaseRecord.id = id;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    userGiftWallResponseDataRecordsGiveUserNobleLevelDtoPurchaseRecord.userId =
        userId;
  }
  final int? nobleLevelId = jsonConvert.convert<int>(json['nobleLevelId']);
  if (nobleLevelId != null) {
    userGiftWallResponseDataRecordsGiveUserNobleLevelDtoPurchaseRecord
        .nobleLevelId = nobleLevelId;
  }
  final String? nobleLevelName = jsonConvert.convert<String>(
      json['nobleLevelName']);
  if (nobleLevelName != null) {
    userGiftWallResponseDataRecordsGiveUserNobleLevelDtoPurchaseRecord
        .nobleLevelName = nobleLevelName;
  }
  final int? purchaseType = jsonConvert.convert<int>(json['purchaseType']);
  if (purchaseType != null) {
    userGiftWallResponseDataRecordsGiveUserNobleLevelDtoPurchaseRecord
        .purchaseType = purchaseType;
  }
  final int? price = jsonConvert.convert<int>(json['price']);
  if (price != null) {
    userGiftWallResponseDataRecordsGiveUserNobleLevelDtoPurchaseRecord.price =
        price;
  }
  final int? purchaseFlag = jsonConvert.convert<int>(json['purchaseFlag']);
  if (purchaseFlag != null) {
    userGiftWallResponseDataRecordsGiveUserNobleLevelDtoPurchaseRecord
        .purchaseFlag = purchaseFlag;
  }
  final int? durationDays = jsonConvert.convert<int>(json['durationDays']);
  if (durationDays != null) {
    userGiftWallResponseDataRecordsGiveUserNobleLevelDtoPurchaseRecord
        .durationDays = durationDays;
  }
  final String? purchaseTime = jsonConvert.convert<String>(
      json['purchaseTime']);
  if (purchaseTime != null) {
    userGiftWallResponseDataRecordsGiveUserNobleLevelDtoPurchaseRecord
        .purchaseTime = purchaseTime;
  }
  final int? roomId = jsonConvert.convert<int>(json['roomId']);
  if (roomId != null) {
    userGiftWallResponseDataRecordsGiveUserNobleLevelDtoPurchaseRecord.roomId =
        roomId;
  }
  final int? orderId = jsonConvert.convert<int>(json['orderId']);
  if (orderId != null) {
    userGiftWallResponseDataRecordsGiveUserNobleLevelDtoPurchaseRecord.orderId =
        orderId;
  }
  final String? orderNo = jsonConvert.convert<String>(json['orderNo']);
  if (orderNo != null) {
    userGiftWallResponseDataRecordsGiveUserNobleLevelDtoPurchaseRecord.orderNo =
        orderNo;
  }
  return userGiftWallResponseDataRecordsGiveUserNobleLevelDtoPurchaseRecord;
}

Map<String,
    dynamic> $UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoPurchaseRecordToJson(
    UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoPurchaseRecord entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['userId'] = entity.userId;
  data['nobleLevelId'] = entity.nobleLevelId;
  data['nobleLevelName'] = entity.nobleLevelName;
  data['purchaseType'] = entity.purchaseType;
  data['price'] = entity.price;
  data['purchaseFlag'] = entity.purchaseFlag;
  data['durationDays'] = entity.durationDays;
  data['purchaseTime'] = entity.purchaseTime;
  data['roomId'] = entity.roomId;
  data['orderId'] = entity.orderId;
  data['orderNo'] = entity.orderNo;
  return data;
}

extension UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoPurchaseRecordExtension on UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoPurchaseRecord {
  UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoPurchaseRecord copyWith({
    int? id,
    int? userId,
    int? nobleLevelId,
    String? nobleLevelName,
    int? purchaseType,
    int? price,
    int? purchaseFlag,
    int? durationDays,
    String? purchaseTime,
    int? roomId,
    int? orderId,
    String? orderNo,
  }) {
    return UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoPurchaseRecord()
      ..id = id ?? this.id
      ..userId = userId ?? this.userId
      ..nobleLevelId = nobleLevelId ?? this.nobleLevelId
      ..nobleLevelName = nobleLevelName ?? this.nobleLevelName
      ..purchaseType = purchaseType ?? this.purchaseType
      ..price = price ?? this.price
      ..purchaseFlag = purchaseFlag ?? this.purchaseFlag
      ..durationDays = durationDays ?? this.durationDays
      ..purchaseTime = purchaseTime ?? this.purchaseTime
      ..roomId = roomId ?? this.roomId
      ..orderId = orderId ?? this.orderId
      ..orderNo = orderNo ?? this.orderNo;
  }
}

UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoPrivileges $UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoPrivilegesFromJson(
    Map<String, dynamic> json) {
  final UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoPrivileges userGiftWallResponseDataRecordsGiveUserNobleLevelDtoPrivileges = UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoPrivileges();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    userGiftWallResponseDataRecordsGiveUserNobleLevelDtoPrivileges.id = id;
  }
  final String? privilegeName = jsonConvert.convert<String>(
      json['privilegeName']);
  if (privilegeName != null) {
    userGiftWallResponseDataRecordsGiveUserNobleLevelDtoPrivileges
        .privilegeName = privilegeName;
  }
  final int? privilegeType = jsonConvert.convert<int>(json['privilegeType']);
  if (privilegeType != null) {
    userGiftWallResponseDataRecordsGiveUserNobleLevelDtoPrivileges
        .privilegeType = privilegeType;
  }
  final String? privilegeFunction = jsonConvert.convert<String>(
      json['privilegeFunction']);
  if (privilegeFunction != null) {
    userGiftWallResponseDataRecordsGiveUserNobleLevelDtoPrivileges
        .privilegeFunction = privilegeFunction;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    userGiftWallResponseDataRecordsGiveUserNobleLevelDtoPrivileges.description =
        description;
  }
  final String? imageUrl = jsonConvert.convert<String>(json['imageUrl']);
  if (imageUrl != null) {
    userGiftWallResponseDataRecordsGiveUserNobleLevelDtoPrivileges.imageUrl =
        imageUrl;
  }
  final bool? enabled = jsonConvert.convert<bool>(json['enabled']);
  if (enabled != null) {
    userGiftWallResponseDataRecordsGiveUserNobleLevelDtoPrivileges.enabled =
        enabled;
  }
  return userGiftWallResponseDataRecordsGiveUserNobleLevelDtoPrivileges;
}

Map<String,
    dynamic> $UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoPrivilegesToJson(
    UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoPrivileges entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['privilegeName'] = entity.privilegeName;
  data['privilegeType'] = entity.privilegeType;
  data['privilegeFunction'] = entity.privilegeFunction;
  data['description'] = entity.description;
  data['imageUrl'] = entity.imageUrl;
  data['enabled'] = entity.enabled;
  return data;
}

extension UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoPrivilegesExtension on UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoPrivileges {
  UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoPrivileges copyWith({
    int? id,
    String? privilegeName,
    int? privilegeType,
    String? privilegeFunction,
    String? description,
    String? imageUrl,
    bool? enabled,
  }) {
    return UserGiftWallResponseDataRecordsGiveUserNobleLevelDtoPrivileges()
      ..id = id ?? this.id
      ..privilegeName = privilegeName ?? this.privilegeName
      ..privilegeType = privilegeType ?? this.privilegeType
      ..privilegeFunction = privilegeFunction ?? this.privilegeFunction
      ..description = description ?? this.description
      ..imageUrl = imageUrl ?? this.imageUrl
      ..enabled = enabled ?? this.enabled;
  }
}