import 'package:oneww/generated/json/base/json_convert_content.dart';
import 'package:oneww/models/query_dispatch_rooms_by_heat_response_entity.dart';

QueryDispatchRoomsByHeatResponseEntity $QueryDispatchRoomsByHeatResponseEntityFromJson(
    Map<String, dynamic> json) {
  final QueryDispatchRoomsByHeatResponseEntity queryDispatchRoomsByHeatResponseEntity = QueryDispatchRoomsByHeatResponseEntity();
  final String? requestId = jsonConvert.convert<String>(json['request_id']);
  if (requestId != null) {
    queryDispatchRoomsByHeatResponseEntity.requestId = requestId;
  }
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    queryDispatchRoomsByHeatResponseEntity.code = code;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    queryDispatchRoomsByHeatResponseEntity.message = message;
  }
  final QueryDispatchRoomsByHeatResponseData? data = jsonConvert.convert<
      QueryDispatchRoomsByHeatResponseData>(json['data']);
  if (data != null) {
    queryDispatchRoomsByHeatResponseEntity.data = data;
  }
  return queryDispatchRoomsByHeatResponseEntity;
}

Map<String, dynamic> $QueryDispatchRoomsByHeatResponseEntityToJson(
    QueryDispatchRoomsByHeatResponseEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['request_id'] = entity.requestId;
  data['code'] = entity.code;
  data['message'] = entity.message;
  data['data'] = entity.data.toJson();
  return data;
}

extension QueryDispatchRoomsByHeatResponseEntityExtension on QueryDispatchRoomsByHeatResponseEntity {
  QueryDispatchRoomsByHeatResponseEntity copyWith({
    String? requestId,
    int? code,
    String? message,
    QueryDispatchRoomsByHeatResponseData? data,
  }) {
    return QueryDispatchRoomsByHeatResponseEntity()
      ..requestId = requestId ?? this.requestId
      ..code = code ?? this.code
      ..message = message ?? this.message
      ..data = data ?? this.data;
  }
}

QueryDispatchRoomsByHeatResponseData $QueryDispatchRoomsByHeatResponseDataFromJson(
    Map<String, dynamic> json) {
  final QueryDispatchRoomsByHeatResponseData queryDispatchRoomsByHeatResponseData = QueryDispatchRoomsByHeatResponseData();
  final int? pageNo = jsonConvert.convert<int>(json['pageNo']);
  if (pageNo != null) {
    queryDispatchRoomsByHeatResponseData.pageNo = pageNo;
  }
  final int? pageSize = jsonConvert.convert<int>(json['pageSize']);
  if (pageSize != null) {
    queryDispatchRoomsByHeatResponseData.pageSize = pageSize;
  }
  final int? total = jsonConvert.convert<int>(json['total']);
  if (total != null) {
    queryDispatchRoomsByHeatResponseData.total = total;
  }
  final int? pages = jsonConvert.convert<int>(json['pages']);
  if (pages != null) {
    queryDispatchRoomsByHeatResponseData.pages = pages;
  }
  final List<
      QueryDispatchRoomsByHeatResponseDataRecords>? records = (json['records'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<QueryDispatchRoomsByHeatResponseDataRecords>(
          e) as QueryDispatchRoomsByHeatResponseDataRecords).toList();
  if (records != null) {
    queryDispatchRoomsByHeatResponseData.records = records;
  }
  return queryDispatchRoomsByHeatResponseData;
}

Map<String, dynamic> $QueryDispatchRoomsByHeatResponseDataToJson(
    QueryDispatchRoomsByHeatResponseData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['pageNo'] = entity.pageNo;
  data['pageSize'] = entity.pageSize;
  data['total'] = entity.total;
  data['pages'] = entity.pages;
  data['records'] = entity.records.map((v) => v.toJson()).toList();
  return data;
}

extension QueryDispatchRoomsByHeatResponseDataExtension on QueryDispatchRoomsByHeatResponseData {
  QueryDispatchRoomsByHeatResponseData copyWith({
    int? pageNo,
    int? pageSize,
    int? total,
    int? pages,
    List<QueryDispatchRoomsByHeatResponseDataRecords>? records,
  }) {
    return QueryDispatchRoomsByHeatResponseData()
      ..pageNo = pageNo ?? this.pageNo
      ..pageSize = pageSize ?? this.pageSize
      ..total = total ?? this.total
      ..pages = pages ?? this.pages
      ..records = records ?? this.records;
  }
}

QueryDispatchRoomsByHeatResponseDataRecords $QueryDispatchRoomsByHeatResponseDataRecordsFromJson(
    Map<String, dynamic> json) {
  final QueryDispatchRoomsByHeatResponseDataRecords queryDispatchRoomsByHeatResponseDataRecords = QueryDispatchRoomsByHeatResponseDataRecords();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    queryDispatchRoomsByHeatResponseDataRecords.id = id;
  }
  final int? channelId = jsonConvert.convert<int>(json['channelId']);
  if (channelId != null) {
    queryDispatchRoomsByHeatResponseDataRecords.channelId = channelId;
  }
  final int? groupId = jsonConvert.convert<int>(json['groupId']);
  if (groupId != null) {
    queryDispatchRoomsByHeatResponseDataRecords.groupId = groupId;
  }
  final String? roomNo = jsonConvert.convert<String>(json['roomNo']);
  if (roomNo != null) {
    queryDispatchRoomsByHeatResponseDataRecords.roomNo = roomNo;
  }
  final String? roomName = jsonConvert.convert<String>(json['roomName']);
  if (roomName != null) {
    queryDispatchRoomsByHeatResponseDataRecords.roomName = roomName;
  }
  final String? roomAvatar = jsonConvert.convert<String>(json['roomAvatar']);
  if (roomAvatar != null) {
    queryDispatchRoomsByHeatResponseDataRecords.roomAvatar = roomAvatar;
  }
  final int? roomOwner = jsonConvert.convert<int>(json['roomOwner']);
  if (roomOwner != null) {
    queryDispatchRoomsByHeatResponseDataRecords.roomOwner = roomOwner;
  }
  final int? roomType = jsonConvert.convert<int>(json['roomType']);
  if (roomType != null) {
    queryDispatchRoomsByHeatResponseDataRecords.roomType = roomType;
  }
  final int? roomMode = jsonConvert.convert<int>(json['roomMode']);
  if (roomMode != null) {
    queryDispatchRoomsByHeatResponseDataRecords.roomMode = roomMode;
  }
  final String? announcement = jsonConvert.convert<String>(
      json['announcement']);
  if (announcement != null) {
    queryDispatchRoomsByHeatResponseDataRecords.announcement = announcement;
  }
  final String? welcomeMsg = jsonConvert.convert<String>(json['welcomeMsg']);
  if (welcomeMsg != null) {
    queryDispatchRoomsByHeatResponseDataRecords.welcomeMsg = welcomeMsg;
  }
  final QueryDispatchRoomsByHeatResponseDataRecordsPreside? preside = jsonConvert
      .convert<QueryDispatchRoomsByHeatResponseDataRecordsPreside>(
      json['preside']);
  if (preside != null) {
    queryDispatchRoomsByHeatResponseDataRecords.preside = preside;
  }
  final QueryDispatchRoomsByHeatResponseDataRecordsOwner? owner = jsonConvert
      .convert<QueryDispatchRoomsByHeatResponseDataRecordsOwner>(json['owner']);
  if (owner != null) {
    queryDispatchRoomsByHeatResponseDataRecords.owner = owner;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    queryDispatchRoomsByHeatResponseDataRecords.status = status;
  }
  final int? openStatus = jsonConvert.convert<int>(json['openStatus']);
  if (openStatus != null) {
    queryDispatchRoomsByHeatResponseDataRecords.openStatus = openStatus;
  }
  final int? queueCnt = jsonConvert.convert<int>(json['queueCnt']);
  if (queueCnt != null) {
    queryDispatchRoomsByHeatResponseDataRecords.queueCnt = queueCnt;
  }
  final int? onlineMemberCount = jsonConvert.convert<int>(
      json['onlineMemberCount']);
  if (onlineMemberCount != null) {
    queryDispatchRoomsByHeatResponseDataRecords.onlineMemberCount =
        onlineMemberCount;
  }
  final int? heatValue = jsonConvert.convert<int>(json['heatValue']);
  if (heatValue != null) {
    queryDispatchRoomsByHeatResponseDataRecords.heatValue = heatValue;
  }
  final int? passwordSettings = jsonConvert.convert<int>(
      json['passwordSettings']);
  if (passwordSettings != null) {
    queryDispatchRoomsByHeatResponseDataRecords.passwordSettings =
        passwordSettings;
  }
  final int? kolId = jsonConvert.convert<int>(json['kolId']);
  if (kolId != null) {
    queryDispatchRoomsByHeatResponseDataRecords.kolId = kolId;
  }
  return queryDispatchRoomsByHeatResponseDataRecords;
}

