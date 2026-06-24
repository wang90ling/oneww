import 'package:oneww/generated/json/base/json_convert_content.dart';
import 'package:oneww/models/home_new_recommend_entity.dart';

HomeNewRecommendEntity $HomeNewRecommendEntityFromJson(
    Map<String, dynamic> json) {
  final HomeNewRecommendEntity homeNewRecommendEntity = HomeNewRecommendEntity();
  final String? requestId = jsonConvert.convert<String>(json['request_id']);
  if (requestId != null) {
    homeNewRecommendEntity.requestId = requestId;
  }
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    homeNewRecommendEntity.code = code;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    homeNewRecommendEntity.message = message;
  }
  final HomeNewRecommendData? data = jsonConvert.convert<HomeNewRecommendData>(
      json['data']);
  if (data != null) {
    homeNewRecommendEntity.data = data;
  }
  return homeNewRecommendEntity;
}

Map<String, dynamic> $HomeNewRecommendEntityToJson(
    HomeNewRecommendEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['request_id'] = entity.requestId;
  data['code'] = entity.code;
  data['message'] = entity.message;
  data['data'] = entity.data.toJson();
  return data;
}

extension HomeNewRecommendEntityExtension on HomeNewRecommendEntity {
  HomeNewRecommendEntity copyWith({
    String? requestId,
    int? code,
    String? message,
    HomeNewRecommendData? data,
  }) {
    return HomeNewRecommendEntity()
      ..requestId = requestId ?? this.requestId
      ..code = code ?? this.code
      ..message = message ?? this.message
      ..data = data ?? this.data;
  }
}

HomeNewRecommendData $HomeNewRecommendDataFromJson(Map<String, dynamic> json) {
  final HomeNewRecommendData homeNewRecommendData = HomeNewRecommendData();
  final int? pageNo = jsonConvert.convert<int>(json['pageNo']);
  if (pageNo != null) {
    homeNewRecommendData.pageNo = pageNo;
  }
  final int? pageSize = jsonConvert.convert<int>(json['pageSize']);
  if (pageSize != null) {
    homeNewRecommendData.pageSize = pageSize;
  }
  final int? total = jsonConvert.convert<int>(json['total']);
  if (total != null) {
    homeNewRecommendData.total = total;
  }
  final int? pages = jsonConvert.convert<int>(json['pages']);
  if (pages != null) {
    homeNewRecommendData.pages = pages;
  }
  final List<HomeNewRecommendDataRecords>? records = (json['records'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<HomeNewRecommendDataRecords>(
          e) as HomeNewRecommendDataRecords).toList();
  if (records != null) {
    homeNewRecommendData.records = records;
  }
  return homeNewRecommendData;
}

Map<String, dynamic> $HomeNewRecommendDataToJson(HomeNewRecommendData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['pageNo'] = entity.pageNo;
  data['pageSize'] = entity.pageSize;
  data['total'] = entity.total;
  data['pages'] = entity.pages;
  data['records'] = entity.records.map((v) => v.toJson()).toList();
  return data;
}

extension HomeNewRecommendDataExtension on HomeNewRecommendData {
  HomeNewRecommendData copyWith({
    int? pageNo,
    int? pageSize,
    int? total,
    int? pages,
    List<HomeNewRecommendDataRecords>? records,
  }) {
    return HomeNewRecommendData()
      ..pageNo = pageNo ?? this.pageNo
      ..pageSize = pageSize ?? this.pageSize
      ..total = total ?? this.total
      ..pages = pages ?? this.pages
      ..records = records ?? this.records;
  }
}

HomeNewRecommendDataRecords $HomeNewRecommendDataRecordsFromJson(
    Map<String, dynamic> json) {
  final HomeNewRecommendDataRecords homeNewRecommendDataRecords = HomeNewRecommendDataRecords();
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    homeNewRecommendDataRecords.userId = userId;
  }
  final String? userNo = jsonConvert.convert<String>(json['userNo']);
  if (userNo != null) {
    homeNewRecommendDataRecords.userNo = userNo;
  }
  final String? luckyNo = jsonConvert.convert<String>(json['luckyNo']);
  if (luckyNo != null) {
    homeNewRecommendDataRecords.luckyNo = luckyNo;
  }
  final int? categoryId = jsonConvert.convert<int>(json['categoryId']);
  if (categoryId != null) {
    homeNewRecommendDataRecords.categoryId = categoryId;
  }
  final String? nickName = jsonConvert.convert<String>(json['nickName']);
  if (nickName != null) {
    homeNewRecommendDataRecords.nickName = nickName;
  }
  final String? avatar = jsonConvert.convert<String>(json['avatar']);
  if (avatar != null) {
    homeNewRecommendDataRecords.avatar = avatar;
  }
  final String? sex = jsonConvert.convert<String>(json['sex']);
  if (sex != null) {
    homeNewRecommendDataRecords.sex = sex;
  }
  final int? age = jsonConvert.convert<int>(json['age']);
  if (age != null) {
    homeNewRecommendDataRecords.age = age;
  }
  final String? introduced = jsonConvert.convert<String>(json['introduced']);
  if (introduced != null) {
    homeNewRecommendDataRecords.introduced = introduced;
  }
  final String? coverImage = jsonConvert.convert<String>(json['coverImage']);
  if (coverImage != null) {
    homeNewRecommendDataRecords.coverImage = coverImage;
  }
  final String? grade = jsonConvert.convert<String>(json['grade']);
  if (grade != null) {
    homeNewRecommendDataRecords.grade = grade;
  }
  final int? scoreAvg = jsonConvert.convert<int>(json['scoreAvg']);
  if (scoreAvg != null) {
    homeNewRecommendDataRecords.scoreAvg = scoreAvg;
  }
  final int? orderAmount = jsonConvert.convert<int>(json['orderAmount']);
  if (orderAmount != null) {
    homeNewRecommendDataRecords.orderAmount = orderAmount;
  }
  final int? level = jsonConvert.convert<int>(json['level']);
  if (level != null) {
    homeNewRecommendDataRecords.level = level;
  }
  final int? roomLevel = jsonConvert.convert<int>(json['roomLevel']);
  if (roomLevel != null) {
    homeNewRecommendDataRecords.roomLevel = roomLevel;
  }
  final HomeNewRecommendDataRecordsRoomLevelConfigDto? roomLevelConfigDto = jsonConvert
      .convert<HomeNewRecommendDataRecordsRoomLevelConfigDto>(
      json['roomLevelConfigDto']);
  if (roomLevelConfigDto != null) {
    homeNewRecommendDataRecords.roomLevelConfigDto = roomLevelConfigDto;
  }
  final HomeNewRecommendDataRecordsNobleLevelDto? nobleLevelDto = jsonConvert
      .convert<HomeNewRecommendDataRecordsNobleLevelDto>(json['nobleLevelDto']);
  if (nobleLevelDto != null) {
    homeNewRecommendDataRecords.nobleLevelDto = nobleLevelDto;
  }
  final int? accompanyLevel = jsonConvert.convert<int>(json['accompanyLevel']);
  if (accompanyLevel != null) {
    homeNewRecommendDataRecords.accompanyLevel = accompanyLevel;
  }
  final int? onlineFlag = jsonConvert.convert<int>(json['onlineFlag']);
  if (onlineFlag != null) {
    homeNewRecommendDataRecords.onlineFlag = onlineFlag;
  }
  final List<
      HomeNewRecommendDataRecordsCategoryList>? categoryList = (json['categoryList'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<HomeNewRecommendDataRecordsCategoryList>(
          e) as HomeNewRecommendDataRecordsCategoryList).toList();
  if (categoryList != null) {
    homeNewRecommendDataRecords.categoryList = categoryList;
  }
  final HomeNewRecommendDataRecordsUserPropDetailDto? userPropDetailDto = jsonConvert
      .convert<HomeNewRecommendDataRecordsUserPropDetailDto>(
      json['userPropDetailDto']);
  if (userPropDetailDto != null) {
    homeNewRecommendDataRecords.userPropDetailDto = userPropDetailDto;
  }
  return homeNewRecommendDataRecords;
}

Map<String, dynamic> $HomeNewRecommendDataRecordsToJson(
    HomeNewRecommendDataRecords entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['userId'] = entity.userId;
  data['userNo'] = entity.userNo;
  data['luckyNo'] = entity.luckyNo;
  data['categoryId'] = entity.categoryId;
  data['nickName'] = entity.nickName;
  data['avatar'] = entity.avatar;
  data['sex'] = entity.sex;
  data['age'] = entity.age;
  data['introduced'] = entity.introduced;
  data['coverImage'] = entity.coverImage;
  data['grade'] = entity.grade;
  data['scoreAvg'] = entity.scoreAvg;
  data['orderAmount'] = entity.orderAmount;
  data['level'] = entity.level;
  data['roomLevel'] = entity.roomLevel;
  data['roomLevelConfigDto'] = entity.roomLevelConfigDto.toJson();
  data['nobleLevelDto'] = entity.nobleLevelDto.toJson();
  data['accompanyLevel'] = entity.accompanyLevel;
  data['onlineFlag'] = entity.onlineFlag;
  data['categoryList'] = entity.categoryList.map((v) => v.toJson()).toList();
  data['userPropDetailDto'] = entity.userPropDetailDto.toJson();
  return data;
}

extension HomeNewRecommendDataRecordsExtension on HomeNewRecommendDataRecords {
  HomeNewRecommendDataRecords copyWith({
    int? userId,
    String? userNo,
    String? luckyNo,
    int? categoryId,
    String? nickName,
    String? avatar,
    String? sex,
    int? age,
    String? introduced,
    String? coverImage,
    String? grade,
    int? scoreAvg,
    int? orderAmount,
    int? level,
    int? roomLevel,
    HomeNewRecommendDataRecordsRoomLevelConfigDto? roomLevelConfigDto,
    HomeNewRecommendDataRecordsNobleLevelDto? nobleLevelDto,
    int? accompanyLevel,
    int? onlineFlag,
    List<HomeNewRecommendDataRecordsCategoryList>? categoryList,
    HomeNewRecommendDataRecordsUserPropDetailDto? userPropDetailDto,
  }) {
    return HomeNewRecommendDataRecords()
      ..userId = userId ?? this.userId
      ..userNo = userNo ?? this.userNo
      ..luckyNo = luckyNo ?? this.luckyNo
      ..categoryId = categoryId ?? this.categoryId
      ..nickName = nickName ?? this.nickName
      ..avatar = avatar ?? this.avatar
      ..sex = sex ?? this.sex
      ..age = age ?? this.age
      ..introduced = introduced ?? this.introduced
      ..coverImage = coverImage ?? this.coverImage
      ..grade = grade ?? this.grade
      ..scoreAvg = scoreAvg ?? this.scoreAvg
      ..orderAmount = orderAmount ?? this.orderAmount
      ..level = level ?? this.level
      ..roomLevel = roomLevel ?? this.roomLevel
      ..roomLevelConfigDto = roomLevelConfigDto ?? this.roomLevelConfigDto
      ..nobleLevelDto = nobleLevelDto ?? this.nobleLevelDto
      ..accompanyLevel = accompanyLevel ?? this.accompanyLevel
      ..onlineFlag = onlineFlag ?? this.onlineFlag
      ..categoryList = categoryList ?? this.categoryList
      ..userPropDetailDto = userPropDetailDto ?? this.userPropDetailDto;
  }
}

HomeNewRecommendDataRecordsRoomLevelConfigDto $HomeNewRecommendDataRecordsRoomLevelConfigDtoFromJson(
    Map<String, dynamic> json) {
  final HomeNewRecommendDataRecordsRoomLevelConfigDto homeNewRecommendDataRecordsRoomLevelConfigDto = HomeNewRecommendDataRecordsRoomLevelConfigDto();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    homeNewRecommendDataRecordsRoomLevelConfigDto.id = id;
  }
  final String? levelName = jsonConvert.convert<String>(json['levelName']);
  if (levelName != null) {
    homeNewRecommendDataRecordsRoomLevelConfigDto.levelName = levelName;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    homeNewRecommendDataRecordsRoomLevelConfigDto.icon = icon;
  }
  final String? backdrop = jsonConvert.convert<String>(json['backdrop']);
  if (backdrop != null) {
    homeNewRecommendDataRecordsRoomLevelConfigDto.backdrop = backdrop;
  }
  final String? medal = jsonConvert.convert<String>(json['medal']);
  if (medal != null) {
    homeNewRecommendDataRecordsRoomLevelConfigDto.medal = medal;
  }
  final String? homeBackdrop = jsonConvert.convert<String>(
      json['homeBackdrop']);
  if (homeBackdrop != null) {
    homeNewRecommendDataRecordsRoomLevelConfigDto.homeBackdrop = homeBackdrop;
  }
  final String? pcMedal = jsonConvert.convert<String>(json['pcMedal']);
  if (pcMedal != null) {
    homeNewRecommendDataRecordsRoomLevelConfigDto.pcMedal = pcMedal;
  }
  final String? pcIcon = jsonConvert.convert<String>(json['pcIcon']);
  if (pcIcon != null) {
    homeNewRecommendDataRecordsRoomLevelConfigDto.pcIcon = pcIcon;
  }
  final int? level = jsonConvert.convert<int>(json['level']);
  if (level != null) {
    homeNewRecommendDataRecordsRoomLevelConfigDto.level = level;
  }
  final int? startPoints = jsonConvert.convert<int>(json['startPoints']);
  if (startPoints != null) {
    homeNewRecommendDataRecordsRoomLevelConfigDto.startPoints = startPoints;
  }
  final int? endPoints = jsonConvert.convert<int>(json['endPoints']);
  if (endPoints != null) {
    homeNewRecommendDataRecordsRoomLevelConfigDto.endPoints = endPoints;
  }
  final int? medalUsable = jsonConvert.convert<int>(json['medalUsable']);
  if (medalUsable != null) {
    homeNewRecommendDataRecordsRoomLevelConfigDto.medalUsable = medalUsable;
  }
  final int? recommendUsable = jsonConvert.convert<int>(
      json['recommendUsable']);
  if (recommendUsable != null) {
    homeNewRecommendDataRecordsRoomLevelConfigDto.recommendUsable =
        recommendUsable;
  }
  final int? recommendRate = jsonConvert.convert<int>(json['recommendRate']);
  if (recommendRate != null) {
    homeNewRecommendDataRecordsRoomLevelConfigDto.recommendRate = recommendRate;
  }
  final int? giftUsable = jsonConvert.convert<int>(json['giftUsable']);
  if (giftUsable != null) {
    homeNewRecommendDataRecordsRoomLevelConfigDto.giftUsable = giftUsable;
  }
  final int? avatarUsable = jsonConvert.convert<int>(json['avatarUsable']);
  if (avatarUsable != null) {
    homeNewRecommendDataRecordsRoomLevelConfigDto.avatarUsable = avatarUsable;
  }
  final int? avatarConfigId = jsonConvert.convert<int>(json['avatarConfigId']);
  if (avatarConfigId != null) {
    homeNewRecommendDataRecordsRoomLevelConfigDto.avatarConfigId =
        avatarConfigId;
  }
  final int? animationUsable = jsonConvert.convert<int>(
      json['animationUsable']);
  if (animationUsable != null) {
    homeNewRecommendDataRecordsRoomLevelConfigDto.animationUsable =
        animationUsable;
  }
  final int? animationConfigId = jsonConvert.convert<int>(
      json['animationConfigId']);
  if (animationConfigId != null) {
    homeNewRecommendDataRecordsRoomLevelConfigDto.animationConfigId =
        animationConfigId;
  }
  final int? nickColorUsable = jsonConvert.convert<int>(
      json['nickColorUsable']);
  if (nickColorUsable != null) {
    homeNewRecommendDataRecordsRoomLevelConfigDto.nickColorUsable =
        nickColorUsable;
  }
  final int? nickColorConfigId = jsonConvert.convert<int>(
      json['nickColorConfigId']);
  if (nickColorConfigId != null) {
    homeNewRecommendDataRecordsRoomLevelConfigDto.nickColorConfigId =
        nickColorConfigId;
  }
  final int? textColorUsable = jsonConvert.convert<int>(
      json['textColorUsable']);
  if (textColorUsable != null) {
    homeNewRecommendDataRecordsRoomLevelConfigDto.textColorUsable =
        textColorUsable;
  }
  final int? textColorConfigId = jsonConvert.convert<int>(
      json['textColorConfigId']);
  if (textColorConfigId != null) {
    homeNewRecommendDataRecordsRoomLevelConfigDto.textColorConfigId =
        textColorConfigId;
  }
  final int? birthdayUsable = jsonConvert.convert<int>(json['birthdayUsable']);
  if (birthdayUsable != null) {
    homeNewRecommendDataRecordsRoomLevelConfigDto.birthdayUsable =
        birthdayUsable;
  }
  final int? birthdayRightsPackageId = jsonConvert.convert<int>(
      json['birthdayRightsPackageId']);
  if (birthdayRightsPackageId != null) {
    homeNewRecommendDataRecordsRoomLevelConfigDto.birthdayRightsPackageId =
        birthdayRightsPackageId;
  }
  final int? invisibleRankUsable = jsonConvert.convert<int>(
      json['invisibleRankUsable']);
  if (invisibleRankUsable != null) {
    homeNewRecommendDataRecordsRoomLevelConfigDto.invisibleRankUsable =
        invisibleRankUsable;
  }
  final String? invisibleRankNick = jsonConvert.convert<String>(
      json['invisibleRankNick']);
  if (invisibleRankNick != null) {
    homeNewRecommendDataRecordsRoomLevelConfigDto.invisibleRankNick =
        invisibleRankNick;
  }
  final int? invisibleRoomUsable = jsonConvert.convert<int>(
      json['invisibleRoomUsable']);
  if (invisibleRoomUsable != null) {
    homeNewRecommendDataRecordsRoomLevelConfigDto.invisibleRoomUsable =
        invisibleRoomUsable;
  }
  final int? supportUsable = jsonConvert.convert<int>(json['supportUsable']);
  if (supportUsable != null) {
    homeNewRecommendDataRecordsRoomLevelConfigDto.supportUsable = supportUsable;
  }
  final int? productCreateUsable = jsonConvert.convert<int>(
      json['productCreateUsable']);
  if (productCreateUsable != null) {
    homeNewRecommendDataRecordsRoomLevelConfigDto.productCreateUsable =
        productCreateUsable;
  }
  return homeNewRecommendDataRecordsRoomLevelConfigDto;
}

