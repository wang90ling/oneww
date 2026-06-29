import 'package:oneww/generated/json/base/json_convert_content.dart';
import 'package:oneww/models/user_detail_response_entity.dart';

UserDetailResponseEntity $UserDetailResponseEntityFromJson(
    Map<String, dynamic> json) {
  final UserDetailResponseEntity userDetailResponseEntity = UserDetailResponseEntity();
  final String? requestId = jsonConvert.convert<String>(json['request_id']);
  if (requestId != null) {
    userDetailResponseEntity.requestId = requestId;
  }
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    userDetailResponseEntity.code = code;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    userDetailResponseEntity.message = message;
  }
  final UserDetailResponseData? data = jsonConvert.convert<
      UserDetailResponseData>(json['data']);
  if (data != null) {
    userDetailResponseEntity.data = data;
  }
  return userDetailResponseEntity;
}

Map<String, dynamic> $UserDetailResponseEntityToJson(
    UserDetailResponseEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['request_id'] = entity.requestId;
  data['code'] = entity.code;
  data['message'] = entity.message;
  data['data'] = entity.data.toJson();
  return data;
}

extension UserDetailResponseEntityExtension on UserDetailResponseEntity {
  UserDetailResponseEntity copyWith({
    String? requestId,
    int? code,
    String? message,
    UserDetailResponseData? data,
  }) {
    return UserDetailResponseEntity()
      ..requestId = requestId ?? this.requestId
      ..code = code ?? this.code
      ..message = message ?? this.message
      ..data = data ?? this.data;
  }
}

UserDetailResponseData $UserDetailResponseDataFromJson(
    Map<String, dynamic> json) {
  final UserDetailResponseData userDetailResponseData = UserDetailResponseData();
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    userDetailResponseData.userId = userId;
  }
  final String? userNo = jsonConvert.convert<String>(json['userNo']);
  if (userNo != null) {
    userDetailResponseData.userNo = userNo;
  }
  final String? luckyNo = jsonConvert.convert<String>(json['luckyNo']);
  if (luckyNo != null) {
    userDetailResponseData.luckyNo = luckyNo;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    userDetailResponseData.name = name;
  }
  final String? avatar = jsonConvert.convert<String>(json['avatar']);
  if (avatar != null) {
    userDetailResponseData.avatar = avatar;
  }
  final String? nickName = jsonConvert.convert<String>(json['nickName']);
  if (nickName != null) {
    userDetailResponseData.nickName = nickName;
  }
  final String? sex = jsonConvert.convert<String>(json['sex']);
  if (sex != null) {
    userDetailResponseData.sex = sex;
  }
  final String? phoneCountryCode = jsonConvert.convert<String>(
      json['phoneCountryCode']);
  if (phoneCountryCode != null) {
    userDetailResponseData.phoneCountryCode = phoneCountryCode;
  }
  final String? telephone = jsonConvert.convert<String>(json['telephone']);
  if (telephone != null) {
    userDetailResponseData.telephone = telephone;
  }
  final String? birthday = jsonConvert.convert<String>(json['birthday']);
  if (birthday != null) {
    userDetailResponseData.birthday = birthday;
  }
  final String? constellation = jsonConvert.convert<String>(
      json['constellation']);
  if (constellation != null) {
    userDetailResponseData.constellation = constellation;
  }
  final String? introduced = jsonConvert.convert<String>(json['introduced']);
  if (introduced != null) {
    userDetailResponseData.introduced = introduced;
  }
  final String? hometown = jsonConvert.convert<String>(json['hometown']);
  if (hometown != null) {
    userDetailResponseData.hometown = hometown;
  }
  final String? coverImage = jsonConvert.convert<String>(json['coverImage']);
  if (coverImage != null) {
    userDetailResponseData.coverImage = coverImage;
  }
  final int? childMode = jsonConvert.convert<int>(json['childMode']);
  if (childMode != null) {
    userDetailResponseData.childMode = childMode;
  }
  final String? childPassword = jsonConvert.convert<String>(
      json['childPassword']);
  if (childPassword != null) {
    userDetailResponseData.childPassword = childPassword;
  }
  final int? authFlag = jsonConvert.convert<int>(json['authFlag']);
  if (authFlag != null) {
    userDetailResponseData.authFlag = authFlag;
  }
  final int? certFlag = jsonConvert.convert<int>(json['certFlag']);
  if (certFlag != null) {
    userDetailResponseData.certFlag = certFlag;
  }
  final int? level = jsonConvert.convert<int>(json['level']);
  if (level != null) {
    userDetailResponseData.level = level;
  }
  final int? roomLevel = jsonConvert.convert<int>(json['roomLevel']);
  if (roomLevel != null) {
    userDetailResponseData.roomLevel = roomLevel;
  }
  final UserDetailResponseDataRoomLevelConfigDto? roomLevelConfigDto = jsonConvert
      .convert<UserDetailResponseDataRoomLevelConfigDto>(
      json['roomLevelConfigDto']);
  if (roomLevelConfigDto != null) {
    userDetailResponseData.roomLevelConfigDto = roomLevelConfigDto;
  }
  final UserDetailResponseDataNobleLevelDto? nobleLevelDto = jsonConvert
      .convert<UserDetailResponseDataNobleLevelDto>(json['nobleLevelDto']);
  if (nobleLevelDto != null) {
    userDetailResponseData.nobleLevelDto = nobleLevelDto;
  }
  final String? accompanyLevel = jsonConvert.convert<String>(
      json['accompanyLevel']);
  if (accompanyLevel != null) {
    userDetailResponseData.accompanyLevel = accompanyLevel;
  }
  final int? accompanyId = jsonConvert.convert<int>(json['accompanyId']);
  if (accompanyId != null) {
    userDetailResponseData.accompanyId = accompanyId;
  }
  final int? userType = jsonConvert.convert<int>(json['userType']);
  if (userType != null) {
    userDetailResponseData.userType = userType;
  }
  final int? currentTime = jsonConvert.convert<int>(json['currentTime']);
  if (currentTime != null) {
    userDetailResponseData.currentTime = currentTime;
  }
  final List<
      UserDetailResponseDataInterestLabel>? interestLabel = (json['interestLabel'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<UserDetailResponseDataInterestLabel>(
          e) as UserDetailResponseDataInterestLabel).toList();
  if (interestLabel != null) {
    userDetailResponseData.interestLabel = interestLabel;
  }
  final UserDetailResponseDataUserPropDetailDto? userPropDetailDto = jsonConvert
      .convert<UserDetailResponseDataUserPropDetailDto>(
      json['userPropDetailDto']);
  if (userPropDetailDto != null) {
    userDetailResponseData.userPropDetailDto = userPropDetailDto;
  }
  final UserDetailResponseDataGuardianMedal? guardianMedal = jsonConvert
      .convert<UserDetailResponseDataGuardianMedal>(json['guardianMedal']);
  if (guardianMedal != null) {
    userDetailResponseData.guardianMedal = guardianMedal;
  }
  final String? mainLabelId = jsonConvert.convert<String>(json['mainLabelId']);
  if (mainLabelId != null) {
    userDetailResponseData.mainLabelId = mainLabelId;
  }
  final bool? lastLoginFlag = jsonConvert.convert<bool>(json['lastLoginFlag']);
  if (lastLoginFlag != null) {
    userDetailResponseData.lastLoginFlag = lastLoginFlag;
  }
  final String? avatarExpireTime = jsonConvert.convert<String>(
      json['avatarExpireTime']);
  if (avatarExpireTime != null) {
    userDetailResponseData.avatarExpireTime = avatarExpireTime;
  }
  final String? personality = jsonConvert.convert<String>(json['personality']);
  if (personality != null) {
    userDetailResponseData.personality = personality;
  }
  final String? charmIcon = jsonConvert.convert<String>(json['charmIcon']);
  if (charmIcon != null) {
    userDetailResponseData.charmIcon = charmIcon;
  }
  return userDetailResponseData;
}

Map<String, dynamic> $UserDetailResponseDataToJson(
    UserDetailResponseData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['userId'] = entity.userId;
  data['userNo'] = entity.userNo;
  data['luckyNo'] = entity.luckyNo;
  data['name'] = entity.name;
  data['avatar'] = entity.avatar;
  data['nickName'] = entity.nickName;
  data['sex'] = entity.sex;
  data['phoneCountryCode'] = entity.phoneCountryCode;
  data['telephone'] = entity.telephone;
  data['birthday'] = entity.birthday;
  data['constellation'] = entity.constellation;
  data['introduced'] = entity.introduced;
  data['hometown'] = entity.hometown;
  data['coverImage'] = entity.coverImage;
  data['childMode'] = entity.childMode;
  data['childPassword'] = entity.childPassword;
  data['authFlag'] = entity.authFlag;
  data['certFlag'] = entity.certFlag;
  data['level'] = entity.level;
  data['roomLevel'] = entity.roomLevel;
  data['roomLevelConfigDto'] = entity.roomLevelConfigDto.toJson();
  data['nobleLevelDto'] = entity.nobleLevelDto.toJson();
  data['accompanyLevel'] = entity.accompanyLevel;
  data['accompanyId'] = entity.accompanyId;
  data['userType'] = entity.userType;
  data['currentTime'] = entity.currentTime;
  data['interestLabel'] = entity.interestLabel.map((v) => v.toJson()).toList();
  data['userPropDetailDto'] = entity.userPropDetailDto.toJson();
  data['guardianMedal'] = entity.guardianMedal.toJson();
  data['mainLabelId'] = entity.mainLabelId;
  data['lastLoginFlag'] = entity.lastLoginFlag;
  data['avatarExpireTime'] = entity.avatarExpireTime;
  data['personality'] = entity.personality;
  data['charmIcon'] = entity.charmIcon;
  return data;
}