Map<String, dynamic> $QueryDispatchRoomsByHeatResponseDataRecordsToJson(
    QueryDispatchRoomsByHeatResponseDataRecords entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['channelId'] = entity.channelId;
  data['groupId'] = entity.groupId;
  data['roomNo'] = entity.roomNo;
  data['roomName'] = entity.roomName;
  data['roomAvatar'] = entity.roomAvatar;
  data['roomOwner'] = entity.roomOwner;
  data['roomType'] = entity.roomType;
  data['roomMode'] = entity.roomMode;
  data['announcement'] = entity.announcement;
  data['welcomeMsg'] = entity.welcomeMsg;
  data['preside'] = entity.preside.toJson();
  data['owner'] = entity.owner.toJson();
  data['status'] = entity.status;
  data['openStatus'] = entity.openStatus;
  data['queueCnt'] = entity.queueCnt;
  data['onlineMemberCount'] = entity.onlineMemberCount;
  data['heatValue'] = entity.heatValue;
  data['passwordSettings'] = entity.passwordSettings;
  data['kolId'] = entity.kolId;
  return data;
}

extension QueryDispatchRoomsByHeatResponseDataRecordsExtension on QueryDispatchRoomsByHeatResponseDataRecords {
  QueryDispatchRoomsByHeatResponseDataRecords copyWith({
    int? id,
    int? channelId,
    int? groupId,
    String? roomNo,
    String? roomName,
    String? roomAvatar,
    int? roomOwner,
    int? roomType,
    int? roomMode,
    String? announcement,
    String? welcomeMsg,
    QueryDispatchRoomsByHeatResponseDataRecordsPreside? preside,
    QueryDispatchRoomsByHeatResponseDataRecordsOwner? owner,
    int? status,
    int? openStatus,
    int? queueCnt,
    int? onlineMemberCount,
    int? heatValue,
    int? passwordSettings,
    int? kolId,
  }) {
    return QueryDispatchRoomsByHeatResponseDataRecords()
      ..id = id ?? this.id
      ..channelId = channelId ?? this.channelId
      ..groupId = groupId ?? this.groupId
      ..roomNo = roomNo ?? this.roomNo
      ..roomName = roomName ?? this.roomName
      ..roomAvatar = roomAvatar ?? this.roomAvatar
      ..roomOwner = roomOwner ?? this.roomOwner
      ..roomType = roomType ?? this.roomType
      ..roomMode = roomMode ?? this.roomMode
      ..announcement = announcement ?? this.announcement
      ..welcomeMsg = welcomeMsg ?? this.welcomeMsg
      ..preside = preside ?? this.preside
      ..owner = owner ?? this.owner
      ..status = status ?? this.status
      ..openStatus = openStatus ?? this.openStatus
      ..queueCnt = queueCnt ?? this.queueCnt
      ..onlineMemberCount = onlineMemberCount ?? this.onlineMemberCount
      ..heatValue = heatValue ?? this.heatValue
      ..passwordSettings = passwordSettings ?? this.passwordSettings
      ..kolId = kolId ?? this.kolId;
  }
}

QueryDispatchRoomsByHeatResponseDataRecordsPreside $QueryDispatchRoomsByHeatResponseDataRecordsPresideFromJson(
    Map<String, dynamic> json) {
  final QueryDispatchRoomsByHeatResponseDataRecordsPreside queryDispatchRoomsByHeatResponseDataRecordsPreside = QueryDispatchRoomsByHeatResponseDataRecordsPreside();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPreside.id = id;
  }
  final String? userNo = jsonConvert.convert<String>(json['userNo']);
  if (userNo != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPreside.userNo = userNo;
  }
  final String? sex = jsonConvert.convert<String>(json['sex']);
  if (sex != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPreside.sex = sex;
  }
  final String? nickName = jsonConvert.convert<String>(json['nickName']);
  if (nickName != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPreside.nickName = nickName;
  }
  final String? avatar = jsonConvert.convert<String>(json['avatar']);
  if (avatar != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPreside.avatar = avatar;
  }
  final int? onlineFlag = jsonConvert.convert<int>(json['onlineFlag']);
  if (onlineFlag != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPreside.onlineFlag = onlineFlag;
  }
  final int? accompanyId = jsonConvert.convert<int>(json['accompanyId']);
  if (accompanyId != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPreside.accompanyId =
        accompanyId;
  }
  final String? introduced = jsonConvert.convert<String>(json['introduced']);
  if (introduced != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPreside.introduced = introduced;
  }
  final int? level = jsonConvert.convert<int>(json['level']);
  if (level != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPreside.level = level;
  }
  final int? roomLevel = jsonConvert.convert<int>(json['roomLevel']);
  if (roomLevel != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPreside.roomLevel = roomLevel;
  }
  final QueryDispatchRoomsByHeatResponseDataRecordsPresideRoomLevelConfigDto? roomLevelConfigDto = jsonConvert
      .convert<
      QueryDispatchRoomsByHeatResponseDataRecordsPresideRoomLevelConfigDto>(
      json['roomLevelConfigDto']);
  if (roomLevelConfigDto != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPreside.roomLevelConfigDto =
        roomLevelConfigDto;
  }
  final QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDto? nobleLevelDto = jsonConvert
      .convert<QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDto>(
      json['nobleLevelDto']);
  if (nobleLevelDto != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPreside.nobleLevelDto =
        nobleLevelDto;
  }
  final String? accompanyLevel = jsonConvert.convert<String>(
      json['accompanyLevel']);
  if (accompanyLevel != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPreside.accompanyLevel =
        accompanyLevel;
  }
  final String? onlineTime = jsonConvert.convert<String>(json['onlineTime']);
  if (onlineTime != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPreside.onlineTime = onlineTime;
  }
  final String? customIdentityImage = jsonConvert.convert<String>(
      json['customIdentityImage']);
  if (customIdentityImage != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPreside.customIdentityImage =
        customIdentityImage;
  }
  final List<
      String>? customIdentityImageList = (json['customIdentityImageList'] as List<
      dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (customIdentityImageList != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPreside.customIdentityImageList =
        customIdentityImageList;
  }
  final int? userMic = jsonConvert.convert<int>(json['userMic']);
  if (userMic != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPreside.userMic = userMic;
  }
  final String? birthday = jsonConvert.convert<String>(json['birthday']);
  if (birthday != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPreside.birthday = birthday;
  }
  final String? mainLabelId = jsonConvert.convert<String>(json['mainLabelId']);
  if (mainLabelId != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPreside.mainLabelId =
        mainLabelId;
  }
  final String? mainLabel = jsonConvert.convert<String>(json['mainLabel']);
  if (mainLabel != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPreside.mainLabel = mainLabel;
  }
  final String? moduleAvatar = jsonConvert.convert<String>(
      json['moduleAvatar']);
  if (moduleAvatar != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPreside.moduleAvatar =
        moduleAvatar;
  }
  return queryDispatchRoomsByHeatResponseDataRecordsPreside;
}