Map<String, dynamic> $HomeNewRecommendDataRecordsRoomLevelConfigDtoToJson(
    HomeNewRecommendDataRecordsRoomLevelConfigDto entity) {
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

extension HomeNewRecommendDataRecordsRoomLevelConfigDtoExtension on HomeNewRecommendDataRecordsRoomLevelConfigDto {
  HomeNewRecommendDataRecordsRoomLevelConfigDto copyWith({
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
    return HomeNewRecommendDataRecordsRoomLevelConfigDto()
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

HomeNewRecommendDataRecordsNobleLevelDto $HomeNewRecommendDataRecordsNobleLevelDtoFromJson(
    Map<String, dynamic> json) {
  final HomeNewRecommendDataRecordsNobleLevelDto homeNewRecommendDataRecordsNobleLevelDto = HomeNewRecommendDataRecordsNobleLevelDto();
  final HomeNewRecommendDataRecordsNobleLevelDtoUserCurrent? userCurrent = jsonConvert
      .convert<HomeNewRecommendDataRecordsNobleLevelDtoUserCurrent>(
      json['userCurrent']);
  if (userCurrent != null) {
    homeNewRecommendDataRecordsNobleLevelDto.userCurrent = userCurrent;
  }
  final HomeNewRecommendDataRecordsNobleLevelDtoLevelBase? levelBase = jsonConvert
      .convert<HomeNewRecommendDataRecordsNobleLevelDtoLevelBase>(
      json['levelBase']);
  if (levelBase != null) {
    homeNewRecommendDataRecordsNobleLevelDto.levelBase = levelBase;
  }
  final HomeNewRecommendDataRecordsNobleLevelDtoPurchaseRecord? purchaseRecord = jsonConvert
      .convert<HomeNewRecommendDataRecordsNobleLevelDtoPurchaseRecord>(
      json['purchaseRecord']);
  if (purchaseRecord != null) {
    homeNewRecommendDataRecordsNobleLevelDto.purchaseRecord = purchaseRecord;
  }
  final List<
      HomeNewRecommendDataRecordsNobleLevelDtoPrivileges>? privileges = (json['privileges'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<
          HomeNewRecommendDataRecordsNobleLevelDtoPrivileges>(
          e) as HomeNewRecommendDataRecordsNobleLevelDtoPrivileges).toList();
  if (privileges != null) {
    homeNewRecommendDataRecordsNobleLevelDto.privileges = privileges;
  }
  return homeNewRecommendDataRecordsNobleLevelDto;
}

Map<String, dynamic> $HomeNewRecommendDataRecordsNobleLevelDtoToJson(
    HomeNewRecommendDataRecordsNobleLevelDto entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['userCurrent'] = entity.userCurrent.toJson();
  data['levelBase'] = entity.levelBase.toJson();
  data['purchaseRecord'] = entity.purchaseRecord.toJson();
  data['privileges'] = entity.privileges.map((v) => v.toJson()).toList();
  return data;
}

extension HomeNewRecommendDataRecordsNobleLevelDtoExtension on HomeNewRecommendDataRecordsNobleLevelDto {
  HomeNewRecommendDataRecordsNobleLevelDto copyWith({
    HomeNewRecommendDataRecordsNobleLevelDtoUserCurrent? userCurrent,
    HomeNewRecommendDataRecordsNobleLevelDtoLevelBase? levelBase,
    HomeNewRecommendDataRecordsNobleLevelDtoPurchaseRecord? purchaseRecord,
    List<HomeNewRecommendDataRecordsNobleLevelDtoPrivileges>? privileges,
  }) {
    return HomeNewRecommendDataRecordsNobleLevelDto()
      ..userCurrent = userCurrent ?? this.userCurrent
      ..levelBase = levelBase ?? this.levelBase
      ..purchaseRecord = purchaseRecord ?? this.purchaseRecord
      ..privileges = privileges ?? this.privileges;
  }
}

HomeNewRecommendDataRecordsNobleLevelDtoUserCurrent $HomeNewRecommendDataRecordsNobleLevelDtoUserCurrentFromJson(
    Map<String, dynamic> json) {
  final HomeNewRecommendDataRecordsNobleLevelDtoUserCurrent homeNewRecommendDataRecordsNobleLevelDtoUserCurrent = HomeNewRecommendDataRecordsNobleLevelDtoUserCurrent();
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    homeNewRecommendDataRecordsNobleLevelDtoUserCurrent.userId = userId;
  }
  final int? nobleLevelId = jsonConvert.convert<int>(json['nobleLevelId']);
  if (nobleLevelId != null) {
    homeNewRecommendDataRecordsNobleLevelDtoUserCurrent.nobleLevelId =
        nobleLevelId;
  }
  final String? nobleName = jsonConvert.convert<String>(json['nobleName']);
  if (nobleName != null) {
    homeNewRecommendDataRecordsNobleLevelDtoUserCurrent.nobleName = nobleName;
  }
  final int? levelFlag = jsonConvert.convert<int>(json['levelFlag']);
  if (levelFlag != null) {
    homeNewRecommendDataRecordsNobleLevelDtoUserCurrent.levelFlag = levelFlag;
  }
  final String? startTime = jsonConvert.convert<String>(json['startTime']);
  if (startTime != null) {
    homeNewRecommendDataRecordsNobleLevelDtoUserCurrent.startTime = startTime;
  }
  final String? endTime = jsonConvert.convert<String>(json['endTime']);
  if (endTime != null) {
    homeNewRecommendDataRecordsNobleLevelDtoUserCurrent.endTime = endTime;
  }
  final int? remainingDays = jsonConvert.convert<int>(json['remainingDays']);
  if (remainingDays != null) {
    homeNewRecommendDataRecordsNobleLevelDtoUserCurrent.remainingDays =
        remainingDays;
  }
  return homeNewRecommendDataRecordsNobleLevelDtoUserCurrent;
}

Map<String, dynamic> $HomeNewRecommendDataRecordsNobleLevelDtoUserCurrentToJson(
    HomeNewRecommendDataRecordsNobleLevelDtoUserCurrent entity) {
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

extension HomeNewRecommendDataRecordsNobleLevelDtoUserCurrentExtension on HomeNewRecommendDataRecordsNobleLevelDtoUserCurrent {
  HomeNewRecommendDataRecordsNobleLevelDtoUserCurrent copyWith({
    int? userId,
    int? nobleLevelId,
    String? nobleName,
    int? levelFlag,
    String? startTime,
    String? endTime,
    int? remainingDays,
  }) {
    return HomeNewRecommendDataRecordsNobleLevelDtoUserCurrent()
      ..userId = userId ?? this.userId
      ..nobleLevelId = nobleLevelId ?? this.nobleLevelId
      ..nobleName = nobleName ?? this.nobleName
      ..levelFlag = levelFlag ?? this.levelFlag
      ..startTime = startTime ?? this.startTime
      ..endTime = endTime ?? this.endTime
      ..remainingDays = remainingDays ?? this.remainingDays;
  }
}

HomeNewRecommendDataRecordsNobleLevelDtoLevelBase $HomeNewRecommendDataRecordsNobleLevelDtoLevelBaseFromJson(
    Map<String, dynamic> json) {
  final HomeNewRecommendDataRecordsNobleLevelDtoLevelBase homeNewRecommendDataRecordsNobleLevelDtoLevelBase = HomeNewRecommendDataRecordsNobleLevelDtoLevelBase();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    homeNewRecommendDataRecordsNobleLevelDtoLevelBase.id = id;
  }
  final int? goodsId = jsonConvert.convert<int>(json['goodsId']);
  if (goodsId != null) {
    homeNewRecommendDataRecordsNobleLevelDtoLevelBase.goodsId = goodsId;
  }
  final int? propId = jsonConvert.convert<int>(json['propId']);
  if (propId != null) {
    homeNewRecommendDataRecordsNobleLevelDtoLevelBase.propId = propId;
  }
  final String? levelName = jsonConvert.convert<String>(json['levelName']);
  if (levelName != null) {
    homeNewRecommendDataRecordsNobleLevelDtoLevelBase.levelName = levelName;
  }
  final int? levelFlag = jsonConvert.convert<int>(json['levelFlag']);
  if (levelFlag != null) {
    homeNewRecommendDataRecordsNobleLevelDtoLevelBase.levelFlag = levelFlag;
  }
  final String? mainImageUrl = jsonConvert.convert<String>(
      json['mainImageUrl']);
  if (mainImageUrl != null) {
    homeNewRecommendDataRecordsNobleLevelDtoLevelBase.mainImageUrl =
        mainImageUrl;
  }
  final String? badgeImageUrl = jsonConvert.convert<String>(
      json['badgeImageUrl']);
  if (badgeImageUrl != null) {
    homeNewRecommendDataRecordsNobleLevelDtoLevelBase.badgeImageUrl =
        badgeImageUrl;
  }
  final String? middleImageUrl = jsonConvert.convert<String>(
      json['middleImageUrl']);
  if (middleImageUrl != null) {
    homeNewRecommendDataRecordsNobleLevelDtoLevelBase.middleImageUrl =
        middleImageUrl;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    homeNewRecommendDataRecordsNobleLevelDtoLevelBase.description = description;
  }
  final int? purchaseType = jsonConvert.convert<int>(json['purchaseType']);
  if (purchaseType != null) {
    homeNewRecommendDataRecordsNobleLevelDtoLevelBase.purchaseType =
        purchaseType;
  }
  final int? firstPrice = jsonConvert.convert<int>(json['firstPrice']);
  if (firstPrice != null) {
    homeNewRecommendDataRecordsNobleLevelDtoLevelBase.firstPrice = firstPrice;
  }
  final int? renewPrice = jsonConvert.convert<int>(json['renewPrice']);
  if (renewPrice != null) {
    homeNewRecommendDataRecordsNobleLevelDtoLevelBase.renewPrice = renewPrice;
  }
  final int? firstSkuId = jsonConvert.convert<int>(json['firstSkuId']);
  if (firstSkuId != null) {
    homeNewRecommendDataRecordsNobleLevelDtoLevelBase.firstSkuId = firstSkuId;
  }
  final int? renewSkuId = jsonConvert.convert<int>(json['renewSkuId']);
  if (renewSkuId != null) {
    homeNewRecommendDataRecordsNobleLevelDtoLevelBase.renewSkuId = renewSkuId;
  }
  final int? firstGiftType = jsonConvert.convert<int>(json['firstGiftType']);
  if (firstGiftType != null) {
    homeNewRecommendDataRecordsNobleLevelDtoLevelBase.firstGiftType =
        firstGiftType;
  }
  final int? firstGiftId = jsonConvert.convert<int>(json['firstGiftId']);
  if (firstGiftId != null) {
    homeNewRecommendDataRecordsNobleLevelDtoLevelBase.firstGiftId = firstGiftId;
  }
  final String? firstGiftName = jsonConvert.convert<String>(
      json['firstGiftName']);
  if (firstGiftName != null) {
    homeNewRecommendDataRecordsNobleLevelDtoLevelBase.firstGiftName =
        firstGiftName;
  }
  final String? firstGiftUrl = jsonConvert.convert<String>(
      json['firstGiftUrl']);
  if (firstGiftUrl != null) {
    homeNewRecommendDataRecordsNobleLevelDtoLevelBase.firstGiftUrl =
        firstGiftUrl;
  }
  final int? firstGiftAmount = jsonConvert.convert<int>(
      json['firstGiftAmount']);
  if (firstGiftAmount != null) {
    homeNewRecommendDataRecordsNobleLevelDtoLevelBase.firstGiftAmount =
        firstGiftAmount;
  }
  final int? firstGiftPurchaseType = jsonConvert.convert<int>(
      json['firstGiftPurchaseType']);
  if (firstGiftPurchaseType != null) {
    homeNewRecommendDataRecordsNobleLevelDtoLevelBase.firstGiftPurchaseType =
        firstGiftPurchaseType;
  }
  final int? firstGiftPrice = jsonConvert.convert<int>(json['firstGiftPrice']);
  if (firstGiftPrice != null) {
    homeNewRecommendDataRecordsNobleLevelDtoLevelBase.firstGiftPrice =
        firstGiftPrice;
  }
  final bool? directPurchase = jsonConvert.convert<bool>(
      json['directPurchase']);
  if (directPurchase != null) {
    homeNewRecommendDataRecordsNobleLevelDtoLevelBase.directPurchase =
        directPurchase;
  }
  final int? purchaseDuration = jsonConvert.convert<int>(
      json['purchaseDuration']);
  if (purchaseDuration != null) {
    homeNewRecommendDataRecordsNobleLevelDtoLevelBase.purchaseDuration =
        purchaseDuration;
  }
  return homeNewRecommendDataRecordsNobleLevelDtoLevelBase;
}

Map<String, dynamic> $HomeNewRecommendDataRecordsNobleLevelDtoLevelBaseToJson(
    HomeNewRecommendDataRecordsNobleLevelDtoLevelBase entity) {
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

extension HomeNewRecommendDataRecordsNobleLevelDtoLevelBaseExtension on HomeNewRecommendDataRecordsNobleLevelDtoLevelBase {
  HomeNewRecommendDataRecordsNobleLevelDtoLevelBase copyWith({
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
    return HomeNewRecommendDataRecordsNobleLevelDtoLevelBase()
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

HomeNewRecommendDataRecordsNobleLevelDtoPurchaseRecord $HomeNewRecommendDataRecordsNobleLevelDtoPurchaseRecordFromJson(
    Map<String, dynamic> json) {
  final HomeNewRecommendDataRecordsNobleLevelDtoPurchaseRecord homeNewRecommendDataRecordsNobleLevelDtoPurchaseRecord = HomeNewRecommendDataRecordsNobleLevelDtoPurchaseRecord();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    homeNewRecommendDataRecordsNobleLevelDtoPurchaseRecord.id = id;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    homeNewRecommendDataRecordsNobleLevelDtoPurchaseRecord.userId = userId;
  }
  final int? nobleLevelId = jsonConvert.convert<int>(json['nobleLevelId']);
  if (nobleLevelId != null) {
    homeNewRecommendDataRecordsNobleLevelDtoPurchaseRecord.nobleLevelId =
        nobleLevelId;
  }
  final String? nobleLevelName = jsonConvert.convert<String>(
      json['nobleLevelName']);
  if (nobleLevelName != null) {
    homeNewRecommendDataRecordsNobleLevelDtoPurchaseRecord.nobleLevelName =
        nobleLevelName;
  }
  final int? purchaseType = jsonConvert.convert<int>(json['purchaseType']);
  if (purchaseType != null) {
    homeNewRecommendDataRecordsNobleLevelDtoPurchaseRecord.purchaseType =
        purchaseType;
  }
  final int? price = jsonConvert.convert<int>(json['price']);
  if (price != null) {
    homeNewRecommendDataRecordsNobleLevelDtoPurchaseRecord.price = price;
  }
  final int? purchaseFlag = jsonConvert.convert<int>(json['purchaseFlag']);
  if (purchaseFlag != null) {
    homeNewRecommendDataRecordsNobleLevelDtoPurchaseRecord.purchaseFlag =
        purchaseFlag;
  }
  final int? durationDays = jsonConvert.convert<int>(json['durationDays']);
  if (durationDays != null) {
    homeNewRecommendDataRecordsNobleLevelDtoPurchaseRecord.durationDays =
        durationDays;
  }
  final String? purchaseTime = jsonConvert.convert<String>(
      json['purchaseTime']);
  if (purchaseTime != null) {
    homeNewRecommendDataRecordsNobleLevelDtoPurchaseRecord.purchaseTime =
        purchaseTime;
  }
  final int? roomId = jsonConvert.convert<int>(json['roomId']);
  if (roomId != null) {
    homeNewRecommendDataRecordsNobleLevelDtoPurchaseRecord.roomId = roomId;
  }
  final int? orderId = jsonConvert.convert<int>(json['orderId']);
  if (orderId != null) {
    homeNewRecommendDataRecordsNobleLevelDtoPurchaseRecord.orderId = orderId;
  }
  final String? orderNo = jsonConvert.convert<String>(json['orderNo']);
  if (orderNo != null) {
    homeNewRecommendDataRecordsNobleLevelDtoPurchaseRecord.orderNo = orderNo;
  }
  return homeNewRecommendDataRecordsNobleLevelDtoPurchaseRecord;
}

Map<String,
    dynamic> $HomeNewRecommendDataRecordsNobleLevelDtoPurchaseRecordToJson(
    HomeNewRecommendDataRecordsNobleLevelDtoPurchaseRecord entity) {
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

extension HomeNewRecommendDataRecordsNobleLevelDtoPurchaseRecordExtension on HomeNewRecommendDataRecordsNobleLevelDtoPurchaseRecord {
  HomeNewRecommendDataRecordsNobleLevelDtoPurchaseRecord copyWith({
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
    return HomeNewRecommendDataRecordsNobleLevelDtoPurchaseRecord()
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

HomeNewRecommendDataRecordsNobleLevelDtoPrivileges $HomeNewRecommendDataRecordsNobleLevelDtoPrivilegesFromJson(
    Map<String, dynamic> json) {
  final HomeNewRecommendDataRecordsNobleLevelDtoPrivileges homeNewRecommendDataRecordsNobleLevelDtoPrivileges = HomeNewRecommendDataRecordsNobleLevelDtoPrivileges();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    homeNewRecommendDataRecordsNobleLevelDtoPrivileges.id = id;
  }
  final String? privilegeName = jsonConvert.convert<String>(
      json['privilegeName']);
  if (privilegeName != null) {
    homeNewRecommendDataRecordsNobleLevelDtoPrivileges.privilegeName =
        privilegeName;
  }
  final int? privilegeType = jsonConvert.convert<int>(json['privilegeType']);
  if (privilegeType != null) {
    homeNewRecommendDataRecordsNobleLevelDtoPrivileges.privilegeType =
        privilegeType;
  }
  final String? privilegeFunction = jsonConvert.convert<String>(
      json['privilegeFunction']);
  if (privilegeFunction != null) {
    homeNewRecommendDataRecordsNobleLevelDtoPrivileges.privilegeFunction =
        privilegeFunction;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    homeNewRecommendDataRecordsNobleLevelDtoPrivileges.description =
        description;
  }
  final String? imageUrl = jsonConvert.convert<String>(json['imageUrl']);
  if (imageUrl != null) {
    homeNewRecommendDataRecordsNobleLevelDtoPrivileges.imageUrl = imageUrl;
  }
  final bool? enabled = jsonConvert.convert<bool>(json['enabled']);
  if (enabled != null) {
    homeNewRecommendDataRecordsNobleLevelDtoPrivileges.enabled = enabled;
  }
  return homeNewRecommendDataRecordsNobleLevelDtoPrivileges;
}

Map<String, dynamic> $HomeNewRecommendDataRecordsNobleLevelDtoPrivilegesToJson(
    HomeNewRecommendDataRecordsNobleLevelDtoPrivileges entity) {
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

extension HomeNewRecommendDataRecordsNobleLevelDtoPrivilegesExtension on HomeNewRecommendDataRecordsNobleLevelDtoPrivileges {
  HomeNewRecommendDataRecordsNobleLevelDtoPrivileges copyWith({
    int? id,
    String? privilegeName,
    int? privilegeType,
    String? privilegeFunction,
    String? description,
    String? imageUrl,
    bool? enabled,
  }) {
    return HomeNewRecommendDataRecordsNobleLevelDtoPrivileges()
      ..id = id ?? this.id
      ..privilegeName = privilegeName ?? this.privilegeName
      ..privilegeType = privilegeType ?? this.privilegeType
      ..privilegeFunction = privilegeFunction ?? this.privilegeFunction
      ..description = description ?? this.description
      ..imageUrl = imageUrl ?? this.imageUrl
      ..enabled = enabled ?? this.enabled;
  }
}

HomeNewRecommendDataRecordsCategoryList $HomeNewRecommendDataRecordsCategoryListFromJson(
    Map<String, dynamic> json) {
  final HomeNewRecommendDataRecordsCategoryList homeNewRecommendDataRecordsCategoryList = HomeNewRecommendDataRecordsCategoryList();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    homeNewRecommendDataRecordsCategoryList.id = id;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    homeNewRecommendDataRecordsCategoryList.userId = userId;
  }
  final int? categoryId = jsonConvert.convert<int>(json['categoryId']);
  if (categoryId != null) {
    homeNewRecommendDataRecordsCategoryList.categoryId = categoryId;
  }
  final String? categoryName = jsonConvert.convert<String>(
      json['categoryName']);
  if (categoryName != null) {
    homeNewRecommendDataRecordsCategoryList.categoryName = categoryName;
  }
  final String? introduced = jsonConvert.convert<String>(json['introduced']);
  if (introduced != null) {
    homeNewRecommendDataRecordsCategoryList.introduced = introduced;
  }
  final String? maxStandard = jsonConvert.convert<String>(json['maxStandard']);
  if (maxStandard != null) {
    homeNewRecommendDataRecordsCategoryList.maxStandard = maxStandard;
  }
  final int? receiveStatus = jsonConvert.convert<int>(json['receiveStatus']);
  if (receiveStatus != null) {
    homeNewRecommendDataRecordsCategoryList.receiveStatus = receiveStatus;
  }
  final String? categoryFileUrl = jsonConvert.convert<String>(
      json['categoryFileUrl']);
  if (categoryFileUrl != null) {
    homeNewRecommendDataRecordsCategoryList.categoryFileUrl = categoryFileUrl;
  }
  final String? categoryCoverImageUrl = jsonConvert.convert<String>(
      json['categoryCoverImageUrl']);
  if (categoryCoverImageUrl != null) {
    homeNewRecommendDataRecordsCategoryList.categoryCoverImageUrl =
        categoryCoverImageUrl;
  }
  final String? backgroundFileUrl = jsonConvert.convert<String>(
      json['backgroundFileUrl']);
  if (backgroundFileUrl != null) {
    homeNewRecommendDataRecordsCategoryList.backgroundFileUrl =
        backgroundFileUrl;
  }
  final String? voiceIntroduced = jsonConvert.convert<String>(
      json['voiceIntroduced']);
  if (voiceIntroduced != null) {
    homeNewRecommendDataRecordsCategoryList.voiceIntroduced = voiceIntroduced;
  }
  final List<
      HomeNewRecommendDataRecordsCategoryListFileList>? fileList = (json['fileList'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<
          HomeNewRecommendDataRecordsCategoryListFileList>(
          e) as HomeNewRecommendDataRecordsCategoryListFileList).toList();
  if (fileList != null) {
    homeNewRecommendDataRecordsCategoryList.fileList = fileList;
  }
  final List<
      HomeNewRecommendDataRecordsCategoryListFieldList>? fieldList = (json['fieldList'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<
          HomeNewRecommendDataRecordsCategoryListFieldList>(
          e) as HomeNewRecommendDataRecordsCategoryListFieldList).toList();
  if (fieldList != null) {
    homeNewRecommendDataRecordsCategoryList.fieldList = fieldList;
  }
  final String? field1 = jsonConvert.convert<String>(json['field1']);
  if (field1 != null) {
    homeNewRecommendDataRecordsCategoryList.field1 = field1;
  }
  final String? field2 = jsonConvert.convert<String>(json['field2']);
  if (field2 != null) {
    homeNewRecommendDataRecordsCategoryList.field2 = field2;
  }
  final String? field3 = jsonConvert.convert<String>(json['field3']);
  if (field3 != null) {
    homeNewRecommendDataRecordsCategoryList.field3 = field3;
  }
  final String? field4 = jsonConvert.convert<String>(json['field4']);
  if (field4 != null) {
    homeNewRecommendDataRecordsCategoryList.field4 = field4;
  }
  final String? field5 = jsonConvert.convert<String>(json['field5']);
  if (field5 != null) {
    homeNewRecommendDataRecordsCategoryList.field5 = field5;
  }
  final String? field6 = jsonConvert.convert<String>(json['field6']);
  if (field6 != null) {
    homeNewRecommendDataRecordsCategoryList.field6 = field6;
  }
  final String? field7 = jsonConvert.convert<String>(json['field7']);
  if (field7 != null) {
    homeNewRecommendDataRecordsCategoryList.field7 = field7;
  }
  final String? field8 = jsonConvert.convert<String>(json['field8']);
  if (field8 != null) {
    homeNewRecommendDataRecordsCategoryList.field8 = field8;
  }
  final String? field9 = jsonConvert.convert<String>(json['field9']);
  if (field9 != null) {
    homeNewRecommendDataRecordsCategoryList.field9 = field9;
  }
  final String? field10 = jsonConvert.convert<String>(json['field10']);
  if (field10 != null) {
    homeNewRecommendDataRecordsCategoryList.field10 = field10;
  }
  final String? field11 = jsonConvert.convert<String>(json['field11']);
  if (field11 != null) {
    homeNewRecommendDataRecordsCategoryList.field11 = field11;
  }
  final String? field12 = jsonConvert.convert<String>(json['field12']);
  if (field12 != null) {
    homeNewRecommendDataRecordsCategoryList.field12 = field12;
  }
  final String? field13 = jsonConvert.convert<String>(json['field13']);
  if (field13 != null) {
    homeNewRecommendDataRecordsCategoryList.field13 = field13;
  }
  final String? field14 = jsonConvert.convert<String>(json['field14']);
  if (field14 != null) {
    homeNewRecommendDataRecordsCategoryList.field14 = field14;
  }
  final String? field15 = jsonConvert.convert<String>(json['field15']);
  if (field15 != null) {
    homeNewRecommendDataRecordsCategoryList.field15 = field15;
  }
  final List<
      HomeNewRecommendDataRecordsCategoryListPriceList>? priceList = (json['priceList'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<
          HomeNewRecommendDataRecordsCategoryListPriceList>(
          e) as HomeNewRecommendDataRecordsCategoryListPriceList).toList();
  if (priceList != null) {
    homeNewRecommendDataRecordsCategoryList.priceList = priceList;
  }
  final int? roomLevel = jsonConvert.convert<int>(json['roomLevel']);
  if (roomLevel != null) {
    homeNewRecommendDataRecordsCategoryList.roomLevel = roomLevel;
  }
  final HomeNewRecommendDataRecordsCategoryListRoomLevelConfigDto? roomLevelConfigDto = jsonConvert
      .convert<HomeNewRecommendDataRecordsCategoryListRoomLevelConfigDto>(
      json['roomLevelConfigDto']);
  if (roomLevelConfigDto != null) {
    homeNewRecommendDataRecordsCategoryList.roomLevelConfigDto =
        roomLevelConfigDto;
  }
  return homeNewRecommendDataRecordsCategoryList;
}

Map<String, dynamic> $HomeNewRecommendDataRecordsCategoryListToJson(
    HomeNewRecommendDataRecordsCategoryList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['userId'] = entity.userId;
  data['categoryId'] = entity.categoryId;
  data['categoryName'] = entity.categoryName;
  data['introduced'] = entity.introduced;
  data['maxStandard'] = entity.maxStandard;
  data['receiveStatus'] = entity.receiveStatus;
  data['categoryFileUrl'] = entity.categoryFileUrl;
  data['categoryCoverImageUrl'] = entity.categoryCoverImageUrl;
  data['backgroundFileUrl'] = entity.backgroundFileUrl;
  data['voiceIntroduced'] = entity.voiceIntroduced;
  data['fileList'] = entity.fileList.map((v) => v.toJson()).toList();
  data['fieldList'] = entity.fieldList.map((v) => v.toJson()).toList();
  data['field1'] = entity.field1;
  data['field2'] = entity.field2;
  data['field3'] = entity.field3;
  data['field4'] = entity.field4;
  data['field5'] = entity.field5;
  data['field6'] = entity.field6;
  data['field7'] = entity.field7;
  data['field8'] = entity.field8;
  data['field9'] = entity.field9;
  data['field10'] = entity.field10;
  data['field11'] = entity.field11;
  data['field12'] = entity.field12;
  data['field13'] = entity.field13;
  data['field14'] = entity.field14;
  data['field15'] = entity.field15;
  data['priceList'] = entity.priceList.map((v) => v.toJson()).toList();
  data['roomLevel'] = entity.roomLevel;
  data['roomLevelConfigDto'] = entity.roomLevelConfigDto.toJson();
  return data;
}

extension HomeNewRecommendDataRecordsCategoryListExtension on HomeNewRecommendDataRecordsCategoryList {
  HomeNewRecommendDataRecordsCategoryList copyWith({
    int? id,
    int? userId,
    int? categoryId,
    String? categoryName,
    String? introduced,
    String? maxStandard,
    int? receiveStatus,
    String? categoryFileUrl,
    String? categoryCoverImageUrl,
    String? backgroundFileUrl,
    String? voiceIntroduced,
    List<HomeNewRecommendDataRecordsCategoryListFileList>? fileList,
    List<HomeNewRecommendDataRecordsCategoryListFieldList>? fieldList,
    String? field1,
    String? field2,
    String? field3,
    String? field4,
    String? field5,
    String? field6,
    String? field7,
    String? field8,
    String? field9,
    String? field10,
    String? field11,
    String? field12,
    String? field13,
    String? field14,
    String? field15,
    List<HomeNewRecommendDataRecordsCategoryListPriceList>? priceList,
    int? roomLevel,
    HomeNewRecommendDataRecordsCategoryListRoomLevelConfigDto? roomLevelConfigDto,
  }) {
    return HomeNewRecommendDataRecordsCategoryList()
      ..id = id ?? this.id
      ..userId = userId ?? this.userId
      ..categoryId = categoryId ?? this.categoryId
      ..categoryName = categoryName ?? this.categoryName
      ..introduced = introduced ?? this.introduced
      ..maxStandard = maxStandard ?? this.maxStandard
      ..receiveStatus = receiveStatus ?? this.receiveStatus
      ..categoryFileUrl = categoryFileUrl ?? this.categoryFileUrl
      ..categoryCoverImageUrl = categoryCoverImageUrl ??
          this.categoryCoverImageUrl
      ..backgroundFileUrl = backgroundFileUrl ?? this.backgroundFileUrl
      ..voiceIntroduced = voiceIntroduced ?? this.voiceIntroduced
      ..fileList = fileList ?? this.fileList
      ..fieldList = fieldList ?? this.fieldList
      ..field1 = field1 ?? this.field1
      ..field2 = field2 ?? this.field2
      ..field3 = field3 ?? this.field3
      ..field4 = field4 ?? this.field4
      ..field5 = field5 ?? this.field5
      ..field6 = field6 ?? this.field6
      ..field7 = field7 ?? this.field7
      ..field8 = field8 ?? this.field8
      ..field9 = field9 ?? this.field9
      ..field10 = field10 ?? this.field10
      ..field11 = field11 ?? this.field11
      ..field12 = field12 ?? this.field12
      ..field13 = field13 ?? this.field13
      ..field14 = field14 ?? this.field14
      ..field15 = field15 ?? this.field15
      ..priceList = priceList ?? this.priceList
      ..roomLevel = roomLevel ?? this.roomLevel
      ..roomLevelConfigDto = roomLevelConfigDto ?? this.roomLevelConfigDto;
  }
}

HomeNewRecommendDataRecordsCategoryListFileList $HomeNewRecommendDataRecordsCategoryListFileListFromJson(
    Map<String, dynamic> json) {
  final HomeNewRecommendDataRecordsCategoryListFileList homeNewRecommendDataRecordsCategoryListFileList = HomeNewRecommendDataRecordsCategoryListFileList();
  final int? accompanyCategoryId = jsonConvert.convert<int>(
      json['accompanyCategoryId']);
  if (accompanyCategoryId != null) {
    homeNewRecommendDataRecordsCategoryListFileList.accompanyCategoryId =
        accompanyCategoryId;
  }
  final int? audioDuration = jsonConvert.convert<int>(json['audioDuration']);
  if (audioDuration != null) {
    homeNewRecommendDataRecordsCategoryListFileList.audioDuration =
        audioDuration;
  }
  final String? fileId = jsonConvert.convert<String>(json['fileId']);
  if (fileId != null) {
    homeNewRecommendDataRecordsCategoryListFileList.fileId = fileId;
  }
  final String? fileUrl = jsonConvert.convert<String>(json['fileUrl']);
  if (fileUrl != null) {
    homeNewRecommendDataRecordsCategoryListFileList.fileUrl = fileUrl;
  }
  final String? fileType = jsonConvert.convert<String>(json['fileType']);
  if (fileType != null) {
    homeNewRecommendDataRecordsCategoryListFileList.fileType = fileType;
  }
  final int? sort = jsonConvert.convert<int>(json['sort']);
  if (sort != null) {
    homeNewRecommendDataRecordsCategoryListFileList.sort = sort;
  }
  return homeNewRecommendDataRecordsCategoryListFileList;
}

Map<String, dynamic> $HomeNewRecommendDataRecordsCategoryListFileListToJson(
    HomeNewRecommendDataRecordsCategoryListFileList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['accompanyCategoryId'] = entity.accompanyCategoryId;
  data['audioDuration'] = entity.audioDuration;
  data['fileId'] = entity.fileId;
  data['fileUrl'] = entity.fileUrl;
  data['fileType'] = entity.fileType;
  data['sort'] = entity.sort;
  return data;
}

extension HomeNewRecommendDataRecordsCategoryListFileListExtension on HomeNewRecommendDataRecordsCategoryListFileList {
  HomeNewRecommendDataRecordsCategoryListFileList copyWith({
    int? accompanyCategoryId,
    int? audioDuration,
    String? fileId,
    String? fileUrl,
    String? fileType,
    int? sort,
  }) {
    return HomeNewRecommendDataRecordsCategoryListFileList()
      ..accompanyCategoryId = accompanyCategoryId ?? this.accompanyCategoryId
      ..audioDuration = audioDuration ?? this.audioDuration
      ..fileId = fileId ?? this.fileId
      ..fileUrl = fileUrl ?? this.fileUrl
      ..fileType = fileType ?? this.fileType
      ..sort = sort ?? this.sort;
  }
}

HomeNewRecommendDataRecordsCategoryListFieldList $HomeNewRecommendDataRecordsCategoryListFieldListFromJson(
    Map<String, dynamic> json) {
  final HomeNewRecommendDataRecordsCategoryListFieldList homeNewRecommendDataRecordsCategoryListFieldList = HomeNewRecommendDataRecordsCategoryListFieldList();
  final HomeNewRecommendDataRecordsCategoryListFieldListAdditionalProp1? additionalProp1 = jsonConvert
      .convert<HomeNewRecommendDataRecordsCategoryListFieldListAdditionalProp1>(
      json['additionalProp1']);
  if (additionalProp1 != null) {
    homeNewRecommendDataRecordsCategoryListFieldList.additionalProp1 =
        additionalProp1;
  }
  final HomeNewRecommendDataRecordsCategoryListFieldListAdditionalProp2? additionalProp2 = jsonConvert
      .convert<HomeNewRecommendDataRecordsCategoryListFieldListAdditionalProp2>(
      json['additionalProp2']);
  if (additionalProp2 != null) {
    homeNewRecommendDataRecordsCategoryListFieldList.additionalProp2 =
        additionalProp2;
  }
  final HomeNewRecommendDataRecordsCategoryListFieldListAdditionalProp3? additionalProp3 = jsonConvert
      .convert<HomeNewRecommendDataRecordsCategoryListFieldListAdditionalProp3>(
      json['additionalProp3']);
  if (additionalProp3 != null) {
    homeNewRecommendDataRecordsCategoryListFieldList.additionalProp3 =
        additionalProp3;
  }
  return homeNewRecommendDataRecordsCategoryListFieldList;
}

Map<String, dynamic> $HomeNewRecommendDataRecordsCategoryListFieldListToJson(
    HomeNewRecommendDataRecordsCategoryListFieldList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['additionalProp1'] = entity.additionalProp1.toJson();
  data['additionalProp2'] = entity.additionalProp2.toJson();
  data['additionalProp3'] = entity.additionalProp3.toJson();
  return data;
}

extension HomeNewRecommendDataRecordsCategoryListFieldListExtension on HomeNewRecommendDataRecordsCategoryListFieldList {
  HomeNewRecommendDataRecordsCategoryListFieldList copyWith({
    HomeNewRecommendDataRecordsCategoryListFieldListAdditionalProp1? additionalProp1,
    HomeNewRecommendDataRecordsCategoryListFieldListAdditionalProp2? additionalProp2,
    HomeNewRecommendDataRecordsCategoryListFieldListAdditionalProp3? additionalProp3,
  }) {
    return HomeNewRecommendDataRecordsCategoryListFieldList()
      ..additionalProp1 = additionalProp1 ?? this.additionalProp1
      ..additionalProp2 = additionalProp2 ?? this.additionalProp2
      ..additionalProp3 = additionalProp3 ?? this.additionalProp3;
  }
}

HomeNewRecommendDataRecordsCategoryListFieldListAdditionalProp1 $HomeNewRecommendDataRecordsCategoryListFieldListAdditionalProp1FromJson(
    Map<String, dynamic> json) {
  final HomeNewRecommendDataRecordsCategoryListFieldListAdditionalProp1 homeNewRecommendDataRecordsCategoryListFieldListAdditionalProp1 = HomeNewRecommendDataRecordsCategoryListFieldListAdditionalProp1();
  return homeNewRecommendDataRecordsCategoryListFieldListAdditionalProp1;
}

Map<String,
    dynamic> $HomeNewRecommendDataRecordsCategoryListFieldListAdditionalProp1ToJson(
    HomeNewRecommendDataRecordsCategoryListFieldListAdditionalProp1 entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  return data;
}

extension HomeNewRecommendDataRecordsCategoryListFieldListAdditionalProp1Extension on HomeNewRecommendDataRecordsCategoryListFieldListAdditionalProp1 {
}

HomeNewRecommendDataRecordsCategoryListFieldListAdditionalProp2 $HomeNewRecommendDataRecordsCategoryListFieldListAdditionalProp2FromJson(
    Map<String, dynamic> json) {
  final HomeNewRecommendDataRecordsCategoryListFieldListAdditionalProp2 homeNewRecommendDataRecordsCategoryListFieldListAdditionalProp2 = HomeNewRecommendDataRecordsCategoryListFieldListAdditionalProp2();
  return homeNewRecommendDataRecordsCategoryListFieldListAdditionalProp2;
}

Map<String,
    dynamic> $HomeNewRecommendDataRecordsCategoryListFieldListAdditionalProp2ToJson(
    HomeNewRecommendDataRecordsCategoryListFieldListAdditionalProp2 entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  return data;
}

extension HomeNewRecommendDataRecordsCategoryListFieldListAdditionalProp2Extension on HomeNewRecommendDataRecordsCategoryListFieldListAdditionalProp2 {
}

HomeNewRecommendDataRecordsCategoryListFieldListAdditionalProp3 $HomeNewRecommendDataRecordsCategoryListFieldListAdditionalProp3FromJson(
    Map<String, dynamic> json) {
  final HomeNewRecommendDataRecordsCategoryListFieldListAdditionalProp3 homeNewRecommendDataRecordsCategoryListFieldListAdditionalProp3 = HomeNewRecommendDataRecordsCategoryListFieldListAdditionalProp3();
  return homeNewRecommendDataRecordsCategoryListFieldListAdditionalProp3;
}

Map<String,
    dynamic> $HomeNewRecommendDataRecordsCategoryListFieldListAdditionalProp3ToJson(
    HomeNewRecommendDataRecordsCategoryListFieldListAdditionalProp3 entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  return data;
}

extension HomeNewRecommendDataRecordsCategoryListFieldListAdditionalProp3Extension on HomeNewRecommendDataRecordsCategoryListFieldListAdditionalProp3 {
}

HomeNewRecommendDataRecordsCategoryListPriceList $HomeNewRecommendDataRecordsCategoryListPriceListFromJson(
    Map<String, dynamic> json) {
  final HomeNewRecommendDataRecordsCategoryListPriceList homeNewRecommendDataRecordsCategoryListPriceList = HomeNewRecommendDataRecordsCategoryListPriceList();
  final int? minPrice = jsonConvert.convert<int>(json['minPrice']);
  if (minPrice != null) {
    homeNewRecommendDataRecordsCategoryListPriceList.minPrice = minPrice;
  }
  final int? maxPrice = jsonConvert.convert<int>(json['maxPrice']);
  if (maxPrice != null) {
    homeNewRecommendDataRecordsCategoryListPriceList.maxPrice = maxPrice;
  }
  final int? price = jsonConvert.convert<int>(json['price']);
  if (price != null) {
    homeNewRecommendDataRecordsCategoryListPriceList.price = price;
  }
  final String? priceUnit = jsonConvert.convert<String>(json['priceUnit']);
  if (priceUnit != null) {
    homeNewRecommendDataRecordsCategoryListPriceList.priceUnit = priceUnit;
  }
  final int? skuId = jsonConvert.convert<int>(json['skuId']);
  if (skuId != null) {
    homeNewRecommendDataRecordsCategoryListPriceList.skuId = skuId;
  }
  final String? skuName = jsonConvert.convert<String>(json['skuName']);
  if (skuName != null) {
    homeNewRecommendDataRecordsCategoryListPriceList.skuName = skuName;
  }
  final String? showName = jsonConvert.convert<String>(json['showName']);
  if (showName != null) {
    homeNewRecommendDataRecordsCategoryListPriceList.showName = showName;
  }
  final String? accompanyStandard = jsonConvert.convert<String>(
      json['accompanyStandard']);
  if (accompanyStandard != null) {
    homeNewRecommendDataRecordsCategoryListPriceList.accompanyStandard =
        accompanyStandard;
  }
  final int? receiveStatus = jsonConvert.convert<int>(json['receiveStatus']);
  if (receiveStatus != null) {
    homeNewRecommendDataRecordsCategoryListPriceList.receiveStatus =
        receiveStatus;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    homeNewRecommendDataRecordsCategoryListPriceList.icon = icon;
  }
  return homeNewRecommendDataRecordsCategoryListPriceList;
}

Map<String, dynamic> $HomeNewRecommendDataRecordsCategoryListPriceListToJson(
    HomeNewRecommendDataRecordsCategoryListPriceList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['minPrice'] = entity.minPrice;
  data['maxPrice'] = entity.maxPrice;
  data['price'] = entity.price;
  data['priceUnit'] = entity.priceUnit;
  data['skuId'] = entity.skuId;
  data['skuName'] = entity.skuName;
  data['showName'] = entity.showName;
  data['accompanyStandard'] = entity.accompanyStandard;
  data['receiveStatus'] = entity.receiveStatus;
  data['icon'] = entity.icon;
  return data;
}

extension HomeNewRecommendDataRecordsCategoryListPriceListExtension on HomeNewRecommendDataRecordsCategoryListPriceList {
  HomeNewRecommendDataRecordsCategoryListPriceList copyWith({
    int? minPrice,
    int? maxPrice,
    int? price,
    String? priceUnit,
    int? skuId,
    String? skuName,
    String? showName,
    String? accompanyStandard,
    int? receiveStatus,
    String? icon,
  }) {
    return HomeNewRecommendDataRecordsCategoryListPriceList()
      ..minPrice = minPrice ?? this.minPrice
      ..maxPrice = maxPrice ?? this.maxPrice
      ..price = price ?? this.price
      ..priceUnit = priceUnit ?? this.priceUnit
      ..skuId = skuId ?? this.skuId
      ..skuName = skuName ?? this.skuName
      ..showName = showName ?? this.showName
      ..accompanyStandard = accompanyStandard ?? this.accompanyStandard
      ..receiveStatus = receiveStatus ?? this.receiveStatus
      ..icon = icon ?? this.icon;
  }
}

HomeNewRecommendDataRecordsCategoryListRoomLevelConfigDto $HomeNewRecommendDataRecordsCategoryListRoomLevelConfigDtoFromJson(
    Map<String, dynamic> json) {
  final HomeNewRecommendDataRecordsCategoryListRoomLevelConfigDto homeNewRecommendDataRecordsCategoryListRoomLevelConfigDto = HomeNewRecommendDataRecordsCategoryListRoomLevelConfigDto();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    homeNewRecommendDataRecordsCategoryListRoomLevelConfigDto.id = id;
  }
  final String? levelName = jsonConvert.convert<String>(json['levelName']);
  if (levelName != null) {
    homeNewRecommendDataRecordsCategoryListRoomLevelConfigDto.levelName =
        levelName;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    homeNewRecommendDataRecordsCategoryListRoomLevelConfigDto.icon = icon;
  }
  final String? backdrop = jsonConvert.convert<String>(json['backdrop']);
  if (backdrop != null) {
    homeNewRecommendDataRecordsCategoryListRoomLevelConfigDto.backdrop =
        backdrop;
  }
  final String? medal = jsonConvert.convert<String>(json['medal']);
  if (medal != null) {
    homeNewRecommendDataRecordsCategoryListRoomLevelConfigDto.medal = medal;
  }
  final String? homeBackdrop = jsonConvert.convert<String>(
      json['homeBackdrop']);
  if (homeBackdrop != null) {
    homeNewRecommendDataRecordsCategoryListRoomLevelConfigDto.homeBackdrop =
        homeBackdrop;
  }
  final String? pcMedal = jsonConvert.convert<String>(json['pcMedal']);
  if (pcMedal != null) {
    homeNewRecommendDataRecordsCategoryListRoomLevelConfigDto.pcMedal = pcMedal;
  }
  final String? pcIcon = jsonConvert.convert<String>(json['pcIcon']);
  if (pcIcon != null) {
    homeNewRecommendDataRecordsCategoryListRoomLevelConfigDto.pcIcon = pcIcon;
  }
  final int? level = jsonConvert.convert<int>(json['level']);
  if (level != null) {
    homeNewRecommendDataRecordsCategoryListRoomLevelConfigDto.level = level;
  }
  final int? startPoints = jsonConvert.convert<int>(json['startPoints']);
  if (startPoints != null) {
    homeNewRecommendDataRecordsCategoryListRoomLevelConfigDto.startPoints =
        startPoints;
  }
  final int? endPoints = jsonConvert.convert<int>(json['endPoints']);
  if (endPoints != null) {
    homeNewRecommendDataRecordsCategoryListRoomLevelConfigDto.endPoints =
        endPoints;
  }
  final int? medalUsable = jsonConvert.convert<int>(json['medalUsable']);
  if (medalUsable != null) {
    homeNewRecommendDataRecordsCategoryListRoomLevelConfigDto.medalUsable =
        medalUsable;
  }
  final int? recommendUsable = jsonConvert.convert<int>(
      json['recommendUsable']);
  if (recommendUsable != null) {
    homeNewRecommendDataRecordsCategoryListRoomLevelConfigDto.recommendUsable =
        recommendUsable;
  }
  final int? recommendRate = jsonConvert.convert<int>(json['recommendRate']);
  if (recommendRate != null) {
    homeNewRecommendDataRecordsCategoryListRoomLevelConfigDto.recommendRate =
        recommendRate;
  }
  final int? giftUsable = jsonConvert.convert<int>(json['giftUsable']);
  if (giftUsable != null) {
    homeNewRecommendDataRecordsCategoryListRoomLevelConfigDto.giftUsable =
        giftUsable;
  }
  final int? avatarUsable = jsonConvert.convert<int>(json['avatarUsable']);
  if (avatarUsable != null) {
    homeNewRecommendDataRecordsCategoryListRoomLevelConfigDto.avatarUsable =
        avatarUsable;
  }
  final int? avatarConfigId = jsonConvert.convert<int>(json['avatarConfigId']);
  if (avatarConfigId != null) {
    homeNewRecommendDataRecordsCategoryListRoomLevelConfigDto.avatarConfigId =
        avatarConfigId;
  }
  final int? animationUsable = jsonConvert.convert<int>(
      json['animationUsable']);
  if (animationUsable != null) {
    homeNewRecommendDataRecordsCategoryListRoomLevelConfigDto.animationUsable =
        animationUsable;
  }
  final int? animationConfigId = jsonConvert.convert<int>(
      json['animationConfigId']);
  if (animationConfigId != null) {
    homeNewRecommendDataRecordsCategoryListRoomLevelConfigDto
        .animationConfigId = animationConfigId;
  }
  final int? nickColorUsable = jsonConvert.convert<int>(
      json['nickColorUsable']);
  if (nickColorUsable != null) {
    homeNewRecommendDataRecordsCategoryListRoomLevelConfigDto.nickColorUsable =
        nickColorUsable;
  }
  final int? nickColorConfigId = jsonConvert.convert<int>(
      json['nickColorConfigId']);
  if (nickColorConfigId != null) {
    homeNewRecommendDataRecordsCategoryListRoomLevelConfigDto
        .nickColorConfigId = nickColorConfigId;
  }
  final int? textColorUsable = jsonConvert.convert<int>(
      json['textColorUsable']);
  if (textColorUsable != null) {
    homeNewRecommendDataRecordsCategoryListRoomLevelConfigDto.textColorUsable =
        textColorUsable;
  }
  final int? textColorConfigId = jsonConvert.convert<int>(
      json['textColorConfigId']);
  if (textColorConfigId != null) {
    homeNewRecommendDataRecordsCategoryListRoomLevelConfigDto
        .textColorConfigId = textColorConfigId;
  }
  final int? birthdayUsable = jsonConvert.convert<int>(json['birthdayUsable']);
  if (birthdayUsable != null) {
    homeNewRecommendDataRecordsCategoryListRoomLevelConfigDto.birthdayUsable =
        birthdayUsable;
  }
  final int? birthdayRightsPackageId = jsonConvert.convert<int>(
      json['birthdayRightsPackageId']);
  if (birthdayRightsPackageId != null) {
    homeNewRecommendDataRecordsCategoryListRoomLevelConfigDto
        .birthdayRightsPackageId = birthdayRightsPackageId;
  }
  final int? invisibleRankUsable = jsonConvert.convert<int>(
      json['invisibleRankUsable']);
  if (invisibleRankUsable != null) {
    homeNewRecommendDataRecordsCategoryListRoomLevelConfigDto
        .invisibleRankUsable = invisibleRankUsable;
  }
  final String? invisibleRankNick = jsonConvert.convert<String>(
      json['invisibleRankNick']);
  if (invisibleRankNick != null) {
    homeNewRecommendDataRecordsCategoryListRoomLevelConfigDto
        .invisibleRankNick = invisibleRankNick;
  }
  final int? invisibleRoomUsable = jsonConvert.convert<int>(
      json['invisibleRoomUsable']);
  if (invisibleRoomUsable != null) {
    homeNewRecommendDataRecordsCategoryListRoomLevelConfigDto
        .invisibleRoomUsable = invisibleRoomUsable;
  }
  final int? supportUsable = jsonConvert.convert<int>(json['supportUsable']);
  if (supportUsable != null) {
    homeNewRecommendDataRecordsCategoryListRoomLevelConfigDto.supportUsable =
        supportUsable;
  }
  final int? productCreateUsable = jsonConvert.convert<int>(
      json['productCreateUsable']);
  if (productCreateUsable != null) {
    homeNewRecommendDataRecordsCategoryListRoomLevelConfigDto
        .productCreateUsable = productCreateUsable;
  }
  return homeNewRecommendDataRecordsCategoryListRoomLevelConfigDto;
}

Map<String,
    dynamic> $HomeNewRecommendDataRecordsCategoryListRoomLevelConfigDtoToJson(
    HomeNewRecommendDataRecordsCategoryListRoomLevelConfigDto entity) {
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

extension HomeNewRecommendDataRecordsCategoryListRoomLevelConfigDtoExtension on HomeNewRecommendDataRecordsCategoryListRoomLevelConfigDto {
  HomeNewRecommendDataRecordsCategoryListRoomLevelConfigDto copyWith({
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
    return HomeNewRecommendDataRecordsCategoryListRoomLevelConfigDto()
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

HomeNewRecommendDataRecordsUserPropDetailDto $HomeNewRecommendDataRecordsUserPropDetailDtoFromJson(
    Map<String, dynamic> json) {
  final HomeNewRecommendDataRecordsUserPropDetailDto homeNewRecommendDataRecordsUserPropDetailDto = HomeNewRecommendDataRecordsUserPropDetailDto();
  final HomeNewRecommendDataRecordsUserPropDetailDtoChatBubble? chatBubble = jsonConvert
      .convert<HomeNewRecommendDataRecordsUserPropDetailDtoChatBubble>(
      json['chatBubble']);
  if (chatBubble != null) {
    homeNewRecommendDataRecordsUserPropDetailDto.chatBubble = chatBubble;
  }
  final HomeNewRecommendDataRecordsUserPropDetailDtoAvatarFrame? avatarFrame = jsonConvert
      .convert<HomeNewRecommendDataRecordsUserPropDetailDtoAvatarFrame>(
      json['avatarFrame']);
  if (avatarFrame != null) {
    homeNewRecommendDataRecordsUserPropDetailDto.avatarFrame = avatarFrame;
  }
  final HomeNewRecommendDataRecordsUserPropDetailDtoLevelMedal? levelMedal = jsonConvert
      .convert<HomeNewRecommendDataRecordsUserPropDetailDtoLevelMedal>(
      json['levelMedal']);
  if (levelMedal != null) {
    homeNewRecommendDataRecordsUserPropDetailDto.levelMedal = levelMedal;
  }
  final HomeNewRecommendDataRecordsUserPropDetailDtoEntranceEffect? entranceEffect = jsonConvert
      .convert<HomeNewRecommendDataRecordsUserPropDetailDtoEntranceEffect>(
      json['entranceEffect']);
  if (entranceEffect != null) {
    homeNewRecommendDataRecordsUserPropDetailDto.entranceEffect =
        entranceEffect;
  }
  final HomeNewRecommendDataRecordsUserPropDetailDtoCustomNickname? customNickname = jsonConvert
      .convert<HomeNewRecommendDataRecordsUserPropDetailDtoCustomNickname>(
      json['customNickname']);
  if (customNickname != null) {
    homeNewRecommendDataRecordsUserPropDetailDto.customNickname =
        customNickname;
  }
  final HomeNewRecommendDataRecordsUserPropDetailDtoHomepageEffect? homepageEffect = jsonConvert
      .convert<HomeNewRecommendDataRecordsUserPropDetailDtoHomepageEffect>(
      json['homepageEffect']);
  if (homepageEffect != null) {
    homeNewRecommendDataRecordsUserPropDetailDto.homepageEffect =
        homepageEffect;
  }
  final HomeNewRecommendDataRecordsUserPropDetailDtoNameplate? nameplate = jsonConvert
      .convert<HomeNewRecommendDataRecordsUserPropDetailDtoNameplate>(
      json['nameplate']);
  if (nameplate != null) {
    homeNewRecommendDataRecordsUserPropDetailDto.nameplate = nameplate;
  }
  final HomeNewRecommendDataRecordsUserPropDetailDtoMount? mount = jsonConvert
      .convert<HomeNewRecommendDataRecordsUserPropDetailDtoMount>(
      json['mount']);
  if (mount != null) {
    homeNewRecommendDataRecordsUserPropDetailDto.mount = mount;
  }
  final HomeNewRecommendDataRecordsUserPropDetailDtoColorfulText? colorfulText = jsonConvert
      .convert<HomeNewRecommendDataRecordsUserPropDetailDtoColorfulText>(
      json['colorfulText']);
  if (colorfulText != null) {
    homeNewRecommendDataRecordsUserPropDetailDto.colorfulText = colorfulText;
  }
  final HomeNewRecommendDataRecordsUserPropDetailDtoRoomWallpaper? roomWallpaper = jsonConvert
      .convert<HomeNewRecommendDataRecordsUserPropDetailDtoRoomWallpaper>(
      json['roomWallpaper']);
  if (roomWallpaper != null) {
    homeNewRecommendDataRecordsUserPropDetailDto.roomWallpaper = roomWallpaper;
  }
  final HomeNewRecommendDataRecordsUserPropDetailDtoNobleCard? nobleCard = jsonConvert
      .convert<HomeNewRecommendDataRecordsUserPropDetailDtoNobleCard>(
      json['nobleCard']);
  if (nobleCard != null) {
    homeNewRecommendDataRecordsUserPropDetailDto.nobleCard = nobleCard;
  }
  return homeNewRecommendDataRecordsUserPropDetailDto;
}

Map<String, dynamic> $HomeNewRecommendDataRecordsUserPropDetailDtoToJson(
    HomeNewRecommendDataRecordsUserPropDetailDto entity) {
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

extension HomeNewRecommendDataRecordsUserPropDetailDtoExtension on HomeNewRecommendDataRecordsUserPropDetailDto {
  HomeNewRecommendDataRecordsUserPropDetailDto copyWith({
    HomeNewRecommendDataRecordsUserPropDetailDtoChatBubble? chatBubble,
    HomeNewRecommendDataRecordsUserPropDetailDtoAvatarFrame? avatarFrame,
    HomeNewRecommendDataRecordsUserPropDetailDtoLevelMedal? levelMedal,
    HomeNewRecommendDataRecordsUserPropDetailDtoEntranceEffect? entranceEffect,
    HomeNewRecommendDataRecordsUserPropDetailDtoCustomNickname? customNickname,
    HomeNewRecommendDataRecordsUserPropDetailDtoHomepageEffect? homepageEffect,
    HomeNewRecommendDataRecordsUserPropDetailDtoNameplate? nameplate,
    HomeNewRecommendDataRecordsUserPropDetailDtoMount? mount,
    HomeNewRecommendDataRecordsUserPropDetailDtoColorfulText? colorfulText,
    HomeNewRecommendDataRecordsUserPropDetailDtoRoomWallpaper? roomWallpaper,
    HomeNewRecommendDataRecordsUserPropDetailDtoNobleCard? nobleCard,
  }) {
    return HomeNewRecommendDataRecordsUserPropDetailDto()
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

HomeNewRecommendDataRecordsUserPropDetailDtoChatBubble $HomeNewRecommendDataRecordsUserPropDetailDtoChatBubbleFromJson(
    Map<String, dynamic> json) {
  final HomeNewRecommendDataRecordsUserPropDetailDtoChatBubble homeNewRecommendDataRecordsUserPropDetailDtoChatBubble = HomeNewRecommendDataRecordsUserPropDetailDtoChatBubble();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoChatBubble.id = id;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoChatBubble.userId = userId;
  }
  final int? propId = jsonConvert.convert<int>(json['propId']);
  if (propId != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoChatBubble.propId = propId;
  }
  final String? propName = jsonConvert.convert<String>(json['propName']);
  if (propName != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoChatBubble.propName = propName;
  }
  final int? propType = jsonConvert.convert<int>(json['propType']);
  if (propType != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoChatBubble.propType = propType;
  }
  final String? propFormat = jsonConvert.convert<String>(json['propFormat']);
  if (propFormat != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoChatBubble.propFormat =
        propFormat;
  }
  final String? dynamicEffect = jsonConvert.convert<String>(
      json['dynamicEffect']);
  if (dynamicEffect != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoChatBubble.dynamicEffect =
        dynamicEffect;
  }
  final String? pcDynamicEffect = jsonConvert.convert<String>(
      json['pcDynamicEffect']);
  if (pcDynamicEffect != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoChatBubble.pcDynamicEffect =
        pcDynamicEffect;
  }
  final String? iosDynamicEffect = jsonConvert.convert<String>(
      json['iosDynamicEffect']);
  if (iosDynamicEffect != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoChatBubble.iosDynamicEffect =
        iosDynamicEffect;
  }
  final int? customFlag = jsonConvert.convert<int>(json['customFlag']);
  if (customFlag != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoChatBubble.customFlag =
        customFlag;
  }
  final String? customInfo = jsonConvert.convert<String>(json['customInfo']);
  if (customInfo != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoChatBubble.customInfo =
        customInfo;
  }
  final int? useFlag = jsonConvert.convert<int>(json['useFlag']);
  if (useFlag != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoChatBubble.useFlag = useFlag;
  }
  return homeNewRecommendDataRecordsUserPropDetailDtoChatBubble;
}

Map<String,
    dynamic> $HomeNewRecommendDataRecordsUserPropDetailDtoChatBubbleToJson(
    HomeNewRecommendDataRecordsUserPropDetailDtoChatBubble entity) {
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

extension HomeNewRecommendDataRecordsUserPropDetailDtoChatBubbleExtension on HomeNewRecommendDataRecordsUserPropDetailDtoChatBubble {
  HomeNewRecommendDataRecordsUserPropDetailDtoChatBubble copyWith({
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
    return HomeNewRecommendDataRecordsUserPropDetailDtoChatBubble()
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

HomeNewRecommendDataRecordsUserPropDetailDtoAvatarFrame $HomeNewRecommendDataRecordsUserPropDetailDtoAvatarFrameFromJson(
    Map<String, dynamic> json) {
  final HomeNewRecommendDataRecordsUserPropDetailDtoAvatarFrame homeNewRecommendDataRecordsUserPropDetailDtoAvatarFrame = HomeNewRecommendDataRecordsUserPropDetailDtoAvatarFrame();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoAvatarFrame.id = id;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoAvatarFrame.userId = userId;
  }
  final int? propId = jsonConvert.convert<int>(json['propId']);
  if (propId != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoAvatarFrame.propId = propId;
  }
  final String? propName = jsonConvert.convert<String>(json['propName']);
  if (propName != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoAvatarFrame.propName = propName;
  }
  final int? propType = jsonConvert.convert<int>(json['propType']);
  if (propType != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoAvatarFrame.propType = propType;
  }
  final String? propFormat = jsonConvert.convert<String>(json['propFormat']);
  if (propFormat != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoAvatarFrame.propFormat =
        propFormat;
  }
  final String? dynamicEffect = jsonConvert.convert<String>(
      json['dynamicEffect']);
  if (dynamicEffect != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoAvatarFrame.dynamicEffect =
        dynamicEffect;
  }
  final String? pcDynamicEffect = jsonConvert.convert<String>(
      json['pcDynamicEffect']);
  if (pcDynamicEffect != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoAvatarFrame.pcDynamicEffect =
        pcDynamicEffect;
  }
  final String? iosDynamicEffect = jsonConvert.convert<String>(
      json['iosDynamicEffect']);
  if (iosDynamicEffect != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoAvatarFrame.iosDynamicEffect =
        iosDynamicEffect;
  }
  final int? customFlag = jsonConvert.convert<int>(json['customFlag']);
  if (customFlag != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoAvatarFrame.customFlag =
        customFlag;
  }
  final String? customInfo = jsonConvert.convert<String>(json['customInfo']);
  if (customInfo != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoAvatarFrame.customInfo =
        customInfo;
  }
  final int? useFlag = jsonConvert.convert<int>(json['useFlag']);
  if (useFlag != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoAvatarFrame.useFlag = useFlag;
  }
  return homeNewRecommendDataRecordsUserPropDetailDtoAvatarFrame;
}

Map<String,
    dynamic> $HomeNewRecommendDataRecordsUserPropDetailDtoAvatarFrameToJson(
    HomeNewRecommendDataRecordsUserPropDetailDtoAvatarFrame entity) {
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

extension HomeNewRecommendDataRecordsUserPropDetailDtoAvatarFrameExtension on HomeNewRecommendDataRecordsUserPropDetailDtoAvatarFrame {
  HomeNewRecommendDataRecordsUserPropDetailDtoAvatarFrame copyWith({
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
    return HomeNewRecommendDataRecordsUserPropDetailDtoAvatarFrame()
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

HomeNewRecommendDataRecordsUserPropDetailDtoLevelMedal $HomeNewRecommendDataRecordsUserPropDetailDtoLevelMedalFromJson(
    Map<String, dynamic> json) {
  final HomeNewRecommendDataRecordsUserPropDetailDtoLevelMedal homeNewRecommendDataRecordsUserPropDetailDtoLevelMedal = HomeNewRecommendDataRecordsUserPropDetailDtoLevelMedal();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoLevelMedal.id = id;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoLevelMedal.userId = userId;
  }
  final int? propId = jsonConvert.convert<int>(json['propId']);
  if (propId != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoLevelMedal.propId = propId;
  }
  final String? propName = jsonConvert.convert<String>(json['propName']);
  if (propName != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoLevelMedal.propName = propName;
  }
  final int? propType = jsonConvert.convert<int>(json['propType']);
  if (propType != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoLevelMedal.propType = propType;
  }
  final String? propFormat = jsonConvert.convert<String>(json['propFormat']);
  if (propFormat != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoLevelMedal.propFormat =
        propFormat;
  }
  final String? dynamicEffect = jsonConvert.convert<String>(
      json['dynamicEffect']);
  if (dynamicEffect != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoLevelMedal.dynamicEffect =
        dynamicEffect;
  }
  final String? pcDynamicEffect = jsonConvert.convert<String>(
      json['pcDynamicEffect']);
  if (pcDynamicEffect != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoLevelMedal.pcDynamicEffect =
        pcDynamicEffect;
  }
  final String? iosDynamicEffect = jsonConvert.convert<String>(
      json['iosDynamicEffect']);
  if (iosDynamicEffect != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoLevelMedal.iosDynamicEffect =
        iosDynamicEffect;
  }
  final int? customFlag = jsonConvert.convert<int>(json['customFlag']);
  if (customFlag != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoLevelMedal.customFlag =
        customFlag;
  }
  final String? customInfo = jsonConvert.convert<String>(json['customInfo']);
  if (customInfo != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoLevelMedal.customInfo =
        customInfo;
  }
  final int? useFlag = jsonConvert.convert<int>(json['useFlag']);
  if (useFlag != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoLevelMedal.useFlag = useFlag;
  }
  return homeNewRecommendDataRecordsUserPropDetailDtoLevelMedal;
}

Map<String,
    dynamic> $HomeNewRecommendDataRecordsUserPropDetailDtoLevelMedalToJson(
    HomeNewRecommendDataRecordsUserPropDetailDtoLevelMedal entity) {
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

extension HomeNewRecommendDataRecordsUserPropDetailDtoLevelMedalExtension on HomeNewRecommendDataRecordsUserPropDetailDtoLevelMedal {
  HomeNewRecommendDataRecordsUserPropDetailDtoLevelMedal copyWith({
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
    return HomeNewRecommendDataRecordsUserPropDetailDtoLevelMedal()
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

HomeNewRecommendDataRecordsUserPropDetailDtoEntranceEffect $HomeNewRecommendDataRecordsUserPropDetailDtoEntranceEffectFromJson(
    Map<String, dynamic> json) {
  final HomeNewRecommendDataRecordsUserPropDetailDtoEntranceEffect homeNewRecommendDataRecordsUserPropDetailDtoEntranceEffect = HomeNewRecommendDataRecordsUserPropDetailDtoEntranceEffect();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoEntranceEffect.id = id;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoEntranceEffect.userId = userId;
  }
  final int? propId = jsonConvert.convert<int>(json['propId']);
  if (propId != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoEntranceEffect.propId = propId;
  }
  final String? propName = jsonConvert.convert<String>(json['propName']);
  if (propName != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoEntranceEffect.propName =
        propName;
  }
  final int? propType = jsonConvert.convert<int>(json['propType']);
  if (propType != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoEntranceEffect.propType =
        propType;
  }
  final String? propFormat = jsonConvert.convert<String>(json['propFormat']);
  if (propFormat != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoEntranceEffect.propFormat =
        propFormat;
  }
  final String? dynamicEffect = jsonConvert.convert<String>(
      json['dynamicEffect']);
  if (dynamicEffect != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoEntranceEffect.dynamicEffect =
        dynamicEffect;
  }
  final String? pcDynamicEffect = jsonConvert.convert<String>(
      json['pcDynamicEffect']);
  if (pcDynamicEffect != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoEntranceEffect.pcDynamicEffect =
        pcDynamicEffect;
  }
  final String? iosDynamicEffect = jsonConvert.convert<String>(
      json['iosDynamicEffect']);
  if (iosDynamicEffect != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoEntranceEffect
        .iosDynamicEffect = iosDynamicEffect;
  }
  final int? customFlag = jsonConvert.convert<int>(json['customFlag']);
  if (customFlag != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoEntranceEffect.customFlag =
        customFlag;
  }
  final String? customInfo = jsonConvert.convert<String>(json['customInfo']);
  if (customInfo != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoEntranceEffect.customInfo =
        customInfo;
  }
  final int? useFlag = jsonConvert.convert<int>(json['useFlag']);
  if (useFlag != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoEntranceEffect.useFlag =
        useFlag;
  }
  return homeNewRecommendDataRecordsUserPropDetailDtoEntranceEffect;
}

Map<String,
    dynamic> $HomeNewRecommendDataRecordsUserPropDetailDtoEntranceEffectToJson(
    HomeNewRecommendDataRecordsUserPropDetailDtoEntranceEffect entity) {
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

extension HomeNewRecommendDataRecordsUserPropDetailDtoEntranceEffectExtension on HomeNewRecommendDataRecordsUserPropDetailDtoEntranceEffect {
  HomeNewRecommendDataRecordsUserPropDetailDtoEntranceEffect copyWith({
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
    return HomeNewRecommendDataRecordsUserPropDetailDtoEntranceEffect()
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

HomeNewRecommendDataRecordsUserPropDetailDtoCustomNickname $HomeNewRecommendDataRecordsUserPropDetailDtoCustomNicknameFromJson(
    Map<String, dynamic> json) {
  final HomeNewRecommendDataRecordsUserPropDetailDtoCustomNickname homeNewRecommendDataRecordsUserPropDetailDtoCustomNickname = HomeNewRecommendDataRecordsUserPropDetailDtoCustomNickname();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoCustomNickname.id = id;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoCustomNickname.userId = userId;
  }
  final int? propId = jsonConvert.convert<int>(json['propId']);
  if (propId != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoCustomNickname.propId = propId;
  }
  final String? propName = jsonConvert.convert<String>(json['propName']);
  if (propName != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoCustomNickname.propName =
        propName;
  }
  final int? propType = jsonConvert.convert<int>(json['propType']);
  if (propType != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoCustomNickname.propType =
        propType;
  }
  final String? propFormat = jsonConvert.convert<String>(json['propFormat']);
  if (propFormat != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoCustomNickname.propFormat =
        propFormat;
  }
  final String? dynamicEffect = jsonConvert.convert<String>(
      json['dynamicEffect']);
  if (dynamicEffect != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoCustomNickname.dynamicEffect =
        dynamicEffect;
  }
  final String? pcDynamicEffect = jsonConvert.convert<String>(
      json['pcDynamicEffect']);
  if (pcDynamicEffect != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoCustomNickname.pcDynamicEffect =
        pcDynamicEffect;
  }
  final String? iosDynamicEffect = jsonConvert.convert<String>(
      json['iosDynamicEffect']);
  if (iosDynamicEffect != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoCustomNickname
        .iosDynamicEffect = iosDynamicEffect;
  }
  final int? customFlag = jsonConvert.convert<int>(json['customFlag']);
  if (customFlag != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoCustomNickname.customFlag =
        customFlag;
  }
  final String? customInfo = jsonConvert.convert<String>(json['customInfo']);
  if (customInfo != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoCustomNickname.customInfo =
        customInfo;
  }
  final int? useFlag = jsonConvert.convert<int>(json['useFlag']);
  if (useFlag != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoCustomNickname.useFlag =
        useFlag;
  }
  return homeNewRecommendDataRecordsUserPropDetailDtoCustomNickname;
}

Map<String,
    dynamic> $HomeNewRecommendDataRecordsUserPropDetailDtoCustomNicknameToJson(
    HomeNewRecommendDataRecordsUserPropDetailDtoCustomNickname entity) {
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

extension HomeNewRecommendDataRecordsUserPropDetailDtoCustomNicknameExtension on HomeNewRecommendDataRecordsUserPropDetailDtoCustomNickname {
  HomeNewRecommendDataRecordsUserPropDetailDtoCustomNickname copyWith({
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
    return HomeNewRecommendDataRecordsUserPropDetailDtoCustomNickname()
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

HomeNewRecommendDataRecordsUserPropDetailDtoHomepageEffect $HomeNewRecommendDataRecordsUserPropDetailDtoHomepageEffectFromJson(
    Map<String, dynamic> json) {
  final HomeNewRecommendDataRecordsUserPropDetailDtoHomepageEffect homeNewRecommendDataRecordsUserPropDetailDtoHomepageEffect = HomeNewRecommendDataRecordsUserPropDetailDtoHomepageEffect();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoHomepageEffect.id = id;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoHomepageEffect.userId = userId;
  }
  final int? propId = jsonConvert.convert<int>(json['propId']);
  if (propId != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoHomepageEffect.propId = propId;
  }
  final String? propName = jsonConvert.convert<String>(json['propName']);
  if (propName != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoHomepageEffect.propName =
        propName;
  }
  final int? propType = jsonConvert.convert<int>(json['propType']);
  if (propType != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoHomepageEffect.propType =
        propType;
  }
  final String? propFormat = jsonConvert.convert<String>(json['propFormat']);
  if (propFormat != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoHomepageEffect.propFormat =
        propFormat;
  }
  final String? dynamicEffect = jsonConvert.convert<String>(
      json['dynamicEffect']);
  if (dynamicEffect != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoHomepageEffect.dynamicEffect =
        dynamicEffect;
  }
  final String? pcDynamicEffect = jsonConvert.convert<String>(
      json['pcDynamicEffect']);
  if (pcDynamicEffect != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoHomepageEffect.pcDynamicEffect =
        pcDynamicEffect;
  }
  final String? iosDynamicEffect = jsonConvert.convert<String>(
      json['iosDynamicEffect']);
  if (iosDynamicEffect != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoHomepageEffect
        .iosDynamicEffect = iosDynamicEffect;
  }
  final int? customFlag = jsonConvert.convert<int>(json['customFlag']);
  if (customFlag != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoHomepageEffect.customFlag =
        customFlag;
  }
  final String? customInfo = jsonConvert.convert<String>(json['customInfo']);
  if (customInfo != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoHomepageEffect.customInfo =
        customInfo;
  }
  final int? useFlag = jsonConvert.convert<int>(json['useFlag']);
  if (useFlag != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoHomepageEffect.useFlag =
        useFlag;
  }
  return homeNewRecommendDataRecordsUserPropDetailDtoHomepageEffect;
}

Map<String,
    dynamic> $HomeNewRecommendDataRecordsUserPropDetailDtoHomepageEffectToJson(
    HomeNewRecommendDataRecordsUserPropDetailDtoHomepageEffect entity) {
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

extension HomeNewRecommendDataRecordsUserPropDetailDtoHomepageEffectExtension on HomeNewRecommendDataRecordsUserPropDetailDtoHomepageEffect {
  HomeNewRecommendDataRecordsUserPropDetailDtoHomepageEffect copyWith({
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
    return HomeNewRecommendDataRecordsUserPropDetailDtoHomepageEffect()
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

HomeNewRecommendDataRecordsUserPropDetailDtoNameplate $HomeNewRecommendDataRecordsUserPropDetailDtoNameplateFromJson(
    Map<String, dynamic> json) {
  final HomeNewRecommendDataRecordsUserPropDetailDtoNameplate homeNewRecommendDataRecordsUserPropDetailDtoNameplate = HomeNewRecommendDataRecordsUserPropDetailDtoNameplate();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoNameplate.id = id;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoNameplate.userId = userId;
  }
  final int? propId = jsonConvert.convert<int>(json['propId']);
  if (propId != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoNameplate.propId = propId;
  }
  final String? propName = jsonConvert.convert<String>(json['propName']);
  if (propName != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoNameplate.propName = propName;
  }
  final int? propType = jsonConvert.convert<int>(json['propType']);
  if (propType != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoNameplate.propType = propType;
  }
  final String? propFormat = jsonConvert.convert<String>(json['propFormat']);
  if (propFormat != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoNameplate.propFormat =
        propFormat;
  }
  final String? dynamicEffect = jsonConvert.convert<String>(
      json['dynamicEffect']);
  if (dynamicEffect != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoNameplate.dynamicEffect =
        dynamicEffect;
  }
  final String? pcDynamicEffect = jsonConvert.convert<String>(
      json['pcDynamicEffect']);
  if (pcDynamicEffect != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoNameplate.pcDynamicEffect =
        pcDynamicEffect;
  }
  final String? iosDynamicEffect = jsonConvert.convert<String>(
      json['iosDynamicEffect']);
  if (iosDynamicEffect != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoNameplate.iosDynamicEffect =
        iosDynamicEffect;
  }
  final int? customFlag = jsonConvert.convert<int>(json['customFlag']);
  if (customFlag != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoNameplate.customFlag =
        customFlag;
  }
  final String? customInfo = jsonConvert.convert<String>(json['customInfo']);
  if (customInfo != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoNameplate.customInfo =
        customInfo;
  }
  final int? useFlag = jsonConvert.convert<int>(json['useFlag']);
  if (useFlag != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoNameplate.useFlag = useFlag;
  }
  return homeNewRecommendDataRecordsUserPropDetailDtoNameplate;
}

Map<String,
    dynamic> $HomeNewRecommendDataRecordsUserPropDetailDtoNameplateToJson(
    HomeNewRecommendDataRecordsUserPropDetailDtoNameplate entity) {
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

extension HomeNewRecommendDataRecordsUserPropDetailDtoNameplateExtension on HomeNewRecommendDataRecordsUserPropDetailDtoNameplate {
  HomeNewRecommendDataRecordsUserPropDetailDtoNameplate copyWith({
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
    return HomeNewRecommendDataRecordsUserPropDetailDtoNameplate()
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

HomeNewRecommendDataRecordsUserPropDetailDtoMount $HomeNewRecommendDataRecordsUserPropDetailDtoMountFromJson(
    Map<String, dynamic> json) {
  final HomeNewRecommendDataRecordsUserPropDetailDtoMount homeNewRecommendDataRecordsUserPropDetailDtoMount = HomeNewRecommendDataRecordsUserPropDetailDtoMount();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoMount.id = id;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoMount.userId = userId;
  }
  final int? propId = jsonConvert.convert<int>(json['propId']);
  if (propId != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoMount.propId = propId;
  }
  final String? propName = jsonConvert.convert<String>(json['propName']);
  if (propName != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoMount.propName = propName;
  }
  final int? propType = jsonConvert.convert<int>(json['propType']);
  if (propType != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoMount.propType = propType;
  }
  final String? propFormat = jsonConvert.convert<String>(json['propFormat']);
  if (propFormat != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoMount.propFormat = propFormat;
  }
  final String? dynamicEffect = jsonConvert.convert<String>(
      json['dynamicEffect']);
  if (dynamicEffect != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoMount.dynamicEffect =
        dynamicEffect;
  }
  final String? pcDynamicEffect = jsonConvert.convert<String>(
      json['pcDynamicEffect']);
  if (pcDynamicEffect != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoMount.pcDynamicEffect =
        pcDynamicEffect;
  }
  final String? iosDynamicEffect = jsonConvert.convert<String>(
      json['iosDynamicEffect']);
  if (iosDynamicEffect != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoMount.iosDynamicEffect =
        iosDynamicEffect;
  }
  final int? customFlag = jsonConvert.convert<int>(json['customFlag']);
  if (customFlag != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoMount.customFlag = customFlag;
  }
  final String? customInfo = jsonConvert.convert<String>(json['customInfo']);
  if (customInfo != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoMount.customInfo = customInfo;
  }
  final int? useFlag = jsonConvert.convert<int>(json['useFlag']);
  if (useFlag != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoMount.useFlag = useFlag;
  }
  return homeNewRecommendDataRecordsUserPropDetailDtoMount;
}

Map<String, dynamic> $HomeNewRecommendDataRecordsUserPropDetailDtoMountToJson(
    HomeNewRecommendDataRecordsUserPropDetailDtoMount entity) {
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

extension HomeNewRecommendDataRecordsUserPropDetailDtoMountExtension on HomeNewRecommendDataRecordsUserPropDetailDtoMount {
  HomeNewRecommendDataRecordsUserPropDetailDtoMount copyWith({
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
    return HomeNewRecommendDataRecordsUserPropDetailDtoMount()
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

HomeNewRecommendDataRecordsUserPropDetailDtoColorfulText $HomeNewRecommendDataRecordsUserPropDetailDtoColorfulTextFromJson(
    Map<String, dynamic> json) {
  final HomeNewRecommendDataRecordsUserPropDetailDtoColorfulText homeNewRecommendDataRecordsUserPropDetailDtoColorfulText = HomeNewRecommendDataRecordsUserPropDetailDtoColorfulText();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoColorfulText.id = id;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoColorfulText.userId = userId;
  }
  final int? propId = jsonConvert.convert<int>(json['propId']);
  if (propId != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoColorfulText.propId = propId;
  }
  final String? propName = jsonConvert.convert<String>(json['propName']);
  if (propName != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoColorfulText.propName =
        propName;
  }
  final int? propType = jsonConvert.convert<int>(json['propType']);
  if (propType != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoColorfulText.propType =
        propType;
  }
  final String? propFormat = jsonConvert.convert<String>(json['propFormat']);
  if (propFormat != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoColorfulText.propFormat =
        propFormat;
  }
  final String? dynamicEffect = jsonConvert.convert<String>(
      json['dynamicEffect']);
  if (dynamicEffect != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoColorfulText.dynamicEffect =
        dynamicEffect;
  }
  final String? pcDynamicEffect = jsonConvert.convert<String>(
      json['pcDynamicEffect']);
  if (pcDynamicEffect != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoColorfulText.pcDynamicEffect =
        pcDynamicEffect;
  }
  final String? iosDynamicEffect = jsonConvert.convert<String>(
      json['iosDynamicEffect']);
  if (iosDynamicEffect != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoColorfulText.iosDynamicEffect =
        iosDynamicEffect;
  }
  final int? customFlag = jsonConvert.convert<int>(json['customFlag']);
  if (customFlag != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoColorfulText.customFlag =
        customFlag;
  }
  final String? customInfo = jsonConvert.convert<String>(json['customInfo']);
  if (customInfo != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoColorfulText.customInfo =
        customInfo;
  }
  final int? useFlag = jsonConvert.convert<int>(json['useFlag']);
  if (useFlag != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoColorfulText.useFlag = useFlag;
  }
  return homeNewRecommendDataRecordsUserPropDetailDtoColorfulText;
}

Map<String,
    dynamic> $HomeNewRecommendDataRecordsUserPropDetailDtoColorfulTextToJson(
    HomeNewRecommendDataRecordsUserPropDetailDtoColorfulText entity) {
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

extension HomeNewRecommendDataRecordsUserPropDetailDtoColorfulTextExtension on HomeNewRecommendDataRecordsUserPropDetailDtoColorfulText {
  HomeNewRecommendDataRecordsUserPropDetailDtoColorfulText copyWith({
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
    return HomeNewRecommendDataRecordsUserPropDetailDtoColorfulText()
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

HomeNewRecommendDataRecordsUserPropDetailDtoRoomWallpaper $HomeNewRecommendDataRecordsUserPropDetailDtoRoomWallpaperFromJson(
    Map<String, dynamic> json) {
  final HomeNewRecommendDataRecordsUserPropDetailDtoRoomWallpaper homeNewRecommendDataRecordsUserPropDetailDtoRoomWallpaper = HomeNewRecommendDataRecordsUserPropDetailDtoRoomWallpaper();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoRoomWallpaper.id = id;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoRoomWallpaper.userId = userId;
  }
  final int? propId = jsonConvert.convert<int>(json['propId']);
  if (propId != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoRoomWallpaper.propId = propId;
  }
  final String? propName = jsonConvert.convert<String>(json['propName']);
  if (propName != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoRoomWallpaper.propName =
        propName;
  }
  final int? propType = jsonConvert.convert<int>(json['propType']);
  if (propType != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoRoomWallpaper.propType =
        propType;
  }
  final String? propFormat = jsonConvert.convert<String>(json['propFormat']);
  if (propFormat != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoRoomWallpaper.propFormat =
        propFormat;
  }
  final String? dynamicEffect = jsonConvert.convert<String>(
      json['dynamicEffect']);
  if (dynamicEffect != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoRoomWallpaper.dynamicEffect =
        dynamicEffect;
  }
  final String? pcDynamicEffect = jsonConvert.convert<String>(
      json['pcDynamicEffect']);
  if (pcDynamicEffect != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoRoomWallpaper.pcDynamicEffect =
        pcDynamicEffect;
  }
  final String? iosDynamicEffect = jsonConvert.convert<String>(
      json['iosDynamicEffect']);
  if (iosDynamicEffect != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoRoomWallpaper.iosDynamicEffect =
        iosDynamicEffect;
  }
  final int? customFlag = jsonConvert.convert<int>(json['customFlag']);
  if (customFlag != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoRoomWallpaper.customFlag =
        customFlag;
  }
  final String? customInfo = jsonConvert.convert<String>(json['customInfo']);
  if (customInfo != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoRoomWallpaper.customInfo =
        customInfo;
  }
  final int? useFlag = jsonConvert.convert<int>(json['useFlag']);
  if (useFlag != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoRoomWallpaper.useFlag = useFlag;
  }
  return homeNewRecommendDataRecordsUserPropDetailDtoRoomWallpaper;
}

Map<String,
    dynamic> $HomeNewRecommendDataRecordsUserPropDetailDtoRoomWallpaperToJson(
    HomeNewRecommendDataRecordsUserPropDetailDtoRoomWallpaper entity) {
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

extension HomeNewRecommendDataRecordsUserPropDetailDtoRoomWallpaperExtension on HomeNewRecommendDataRecordsUserPropDetailDtoRoomWallpaper {
  HomeNewRecommendDataRecordsUserPropDetailDtoRoomWallpaper copyWith({
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
    return HomeNewRecommendDataRecordsUserPropDetailDtoRoomWallpaper()
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

HomeNewRecommendDataRecordsUserPropDetailDtoNobleCard $HomeNewRecommendDataRecordsUserPropDetailDtoNobleCardFromJson(
    Map<String, dynamic> json) {
  final HomeNewRecommendDataRecordsUserPropDetailDtoNobleCard homeNewRecommendDataRecordsUserPropDetailDtoNobleCard = HomeNewRecommendDataRecordsUserPropDetailDtoNobleCard();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoNobleCard.id = id;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoNobleCard.userId = userId;
  }
  final int? propId = jsonConvert.convert<int>(json['propId']);
  if (propId != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoNobleCard.propId = propId;
  }
  final String? propName = jsonConvert.convert<String>(json['propName']);
  if (propName != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoNobleCard.propName = propName;
  }
  final int? propType = jsonConvert.convert<int>(json['propType']);
  if (propType != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoNobleCard.propType = propType;
  }
  final String? propFormat = jsonConvert.convert<String>(json['propFormat']);
  if (propFormat != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoNobleCard.propFormat =
        propFormat;
  }
  final String? dynamicEffect = jsonConvert.convert<String>(
      json['dynamicEffect']);
  if (dynamicEffect != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoNobleCard.dynamicEffect =
        dynamicEffect;
  }
  final String? pcDynamicEffect = jsonConvert.convert<String>(
      json['pcDynamicEffect']);
  if (pcDynamicEffect != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoNobleCard.pcDynamicEffect =
        pcDynamicEffect;
  }
  final String? iosDynamicEffect = jsonConvert.convert<String>(
      json['iosDynamicEffect']);
  if (iosDynamicEffect != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoNobleCard.iosDynamicEffect =
        iosDynamicEffect;
  }
  final int? customFlag = jsonConvert.convert<int>(json['customFlag']);
  if (customFlag != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoNobleCard.customFlag =
        customFlag;
  }
  final String? customInfo = jsonConvert.convert<String>(json['customInfo']);
  if (customInfo != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoNobleCard.customInfo =
        customInfo;
  }
  final int? useFlag = jsonConvert.convert<int>(json['useFlag']);
  if (useFlag != null) {
    homeNewRecommendDataRecordsUserPropDetailDtoNobleCard.useFlag = useFlag;
  }
  return homeNewRecommendDataRecordsUserPropDetailDtoNobleCard;
}

Map<String,
    dynamic> $HomeNewRecommendDataRecordsUserPropDetailDtoNobleCardToJson(
    HomeNewRecommendDataRecordsUserPropDetailDtoNobleCard entity) {
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

extension HomeNewRecommendDataRecordsUserPropDetailDtoNobleCardExtension on HomeNewRecommendDataRecordsUserPropDetailDtoNobleCard {
  HomeNewRecommendDataRecordsUserPropDetailDtoNobleCard copyWith({
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
    return HomeNewRecommendDataRecordsUserPropDetailDtoNobleCard()
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