extension UserDetailResponseDataExtension on UserDetailResponseData {
  UserDetailResponseData copyWith({
    int? userId,
    String? userNo,
    String? luckyNo,
    String? name,
    String? avatar,
    String? nickName,
    String? sex,
    String? phoneCountryCode,
    String? telephone,
    String? birthday,
    String? constellation,
    String? introduced,
    String? hometown,
    String? coverImage,
    int? childMode,
    String? childPassword,
    int? authFlag,
    int? certFlag,
    int? level,
    int? roomLevel,
    UserDetailResponseDataRoomLevelConfigDto? roomLevelConfigDto,
    UserDetailResponseDataNobleLevelDto? nobleLevelDto,
    String? accompanyLevel,
    int? accompanyId,
    int? userType,
    int? currentTime,
    List<UserDetailResponseDataInterestLabel>? interestLabel,
    UserDetailResponseDataUserPropDetailDto? userPropDetailDto,
    UserDetailResponseDataGuardianMedal? guardianMedal,
    String? mainLabelId,
    bool? lastLoginFlag,
    String? avatarExpireTime,
    String? personality,
    String? charmIcon,
  }) {
    return UserDetailResponseData()
      ..userId = userId ?? this.userId
      ..userNo = userNo ?? this.userNo
      ..luckyNo = luckyNo ?? this.luckyNo
      ..name = name ?? this.name
      ..avatar = avatar ?? this.avatar
      ..nickName = nickName ?? this.nickName
      ..sex = sex ?? this.sex
      ..phoneCountryCode = phoneCountryCode ?? this.phoneCountryCode
      ..telephone = telephone ?? this.telephone
      ..birthday = birthday ?? this.birthday
      ..constellation = constellation ?? this.constellation
      ..introduced = introduced ?? this.introduced
      ..hometown = hometown ?? this.hometown
      ..coverImage = coverImage ?? this.coverImage
      ..childMode = childMode ?? this.childMode
      ..childPassword = childPassword ?? this.childPassword
      ..authFlag = authFlag ?? this.authFlag
      ..certFlag = certFlag ?? this.certFlag
      ..level = level ?? this.level
      ..roomLevel = roomLevel ?? this.roomLevel
      ..roomLevelConfigDto = roomLevelConfigDto ?? this.roomLevelConfigDto
      ..nobleLevelDto = nobleLevelDto ?? this.nobleLevelDto
      ..accompanyLevel = accompanyLevel ?? this.accompanyLevel
      ..accompanyId = accompanyId ?? this.accompanyId
      ..userType = userType ?? this.userType
      ..currentTime = currentTime ?? this.currentTime
      ..interestLabel = interestLabel ?? this.interestLabel
      ..userPropDetailDto = userPropDetailDto ?? this.userPropDetailDto
      ..guardianMedal = guardianMedal ?? this.guardianMedal
      ..mainLabelId = mainLabelId ?? this.mainLabelId
      ..lastLoginFlag = lastLoginFlag ?? this.lastLoginFlag
      ..avatarExpireTime = avatarExpireTime ?? this.avatarExpireTime
      ..personality = personality ?? this.personality
      ..charmIcon = charmIcon ?? this.charmIcon;
  }
}

UserDetailResponseDataRoomLevelConfigDto $UserDetailResponseDataRoomLevelConfigDtoFromJson(
    Map<String, dynamic> json) {
  final UserDetailResponseDataRoomLevelConfigDto userDetailResponseDataRoomLevelConfigDto = UserDetailResponseDataRoomLevelConfigDto();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    userDetailResponseDataRoomLevelConfigDto.id = id;
  }
  final String? levelName = jsonConvert.convert<String>(json['levelName']);
  if (levelName != null) {
    userDetailResponseDataRoomLevelConfigDto.levelName = levelName;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    userDetailResponseDataRoomLevelConfigDto.icon = icon;
  }
  final String? backdrop = jsonConvert.convert<String>(json['backdrop']);
  if (backdrop != null) {
    userDetailResponseDataRoomLevelConfigDto.backdrop = backdrop;
  }
  final String? medal = jsonConvert.convert<String>(json['medal']);
  if (medal != null) {
    userDetailResponseDataRoomLevelConfigDto.medal = medal;
  }
  final String? homeBackdrop = jsonConvert.convert<String>(
      json['homeBackdrop']);
  if (homeBackdrop != null) {
    userDetailResponseDataRoomLevelConfigDto.homeBackdrop = homeBackdrop;
  }
  final String? pcMedal = jsonConvert.convert<String>(json['pcMedal']);
  if (pcMedal != null) {
    userDetailResponseDataRoomLevelConfigDto.pcMedal = pcMedal;
  }
  final String? pcIcon = jsonConvert.convert<String>(json['pcIcon']);
  if (pcIcon != null) {
    userDetailResponseDataRoomLevelConfigDto.pcIcon = pcIcon;
  }
  final int? level = jsonConvert.convert<int>(json['level']);
  if (level != null) {
    userDetailResponseDataRoomLevelConfigDto.level = level;
  }
  final int? startPoints = jsonConvert.convert<int>(json['startPoints']);
  if (startPoints != null) {
    userDetailResponseDataRoomLevelConfigDto.startPoints = startPoints;
  }
  final int? endPoints = jsonConvert.convert<int>(json['endPoints']);
  if (endPoints != null) {
    userDetailResponseDataRoomLevelConfigDto.endPoints = endPoints;
  }
  final int? medalUsable = jsonConvert.convert<int>(json['medalUsable']);
  if (medalUsable != null) {
    userDetailResponseDataRoomLevelConfigDto.medalUsable = medalUsable;
  }
  final int? recommendUsable = jsonConvert.convert<int>(
      json['recommendUsable']);
  if (recommendUsable != null) {
    userDetailResponseDataRoomLevelConfigDto.recommendUsable = recommendUsable;
  }
  final int? recommendRate = jsonConvert.convert<int>(json['recommendRate']);
  if (recommendRate != null) {
    userDetailResponseDataRoomLevelConfigDto.recommendRate = recommendRate;
  }
  final int? giftUsable = jsonConvert.convert<int>(json['giftUsable']);
  if (giftUsable != null) {
    userDetailResponseDataRoomLevelConfigDto.giftUsable = giftUsable;
  }
  final int? avatarUsable = jsonConvert.convert<int>(json['avatarUsable']);
  if (avatarUsable != null) {
    userDetailResponseDataRoomLevelConfigDto.avatarUsable = avatarUsable;
  }
  final int? avatarConfigId = jsonConvert.convert<int>(json['avatarConfigId']);
  if (avatarConfigId != null) {
    userDetailResponseDataRoomLevelConfigDto.avatarConfigId = avatarConfigId;
  }
  final int? animationUsable = jsonConvert.convert<int>(
      json['animationUsable']);
  if (animationUsable != null) {
    userDetailResponseDataRoomLevelConfigDto.animationUsable = animationUsable;
  }
  final int? animationConfigId = jsonConvert.convert<int>(
      json['animationConfigId']);
  if (animationConfigId != null) {
    userDetailResponseDataRoomLevelConfigDto.animationConfigId =
        animationConfigId;
  }
  final int? nickColorUsable = jsonConvert.convert<int>(
      json['nickColorUsable']);
  if (nickColorUsable != null) {
    userDetailResponseDataRoomLevelConfigDto.nickColorUsable = nickColorUsable;
  }
  final int? nickColorConfigId = jsonConvert.convert<int>(
      json['nickColorConfigId']);
  if (nickColorConfigId != null) {
    userDetailResponseDataRoomLevelConfigDto.nickColorConfigId =
        nickColorConfigId;
  }
  final int? textColorUsable = jsonConvert.convert<int>(
      json['textColorUsable']);
  if (textColorUsable != null) {
    userDetailResponseDataRoomLevelConfigDto.textColorUsable = textColorUsable;
  }
  final int? textColorConfigId = jsonConvert.convert<int>(
      json['textColorConfigId']);
  if (textColorConfigId != null) {
    userDetailResponseDataRoomLevelConfigDto.textColorConfigId =
        textColorConfigId;
  }
  final int? birthdayUsable = jsonConvert.convert<int>(json['birthdayUsable']);
  if (birthdayUsable != null) {
    userDetailResponseDataRoomLevelConfigDto.birthdayUsable = birthdayUsable;
  }
  final int? birthdayRightsPackageId = jsonConvert.convert<int>(
      json['birthdayRightsPackageId']);
  if (birthdayRightsPackageId != null) {
    userDetailResponseDataRoomLevelConfigDto.birthdayRightsPackageId =
        birthdayRightsPackageId;
  }
  final int? invisibleRankUsable = jsonConvert.convert<int>(
      json['invisibleRankUsable']);
  if (invisibleRankUsable != null) {
    userDetailResponseDataRoomLevelConfigDto.invisibleRankUsable =
        invisibleRankUsable;
  }
  final String? invisibleRankNick = jsonConvert.convert<String>(
      json['invisibleRankNick']);
  if (invisibleRankNick != null) {
    userDetailResponseDataRoomLevelConfigDto.invisibleRankNick =
        invisibleRankNick;
  }
  final int? invisibleRoomUsable = jsonConvert.convert<int>(
      json['invisibleRoomUsable']);
  if (invisibleRoomUsable != null) {
    userDetailResponseDataRoomLevelConfigDto.invisibleRoomUsable =
        invisibleRoomUsable;
  }
  final int? supportUsable = jsonConvert.convert<int>(json['supportUsable']);
  if (supportUsable != null) {
    userDetailResponseDataRoomLevelConfigDto.supportUsable = supportUsable;
  }
  final int? productCreateUsable = jsonConvert.convert<int>(
      json['productCreateUsable']);
  if (productCreateUsable != null) {
    userDetailResponseDataRoomLevelConfigDto.productCreateUsable =
        productCreateUsable;
  }
  return userDetailResponseDataRoomLevelConfigDto;
}