Map<String, dynamic> $QueryDispatchRoomsByHeatResponseDataRecordsPresideToJson(
    QueryDispatchRoomsByHeatResponseDataRecordsPreside entity) {
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

extension QueryDispatchRoomsByHeatResponseDataRecordsPresideExtension on QueryDispatchRoomsByHeatResponseDataRecordsPreside {
  QueryDispatchRoomsByHeatResponseDataRecordsPreside copyWith({
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
    QueryDispatchRoomsByHeatResponseDataRecordsPresideRoomLevelConfigDto? roomLevelConfigDto,
    QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDto? nobleLevelDto,
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
    return QueryDispatchRoomsByHeatResponseDataRecordsPreside()
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

QueryDispatchRoomsByHeatResponseDataRecordsPresideRoomLevelConfigDto $QueryDispatchRoomsByHeatResponseDataRecordsPresideRoomLevelConfigDtoFromJson(
    Map<String, dynamic> json) {
  final QueryDispatchRoomsByHeatResponseDataRecordsPresideRoomLevelConfigDto queryDispatchRoomsByHeatResponseDataRecordsPresideRoomLevelConfigDto = QueryDispatchRoomsByHeatResponseDataRecordsPresideRoomLevelConfigDto();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideRoomLevelConfigDto.id =
        id;
  }
  final String? levelName = jsonConvert.convert<String>(json['levelName']);
  if (levelName != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideRoomLevelConfigDto
        .levelName = levelName;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideRoomLevelConfigDto.icon =
        icon;
  }
  final String? backdrop = jsonConvert.convert<String>(json['backdrop']);
  if (backdrop != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideRoomLevelConfigDto
        .backdrop = backdrop;
  }
  final String? medal = jsonConvert.convert<String>(json['medal']);
  if (medal != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideRoomLevelConfigDto.medal =
        medal;
  }
  final String? homeBackdrop = jsonConvert.convert<String>(
      json['homeBackdrop']);
  if (homeBackdrop != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideRoomLevelConfigDto
        .homeBackdrop = homeBackdrop;
  }
  final String? pcMedal = jsonConvert.convert<String>(json['pcMedal']);
  if (pcMedal != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideRoomLevelConfigDto
        .pcMedal = pcMedal;
  }
  final String? pcIcon = jsonConvert.convert<String>(json['pcIcon']);
  if (pcIcon != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideRoomLevelConfigDto
        .pcIcon = pcIcon;
  }
  final int? level = jsonConvert.convert<int>(json['level']);
  if (level != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideRoomLevelConfigDto.level =
        level;
  }
  final int? startPoints = jsonConvert.convert<int>(json['startPoints']);
  if (startPoints != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideRoomLevelConfigDto
        .startPoints = startPoints;
  }
  final int? endPoints = jsonConvert.convert<int>(json['endPoints']);
  if (endPoints != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideRoomLevelConfigDto
        .endPoints = endPoints;
  }
  final int? medalUsable = jsonConvert.convert<int>(json['medalUsable']);
  if (medalUsable != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideRoomLevelConfigDto
        .medalUsable = medalUsable;
  }
  final int? recommendUsable = jsonConvert.convert<int>(
      json['recommendUsable']);
  if (recommendUsable != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideRoomLevelConfigDto
        .recommendUsable = recommendUsable;
  }
  final int? recommendRate = jsonConvert.convert<int>(json['recommendRate']);
  if (recommendRate != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideRoomLevelConfigDto
        .recommendRate = recommendRate;
  }
  final int? giftUsable = jsonConvert.convert<int>(json['giftUsable']);
  if (giftUsable != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideRoomLevelConfigDto
        .giftUsable = giftUsable;
  }
  final int? avatarUsable = jsonConvert.convert<int>(json['avatarUsable']);
  if (avatarUsable != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideRoomLevelConfigDto
        .avatarUsable = avatarUsable;
  }
  final int? avatarConfigId = jsonConvert.convert<int>(json['avatarConfigId']);
  if (avatarConfigId != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideRoomLevelConfigDto
        .avatarConfigId = avatarConfigId;
  }
  final int? animationUsable = jsonConvert.convert<int>(
      json['animationUsable']);
  if (animationUsable != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideRoomLevelConfigDto
        .animationUsable = animationUsable;
  }
  final int? animationConfigId = jsonConvert.convert<int>(
      json['animationConfigId']);
  if (animationConfigId != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideRoomLevelConfigDto
        .animationConfigId = animationConfigId;
  }
  final int? nickColorUsable = jsonConvert.convert<int>(
      json['nickColorUsable']);
  if (nickColorUsable != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideRoomLevelConfigDto
        .nickColorUsable = nickColorUsable;
  }
  final int? nickColorConfigId = jsonConvert.convert<int>(
      json['nickColorConfigId']);
  if (nickColorConfigId != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideRoomLevelConfigDto
        .nickColorConfigId = nickColorConfigId;
  }
  final int? textColorUsable = jsonConvert.convert<int>(
      json['textColorUsable']);
  if (textColorUsable != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideRoomLevelConfigDto
        .textColorUsable = textColorUsable;
  }
  final int? textColorConfigId = jsonConvert.convert<int>(
      json['textColorConfigId']);
  if (textColorConfigId != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideRoomLevelConfigDto
        .textColorConfigId = textColorConfigId;
  }
  final int? birthdayUsable = jsonConvert.convert<int>(json['birthdayUsable']);
  if (birthdayUsable != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideRoomLevelConfigDto
        .birthdayUsable = birthdayUsable;
  }
  final int? birthdayRightsPackageId = jsonConvert.convert<int>(
      json['birthdayRightsPackageId']);
  if (birthdayRightsPackageId != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideRoomLevelConfigDto
        .birthdayRightsPackageId = birthdayRightsPackageId;
  }
  final int? invisibleRankUsable = jsonConvert.convert<int>(
      json['invisibleRankUsable']);
  if (invisibleRankUsable != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideRoomLevelConfigDto
        .invisibleRankUsable = invisibleRankUsable;
  }
  final String? invisibleRankNick = jsonConvert.convert<String>(
      json['invisibleRankNick']);
  if (invisibleRankNick != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideRoomLevelConfigDto
        .invisibleRankNick = invisibleRankNick;
  }
  final int? invisibleRoomUsable = jsonConvert.convert<int>(
      json['invisibleRoomUsable']);
  if (invisibleRoomUsable != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideRoomLevelConfigDto
        .invisibleRoomUsable = invisibleRoomUsable;
  }
  final int? supportUsable = jsonConvert.convert<int>(json['supportUsable']);
  if (supportUsable != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideRoomLevelConfigDto
        .supportUsable = supportUsable;
  }
  final int? productCreateUsable = jsonConvert.convert<int>(
      json['productCreateUsable']);
  if (productCreateUsable != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideRoomLevelConfigDto
        .productCreateUsable = productCreateUsable;
  }
  return queryDispatchRoomsByHeatResponseDataRecordsPresideRoomLevelConfigDto;
}

Map<String,
    dynamic> $QueryDispatchRoomsByHeatResponseDataRecordsPresideRoomLevelConfigDtoToJson(
    QueryDispatchRoomsByHeatResponseDataRecordsPresideRoomLevelConfigDto entity) {
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

extension QueryDispatchRoomsByHeatResponseDataRecordsPresideRoomLevelConfigDtoExtension on QueryDispatchRoomsByHeatResponseDataRecordsPresideRoomLevelConfigDto {
  QueryDispatchRoomsByHeatResponseDataRecordsPresideRoomLevelConfigDto copyWith(
      {
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
    return QueryDispatchRoomsByHeatResponseDataRecordsPresideRoomLevelConfigDto()
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

QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDto $QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoFromJson(
    Map<String, dynamic> json) {
  final QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDto queryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDto = QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDto();
  final QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoUserCurrent? userCurrent = jsonConvert
      .convert<
      QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoUserCurrent>(
      json['userCurrent']);
  if (userCurrent != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDto
        .userCurrent = userCurrent;
  }
  final QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoLevelBase? levelBase = jsonConvert
      .convert<
      QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoLevelBase>(
      json['levelBase']);
  if (levelBase != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDto.levelBase =
        levelBase;
  }
  final QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoPurchaseRecord? purchaseRecord = jsonConvert
      .convert<
      QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoPurchaseRecord>(
      json['purchaseRecord']);
  if (purchaseRecord != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDto
        .purchaseRecord = purchaseRecord;
  }
  final List<
      QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoPrivileges>? privileges = (json['privileges'] as List<
      dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<
          QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoPrivileges>(
          e) as QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoPrivileges)
      .toList();
  if (privileges != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDto.privileges =
        privileges;
  }
  return queryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDto;
}

Map<String,
    dynamic> $QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoToJson(
    QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDto entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['userCurrent'] = entity.userCurrent.toJson();
  data['levelBase'] = entity.levelBase.toJson();
  data['purchaseRecord'] = entity.purchaseRecord.toJson();
  data['privileges'] = entity.privileges.map((v) => v.toJson()).toList();
  return data;
}

extension QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoExtension on QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDto {
  QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDto copyWith({
    QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoUserCurrent? userCurrent,
    QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoLevelBase? levelBase,
    QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoPurchaseRecord? purchaseRecord,
    List<
        QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoPrivileges>? privileges,
  }) {
    return QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDto()
      ..userCurrent = userCurrent ?? this.userCurrent
      ..levelBase = levelBase ?? this.levelBase
      ..purchaseRecord = purchaseRecord ?? this.purchaseRecord
      ..privileges = privileges ?? this.privileges;
  }
}

QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoUserCurrent $QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoUserCurrentFromJson(
    Map<String, dynamic> json) {
  final QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoUserCurrent queryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoUserCurrent = QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoUserCurrent();
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoUserCurrent
        .userId = userId;
  }
  final int? nobleLevelId = jsonConvert.convert<int>(json['nobleLevelId']);
  if (nobleLevelId != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoUserCurrent
        .nobleLevelId = nobleLevelId;
  }
  final String? nobleName = jsonConvert.convert<String>(json['nobleName']);
  if (nobleName != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoUserCurrent
        .nobleName = nobleName;
  }
  final int? levelFlag = jsonConvert.convert<int>(json['levelFlag']);
  if (levelFlag != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoUserCurrent
        .levelFlag = levelFlag;
  }
  final String? startTime = jsonConvert.convert<String>(json['startTime']);
  if (startTime != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoUserCurrent
        .startTime = startTime;
  }
  final String? endTime = jsonConvert.convert<String>(json['endTime']);
  if (endTime != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoUserCurrent
        .endTime = endTime;
  }
  final int? remainingDays = jsonConvert.convert<int>(json['remainingDays']);
  if (remainingDays != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoUserCurrent
        .remainingDays = remainingDays;
  }
  return queryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoUserCurrent;
}

Map<String,
    dynamic> $QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoUserCurrentToJson(
    QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoUserCurrent entity) {
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

extension QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoUserCurrentExtension on QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoUserCurrent {
  QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoUserCurrent copyWith(
      {
        int? userId,
        int? nobleLevelId,
        String? nobleName,
        int? levelFlag,
        String? startTime,
        String? endTime,
        int? remainingDays,
      }) {
    return QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoUserCurrent()
      ..userId = userId ?? this.userId
      ..nobleLevelId = nobleLevelId ?? this.nobleLevelId
      ..nobleName = nobleName ?? this.nobleName
      ..levelFlag = levelFlag ?? this.levelFlag
      ..startTime = startTime ?? this.startTime
      ..endTime = endTime ?? this.endTime
      ..remainingDays = remainingDays ?? this.remainingDays;
  }
}

QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoLevelBase $QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoLevelBaseFromJson(
    Map<String, dynamic> json) {
  final QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoLevelBase queryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoLevelBase = QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoLevelBase();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoLevelBase
        .id = id;
  }
  final int? goodsId = jsonConvert.convert<int>(json['goodsId']);
  if (goodsId != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoLevelBase
        .goodsId = goodsId;
  }
  final int? propId = jsonConvert.convert<int>(json['propId']);
  if (propId != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoLevelBase
        .propId = propId;
  }
  final String? levelName = jsonConvert.convert<String>(json['levelName']);
  if (levelName != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoLevelBase
        .levelName = levelName;
  }
  final int? levelFlag = jsonConvert.convert<int>(json['levelFlag']);
  if (levelFlag != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoLevelBase
        .levelFlag = levelFlag;
  }
  final String? mainImageUrl = jsonConvert.convert<String>(
      json['mainImageUrl']);
  if (mainImageUrl != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoLevelBase
        .mainImageUrl = mainImageUrl;
  }
  final String? badgeImageUrl = jsonConvert.convert<String>(
      json['badgeImageUrl']);
  if (badgeImageUrl != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoLevelBase
        .badgeImageUrl = badgeImageUrl;
  }
  final String? middleImageUrl = jsonConvert.convert<String>(
      json['middleImageUrl']);
  if (middleImageUrl != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoLevelBase
        .middleImageUrl = middleImageUrl;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoLevelBase
        .description = description;
  }
  final int? purchaseType = jsonConvert.convert<int>(json['purchaseType']);
  if (purchaseType != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoLevelBase
        .purchaseType = purchaseType;
  }
  final int? firstPrice = jsonConvert.convert<int>(json['firstPrice']);
  if (firstPrice != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoLevelBase
        .firstPrice = firstPrice;
  }
  final int? renewPrice = jsonConvert.convert<int>(json['renewPrice']);
  if (renewPrice != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoLevelBase
        .renewPrice = renewPrice;
  }
  final int? firstSkuId = jsonConvert.convert<int>(json['firstSkuId']);
  if (firstSkuId != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoLevelBase
        .firstSkuId = firstSkuId;
  }
  final int? renewSkuId = jsonConvert.convert<int>(json['renewSkuId']);
  if (renewSkuId != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoLevelBase
        .renewSkuId = renewSkuId;
  }
  final int? firstGiftType = jsonConvert.convert<int>(json['firstGiftType']);
  if (firstGiftType != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoLevelBase
        .firstGiftType = firstGiftType;
  }
  final int? firstGiftId = jsonConvert.convert<int>(json['firstGiftId']);
  if (firstGiftId != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoLevelBase
        .firstGiftId = firstGiftId;
  }
  final String? firstGiftName = jsonConvert.convert<String>(
      json['firstGiftName']);
  if (firstGiftName != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoLevelBase
        .firstGiftName = firstGiftName;
  }
  final String? firstGiftUrl = jsonConvert.convert<String>(
      json['firstGiftUrl']);
  if (firstGiftUrl != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoLevelBase
        .firstGiftUrl = firstGiftUrl;
  }
  final int? firstGiftAmount = jsonConvert.convert<int>(
      json['firstGiftAmount']);
  if (firstGiftAmount != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoLevelBase
        .firstGiftAmount = firstGiftAmount;
  }
  final int? firstGiftPurchaseType = jsonConvert.convert<int>(
      json['firstGiftPurchaseType']);
  if (firstGiftPurchaseType != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoLevelBase
        .firstGiftPurchaseType = firstGiftPurchaseType;
  }
  final int? firstGiftPrice = jsonConvert.convert<int>(json['firstGiftPrice']);
  if (firstGiftPrice != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoLevelBase
        .firstGiftPrice = firstGiftPrice;
  }
  final bool? directPurchase = jsonConvert.convert<bool>(
      json['directPurchase']);
  if (directPurchase != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoLevelBase
        .directPurchase = directPurchase;
  }
  final int? purchaseDuration = jsonConvert.convert<int>(
      json['purchaseDuration']);
  if (purchaseDuration != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoLevelBase
        .purchaseDuration = purchaseDuration;
  }
  return queryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoLevelBase;
}

Map<String,
    dynamic> $QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoLevelBaseToJson(
    QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoLevelBase entity) {
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

extension QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoLevelBaseExtension on QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoLevelBase {
  QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoLevelBase copyWith(
      {
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
    return QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoLevelBase()
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

QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoPurchaseRecord $QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoPurchaseRecordFromJson(
    Map<String, dynamic> json) {
  final QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoPurchaseRecord queryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoPurchaseRecord = QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoPurchaseRecord();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoPurchaseRecord
        .id = id;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoPurchaseRecord
        .userId = userId;
  }
  final int? nobleLevelId = jsonConvert.convert<int>(json['nobleLevelId']);
  if (nobleLevelId != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoPurchaseRecord
        .nobleLevelId = nobleLevelId;
  }
  final String? nobleLevelName = jsonConvert.convert<String>(
      json['nobleLevelName']);
  if (nobleLevelName != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoPurchaseRecord
        .nobleLevelName = nobleLevelName;
  }
  final int? purchaseType = jsonConvert.convert<int>(json['purchaseType']);
  if (purchaseType != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoPurchaseRecord
        .purchaseType = purchaseType;
  }
  final int? price = jsonConvert.convert<int>(json['price']);
  if (price != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoPurchaseRecord
        .price = price;
  }
  final int? purchaseFlag = jsonConvert.convert<int>(json['purchaseFlag']);
  if (purchaseFlag != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoPurchaseRecord
        .purchaseFlag = purchaseFlag;
  }
  final int? durationDays = jsonConvert.convert<int>(json['durationDays']);
  if (durationDays != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoPurchaseRecord
        .durationDays = durationDays;
  }
  final String? purchaseTime = jsonConvert.convert<String>(
      json['purchaseTime']);
  if (purchaseTime != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoPurchaseRecord
        .purchaseTime = purchaseTime;
  }
  final int? roomId = jsonConvert.convert<int>(json['roomId']);
  if (roomId != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoPurchaseRecord
        .roomId = roomId;
  }
  final int? orderId = jsonConvert.convert<int>(json['orderId']);
  if (orderId != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoPurchaseRecord
        .orderId = orderId;
  }
  final String? orderNo = jsonConvert.convert<String>(json['orderNo']);
  if (orderNo != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoPurchaseRecord
        .orderNo = orderNo;
  }
  return queryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoPurchaseRecord;
}

Map<String,
    dynamic> $QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoPurchaseRecordToJson(
    QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoPurchaseRecord entity) {
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

extension QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoPurchaseRecordExtension on QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoPurchaseRecord {
  QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoPurchaseRecord copyWith(
      {
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
    return QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoPurchaseRecord()
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

QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoPrivileges $QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoPrivilegesFromJson(
    Map<String, dynamic> json) {
  final QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoPrivileges queryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoPrivileges = QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoPrivileges();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoPrivileges
        .id = id;
  }
  final String? privilegeName = jsonConvert.convert<String>(
      json['privilegeName']);
  if (privilegeName != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoPrivileges
        .privilegeName = privilegeName;
  }
  final int? privilegeType = jsonConvert.convert<int>(json['privilegeType']);
  if (privilegeType != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoPrivileges
        .privilegeType = privilegeType;
  }
  final String? privilegeFunction = jsonConvert.convert<String>(
      json['privilegeFunction']);
  if (privilegeFunction != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoPrivileges
        .privilegeFunction = privilegeFunction;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoPrivileges
        .description = description;
  }
  final String? imageUrl = jsonConvert.convert<String>(json['imageUrl']);
  if (imageUrl != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoPrivileges
        .imageUrl = imageUrl;
  }
  final bool? enabled = jsonConvert.convert<bool>(json['enabled']);
  if (enabled != null) {
    queryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoPrivileges
        .enabled = enabled;
  }
  return queryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoPrivileges;
}

Map<String,
    dynamic> $QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoPrivilegesToJson(
    QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoPrivileges entity) {
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

extension QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoPrivilegesExtension on QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoPrivileges {
  QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoPrivileges copyWith(
      {
        int? id,
        String? privilegeName,
        int? privilegeType,
        String? privilegeFunction,
        String? description,
        String? imageUrl,
        bool? enabled,
      }) {
    return QueryDispatchRoomsByHeatResponseDataRecordsPresideNobleLevelDtoPrivileges()
      ..id = id ?? this.id
      ..privilegeName = privilegeName ?? this.privilegeName
      ..privilegeType = privilegeType ?? this.privilegeType
      ..privilegeFunction = privilegeFunction ?? this.privilegeFunction
      ..description = description ?? this.description
      ..imageUrl = imageUrl ?? this.imageUrl
      ..enabled = enabled ?? this.enabled;
  }
}

QueryDispatchRoomsByHeatResponseDataRecordsOwner $QueryDispatchRoomsByHeatResponseDataRecordsOwnerFromJson(
    Map<String, dynamic> json) {
  final QueryDispatchRoomsByHeatResponseDataRecordsOwner queryDispatchRoomsByHeatResponseDataRecordsOwner = QueryDispatchRoomsByHeatResponseDataRecordsOwner();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwner.id = id;
  }
  final String? userNo = jsonConvert.convert<String>(json['userNo']);
  if (userNo != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwner.userNo = userNo;
  }
  final String? sex = jsonConvert.convert<String>(json['sex']);
  if (sex != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwner.sex = sex;
  }
  final String? nickName = jsonConvert.convert<String>(json['nickName']);
  if (nickName != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwner.nickName = nickName;
  }
  final String? avatar = jsonConvert.convert<String>(json['avatar']);
  if (avatar != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwner.avatar = avatar;
  }
  final int? onlineFlag = jsonConvert.convert<int>(json['onlineFlag']);
  if (onlineFlag != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwner.onlineFlag = onlineFlag;
  }
  final int? accompanyId = jsonConvert.convert<int>(json['accompanyId']);
  if (accompanyId != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwner.accompanyId = accompanyId;
  }
  final String? introduced = jsonConvert.convert<String>(json['introduced']);
  if (introduced != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwner.introduced = introduced;
  }
  final int? level = jsonConvert.convert<int>(json['level']);
  if (level != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwner.level = level;
  }
  final int? roomLevel = jsonConvert.convert<int>(json['roomLevel']);
  if (roomLevel != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwner.roomLevel = roomLevel;
  }
  final QueryDispatchRoomsByHeatResponseDataRecordsOwnerRoomLevelConfigDto? roomLevelConfigDto = jsonConvert
      .convert<
      QueryDispatchRoomsByHeatResponseDataRecordsOwnerRoomLevelConfigDto>(
      json['roomLevelConfigDto']);
  if (roomLevelConfigDto != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwner.roomLevelConfigDto =
        roomLevelConfigDto;
  }
  final QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDto? nobleLevelDto = jsonConvert
      .convert<QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDto>(
      json['nobleLevelDto']);
  if (nobleLevelDto != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwner.nobleLevelDto =
        nobleLevelDto;
  }
  final String? accompanyLevel = jsonConvert.convert<String>(
      json['accompanyLevel']);
  if (accompanyLevel != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwner.accompanyLevel =
        accompanyLevel;
  }
  final String? onlineTime = jsonConvert.convert<String>(json['onlineTime']);
  if (onlineTime != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwner.onlineTime = onlineTime;
  }
  final String? customIdentityImage = jsonConvert.convert<String>(
      json['customIdentityImage']);
  if (customIdentityImage != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwner.customIdentityImage =
        customIdentityImage;
  }
  final List<
      String>? customIdentityImageList = (json['customIdentityImageList'] as List<
      dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (customIdentityImageList != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwner.customIdentityImageList =
        customIdentityImageList;
  }
  final int? userMic = jsonConvert.convert<int>(json['userMic']);
  if (userMic != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwner.userMic = userMic;
  }
  final String? birthday = jsonConvert.convert<String>(json['birthday']);
  if (birthday != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwner.birthday = birthday;
  }
  final String? mainLabelId = jsonConvert.convert<String>(json['mainLabelId']);
  if (mainLabelId != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwner.mainLabelId = mainLabelId;
  }
  final String? mainLabel = jsonConvert.convert<String>(json['mainLabel']);
  if (mainLabel != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwner.mainLabel = mainLabel;
  }
  final String? moduleAvatar = jsonConvert.convert<String>(
      json['moduleAvatar']);
  if (moduleAvatar != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwner.moduleAvatar =
        moduleAvatar;
  }
  return queryDispatchRoomsByHeatResponseDataRecordsOwner;
}

Map<String, dynamic> $QueryDispatchRoomsByHeatResponseDataRecordsOwnerToJson(
    QueryDispatchRoomsByHeatResponseDataRecordsOwner entity) {
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

extension QueryDispatchRoomsByHeatResponseDataRecordsOwnerExtension on QueryDispatchRoomsByHeatResponseDataRecordsOwner {
  QueryDispatchRoomsByHeatResponseDataRecordsOwner copyWith({
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
    QueryDispatchRoomsByHeatResponseDataRecordsOwnerRoomLevelConfigDto? roomLevelConfigDto,
    QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDto? nobleLevelDto,
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
    return QueryDispatchRoomsByHeatResponseDataRecordsOwner()
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

QueryDispatchRoomsByHeatResponseDataRecordsOwnerRoomLevelConfigDto $QueryDispatchRoomsByHeatResponseDataRecordsOwnerRoomLevelConfigDtoFromJson(
    Map<String, dynamic> json) {
  final QueryDispatchRoomsByHeatResponseDataRecordsOwnerRoomLevelConfigDto queryDispatchRoomsByHeatResponseDataRecordsOwnerRoomLevelConfigDto = QueryDispatchRoomsByHeatResponseDataRecordsOwnerRoomLevelConfigDto();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerRoomLevelConfigDto.id = id;
  }
  final String? levelName = jsonConvert.convert<String>(json['levelName']);
  if (levelName != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerRoomLevelConfigDto
        .levelName = levelName;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerRoomLevelConfigDto.icon =
        icon;
  }
  final String? backdrop = jsonConvert.convert<String>(json['backdrop']);
  if (backdrop != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerRoomLevelConfigDto
        .backdrop = backdrop;
  }
  final String? medal = jsonConvert.convert<String>(json['medal']);
  if (medal != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerRoomLevelConfigDto.medal =
        medal;
  }
  final String? homeBackdrop = jsonConvert.convert<String>(
      json['homeBackdrop']);
  if (homeBackdrop != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerRoomLevelConfigDto
        .homeBackdrop = homeBackdrop;
  }
  final String? pcMedal = jsonConvert.convert<String>(json['pcMedal']);
  if (pcMedal != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerRoomLevelConfigDto.pcMedal =
        pcMedal;
  }
  final String? pcIcon = jsonConvert.convert<String>(json['pcIcon']);
  if (pcIcon != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerRoomLevelConfigDto.pcIcon =
        pcIcon;
  }
  final int? level = jsonConvert.convert<int>(json['level']);
  if (level != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerRoomLevelConfigDto.level =
        level;
  }
  final int? startPoints = jsonConvert.convert<int>(json['startPoints']);
  if (startPoints != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerRoomLevelConfigDto
        .startPoints = startPoints;
  }
  final int? endPoints = jsonConvert.convert<int>(json['endPoints']);
  if (endPoints != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerRoomLevelConfigDto
        .endPoints = endPoints;
  }
  final int? medalUsable = jsonConvert.convert<int>(json['medalUsable']);
  if (medalUsable != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerRoomLevelConfigDto
        .medalUsable = medalUsable;
  }
  final int? recommendUsable = jsonConvert.convert<int>(
      json['recommendUsable']);
  if (recommendUsable != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerRoomLevelConfigDto
        .recommendUsable = recommendUsable;
  }
  final int? recommendRate = jsonConvert.convert<int>(json['recommendRate']);
  if (recommendRate != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerRoomLevelConfigDto
        .recommendRate = recommendRate;
  }
  final int? giftUsable = jsonConvert.convert<int>(json['giftUsable']);
  if (giftUsable != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerRoomLevelConfigDto
        .giftUsable = giftUsable;
  }
  final int? avatarUsable = jsonConvert.convert<int>(json['avatarUsable']);
  if (avatarUsable != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerRoomLevelConfigDto
        .avatarUsable = avatarUsable;
  }
  final int? avatarConfigId = jsonConvert.convert<int>(json['avatarConfigId']);
  if (avatarConfigId != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerRoomLevelConfigDto
        .avatarConfigId = avatarConfigId;
  }
  final int? animationUsable = jsonConvert.convert<int>(
      json['animationUsable']);
  if (animationUsable != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerRoomLevelConfigDto
        .animationUsable = animationUsable;
  }
  final int? animationConfigId = jsonConvert.convert<int>(
      json['animationConfigId']);
  if (animationConfigId != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerRoomLevelConfigDto
        .animationConfigId = animationConfigId;
  }
  final int? nickColorUsable = jsonConvert.convert<int>(
      json['nickColorUsable']);
  if (nickColorUsable != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerRoomLevelConfigDto
        .nickColorUsable = nickColorUsable;
  }
  final int? nickColorConfigId = jsonConvert.convert<int>(
      json['nickColorConfigId']);
  if (nickColorConfigId != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerRoomLevelConfigDto
        .nickColorConfigId = nickColorConfigId;
  }
  final int? textColorUsable = jsonConvert.convert<int>(
      json['textColorUsable']);
  if (textColorUsable != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerRoomLevelConfigDto
        .textColorUsable = textColorUsable;
  }
  final int? textColorConfigId = jsonConvert.convert<int>(
      json['textColorConfigId']);
  if (textColorConfigId != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerRoomLevelConfigDto
        .textColorConfigId = textColorConfigId;
  }
  final int? birthdayUsable = jsonConvert.convert<int>(json['birthdayUsable']);
  if (birthdayUsable != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerRoomLevelConfigDto
        .birthdayUsable = birthdayUsable;
  }
  final int? birthdayRightsPackageId = jsonConvert.convert<int>(
      json['birthdayRightsPackageId']);
  if (birthdayRightsPackageId != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerRoomLevelConfigDto
        .birthdayRightsPackageId = birthdayRightsPackageId;
  }
  final int? invisibleRankUsable = jsonConvert.convert<int>(
      json['invisibleRankUsable']);
  if (invisibleRankUsable != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerRoomLevelConfigDto
        .invisibleRankUsable = invisibleRankUsable;
  }
  final String? invisibleRankNick = jsonConvert.convert<String>(
      json['invisibleRankNick']);
  if (invisibleRankNick != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerRoomLevelConfigDto
        .invisibleRankNick = invisibleRankNick;
  }
  final int? invisibleRoomUsable = jsonConvert.convert<int>(
      json['invisibleRoomUsable']);
  if (invisibleRoomUsable != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerRoomLevelConfigDto
        .invisibleRoomUsable = invisibleRoomUsable;
  }
  final int? supportUsable = jsonConvert.convert<int>(json['supportUsable']);
  if (supportUsable != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerRoomLevelConfigDto
        .supportUsable = supportUsable;
  }
  final int? productCreateUsable = jsonConvert.convert<int>(
      json['productCreateUsable']);
  if (productCreateUsable != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerRoomLevelConfigDto
        .productCreateUsable = productCreateUsable;
  }
  return queryDispatchRoomsByHeatResponseDataRecordsOwnerRoomLevelConfigDto;
}

Map<String,
    dynamic> $QueryDispatchRoomsByHeatResponseDataRecordsOwnerRoomLevelConfigDtoToJson(
    QueryDispatchRoomsByHeatResponseDataRecordsOwnerRoomLevelConfigDto entity) {
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

extension QueryDispatchRoomsByHeatResponseDataRecordsOwnerRoomLevelConfigDtoExtension on QueryDispatchRoomsByHeatResponseDataRecordsOwnerRoomLevelConfigDto {
  QueryDispatchRoomsByHeatResponseDataRecordsOwnerRoomLevelConfigDto copyWith({
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
    return QueryDispatchRoomsByHeatResponseDataRecordsOwnerRoomLevelConfigDto()
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

QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDto $QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoFromJson(
    Map<String, dynamic> json) {
  final QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDto queryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDto = QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDto();
  final QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoUserCurrent? userCurrent = jsonConvert
      .convert<
      QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoUserCurrent>(
      json['userCurrent']);
  if (userCurrent != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDto.userCurrent =
        userCurrent;
  }
  final QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoLevelBase? levelBase = jsonConvert
      .convert<
      QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoLevelBase>(
      json['levelBase']);
  if (levelBase != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDto.levelBase =
        levelBase;
  }
  final QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoPurchaseRecord? purchaseRecord = jsonConvert
      .convert<
      QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoPurchaseRecord>(
      json['purchaseRecord']);
  if (purchaseRecord != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDto
        .purchaseRecord = purchaseRecord;
  }
  final List<
      QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoPrivileges>? privileges = (json['privileges'] as List<
      dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<
          QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoPrivileges>(
          e) as QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoPrivileges)
      .toList();
  if (privileges != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDto.privileges =
        privileges;
  }
  return queryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDto;
}

Map<String,
    dynamic> $QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoToJson(
    QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDto entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['userCurrent'] = entity.userCurrent.toJson();
  data['levelBase'] = entity.levelBase.toJson();
  data['purchaseRecord'] = entity.purchaseRecord.toJson();
  data['privileges'] = entity.privileges.map((v) => v.toJson()).toList();
  return data;
}

extension QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoExtension on QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDto {
  QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDto copyWith({
    QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoUserCurrent? userCurrent,
    QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoLevelBase? levelBase,
    QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoPurchaseRecord? purchaseRecord,
    List<
        QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoPrivileges>? privileges,
  }) {
    return QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDto()
      ..userCurrent = userCurrent ?? this.userCurrent
      ..levelBase = levelBase ?? this.levelBase
      ..purchaseRecord = purchaseRecord ?? this.purchaseRecord
      ..privileges = privileges ?? this.privileges;
  }
}

QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoUserCurrent $QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoUserCurrentFromJson(
    Map<String, dynamic> json) {
  final QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoUserCurrent queryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoUserCurrent = QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoUserCurrent();
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoUserCurrent
        .userId = userId;
  }
  final int? nobleLevelId = jsonConvert.convert<int>(json['nobleLevelId']);
  if (nobleLevelId != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoUserCurrent
        .nobleLevelId = nobleLevelId;
  }
  final String? nobleName = jsonConvert.convert<String>(json['nobleName']);
  if (nobleName != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoUserCurrent
        .nobleName = nobleName;
  }
  final int? levelFlag = jsonConvert.convert<int>(json['levelFlag']);
  if (levelFlag != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoUserCurrent
        .levelFlag = levelFlag;
  }
  final String? startTime = jsonConvert.convert<String>(json['startTime']);
  if (startTime != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoUserCurrent
        .startTime = startTime;
  }
  final String? endTime = jsonConvert.convert<String>(json['endTime']);
  if (endTime != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoUserCurrent
        .endTime = endTime;
  }
  final int? remainingDays = jsonConvert.convert<int>(json['remainingDays']);
  if (remainingDays != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoUserCurrent
        .remainingDays = remainingDays;
  }
  return queryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoUserCurrent;
}

Map<String,
    dynamic> $QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoUserCurrentToJson(
    QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoUserCurrent entity) {
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

extension QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoUserCurrentExtension on QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoUserCurrent {
  QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoUserCurrent copyWith(
      {
        int? userId,
        int? nobleLevelId,
        String? nobleName,
        int? levelFlag,
        String? startTime,
        String? endTime,
        int? remainingDays,
      }) {
    return QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoUserCurrent()
      ..userId = userId ?? this.userId
      ..nobleLevelId = nobleLevelId ?? this.nobleLevelId
      ..nobleName = nobleName ?? this.nobleName
      ..levelFlag = levelFlag ?? this.levelFlag
      ..startTime = startTime ?? this.startTime
      ..endTime = endTime ?? this.endTime
      ..remainingDays = remainingDays ?? this.remainingDays;
  }
}

QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoLevelBase $QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoLevelBaseFromJson(
    Map<String, dynamic> json) {
  final QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoLevelBase queryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoLevelBase = QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoLevelBase();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoLevelBase.id =
        id;
  }
  final int? goodsId = jsonConvert.convert<int>(json['goodsId']);
  if (goodsId != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoLevelBase
        .goodsId = goodsId;
  }
  final int? propId = jsonConvert.convert<int>(json['propId']);
  if (propId != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoLevelBase
        .propId = propId;
  }
  final String? levelName = jsonConvert.convert<String>(json['levelName']);
  if (levelName != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoLevelBase
        .levelName = levelName;
  }
  final int? levelFlag = jsonConvert.convert<int>(json['levelFlag']);
  if (levelFlag != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoLevelBase
        .levelFlag = levelFlag;
  }
  final String? mainImageUrl = jsonConvert.convert<String>(
      json['mainImageUrl']);
  if (mainImageUrl != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoLevelBase
        .mainImageUrl = mainImageUrl;
  }
  final String? badgeImageUrl = jsonConvert.convert<String>(
      json['badgeImageUrl']);
  if (badgeImageUrl != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoLevelBase
        .badgeImageUrl = badgeImageUrl;
  }
  final String? middleImageUrl = jsonConvert.convert<String>(
      json['middleImageUrl']);
  if (middleImageUrl != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoLevelBase
        .middleImageUrl = middleImageUrl;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoLevelBase
        .description = description;
  }
  final int? purchaseType = jsonConvert.convert<int>(json['purchaseType']);
  if (purchaseType != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoLevelBase
        .purchaseType = purchaseType;
  }
  final int? firstPrice = jsonConvert.convert<int>(json['firstPrice']);
  if (firstPrice != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoLevelBase
        .firstPrice = firstPrice;
  }
  final int? renewPrice = jsonConvert.convert<int>(json['renewPrice']);
  if (renewPrice != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoLevelBase
        .renewPrice = renewPrice;
  }
  final int? firstSkuId = jsonConvert.convert<int>(json['firstSkuId']);
  if (firstSkuId != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoLevelBase
        .firstSkuId = firstSkuId;
  }
  final int? renewSkuId = jsonConvert.convert<int>(json['renewSkuId']);
  if (renewSkuId != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoLevelBase
        .renewSkuId = renewSkuId;
  }
  final int? firstGiftType = jsonConvert.convert<int>(json['firstGiftType']);
  if (firstGiftType != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoLevelBase
        .firstGiftType = firstGiftType;
  }
  final int? firstGiftId = jsonConvert.convert<int>(json['firstGiftId']);
  if (firstGiftId != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoLevelBase
        .firstGiftId = firstGiftId;
  }
  final String? firstGiftName = jsonConvert.convert<String>(
      json['firstGiftName']);
  if (firstGiftName != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoLevelBase
        .firstGiftName = firstGiftName;
  }
  final String? firstGiftUrl = jsonConvert.convert<String>(
      json['firstGiftUrl']);
  if (firstGiftUrl != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoLevelBase
        .firstGiftUrl = firstGiftUrl;
  }
  final int? firstGiftAmount = jsonConvert.convert<int>(
      json['firstGiftAmount']);
  if (firstGiftAmount != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoLevelBase
        .firstGiftAmount = firstGiftAmount;
  }
  final int? firstGiftPurchaseType = jsonConvert.convert<int>(
      json['firstGiftPurchaseType']);
  if (firstGiftPurchaseType != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoLevelBase
        .firstGiftPurchaseType = firstGiftPurchaseType;
  }
  final int? firstGiftPrice = jsonConvert.convert<int>(json['firstGiftPrice']);
  if (firstGiftPrice != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoLevelBase
        .firstGiftPrice = firstGiftPrice;
  }
  final bool? directPurchase = jsonConvert.convert<bool>(
      json['directPurchase']);
  if (directPurchase != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoLevelBase
        .directPurchase = directPurchase;
  }
  final int? purchaseDuration = jsonConvert.convert<int>(
      json['purchaseDuration']);
  if (purchaseDuration != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoLevelBase
        .purchaseDuration = purchaseDuration;
  }
  return queryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoLevelBase;
}

Map<String,
    dynamic> $QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoLevelBaseToJson(
    QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoLevelBase entity) {
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

extension QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoLevelBaseExtension on QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoLevelBase {
  QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoLevelBase copyWith(
      {
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
    return QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoLevelBase()
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

QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoPurchaseRecord $QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoPurchaseRecordFromJson(
    Map<String, dynamic> json) {
  final QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoPurchaseRecord queryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoPurchaseRecord = QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoPurchaseRecord();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoPurchaseRecord
        .id = id;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoPurchaseRecord
        .userId = userId;
  }
  final int? nobleLevelId = jsonConvert.convert<int>(json['nobleLevelId']);
  if (nobleLevelId != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoPurchaseRecord
        .nobleLevelId = nobleLevelId;
  }
  final String? nobleLevelName = jsonConvert.convert<String>(
      json['nobleLevelName']);
  if (nobleLevelName != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoPurchaseRecord
        .nobleLevelName = nobleLevelName;
  }
  final int? purchaseType = jsonConvert.convert<int>(json['purchaseType']);
  if (purchaseType != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoPurchaseRecord
        .purchaseType = purchaseType;
  }
  final int? price = jsonConvert.convert<int>(json['price']);
  if (price != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoPurchaseRecord
        .price = price;
  }
  final int? purchaseFlag = jsonConvert.convert<int>(json['purchaseFlag']);
  if (purchaseFlag != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoPurchaseRecord
        .purchaseFlag = purchaseFlag;
  }
  final int? durationDays = jsonConvert.convert<int>(json['durationDays']);
  if (durationDays != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoPurchaseRecord
        .durationDays = durationDays;
  }
  final String? purchaseTime = jsonConvert.convert<String>(
      json['purchaseTime']);
  if (purchaseTime != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoPurchaseRecord
        .purchaseTime = purchaseTime;
  }
  final int? roomId = jsonConvert.convert<int>(json['roomId']);
  if (roomId != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoPurchaseRecord
        .roomId = roomId;
  }
  final int? orderId = jsonConvert.convert<int>(json['orderId']);
  if (orderId != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoPurchaseRecord
        .orderId = orderId;
  }
  final String? orderNo = jsonConvert.convert<String>(json['orderNo']);
  if (orderNo != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoPurchaseRecord
        .orderNo = orderNo;
  }
  return queryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoPurchaseRecord;
}

Map<String,
    dynamic> $QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoPurchaseRecordToJson(
    QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoPurchaseRecord entity) {
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

extension QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoPurchaseRecordExtension on QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoPurchaseRecord {
  QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoPurchaseRecord copyWith(
      {
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
    return QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoPurchaseRecord()
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

QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoPrivileges $QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoPrivilegesFromJson(
    Map<String, dynamic> json) {
  final QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoPrivileges queryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoPrivileges = QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoPrivileges();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoPrivileges.id =
        id;
  }
  final String? privilegeName = jsonConvert.convert<String>(
      json['privilegeName']);
  if (privilegeName != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoPrivileges
        .privilegeName = privilegeName;
  }
  final int? privilegeType = jsonConvert.convert<int>(json['privilegeType']);
  if (privilegeType != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoPrivileges
        .privilegeType = privilegeType;
  }
  final String? privilegeFunction = jsonConvert.convert<String>(
      json['privilegeFunction']);
  if (privilegeFunction != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoPrivileges
        .privilegeFunction = privilegeFunction;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoPrivileges
        .description = description;
  }
  final String? imageUrl = jsonConvert.convert<String>(json['imageUrl']);
  if (imageUrl != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoPrivileges
        .imageUrl = imageUrl;
  }
  final bool? enabled = jsonConvert.convert<bool>(json['enabled']);
  if (enabled != null) {
    queryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoPrivileges
        .enabled = enabled;
  }
  return queryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoPrivileges;
}

Map<String,
    dynamic> $QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoPrivilegesToJson(
    QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoPrivileges entity) {
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

extension QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoPrivilegesExtension on QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoPrivileges {
  QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoPrivileges copyWith(
      {
        int? id,
        String? privilegeName,
        int? privilegeType,
        String? privilegeFunction,
        String? description,
        String? imageUrl,
        bool? enabled,
      }) {
    return QueryDispatchRoomsByHeatResponseDataRecordsOwnerNobleLevelDtoPrivileges()
      ..id = id ?? this.id
      ..privilegeName = privilegeName ?? this.privilegeName
      ..privilegeType = privilegeType ?? this.privilegeType
      ..privilegeFunction = privilegeFunction ?? this.privilegeFunction
      ..description = description ?? this.description
      ..imageUrl = imageUrl ?? this.imageUrl
      ..enabled = enabled ?? this.enabled;
  }
}