Map<String, dynamic> $UserDetailResponseDataRoomLevelConfigDtoToJson(
    UserDetailResponseDataRoomLevelConfigDto entity) {
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

extension UserDetailResponseDataRoomLevelConfigDtoExtension on UserDetailResponseDataRoomLevelConfigDto {
  UserDetailResponseDataRoomLevelConfigDto copyWith({
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
    return UserDetailResponseDataRoomLevelConfigDto()
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

UserDetailResponseDataNobleLevelDto $UserDetailResponseDataNobleLevelDtoFromJson(
    Map<String, dynamic> json) {
  final UserDetailResponseDataNobleLevelDto userDetailResponseDataNobleLevelDto = UserDetailResponseDataNobleLevelDto();
  final UserDetailResponseDataNobleLevelDtoUserCurrent? userCurrent = jsonConvert
      .convert<UserDetailResponseDataNobleLevelDtoUserCurrent>(
      json['userCurrent']);
  if (userCurrent != null) {
    userDetailResponseDataNobleLevelDto.userCurrent = userCurrent;
  }
  final UserDetailResponseDataNobleLevelDtoLevelBase? levelBase = jsonConvert
      .convert<UserDetailResponseDataNobleLevelDtoLevelBase>(json['levelBase']);
  if (levelBase != null) {
    userDetailResponseDataNobleLevelDto.levelBase = levelBase;
  }
  final UserDetailResponseDataNobleLevelDtoPurchaseRecord? purchaseRecord = jsonConvert
      .convert<UserDetailResponseDataNobleLevelDtoPurchaseRecord>(
      json['purchaseRecord']);
  if (purchaseRecord != null) {
    userDetailResponseDataNobleLevelDto.purchaseRecord = purchaseRecord;
  }
  final List<
      UserDetailResponseDataNobleLevelDtoPrivileges>? privileges = (json['privileges'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<
          UserDetailResponseDataNobleLevelDtoPrivileges>(
          e) as UserDetailResponseDataNobleLevelDtoPrivileges).toList();
  if (privileges != null) {
    userDetailResponseDataNobleLevelDto.privileges = privileges;
  }
  return userDetailResponseDataNobleLevelDto;
}

Map<String, dynamic> $UserDetailResponseDataNobleLevelDtoToJson(
    UserDetailResponseDataNobleLevelDto entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['userCurrent'] = entity.userCurrent.toJson();
  data['levelBase'] = entity.levelBase.toJson();
  data['purchaseRecord'] = entity.purchaseRecord.toJson();
  data['privileges'] = entity.privileges.map((v) => v.toJson()).toList();
  return data;
}

extension UserDetailResponseDataNobleLevelDtoExtension on UserDetailResponseDataNobleLevelDto {
  UserDetailResponseDataNobleLevelDto copyWith({
    UserDetailResponseDataNobleLevelDtoUserCurrent? userCurrent,
    UserDetailResponseDataNobleLevelDtoLevelBase? levelBase,
    UserDetailResponseDataNobleLevelDtoPurchaseRecord? purchaseRecord,
    List<UserDetailResponseDataNobleLevelDtoPrivileges>? privileges,
  }) {
    return UserDetailResponseDataNobleLevelDto()
      ..userCurrent = userCurrent ?? this.userCurrent
      ..levelBase = levelBase ?? this.levelBase
      ..purchaseRecord = purchaseRecord ?? this.purchaseRecord
      ..privileges = privileges ?? this.privileges;
  }
}

UserDetailResponseDataNobleLevelDtoUserCurrent $UserDetailResponseDataNobleLevelDtoUserCurrentFromJson(
    Map<String, dynamic> json) {
  final UserDetailResponseDataNobleLevelDtoUserCurrent userDetailResponseDataNobleLevelDtoUserCurrent = UserDetailResponseDataNobleLevelDtoUserCurrent();
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    userDetailResponseDataNobleLevelDtoUserCurrent.userId = userId;
  }
  final int? nobleLevelId = jsonConvert.convert<int>(json['nobleLevelId']);
  if (nobleLevelId != null) {
    userDetailResponseDataNobleLevelDtoUserCurrent.nobleLevelId = nobleLevelId;
  }
  final String? nobleName = jsonConvert.convert<String>(json['nobleName']);
  if (nobleName != null) {
    userDetailResponseDataNobleLevelDtoUserCurrent.nobleName = nobleName;
  }
  final int? levelFlag = jsonConvert.convert<int>(json['levelFlag']);
  if (levelFlag != null) {
    userDetailResponseDataNobleLevelDtoUserCurrent.levelFlag = levelFlag;
  }
  final String? startTime = jsonConvert.convert<String>(json['startTime']);
  if (startTime != null) {
    userDetailResponseDataNobleLevelDtoUserCurrent.startTime = startTime;
  }
  final String? endTime = jsonConvert.convert<String>(json['endTime']);
  if (endTime != null) {
    userDetailResponseDataNobleLevelDtoUserCurrent.endTime = endTime;
  }
  final int? remainingDays = jsonConvert.convert<int>(json['remainingDays']);
  if (remainingDays != null) {
    userDetailResponseDataNobleLevelDtoUserCurrent.remainingDays =
        remainingDays;
  }
  return userDetailResponseDataNobleLevelDtoUserCurrent;
}

Map<String, dynamic> $UserDetailResponseDataNobleLevelDtoUserCurrentToJson(
    UserDetailResponseDataNobleLevelDtoUserCurrent entity) {
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

extension UserDetailResponseDataNobleLevelDtoUserCurrentExtension on UserDetailResponseDataNobleLevelDtoUserCurrent {
  UserDetailResponseDataNobleLevelDtoUserCurrent copyWith({
    int? userId,
    int? nobleLevelId,
    String? nobleName,
    int? levelFlag,
    String? startTime,
    String? endTime,
    int? remainingDays,
  }) {
    return UserDetailResponseDataNobleLevelDtoUserCurrent()
      ..userId = userId ?? this.userId
      ..nobleLevelId = nobleLevelId ?? this.nobleLevelId
      ..nobleName = nobleName ?? this.nobleName
      ..levelFlag = levelFlag ?? this.levelFlag
      ..startTime = startTime ?? this.startTime
      ..endTime = endTime ?? this.endTime
      ..remainingDays = remainingDays ?? this.remainingDays;
  }
}

UserDetailResponseDataNobleLevelDtoLevelBase $UserDetailResponseDataNobleLevelDtoLevelBaseFromJson(
    Map<String, dynamic> json) {
  final UserDetailResponseDataNobleLevelDtoLevelBase userDetailResponseDataNobleLevelDtoLevelBase = UserDetailResponseDataNobleLevelDtoLevelBase();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    userDetailResponseDataNobleLevelDtoLevelBase.id = id;
  }
  final int? goodsId = jsonConvert.convert<int>(json['goodsId']);
  if (goodsId != null) {
    userDetailResponseDataNobleLevelDtoLevelBase.goodsId = goodsId;
  }
  final int? propId = jsonConvert.convert<int>(json['propId']);
  if (propId != null) {
    userDetailResponseDataNobleLevelDtoLevelBase.propId = propId;
  }
  final String? levelName = jsonConvert.convert<String>(json['levelName']);
  if (levelName != null) {
    userDetailResponseDataNobleLevelDtoLevelBase.levelName = levelName;
  }
  final int? levelFlag = jsonConvert.convert<int>(json['levelFlag']);
  if (levelFlag != null) {
    userDetailResponseDataNobleLevelDtoLevelBase.levelFlag = levelFlag;
  }
  final String? mainImageUrl = jsonConvert.convert<String>(
      json['mainImageUrl']);
  if (mainImageUrl != null) {
    userDetailResponseDataNobleLevelDtoLevelBase.mainImageUrl = mainImageUrl;
  }
  final String? badgeImageUrl = jsonConvert.convert<String>(
      json['badgeImageUrl']);
  if (badgeImageUrl != null) {
    userDetailResponseDataNobleLevelDtoLevelBase.badgeImageUrl = badgeImageUrl;
  }
  final String? middleImageUrl = jsonConvert.convert<String>(
      json['middleImageUrl']);
  if (middleImageUrl != null) {
    userDetailResponseDataNobleLevelDtoLevelBase.middleImageUrl =
        middleImageUrl;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    userDetailResponseDataNobleLevelDtoLevelBase.description = description;
  }
  final int? purchaseType = jsonConvert.convert<int>(json['purchaseType']);
  if (purchaseType != null) {
    userDetailResponseDataNobleLevelDtoLevelBase.purchaseType = purchaseType;
  }
  final int? firstPrice = jsonConvert.convert<int>(json['firstPrice']);
  if (firstPrice != null) {
    userDetailResponseDataNobleLevelDtoLevelBase.firstPrice = firstPrice;
  }
  final int? renewPrice = jsonConvert.convert<int>(json['renewPrice']);
  if (renewPrice != null) {
    userDetailResponseDataNobleLevelDtoLevelBase.renewPrice = renewPrice;
  }
  final int? firstSkuId = jsonConvert.convert<int>(json['firstSkuId']);
  if (firstSkuId != null) {
    userDetailResponseDataNobleLevelDtoLevelBase.firstSkuId = firstSkuId;
  }
  final int? renewSkuId = jsonConvert.convert<int>(json['renewSkuId']);
  if (renewSkuId != null) {
    userDetailResponseDataNobleLevelDtoLevelBase.renewSkuId = renewSkuId;
  }
  final int? firstGiftType = jsonConvert.convert<int>(json['firstGiftType']);
  if (firstGiftType != null) {
    userDetailResponseDataNobleLevelDtoLevelBase.firstGiftType = firstGiftType;
  }
  final int? firstGiftId = jsonConvert.convert<int>(json['firstGiftId']);
  if (firstGiftId != null) {
    userDetailResponseDataNobleLevelDtoLevelBase.firstGiftId = firstGiftId;
  }
  final String? firstGiftName = jsonConvert.convert<String>(
      json['firstGiftName']);
  if (firstGiftName != null) {
    userDetailResponseDataNobleLevelDtoLevelBase.firstGiftName = firstGiftName;
  }
  final String? firstGiftUrl = jsonConvert.convert<String>(
      json['firstGiftUrl']);
  if (firstGiftUrl != null) {
    userDetailResponseDataNobleLevelDtoLevelBase.firstGiftUrl = firstGiftUrl;
  }
  final int? firstGiftAmount = jsonConvert.convert<int>(
      json['firstGiftAmount']);
  if (firstGiftAmount != null) {
    userDetailResponseDataNobleLevelDtoLevelBase.firstGiftAmount =
        firstGiftAmount;
  }
  final int? firstGiftPurchaseType = jsonConvert.convert<int>(
      json['firstGiftPurchaseType']);
  if (firstGiftPurchaseType != null) {
    userDetailResponseDataNobleLevelDtoLevelBase.firstGiftPurchaseType =
        firstGiftPurchaseType;
  }
  final int? firstGiftPrice = jsonConvert.convert<int>(json['firstGiftPrice']);
  if (firstGiftPrice != null) {
    userDetailResponseDataNobleLevelDtoLevelBase.firstGiftPrice =
        firstGiftPrice;
  }
  final bool? directPurchase = jsonConvert.convert<bool>(
      json['directPurchase']);
  if (directPurchase != null) {
    userDetailResponseDataNobleLevelDtoLevelBase.directPurchase =
        directPurchase;
  }
  final int? purchaseDuration = jsonConvert.convert<int>(
      json['purchaseDuration']);
  if (purchaseDuration != null) {
    userDetailResponseDataNobleLevelDtoLevelBase.purchaseDuration =
        purchaseDuration;
  }
  return userDetailResponseDataNobleLevelDtoLevelBase;
}

Map<String, dynamic> $UserDetailResponseDataNobleLevelDtoLevelBaseToJson(
    UserDetailResponseDataNobleLevelDtoLevelBase entity) {
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

extension UserDetailResponseDataNobleLevelDtoLevelBaseExtension on UserDetailResponseDataNobleLevelDtoLevelBase {
  UserDetailResponseDataNobleLevelDtoLevelBase copyWith({
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
    return UserDetailResponseDataNobleLevelDtoLevelBase()
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

UserDetailResponseDataNobleLevelDtoPurchaseRecord $UserDetailResponseDataNobleLevelDtoPurchaseRecordFromJson(
    Map<String, dynamic> json) {
  final UserDetailResponseDataNobleLevelDtoPurchaseRecord userDetailResponseDataNobleLevelDtoPurchaseRecord = UserDetailResponseDataNobleLevelDtoPurchaseRecord();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    userDetailResponseDataNobleLevelDtoPurchaseRecord.id = id;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    userDetailResponseDataNobleLevelDtoPurchaseRecord.userId = userId;
  }
  final int? nobleLevelId = jsonConvert.convert<int>(json['nobleLevelId']);
  if (nobleLevelId != null) {
    userDetailResponseDataNobleLevelDtoPurchaseRecord.nobleLevelId =
        nobleLevelId;
  }
  final String? nobleLevelName = jsonConvert.convert<String>(
      json['nobleLevelName']);
  if (nobleLevelName != null) {
    userDetailResponseDataNobleLevelDtoPurchaseRecord.nobleLevelName =
        nobleLevelName;
  }
  final int? purchaseType = jsonConvert.convert<int>(json['purchaseType']);
  if (purchaseType != null) {
    userDetailResponseDataNobleLevelDtoPurchaseRecord.purchaseType =
        purchaseType;
  }
  final int? price = jsonConvert.convert<int>(json['price']);
  if (price != null) {
    userDetailResponseDataNobleLevelDtoPurchaseRecord.price = price;
  }
  final int? purchaseFlag = jsonConvert.convert<int>(json['purchaseFlag']);
  if (purchaseFlag != null) {
    userDetailResponseDataNobleLevelDtoPurchaseRecord.purchaseFlag =
        purchaseFlag;
  }
  final int? durationDays = jsonConvert.convert<int>(json['durationDays']);
  if (durationDays != null) {
    userDetailResponseDataNobleLevelDtoPurchaseRecord.durationDays =
        durationDays;
  }
  final String? purchaseTime = jsonConvert.convert<String>(
      json['purchaseTime']);
  if (purchaseTime != null) {
    userDetailResponseDataNobleLevelDtoPurchaseRecord.purchaseTime =
        purchaseTime;
  }
  final int? roomId = jsonConvert.convert<int>(json['roomId']);
  if (roomId != null) {
    userDetailResponseDataNobleLevelDtoPurchaseRecord.roomId = roomId;
  }
  final int? orderId = jsonConvert.convert<int>(json['orderId']);
  if (orderId != null) {
    userDetailResponseDataNobleLevelDtoPurchaseRecord.orderId = orderId;
  }
  final String? orderNo = jsonConvert.convert<String>(json['orderNo']);
  if (orderNo != null) {
    userDetailResponseDataNobleLevelDtoPurchaseRecord.orderNo = orderNo;
  }
  return userDetailResponseDataNobleLevelDtoPurchaseRecord;
}

Map<String, dynamic> $UserDetailResponseDataNobleLevelDtoPurchaseRecordToJson(
    UserDetailResponseDataNobleLevelDtoPurchaseRecord entity) {
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

extension UserDetailResponseDataNobleLevelDtoPurchaseRecordExtension on UserDetailResponseDataNobleLevelDtoPurchaseRecord {
  UserDetailResponseDataNobleLevelDtoPurchaseRecord copyWith({
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
    return UserDetailResponseDataNobleLevelDtoPurchaseRecord()
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

UserDetailResponseDataNobleLevelDtoPrivileges $UserDetailResponseDataNobleLevelDtoPrivilegesFromJson(
    Map<String, dynamic> json) {
  final UserDetailResponseDataNobleLevelDtoPrivileges userDetailResponseDataNobleLevelDtoPrivileges = UserDetailResponseDataNobleLevelDtoPrivileges();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    userDetailResponseDataNobleLevelDtoPrivileges.id = id;
  }
  final String? privilegeName = jsonConvert.convert<String>(
      json['privilegeName']);
  if (privilegeName != null) {
    userDetailResponseDataNobleLevelDtoPrivileges.privilegeName = privilegeName;
  }
  final int? privilegeType = jsonConvert.convert<int>(json['privilegeType']);
  if (privilegeType != null) {
    userDetailResponseDataNobleLevelDtoPrivileges.privilegeType = privilegeType;
  }
  final String? privilegeFunction = jsonConvert.convert<String>(
      json['privilegeFunction']);
  if (privilegeFunction != null) {
    userDetailResponseDataNobleLevelDtoPrivileges.privilegeFunction =
        privilegeFunction;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    userDetailResponseDataNobleLevelDtoPrivileges.description = description;
  }
  final String? imageUrl = jsonConvert.convert<String>(json['imageUrl']);
  if (imageUrl != null) {
    userDetailResponseDataNobleLevelDtoPrivileges.imageUrl = imageUrl;
  }
  final bool? enabled = jsonConvert.convert<bool>(json['enabled']);
  if (enabled != null) {
    userDetailResponseDataNobleLevelDtoPrivileges.enabled = enabled;
  }
  return userDetailResponseDataNobleLevelDtoPrivileges;
}

Map<String, dynamic> $UserDetailResponseDataNobleLevelDtoPrivilegesToJson(
    UserDetailResponseDataNobleLevelDtoPrivileges entity) {
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

extension UserDetailResponseDataNobleLevelDtoPrivilegesExtension on UserDetailResponseDataNobleLevelDtoPrivileges {
  UserDetailResponseDataNobleLevelDtoPrivileges copyWith({
    int? id,
    String? privilegeName,
    int? privilegeType,
    String? privilegeFunction,
    String? description,
    String? imageUrl,
    bool? enabled,
  }) {
    return UserDetailResponseDataNobleLevelDtoPrivileges()
      ..id = id ?? this.id
      ..privilegeName = privilegeName ?? this.privilegeName
      ..privilegeType = privilegeType ?? this.privilegeType
      ..privilegeFunction = privilegeFunction ?? this.privilegeFunction
      ..description = description ?? this.description
      ..imageUrl = imageUrl ?? this.imageUrl
      ..enabled = enabled ?? this.enabled;
  }
}

UserDetailResponseDataInterestLabel $UserDetailResponseDataInterestLabelFromJson(
    Map<String, dynamic> json) {
  final UserDetailResponseDataInterestLabel userDetailResponseDataInterestLabel = UserDetailResponseDataInterestLabel();
  final int? labelId = jsonConvert.convert<int>(json['labelId']);
  if (labelId != null) {
    userDetailResponseDataInterestLabel.labelId = labelId;
  }
  final String? labelName = jsonConvert.convert<String>(json['labelName']);
  if (labelName != null) {
    userDetailResponseDataInterestLabel.labelName = labelName;
  }
  final String? labelType = jsonConvert.convert<String>(json['labelType']);
  if (labelType != null) {
    userDetailResponseDataInterestLabel.labelType = labelType;
  }
  return userDetailResponseDataInterestLabel;
}

Map<String, dynamic> $UserDetailResponseDataInterestLabelToJson(
    UserDetailResponseDataInterestLabel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['labelId'] = entity.labelId;
  data['labelName'] = entity.labelName;
  data['labelType'] = entity.labelType;
  return data;
}

extension UserDetailResponseDataInterestLabelExtension on UserDetailResponseDataInterestLabel {
  UserDetailResponseDataInterestLabel copyWith({
    int? labelId,
    String? labelName,
    String? labelType,
  }) {
    return UserDetailResponseDataInterestLabel()
      ..labelId = labelId ?? this.labelId
      ..labelName = labelName ?? this.labelName
      ..labelType = labelType ?? this.labelType;
  }
}

UserDetailResponseDataUserPropDetailDto $UserDetailResponseDataUserPropDetailDtoFromJson(
    Map<String, dynamic> json) {
  final UserDetailResponseDataUserPropDetailDto userDetailResponseDataUserPropDetailDto = UserDetailResponseDataUserPropDetailDto();
  final UserDetailResponseDataUserPropDetailDtoChatBubble? chatBubble = jsonConvert
      .convert<UserDetailResponseDataUserPropDetailDtoChatBubble>(
      json['chatBubble']);
  if (chatBubble != null) {
    userDetailResponseDataUserPropDetailDto.chatBubble = chatBubble;
  }
  final UserDetailResponseDataUserPropDetailDtoAvatarFrame? avatarFrame = jsonConvert
      .convert<UserDetailResponseDataUserPropDetailDtoAvatarFrame>(
      json['avatarFrame']);
  if (avatarFrame != null) {
    userDetailResponseDataUserPropDetailDto.avatarFrame = avatarFrame;
  }
  final UserDetailResponseDataUserPropDetailDtoLevelMedal? levelMedal = jsonConvert
      .convert<UserDetailResponseDataUserPropDetailDtoLevelMedal>(
      json['levelMedal']);
  if (levelMedal != null) {
    userDetailResponseDataUserPropDetailDto.levelMedal = levelMedal;
  }
  final UserDetailResponseDataUserPropDetailDtoEntranceEffect? entranceEffect = jsonConvert
      .convert<UserDetailResponseDataUserPropDetailDtoEntranceEffect>(
      json['entranceEffect']);
  if (entranceEffect != null) {
    userDetailResponseDataUserPropDetailDto.entranceEffect = entranceEffect;
  }
  final UserDetailResponseDataUserPropDetailDtoCustomNickname? customNickname = jsonConvert
      .convert<UserDetailResponseDataUserPropDetailDtoCustomNickname>(
      json['customNickname']);
  if (customNickname != null) {
    userDetailResponseDataUserPropDetailDto.customNickname = customNickname;
  }
  final UserDetailResponseDataUserPropDetailDtoHomepageEffect? homepageEffect = jsonConvert
      .convert<UserDetailResponseDataUserPropDetailDtoHomepageEffect>(
      json['homepageEffect']);
  if (homepageEffect != null) {
    userDetailResponseDataUserPropDetailDto.homepageEffect = homepageEffect;
  }
  final UserDetailResponseDataUserPropDetailDtoNameplate? nameplate = jsonConvert
      .convert<UserDetailResponseDataUserPropDetailDtoNameplate>(
      json['nameplate']);
  if (nameplate != null) {
    userDetailResponseDataUserPropDetailDto.nameplate = nameplate;
  }
  final UserDetailResponseDataUserPropDetailDtoMount? mount = jsonConvert
      .convert<UserDetailResponseDataUserPropDetailDtoMount>(json['mount']);
  if (mount != null) {
    userDetailResponseDataUserPropDetailDto.mount = mount;
  }
  final UserDetailResponseDataUserPropDetailDtoColorfulText? colorfulText = jsonConvert
      .convert<UserDetailResponseDataUserPropDetailDtoColorfulText>(
      json['colorfulText']);
  if (colorfulText != null) {
    userDetailResponseDataUserPropDetailDto.colorfulText = colorfulText;
  }
  final UserDetailResponseDataUserPropDetailDtoRoomWallpaper? roomWallpaper = jsonConvert
      .convert<UserDetailResponseDataUserPropDetailDtoRoomWallpaper>(
      json['roomWallpaper']);
  if (roomWallpaper != null) {
    userDetailResponseDataUserPropDetailDto.roomWallpaper = roomWallpaper;
  }
  final UserDetailResponseDataUserPropDetailDtoNobleCard? nobleCard = jsonConvert
      .convert<UserDetailResponseDataUserPropDetailDtoNobleCard>(
      json['nobleCard']);
  if (nobleCard != null) {
    userDetailResponseDataUserPropDetailDto.nobleCard = nobleCard;
  }
  return userDetailResponseDataUserPropDetailDto;
}

Map<String, dynamic> $UserDetailResponseDataUserPropDetailDtoToJson(
    UserDetailResponseDataUserPropDetailDto entity) {
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

extension UserDetailResponseDataUserPropDetailDtoExtension on UserDetailResponseDataUserPropDetailDto {
  UserDetailResponseDataUserPropDetailDto copyWith({
    UserDetailResponseDataUserPropDetailDtoChatBubble? chatBubble,
    UserDetailResponseDataUserPropDetailDtoAvatarFrame? avatarFrame,
    UserDetailResponseDataUserPropDetailDtoLevelMedal? levelMedal,
    UserDetailResponseDataUserPropDetailDtoEntranceEffect? entranceEffect,
    UserDetailResponseDataUserPropDetailDtoCustomNickname? customNickname,
    UserDetailResponseDataUserPropDetailDtoHomepageEffect? homepageEffect,
    UserDetailResponseDataUserPropDetailDtoNameplate? nameplate,
    UserDetailResponseDataUserPropDetailDtoMount? mount,
    UserDetailResponseDataUserPropDetailDtoColorfulText? colorfulText,
    UserDetailResponseDataUserPropDetailDtoRoomWallpaper? roomWallpaper,
    UserDetailResponseDataUserPropDetailDtoNobleCard? nobleCard,
  }) {
    return UserDetailResponseDataUserPropDetailDto()
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

UserDetailResponseDataUserPropDetailDtoChatBubble $UserDetailResponseDataUserPropDetailDtoChatBubbleFromJson(
    Map<String, dynamic> json) {
  final UserDetailResponseDataUserPropDetailDtoChatBubble userDetailResponseDataUserPropDetailDtoChatBubble = UserDetailResponseDataUserPropDetailDtoChatBubble();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    userDetailResponseDataUserPropDetailDtoChatBubble.id = id;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    userDetailResponseDataUserPropDetailDtoChatBubble.userId = userId;
  }
  final int? propId = jsonConvert.convert<int>(json['propId']);
  if (propId != null) {
    userDetailResponseDataUserPropDetailDtoChatBubble.propId = propId;
  }
  final String? propName = jsonConvert.convert<String>(json['propName']);
  if (propName != null) {
    userDetailResponseDataUserPropDetailDtoChatBubble.propName = propName;
  }
  final int? propType = jsonConvert.convert<int>(json['propType']);
  if (propType != null) {
    userDetailResponseDataUserPropDetailDtoChatBubble.propType = propType;
  }
  final String? propFormat = jsonConvert.convert<String>(json['propFormat']);
  if (propFormat != null) {
    userDetailResponseDataUserPropDetailDtoChatBubble.propFormat = propFormat;
  }
  final String? dynamicEffect = jsonConvert.convert<String>(
      json['dynamicEffect']);
  if (dynamicEffect != null) {
    userDetailResponseDataUserPropDetailDtoChatBubble.dynamicEffect =
        dynamicEffect;
  }
  final String? pcDynamicEffect = jsonConvert.convert<String>(
      json['pcDynamicEffect']);
  if (pcDynamicEffect != null) {
    userDetailResponseDataUserPropDetailDtoChatBubble.pcDynamicEffect =
        pcDynamicEffect;
  }
  final String? iosDynamicEffect = jsonConvert.convert<String>(
      json['iosDynamicEffect']);
  if (iosDynamicEffect != null) {
    userDetailResponseDataUserPropDetailDtoChatBubble.iosDynamicEffect =
        iosDynamicEffect;
  }
  final int? customFlag = jsonConvert.convert<int>(json['customFlag']);
  if (customFlag != null) {
    userDetailResponseDataUserPropDetailDtoChatBubble.customFlag = customFlag;
  }
  final String? customInfo = jsonConvert.convert<String>(json['customInfo']);
  if (customInfo != null) {
    userDetailResponseDataUserPropDetailDtoChatBubble.customInfo = customInfo;
  }
  final int? useFlag = jsonConvert.convert<int>(json['useFlag']);
  if (useFlag != null) {
    userDetailResponseDataUserPropDetailDtoChatBubble.useFlag = useFlag;
  }
  return userDetailResponseDataUserPropDetailDtoChatBubble;
}

Map<String, dynamic> $UserDetailResponseDataUserPropDetailDtoChatBubbleToJson(
    UserDetailResponseDataUserPropDetailDtoChatBubble entity) {
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

extension UserDetailResponseDataUserPropDetailDtoChatBubbleExtension on UserDetailResponseDataUserPropDetailDtoChatBubble {
  UserDetailResponseDataUserPropDetailDtoChatBubble copyWith({
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
    return UserDetailResponseDataUserPropDetailDtoChatBubble()
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

UserDetailResponseDataUserPropDetailDtoAvatarFrame $UserDetailResponseDataUserPropDetailDtoAvatarFrameFromJson(
    Map<String, dynamic> json) {
  final UserDetailResponseDataUserPropDetailDtoAvatarFrame userDetailResponseDataUserPropDetailDtoAvatarFrame = UserDetailResponseDataUserPropDetailDtoAvatarFrame();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    userDetailResponseDataUserPropDetailDtoAvatarFrame.id = id;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    userDetailResponseDataUserPropDetailDtoAvatarFrame.userId = userId;
  }
  final int? propId = jsonConvert.convert<int>(json['propId']);
  if (propId != null) {
    userDetailResponseDataUserPropDetailDtoAvatarFrame.propId = propId;
  }
  final String? propName = jsonConvert.convert<String>(json['propName']);
  if (propName != null) {
    userDetailResponseDataUserPropDetailDtoAvatarFrame.propName = propName;
  }
  final int? propType = jsonConvert.convert<int>(json['propType']);
  if (propType != null) {
    userDetailResponseDataUserPropDetailDtoAvatarFrame.propType = propType;
  }
  final String? propFormat = jsonConvert.convert<String>(json['propFormat']);
  if (propFormat != null) {
    userDetailResponseDataUserPropDetailDtoAvatarFrame.propFormat = propFormat;
  }
  final String? dynamicEffect = jsonConvert.convert<String>(
      json['dynamicEffect']);
  if (dynamicEffect != null) {
    userDetailResponseDataUserPropDetailDtoAvatarFrame.dynamicEffect =
        dynamicEffect;
  }
  final String? pcDynamicEffect = jsonConvert.convert<String>(
      json['pcDynamicEffect']);
  if (pcDynamicEffect != null) {
    userDetailResponseDataUserPropDetailDtoAvatarFrame.pcDynamicEffect =
        pcDynamicEffect;
  }
  final String? iosDynamicEffect = jsonConvert.convert<String>(
      json['iosDynamicEffect']);
  if (iosDynamicEffect != null) {
    userDetailResponseDataUserPropDetailDtoAvatarFrame.iosDynamicEffect =
        iosDynamicEffect;
  }
  final int? customFlag = jsonConvert.convert<int>(json['customFlag']);
  if (customFlag != null) {
    userDetailResponseDataUserPropDetailDtoAvatarFrame.customFlag = customFlag;
  }
  final String? customInfo = jsonConvert.convert<String>(json['customInfo']);
  if (customInfo != null) {
    userDetailResponseDataUserPropDetailDtoAvatarFrame.customInfo = customInfo;
  }
  final int? useFlag = jsonConvert.convert<int>(json['useFlag']);
  if (useFlag != null) {
    userDetailResponseDataUserPropDetailDtoAvatarFrame.useFlag = useFlag;
  }
  return userDetailResponseDataUserPropDetailDtoAvatarFrame;
}

Map<String, dynamic> $UserDetailResponseDataUserPropDetailDtoAvatarFrameToJson(
    UserDetailResponseDataUserPropDetailDtoAvatarFrame entity) {
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

extension UserDetailResponseDataUserPropDetailDtoAvatarFrameExtension on UserDetailResponseDataUserPropDetailDtoAvatarFrame {
  UserDetailResponseDataUserPropDetailDtoAvatarFrame copyWith({
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
    return UserDetailResponseDataUserPropDetailDtoAvatarFrame()
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

UserDetailResponseDataUserPropDetailDtoLevelMedal $UserDetailResponseDataUserPropDetailDtoLevelMedalFromJson(
    Map<String, dynamic> json) {
  final UserDetailResponseDataUserPropDetailDtoLevelMedal userDetailResponseDataUserPropDetailDtoLevelMedal = UserDetailResponseDataUserPropDetailDtoLevelMedal();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    userDetailResponseDataUserPropDetailDtoLevelMedal.id = id;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    userDetailResponseDataUserPropDetailDtoLevelMedal.userId = userId;
  }
  final int? propId = jsonConvert.convert<int>(json['propId']);
  if (propId != null) {
    userDetailResponseDataUserPropDetailDtoLevelMedal.propId = propId;
  }
  final String? propName = jsonConvert.convert<String>(json['propName']);
  if (propName != null) {
    userDetailResponseDataUserPropDetailDtoLevelMedal.propName = propName;
  }
  final int? propType = jsonConvert.convert<int>(json['propType']);
  if (propType != null) {
    userDetailResponseDataUserPropDetailDtoLevelMedal.propType = propType;
  }
  final String? propFormat = jsonConvert.convert<String>(json['propFormat']);
  if (propFormat != null) {
    userDetailResponseDataUserPropDetailDtoLevelMedal.propFormat = propFormat;
  }
  final String? dynamicEffect = jsonConvert.convert<String>(
      json['dynamicEffect']);
  if (dynamicEffect != null) {
    userDetailResponseDataUserPropDetailDtoLevelMedal.dynamicEffect =
        dynamicEffect;
  }
  final String? pcDynamicEffect = jsonConvert.convert<String>(
      json['pcDynamicEffect']);
  if (pcDynamicEffect != null) {
    userDetailResponseDataUserPropDetailDtoLevelMedal.pcDynamicEffect =
        pcDynamicEffect;
  }
  final String? iosDynamicEffect = jsonConvert.convert<String>(
      json['iosDynamicEffect']);
  if (iosDynamicEffect != null) {
    userDetailResponseDataUserPropDetailDtoLevelMedal.iosDynamicEffect =
        iosDynamicEffect;
  }
  final int? customFlag = jsonConvert.convert<int>(json['customFlag']);
  if (customFlag != null) {
    userDetailResponseDataUserPropDetailDtoLevelMedal.customFlag = customFlag;
  }
  final String? customInfo = jsonConvert.convert<String>(json['customInfo']);
  if (customInfo != null) {
    userDetailResponseDataUserPropDetailDtoLevelMedal.customInfo = customInfo;
  }
  final int? useFlag = jsonConvert.convert<int>(json['useFlag']);
  if (useFlag != null) {
    userDetailResponseDataUserPropDetailDtoLevelMedal.useFlag = useFlag;
  }
  return userDetailResponseDataUserPropDetailDtoLevelMedal;
}

Map<String, dynamic> $UserDetailResponseDataUserPropDetailDtoLevelMedalToJson(
    UserDetailResponseDataUserPropDetailDtoLevelMedal entity) {
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

extension UserDetailResponseDataUserPropDetailDtoLevelMedalExtension on UserDetailResponseDataUserPropDetailDtoLevelMedal {
  UserDetailResponseDataUserPropDetailDtoLevelMedal copyWith({
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
    return UserDetailResponseDataUserPropDetailDtoLevelMedal()
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

UserDetailResponseDataUserPropDetailDtoEntranceEffect $UserDetailResponseDataUserPropDetailDtoEntranceEffectFromJson(
    Map<String, dynamic> json) {
  final UserDetailResponseDataUserPropDetailDtoEntranceEffect userDetailResponseDataUserPropDetailDtoEntranceEffect = UserDetailResponseDataUserPropDetailDtoEntranceEffect();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    userDetailResponseDataUserPropDetailDtoEntranceEffect.id = id;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    userDetailResponseDataUserPropDetailDtoEntranceEffect.userId = userId;
  }
  final int? propId = jsonConvert.convert<int>(json['propId']);
  if (propId != null) {
    userDetailResponseDataUserPropDetailDtoEntranceEffect.propId = propId;
  }
  final String? propName = jsonConvert.convert<String>(json['propName']);
  if (propName != null) {
    userDetailResponseDataUserPropDetailDtoEntranceEffect.propName = propName;
  }
  final int? propType = jsonConvert.convert<int>(json['propType']);
  if (propType != null) {
    userDetailResponseDataUserPropDetailDtoEntranceEffect.propType = propType;
  }
  final String? propFormat = jsonConvert.convert<String>(json['propFormat']);
  if (propFormat != null) {
    userDetailResponseDataUserPropDetailDtoEntranceEffect.propFormat =
        propFormat;
  }
  final String? dynamicEffect = jsonConvert.convert<String>(
      json['dynamicEffect']);
  if (dynamicEffect != null) {
    userDetailResponseDataUserPropDetailDtoEntranceEffect.dynamicEffect =
        dynamicEffect;
  }
  final String? pcDynamicEffect = jsonConvert.convert<String>(
      json['pcDynamicEffect']);
  if (pcDynamicEffect != null) {
    userDetailResponseDataUserPropDetailDtoEntranceEffect.pcDynamicEffect =
        pcDynamicEffect;
  }
  final String? iosDynamicEffect = jsonConvert.convert<String>(
      json['iosDynamicEffect']);
  if (iosDynamicEffect != null) {
    userDetailResponseDataUserPropDetailDtoEntranceEffect.iosDynamicEffect =
        iosDynamicEffect;
  }
  final int? customFlag = jsonConvert.convert<int>(json['customFlag']);
  if (customFlag != null) {
    userDetailResponseDataUserPropDetailDtoEntranceEffect.customFlag =
        customFlag;
  }
  final String? customInfo = jsonConvert.convert<String>(json['customInfo']);
  if (customInfo != null) {
    userDetailResponseDataUserPropDetailDtoEntranceEffect.customInfo =
        customInfo;
  }
  final int? useFlag = jsonConvert.convert<int>(json['useFlag']);
  if (useFlag != null) {
    userDetailResponseDataUserPropDetailDtoEntranceEffect.useFlag = useFlag;
  }
  return userDetailResponseDataUserPropDetailDtoEntranceEffect;
}

Map<String,
    dynamic> $UserDetailResponseDataUserPropDetailDtoEntranceEffectToJson(
    UserDetailResponseDataUserPropDetailDtoEntranceEffect entity) {
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

extension UserDetailResponseDataUserPropDetailDtoEntranceEffectExtension on UserDetailResponseDataUserPropDetailDtoEntranceEffect {
  UserDetailResponseDataUserPropDetailDtoEntranceEffect copyWith({
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
    return UserDetailResponseDataUserPropDetailDtoEntranceEffect()
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

UserDetailResponseDataUserPropDetailDtoCustomNickname $UserDetailResponseDataUserPropDetailDtoCustomNicknameFromJson(
    Map<String, dynamic> json) {
  final UserDetailResponseDataUserPropDetailDtoCustomNickname userDetailResponseDataUserPropDetailDtoCustomNickname = UserDetailResponseDataUserPropDetailDtoCustomNickname();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    userDetailResponseDataUserPropDetailDtoCustomNickname.id = id;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    userDetailResponseDataUserPropDetailDtoCustomNickname.userId = userId;
  }
  final int? propId = jsonConvert.convert<int>(json['propId']);
  if (propId != null) {
    userDetailResponseDataUserPropDetailDtoCustomNickname.propId = propId;
  }
  final String? propName = jsonConvert.convert<String>(json['propName']);
  if (propName != null) {
    userDetailResponseDataUserPropDetailDtoCustomNickname.propName = propName;
  }
  final int? propType = jsonConvert.convert<int>(json['propType']);
  if (propType != null) {
    userDetailResponseDataUserPropDetailDtoCustomNickname.propType = propType;
  }
  final String? propFormat = jsonConvert.convert<String>(json['propFormat']);
  if (propFormat != null) {
    userDetailResponseDataUserPropDetailDtoCustomNickname.propFormat =
        propFormat;
  }
  final String? dynamicEffect = jsonConvert.convert<String>(
      json['dynamicEffect']);
  if (dynamicEffect != null) {
    userDetailResponseDataUserPropDetailDtoCustomNickname.dynamicEffect =
        dynamicEffect;
  }
  final String? pcDynamicEffect = jsonConvert.convert<String>(
      json['pcDynamicEffect']);
  if (pcDynamicEffect != null) {
    userDetailResponseDataUserPropDetailDtoCustomNickname.pcDynamicEffect =
        pcDynamicEffect;
  }
  final String? iosDynamicEffect = jsonConvert.convert<String>(
      json['iosDynamicEffect']);
  if (iosDynamicEffect != null) {
    userDetailResponseDataUserPropDetailDtoCustomNickname.iosDynamicEffect =
        iosDynamicEffect;
  }
  final int? customFlag = jsonConvert.convert<int>(json['customFlag']);
  if (customFlag != null) {
    userDetailResponseDataUserPropDetailDtoCustomNickname.customFlag =
        customFlag;
  }
  final String? customInfo = jsonConvert.convert<String>(json['customInfo']);
  if (customInfo != null) {
    userDetailResponseDataUserPropDetailDtoCustomNickname.customInfo =
        customInfo;
  }
  final int? useFlag = jsonConvert.convert<int>(json['useFlag']);
  if (useFlag != null) {
    userDetailResponseDataUserPropDetailDtoCustomNickname.useFlag = useFlag;
  }
  return userDetailResponseDataUserPropDetailDtoCustomNickname;
}

Map<String,
    dynamic> $UserDetailResponseDataUserPropDetailDtoCustomNicknameToJson(
    UserDetailResponseDataUserPropDetailDtoCustomNickname entity) {
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

extension UserDetailResponseDataUserPropDetailDtoCustomNicknameExtension on UserDetailResponseDataUserPropDetailDtoCustomNickname {
  UserDetailResponseDataUserPropDetailDtoCustomNickname copyWith({
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
    return UserDetailResponseDataUserPropDetailDtoCustomNickname()
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

UserDetailResponseDataUserPropDetailDtoHomepageEffect $UserDetailResponseDataUserPropDetailDtoHomepageEffectFromJson(
    Map<String, dynamic> json) {
  final UserDetailResponseDataUserPropDetailDtoHomepageEffect userDetailResponseDataUserPropDetailDtoHomepageEffect = UserDetailResponseDataUserPropDetailDtoHomepageEffect();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    userDetailResponseDataUserPropDetailDtoHomepageEffect.id = id;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    userDetailResponseDataUserPropDetailDtoHomepageEffect.userId = userId;
  }
  final int? propId = jsonConvert.convert<int>(json['propId']);
  if (propId != null) {
    userDetailResponseDataUserPropDetailDtoHomepageEffect.propId = propId;
  }
  final String? propName = jsonConvert.convert<String>(json['propName']);
  if (propName != null) {
    userDetailResponseDataUserPropDetailDtoHomepageEffect.propName = propName;
  }
  final int? propType = jsonConvert.convert<int>(json['propType']);
  if (propType != null) {
    userDetailResponseDataUserPropDetailDtoHomepageEffect.propType = propType;
  }
  final String? propFormat = jsonConvert.convert<String>(json['propFormat']);
  if (propFormat != null) {
    userDetailResponseDataUserPropDetailDtoHomepageEffect.propFormat =
        propFormat;
  }
  final String? dynamicEffect = jsonConvert.convert<String>(
      json['dynamicEffect']);
  if (dynamicEffect != null) {
    userDetailResponseDataUserPropDetailDtoHomepageEffect.dynamicEffect =
        dynamicEffect;
  }
  final String? pcDynamicEffect = jsonConvert.convert<String>(
      json['pcDynamicEffect']);
  if (pcDynamicEffect != null) {
    userDetailResponseDataUserPropDetailDtoHomepageEffect.pcDynamicEffect =
        pcDynamicEffect;
  }
  final String? iosDynamicEffect = jsonConvert.convert<String>(
      json['iosDynamicEffect']);
  if (iosDynamicEffect != null) {
    userDetailResponseDataUserPropDetailDtoHomepageEffect.iosDynamicEffect =
        iosDynamicEffect;
  }
  final int? customFlag = jsonConvert.convert<int>(json['customFlag']);
  if (customFlag != null) {
    userDetailResponseDataUserPropDetailDtoHomepageEffect.customFlag =
        customFlag;
  }
  final String? customInfo = jsonConvert.convert<String>(json['customInfo']);
  if (customInfo != null) {
    userDetailResponseDataUserPropDetailDtoHomepageEffect.customInfo =
        customInfo;
  }
  final int? useFlag = jsonConvert.convert<int>(json['useFlag']);
  if (useFlag != null) {
    userDetailResponseDataUserPropDetailDtoHomepageEffect.useFlag = useFlag;
  }
  return userDetailResponseDataUserPropDetailDtoHomepageEffect;
}

Map<String,
    dynamic> $UserDetailResponseDataUserPropDetailDtoHomepageEffectToJson(
    UserDetailResponseDataUserPropDetailDtoHomepageEffect entity) {
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

extension UserDetailResponseDataUserPropDetailDtoHomepageEffectExtension on UserDetailResponseDataUserPropDetailDtoHomepageEffect {
  UserDetailResponseDataUserPropDetailDtoHomepageEffect copyWith({
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
    return UserDetailResponseDataUserPropDetailDtoHomepageEffect()
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

UserDetailResponseDataUserPropDetailDtoNameplate $UserDetailResponseDataUserPropDetailDtoNameplateFromJson(
    Map<String, dynamic> json) {
  final UserDetailResponseDataUserPropDetailDtoNameplate userDetailResponseDataUserPropDetailDtoNameplate = UserDetailResponseDataUserPropDetailDtoNameplate();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    userDetailResponseDataUserPropDetailDtoNameplate.id = id;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    userDetailResponseDataUserPropDetailDtoNameplate.userId = userId;
  }
  final int? propId = jsonConvert.convert<int>(json['propId']);
  if (propId != null) {
    userDetailResponseDataUserPropDetailDtoNameplate.propId = propId;
  }
  final String? propName = jsonConvert.convert<String>(json['propName']);
  if (propName != null) {
    userDetailResponseDataUserPropDetailDtoNameplate.propName = propName;
  }
  final int? propType = jsonConvert.convert<int>(json['propType']);
  if (propType != null) {
    userDetailResponseDataUserPropDetailDtoNameplate.propType = propType;
  }
  final String? propFormat = jsonConvert.convert<String>(json['propFormat']);
  if (propFormat != null) {
    userDetailResponseDataUserPropDetailDtoNameplate.propFormat = propFormat;
  }
  final String? dynamicEffect = jsonConvert.convert<String>(
      json['dynamicEffect']);
  if (dynamicEffect != null) {
    userDetailResponseDataUserPropDetailDtoNameplate.dynamicEffect =
        dynamicEffect;
  }
  final String? pcDynamicEffect = jsonConvert.convert<String>(
      json['pcDynamicEffect']);
  if (pcDynamicEffect != null) {
    userDetailResponseDataUserPropDetailDtoNameplate.pcDynamicEffect =
        pcDynamicEffect;
  }
  final String? iosDynamicEffect = jsonConvert.convert<String>(
      json['iosDynamicEffect']);
  if (iosDynamicEffect != null) {
    userDetailResponseDataUserPropDetailDtoNameplate.iosDynamicEffect =
        iosDynamicEffect;
  }
  final int? customFlag = jsonConvert.convert<int>(json['customFlag']);
  if (customFlag != null) {
    userDetailResponseDataUserPropDetailDtoNameplate.customFlag = customFlag;
  }
  final String? customInfo = jsonConvert.convert<String>(json['customInfo']);
  if (customInfo != null) {
    userDetailResponseDataUserPropDetailDtoNameplate.customInfo = customInfo;
  }
  final int? useFlag = jsonConvert.convert<int>(json['useFlag']);
  if (useFlag != null) {
    userDetailResponseDataUserPropDetailDtoNameplate.useFlag = useFlag;
  }
  return userDetailResponseDataUserPropDetailDtoNameplate;
}

Map<String, dynamic> $UserDetailResponseDataUserPropDetailDtoNameplateToJson(
    UserDetailResponseDataUserPropDetailDtoNameplate entity) {
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

extension UserDetailResponseDataUserPropDetailDtoNameplateExtension on UserDetailResponseDataUserPropDetailDtoNameplate {
  UserDetailResponseDataUserPropDetailDtoNameplate copyWith({
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
    return UserDetailResponseDataUserPropDetailDtoNameplate()
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

UserDetailResponseDataUserPropDetailDtoMount $UserDetailResponseDataUserPropDetailDtoMountFromJson(
    Map<String, dynamic> json) {
  final UserDetailResponseDataUserPropDetailDtoMount userDetailResponseDataUserPropDetailDtoMount = UserDetailResponseDataUserPropDetailDtoMount();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    userDetailResponseDataUserPropDetailDtoMount.id = id;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    userDetailResponseDataUserPropDetailDtoMount.userId = userId;
  }
  final int? propId = jsonConvert.convert<int>(json['propId']);
  if (propId != null) {
    userDetailResponseDataUserPropDetailDtoMount.propId = propId;
  }
  final String? propName = jsonConvert.convert<String>(json['propName']);
  if (propName != null) {
    userDetailResponseDataUserPropDetailDtoMount.propName = propName;
  }
  final int? propType = jsonConvert.convert<int>(json['propType']);
  if (propType != null) {
    userDetailResponseDataUserPropDetailDtoMount.propType = propType;
  }
  final String? propFormat = jsonConvert.convert<String>(json['propFormat']);
  if (propFormat != null) {
    userDetailResponseDataUserPropDetailDtoMount.propFormat = propFormat;
  }
  final String? dynamicEffect = jsonConvert.convert<String>(
      json['dynamicEffect']);
  if (dynamicEffect != null) {
    userDetailResponseDataUserPropDetailDtoMount.dynamicEffect = dynamicEffect;
  }
  final String? pcDynamicEffect = jsonConvert.convert<String>(
      json['pcDynamicEffect']);
  if (pcDynamicEffect != null) {
    userDetailResponseDataUserPropDetailDtoMount.pcDynamicEffect =
        pcDynamicEffect;
  }
  final String? iosDynamicEffect = jsonConvert.convert<String>(
      json['iosDynamicEffect']);
  if (iosDynamicEffect != null) {
    userDetailResponseDataUserPropDetailDtoMount.iosDynamicEffect =
        iosDynamicEffect;
  }
  final int? customFlag = jsonConvert.convert<int>(json['customFlag']);
  if (customFlag != null) {
    userDetailResponseDataUserPropDetailDtoMount.customFlag = customFlag;
  }
  final String? customInfo = jsonConvert.convert<String>(json['customInfo']);
  if (customInfo != null) {
    userDetailResponseDataUserPropDetailDtoMount.customInfo = customInfo;
  }
  final int? useFlag = jsonConvert.convert<int>(json['useFlag']);
  if (useFlag != null) {
    userDetailResponseDataUserPropDetailDtoMount.useFlag = useFlag;
  }
  return userDetailResponseDataUserPropDetailDtoMount;
}

Map<String, dynamic> $UserDetailResponseDataUserPropDetailDtoMountToJson(
    UserDetailResponseDataUserPropDetailDtoMount entity) {
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

extension UserDetailResponseDataUserPropDetailDtoMountExtension on UserDetailResponseDataUserPropDetailDtoMount {
  UserDetailResponseDataUserPropDetailDtoMount copyWith({
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
    return UserDetailResponseDataUserPropDetailDtoMount()
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

UserDetailResponseDataUserPropDetailDtoColorfulText $UserDetailResponseDataUserPropDetailDtoColorfulTextFromJson(
    Map<String, dynamic> json) {
  final UserDetailResponseDataUserPropDetailDtoColorfulText userDetailResponseDataUserPropDetailDtoColorfulText = UserDetailResponseDataUserPropDetailDtoColorfulText();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    userDetailResponseDataUserPropDetailDtoColorfulText.id = id;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    userDetailResponseDataUserPropDetailDtoColorfulText.userId = userId;
  }
  final int? propId = jsonConvert.convert<int>(json['propId']);
  if (propId != null) {
    userDetailResponseDataUserPropDetailDtoColorfulText.propId = propId;
  }
  final String? propName = jsonConvert.convert<String>(json['propName']);
  if (propName != null) {
    userDetailResponseDataUserPropDetailDtoColorfulText.propName = propName;
  }
  final int? propType = jsonConvert.convert<int>(json['propType']);
  if (propType != null) {
    userDetailResponseDataUserPropDetailDtoColorfulText.propType = propType;
  }
  final String? propFormat = jsonConvert.convert<String>(json['propFormat']);
  if (propFormat != null) {
    userDetailResponseDataUserPropDetailDtoColorfulText.propFormat = propFormat;
  }
  final String? dynamicEffect = jsonConvert.convert<String>(
      json['dynamicEffect']);
  if (dynamicEffect != null) {
    userDetailResponseDataUserPropDetailDtoColorfulText.dynamicEffect =
        dynamicEffect;
  }
  final String? pcDynamicEffect = jsonConvert.convert<String>(
      json['pcDynamicEffect']);
  if (pcDynamicEffect != null) {
    userDetailResponseDataUserPropDetailDtoColorfulText.pcDynamicEffect =
        pcDynamicEffect;
  }
  final String? iosDynamicEffect = jsonConvert.convert<String>(
      json['iosDynamicEffect']);
  if (iosDynamicEffect != null) {
    userDetailResponseDataUserPropDetailDtoColorfulText.iosDynamicEffect =
        iosDynamicEffect;
  }
  final int? customFlag = jsonConvert.convert<int>(json['customFlag']);
  if (customFlag != null) {
    userDetailResponseDataUserPropDetailDtoColorfulText.customFlag = customFlag;
  }
  final String? customInfo = jsonConvert.convert<String>(json['customInfo']);
  if (customInfo != null) {
    userDetailResponseDataUserPropDetailDtoColorfulText.customInfo = customInfo;
  }
  final int? useFlag = jsonConvert.convert<int>(json['useFlag']);
  if (useFlag != null) {
    userDetailResponseDataUserPropDetailDtoColorfulText.useFlag = useFlag;
  }
  return userDetailResponseDataUserPropDetailDtoColorfulText;
}

Map<String, dynamic> $UserDetailResponseDataUserPropDetailDtoColorfulTextToJson(
    UserDetailResponseDataUserPropDetailDtoColorfulText entity) {
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

extension UserDetailResponseDataUserPropDetailDtoColorfulTextExtension on UserDetailResponseDataUserPropDetailDtoColorfulText {
  UserDetailResponseDataUserPropDetailDtoColorfulText copyWith({
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
    return UserDetailResponseDataUserPropDetailDtoColorfulText()
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

UserDetailResponseDataUserPropDetailDtoRoomWallpaper $UserDetailResponseDataUserPropDetailDtoRoomWallpaperFromJson(
    Map<String, dynamic> json) {
  final UserDetailResponseDataUserPropDetailDtoRoomWallpaper userDetailResponseDataUserPropDetailDtoRoomWallpaper = UserDetailResponseDataUserPropDetailDtoRoomWallpaper();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    userDetailResponseDataUserPropDetailDtoRoomWallpaper.id = id;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    userDetailResponseDataUserPropDetailDtoRoomWallpaper.userId = userId;
  }
  final int? propId = jsonConvert.convert<int>(json['propId']);
  if (propId != null) {
    userDetailResponseDataUserPropDetailDtoRoomWallpaper.propId = propId;
  }
  final String? propName = jsonConvert.convert<String>(json['propName']);
  if (propName != null) {
    userDetailResponseDataUserPropDetailDtoRoomWallpaper.propName = propName;
  }
  final int? propType = jsonConvert.convert<int>(json['propType']);
  if (propType != null) {
    userDetailResponseDataUserPropDetailDtoRoomWallpaper.propType = propType;
  }
  final String? propFormat = jsonConvert.convert<String>(json['propFormat']);
  if (propFormat != null) {
    userDetailResponseDataUserPropDetailDtoRoomWallpaper.propFormat =
        propFormat;
  }
  final String? dynamicEffect = jsonConvert.convert<String>(
      json['dynamicEffect']);
  if (dynamicEffect != null) {
    userDetailResponseDataUserPropDetailDtoRoomWallpaper.dynamicEffect =
        dynamicEffect;
  }
  final String? pcDynamicEffect = jsonConvert.convert<String>(
      json['pcDynamicEffect']);
  if (pcDynamicEffect != null) {
    userDetailResponseDataUserPropDetailDtoRoomWallpaper.pcDynamicEffect =
        pcDynamicEffect;
  }
  final String? iosDynamicEffect = jsonConvert.convert<String>(
      json['iosDynamicEffect']);
  if (iosDynamicEffect != null) {
    userDetailResponseDataUserPropDetailDtoRoomWallpaper.iosDynamicEffect =
        iosDynamicEffect;
  }
  final int? customFlag = jsonConvert.convert<int>(json['customFlag']);
  if (customFlag != null) {
    userDetailResponseDataUserPropDetailDtoRoomWallpaper.customFlag =
        customFlag;
  }
  final String? customInfo = jsonConvert.convert<String>(json['customInfo']);
  if (customInfo != null) {
    userDetailResponseDataUserPropDetailDtoRoomWallpaper.customInfo =
        customInfo;
  }
  final int? useFlag = jsonConvert.convert<int>(json['useFlag']);
  if (useFlag != null) {
    userDetailResponseDataUserPropDetailDtoRoomWallpaper.useFlag = useFlag;
  }
  return userDetailResponseDataUserPropDetailDtoRoomWallpaper;
}

Map<String,
    dynamic> $UserDetailResponseDataUserPropDetailDtoRoomWallpaperToJson(
    UserDetailResponseDataUserPropDetailDtoRoomWallpaper entity) {
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

extension UserDetailResponseDataUserPropDetailDtoRoomWallpaperExtension on UserDetailResponseDataUserPropDetailDtoRoomWallpaper {
  UserDetailResponseDataUserPropDetailDtoRoomWallpaper copyWith({
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
    return UserDetailResponseDataUserPropDetailDtoRoomWallpaper()
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

UserDetailResponseDataUserPropDetailDtoNobleCard $UserDetailResponseDataUserPropDetailDtoNobleCardFromJson(
    Map<String, dynamic> json) {
  final UserDetailResponseDataUserPropDetailDtoNobleCard userDetailResponseDataUserPropDetailDtoNobleCard = UserDetailResponseDataUserPropDetailDtoNobleCard();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    userDetailResponseDataUserPropDetailDtoNobleCard.id = id;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    userDetailResponseDataUserPropDetailDtoNobleCard.userId = userId;
  }
  final int? propId = jsonConvert.convert<int>(json['propId']);
  if (propId != null) {
    userDetailResponseDataUserPropDetailDtoNobleCard.propId = propId;
  }
  final String? propName = jsonConvert.convert<String>(json['propName']);
  if (propName != null) {
    userDetailResponseDataUserPropDetailDtoNobleCard.propName = propName;
  }
  final int? propType = jsonConvert.convert<int>(json['propType']);
  if (propType != null) {
    userDetailResponseDataUserPropDetailDtoNobleCard.propType = propType;
  }
  final String? propFormat = jsonConvert.convert<String>(json['propFormat']);
  if (propFormat != null) {
    userDetailResponseDataUserPropDetailDtoNobleCard.propFormat = propFormat;
  }
  final String? dynamicEffect = jsonConvert.convert<String>(
      json['dynamicEffect']);
  if (dynamicEffect != null) {
    userDetailResponseDataUserPropDetailDtoNobleCard.dynamicEffect =
        dynamicEffect;
  }
  final String? pcDynamicEffect = jsonConvert.convert<String>(
      json['pcDynamicEffect']);
  if (pcDynamicEffect != null) {
    userDetailResponseDataUserPropDetailDtoNobleCard.pcDynamicEffect =
        pcDynamicEffect;
  }
  final String? iosDynamicEffect = jsonConvert.convert<String>(
      json['iosDynamicEffect']);
  if (iosDynamicEffect != null) {
    userDetailResponseDataUserPropDetailDtoNobleCard.iosDynamicEffect =
        iosDynamicEffect;
  }
  final int? customFlag = jsonConvert.convert<int>(json['customFlag']);
  if (customFlag != null) {
    userDetailResponseDataUserPropDetailDtoNobleCard.customFlag = customFlag;
  }
  final String? customInfo = jsonConvert.convert<String>(json['customInfo']);
  if (customInfo != null) {
    userDetailResponseDataUserPropDetailDtoNobleCard.customInfo = customInfo;
  }
  final int? useFlag = jsonConvert.convert<int>(json['useFlag']);
  if (useFlag != null) {
    userDetailResponseDataUserPropDetailDtoNobleCard.useFlag = useFlag;
  }
  return userDetailResponseDataUserPropDetailDtoNobleCard;
}

Map<String, dynamic> $UserDetailResponseDataUserPropDetailDtoNobleCardToJson(
    UserDetailResponseDataUserPropDetailDtoNobleCard entity) {
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

extension UserDetailResponseDataUserPropDetailDtoNobleCardExtension on UserDetailResponseDataUserPropDetailDtoNobleCard {
  UserDetailResponseDataUserPropDetailDtoNobleCard copyWith({
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
    return UserDetailResponseDataUserPropDetailDtoNobleCard()
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

UserDetailResponseDataGuardianMedal $UserDetailResponseDataGuardianMedalFromJson(
    Map<String, dynamic> json) {
  final UserDetailResponseDataGuardianMedal userDetailResponseDataGuardianMedal = UserDetailResponseDataGuardianMedal();
  final int? guardianLevel = jsonConvert.convert<int>(json['guardianLevel']);
  if (guardianLevel != null) {
    userDetailResponseDataGuardianMedal.guardianLevel = guardianLevel;
  }
  final String? roomNamePrefix = jsonConvert.convert<String>(
      json['roomNamePrefix']);
  if (roomNamePrefix != null) {
    userDetailResponseDataGuardianMedal.roomNamePrefix = roomNamePrefix;
  }
  final String? streamerTagPrefix = jsonConvert.convert<String>(
      json['streamerTagPrefix']);
  if (streamerTagPrefix != null) {
    userDetailResponseDataGuardianMedal.streamerTagPrefix = streamerTagPrefix;
  }
  final int? roomId = jsonConvert.convert<int>(json['roomId']);
  if (roomId != null) {
    userDetailResponseDataGuardianMedal.roomId = roomId;
  }
  final int? streamerUserId = jsonConvert.convert<int>(json['streamerUserId']);
  if (streamerUserId != null) {
    userDetailResponseDataGuardianMedal.streamerUserId = streamerUserId;
  }
  final bool? isGold = jsonConvert.convert<bool>(json['isGold']);
  if (isGold != null) {
    userDetailResponseDataGuardianMedal.isGold = isGold;
  }
  return userDetailResponseDataGuardianMedal;
}

Map<String, dynamic> $UserDetailResponseDataGuardianMedalToJson(
    UserDetailResponseDataGuardianMedal entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['guardianLevel'] = entity.guardianLevel;
  data['roomNamePrefix'] = entity.roomNamePrefix;
  data['streamerTagPrefix'] = entity.streamerTagPrefix;
  data['roomId'] = entity.roomId;
  data['streamerUserId'] = entity.streamerUserId;
  data['isGold'] = entity.isGold;
  return data;
}

extension UserDetailResponseDataGuardianMedalExtension on UserDetailResponseDataGuardianMedal {
  UserDetailResponseDataGuardianMedal copyWith({
    int? guardianLevel,
    String? roomNamePrefix,
    String? streamerTagPrefix,
    int? roomId,
    int? streamerUserId,
    bool? isGold,
  }) {
    return UserDetailResponseDataGuardianMedal()
      ..guardianLevel = guardianLevel ?? this.guardianLevel
      ..roomNamePrefix = roomNamePrefix ?? this.roomNamePrefix
      ..streamerTagPrefix = streamerTagPrefix ?? this.streamerTagPrefix
      ..roomId = roomId ?? this.roomId
      ..streamerUserId = streamerUserId ?? this.streamerUserId
      ..isGold = isGold ?? this.isGold;
  }
}