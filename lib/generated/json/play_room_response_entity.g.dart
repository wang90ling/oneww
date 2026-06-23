import 'package:oneww/generated/json/base/json_convert_content.dart';
import 'package:oneww/models/play_room_response_entity.dart';

PlayRoomResponseEntity $PlayRoomResponseEntityFromJson(
    Map<String, dynamic> json) {
  final PlayRoomResponseEntity playRoomResponseEntity = PlayRoomResponseEntity();
  final String? requestId = jsonConvert.convert<String>(json['request_id']);
  if (requestId != null) {
    playRoomResponseEntity.requestId = requestId;
  }
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    playRoomResponseEntity.code = code;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    playRoomResponseEntity.message = message;
  }
  final PlayRoomResponseData? data = jsonConvert.convert<PlayRoomResponseData>(
      json['data']);
  if (data != null) {
    playRoomResponseEntity.data = data;
  }
  return playRoomResponseEntity;
}

Map<String, dynamic> $PlayRoomResponseEntityToJson(
    PlayRoomResponseEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['request_id'] = entity.requestId;
  data['code'] = entity.code;
  data['message'] = entity.message;
  data['data'] = entity.data?.toJson();
  return data;
}

extension PlayRoomResponseEntityExtension on PlayRoomResponseEntity {
  PlayRoomResponseEntity copyWith({
    String? requestId,
    int? code,
    String? message,
    PlayRoomResponseData? data,
  }) {
    return PlayRoomResponseEntity()
      ..requestId = requestId ?? this.requestId
      ..code = code ?? this.code
      ..message = message ?? this.message
      ..data = data ?? this.data;
  }
}

PlayRoomResponseData $PlayRoomResponseDataFromJson(Map<String, dynamic> json) {
  final PlayRoomResponseData playRoomResponseData = PlayRoomResponseData();
  final int? pageNo = jsonConvert.convert<int>(json['pageNo']);
  if (pageNo != null) {
    playRoomResponseData.pageNo = pageNo;
  }
  final int? pageSize = jsonConvert.convert<int>(json['pageSize']);
  if (pageSize != null) {
    playRoomResponseData.pageSize = pageSize;
  }
  final int? total = jsonConvert.convert<int>(json['total']);
  if (total != null) {
    playRoomResponseData.total = total;
  }
  final int? pages = jsonConvert.convert<int>(json['pages']);
  if (pages != null) {
    playRoomResponseData.pages = pages;
  }
  final List<PlayRoomResponseDataRecords>? records = (json['records'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<PlayRoomResponseDataRecords>(
          e) as PlayRoomResponseDataRecords).toList();
  if (records != null) {
    playRoomResponseData.records = records;
  }
  return playRoomResponseData;
}

Map<String, dynamic> $PlayRoomResponseDataToJson(PlayRoomResponseData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['pageNo'] = entity.pageNo;
  data['pageSize'] = entity.pageSize;
  data['total'] = entity.total;
  data['pages'] = entity.pages;
  data['records'] = entity.records.map((v) => v.toJson()).toList();
  return data;
}

extension PlayRoomResponseDataExtension on PlayRoomResponseData {
  PlayRoomResponseData copyWith({
    int? pageNo,
    int? pageSize,
    int? total,
    int? pages,
    List<PlayRoomResponseDataRecords>? records,
  }) {
    return PlayRoomResponseData()
      ..pageNo = pageNo ?? this.pageNo
      ..pageSize = pageSize ?? this.pageSize
      ..total = total ?? this.total
      ..pages = pages ?? this.pages
      ..records = records ?? this.records;
  }
}

PlayRoomResponseDataRecords $PlayRoomResponseDataRecordsFromJson(
    Map<String, dynamic> json) {
  final PlayRoomResponseDataRecords playRoomResponseDataRecords = PlayRoomResponseDataRecords();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    playRoomResponseDataRecords.id = id;
  }
  final int? moduleId = jsonConvert.convert<int>(json['moduleId']);
  if (moduleId != null) {
    playRoomResponseDataRecords.moduleId = moduleId;
  }
  final String? moduleName = jsonConvert.convert<String>(json['moduleName']);
  if (moduleName != null) {
    playRoomResponseDataRecords.moduleName = moduleName;
  }
  final String? mainLabel = jsonConvert.convert<String>(json['mainLabel']);
  if (mainLabel != null) {
    playRoomResponseDataRecords.mainLabel = mainLabel;
  }
  final String? moduleAvatar = jsonConvert.convert<String>(
      json['moduleAvatar']);
  if (moduleAvatar != null) {
    playRoomResponseDataRecords.moduleAvatar = moduleAvatar;
  }
  final int? roomNo = jsonConvert.convert<int>(json['roomNo']);
  if (roomNo != null) {
    playRoomResponseDataRecords.roomNo = roomNo;
  }
  final String? roomName = jsonConvert.convert<String>(json['roomName']);
  if (roomName != null) {
    playRoomResponseDataRecords.roomName = roomName;
  }
  final String? roomAvatar = jsonConvert.convert<String>(json['roomAvatar']);
  if (roomAvatar != null) {
    playRoomResponseDataRecords.roomAvatar = roomAvatar;
  }
  final int? roomType = jsonConvert.convert<int>(json['roomType']);
  if (roomType != null) {
    playRoomResponseDataRecords.roomType = roomType;
  }
  final String? roomTypeName = jsonConvert.convert<String>(
      json['roomTypeName']);
  if (roomTypeName != null) {
    playRoomResponseDataRecords.roomTypeName = roomTypeName;
  }
  final int? roomStatus = jsonConvert.convert<int>(json['roomStatus']);
  if (roomStatus != null) {
    playRoomResponseDataRecords.roomStatus = roomStatus;
  }
  final int? display = jsonConvert.convert<int>(json['display']);
  if (display != null) {
    playRoomResponseDataRecords.display = display;
  }
  final int? openStatus = jsonConvert.convert<int>(json['openStatus']);
  if (openStatus != null) {
    playRoomResponseDataRecords.openStatus = openStatus;
  }
  final String? announcement = jsonConvert.convert<String>(
      json['announcement']);
  if (announcement != null) {
    playRoomResponseDataRecords.announcement = announcement;
  }
  final String? welcomeMsg = jsonConvert.convert<String>(json['welcomeMsg']);
  if (welcomeMsg != null) {
    playRoomResponseDataRecords.welcomeMsg = welcomeMsg;
  }
  final int? heatValue = jsonConvert.convert<int>(json['heatValue']);
  if (heatValue != null) {
    playRoomResponseDataRecords.heatValue = heatValue;
  }
  final String? heatValueStr = jsonConvert.convert<String>(
      json['heatValueStr']);
  if (heatValueStr != null) {
    playRoomResponseDataRecords.heatValueStr = heatValueStr;
  }
  final int? followStatus = jsonConvert.convert<int>(json['followStatus']);
  if (followStatus != null) {
    playRoomResponseDataRecords.followStatus = followStatus;
  }
  final int? onlineCount = jsonConvert.convert<int>(json['onlineCount']);
  if (onlineCount != null) {
    playRoomResponseDataRecords.onlineCount = onlineCount;
  }
  final int? withdrawalSettings = jsonConvert.convert<int>(
      json['withdrawalSettings']);
  if (withdrawalSettings != null) {
    playRoomResponseDataRecords.withdrawalSettings = withdrawalSettings;
  }
  final int? passwordSettings = jsonConvert.convert<int>(
      json['passwordSettings']);
  if (passwordSettings != null) {
    playRoomResponseDataRecords.passwordSettings = passwordSettings;
  }
  final int? roomOwner = jsonConvert.convert<int>(json['roomOwner']);
  if (roomOwner != null) {
    playRoomResponseDataRecords.roomOwner = roomOwner;
  }
  final int? wallpaperPropId = jsonConvert.convert<int>(
      json['wallpaperPropId']);
  if (wallpaperPropId != null) {
    playRoomResponseDataRecords.wallpaperPropId = wallpaperPropId;
  }
  final String? wallpaperWearTime = jsonConvert.convert<String>(
      json['wallpaperWearTime']);
  if (wallpaperWearTime != null) {
    playRoomResponseDataRecords.wallpaperWearTime = wallpaperWearTime;
  }
  final int? wearStatus = jsonConvert.convert<int>(json['wearStatus']);
  if (wearStatus != null) {
    playRoomResponseDataRecords.wearStatus = wearStatus;
  }
  final PlayRoomResponseDataRecordsWallpaperPropInfo? wallpaperPropInfo = jsonConvert
      .convert<PlayRoomResponseDataRecordsWallpaperPropInfo>(
      json['wallpaperPropInfo']);
  if (wallpaperPropInfo != null) {
    playRoomResponseDataRecords.wallpaperPropInfo = wallpaperPropInfo;
  }
  final int? defaultWallpaperPropId = jsonConvert.convert<int>(
      json['defaultWallpaperPropId']);
  if (defaultWallpaperPropId != null) {
    playRoomResponseDataRecords.defaultWallpaperPropId = defaultWallpaperPropId;
  }
  final PlayRoomResponseDataRecordsDefaultWallpaperPropInfo? defaultWallpaperPropInfo = jsonConvert
      .convert<PlayRoomResponseDataRecordsDefaultWallpaperPropInfo>(
      json['defaultWallpaperPropInfo']);
  if (defaultWallpaperPropInfo != null) {
    playRoomResponseDataRecords.defaultWallpaperPropInfo =
        defaultWallpaperPropInfo;
  }
  final int? guildId = jsonConvert.convert<int>(json['guildId']);
  if (guildId != null) {
    playRoomResponseDataRecords.guildId = guildId;
  }
  final String? userName = jsonConvert.convert<String>(json['userName']);
  if (userName != null) {
    playRoomResponseDataRecords.userName = userName;
  }
  final String? userAvatar = jsonConvert.convert<String>(json['userAvatar']);
  if (userAvatar != null) {
    playRoomResponseDataRecords.userAvatar = userAvatar;
  }
  final int? otherType = jsonConvert.convert<int>(json['otherType']);
  if (otherType != null) {
    playRoomResponseDataRecords.otherType = otherType;
  }
  final String? otherBusinessId = jsonConvert.convert<String>(
      json['otherBusinessId']);
  if (otherBusinessId != null) {
    playRoomResponseDataRecords.otherBusinessId = otherBusinessId;
  }
  final String? otherValue = jsonConvert.convert<String>(json['otherValue']);
  if (otherValue != null) {
    playRoomResponseDataRecords.otherValue = otherValue;
  }
  final String? otherAvatar = jsonConvert.convert<String>(json['otherAvatar']);
  if (otherAvatar != null) {
    playRoomResponseDataRecords.otherAvatar = otherAvatar;
  }
  final int? kolId = jsonConvert.convert<int>(json['kolId']);
  if (kolId != null) {
    playRoomResponseDataRecords.kolId = kolId;
  }
  final int? businessRoomType = jsonConvert.convert<int>(
      json['businessRoomType']);
  if (businessRoomType != null) {
    playRoomResponseDataRecords.businessRoomType = businessRoomType;
  }
  final List<
      PlayRoomResponseDataRecordsMicUsers>? micUsers = (json['micUsers'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<PlayRoomResponseDataRecordsMicUsers>(
          e) as PlayRoomResponseDataRecordsMicUsers).toList();
  if (micUsers != null) {
    playRoomResponseDataRecords.micUsers = micUsers;
  }
  final String? gloryBorder = jsonConvert.convert<String>(json['gloryBorder']);
  if (gloryBorder != null) {
    playRoomResponseDataRecords.gloryBorder = gloryBorder;
  }
  return playRoomResponseDataRecords;
}

Map<String, dynamic> $PlayRoomResponseDataRecordsToJson(
    PlayRoomResponseDataRecords entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['moduleId'] = entity.moduleId;
  data['moduleName'] = entity.moduleName;
  data['mainLabel'] = entity.mainLabel;
  data['moduleAvatar'] = entity.moduleAvatar;
  data['roomNo'] = entity.roomNo;
  data['roomName'] = entity.roomName;
  data['roomAvatar'] = entity.roomAvatar;
  data['roomType'] = entity.roomType;
  data['roomTypeName'] = entity.roomTypeName;
  data['roomStatus'] = entity.roomStatus;
  data['display'] = entity.display;
  data['openStatus'] = entity.openStatus;
  data['announcement'] = entity.announcement;
  data['welcomeMsg'] = entity.welcomeMsg;
  data['heatValue'] = entity.heatValue;
  data['heatValueStr'] = entity.heatValueStr;
  data['followStatus'] = entity.followStatus;
  data['onlineCount'] = entity.onlineCount;
  data['withdrawalSettings'] = entity.withdrawalSettings;
  data['passwordSettings'] = entity.passwordSettings;
  data['roomOwner'] = entity.roomOwner;
  data['wallpaperPropId'] = entity.wallpaperPropId;
  data['wallpaperWearTime'] = entity.wallpaperWearTime;
  data['wearStatus'] = entity.wearStatus;
  data['wallpaperPropInfo'] = entity.wallpaperPropInfo?.toJson();
  data['defaultWallpaperPropId'] = entity.defaultWallpaperPropId;
  data['defaultWallpaperPropInfo'] = entity.defaultWallpaperPropInfo?.toJson();
  data['guildId'] = entity.guildId;
  data['userName'] = entity.userName;
  data['userAvatar'] = entity.userAvatar;
  data['otherType'] = entity.otherType;
  data['otherBusinessId'] = entity.otherBusinessId;
  data['otherValue'] = entity.otherValue;
  data['otherAvatar'] = entity.otherAvatar;
  data['kolId'] = entity.kolId;
  data['businessRoomType'] = entity.businessRoomType;
  data['micUsers'] = entity.micUsers.map((v) => v.toJson()).toList();
  data['gloryBorder'] = entity.gloryBorder;
  return data;
}

extension PlayRoomResponseDataRecordsExtension on PlayRoomResponseDataRecords {
  PlayRoomResponseDataRecords copyWith({
    int? id,
    int? moduleId,
    String? moduleName,
    String? mainLabel,
    String? moduleAvatar,
    int? roomNo,
    String? roomName,
    String? roomAvatar,
    int? roomType,
    String? roomTypeName,
    int? roomStatus,
    int? display,
    int? openStatus,
    String? announcement,
    String? welcomeMsg,
    int? heatValue,
    String? heatValueStr,
    int? followStatus,
    int? onlineCount,
    int? withdrawalSettings,
    int? passwordSettings,
    int? roomOwner,
    int? wallpaperPropId,
    String? wallpaperWearTime,
    int? wearStatus,
    PlayRoomResponseDataRecordsWallpaperPropInfo? wallpaperPropInfo,
    int? defaultWallpaperPropId,
    PlayRoomResponseDataRecordsDefaultWallpaperPropInfo? defaultWallpaperPropInfo,
    int? guildId,
    String? userName,
    String? userAvatar,
    int? otherType,
    String? otherBusinessId,
    String? otherValue,
    String? otherAvatar,
    int? kolId,
    int? businessRoomType,
    List<PlayRoomResponseDataRecordsMicUsers>? micUsers,
    String? gloryBorder,
  }) {
    return PlayRoomResponseDataRecords()
      ..id = id ?? this.id
      ..moduleId = moduleId ?? this.moduleId
      ..moduleName = moduleName ?? this.moduleName
      ..mainLabel = mainLabel ?? this.mainLabel
      ..moduleAvatar = moduleAvatar ?? this.moduleAvatar
      ..roomNo = roomNo ?? this.roomNo
      ..roomName = roomName ?? this.roomName
      ..roomAvatar = roomAvatar ?? this.roomAvatar
      ..roomType = roomType ?? this.roomType
      ..roomTypeName = roomTypeName ?? this.roomTypeName
      ..roomStatus = roomStatus ?? this.roomStatus
      ..display = display ?? this.display
      ..openStatus = openStatus ?? this.openStatus
      ..announcement = announcement ?? this.announcement
      ..welcomeMsg = welcomeMsg ?? this.welcomeMsg
      ..heatValue = heatValue ?? this.heatValue
      ..heatValueStr = heatValueStr ?? this.heatValueStr
      ..followStatus = followStatus ?? this.followStatus
      ..onlineCount = onlineCount ?? this.onlineCount
      ..withdrawalSettings = withdrawalSettings ?? this.withdrawalSettings
      ..passwordSettings = passwordSettings ?? this.passwordSettings
      ..roomOwner = roomOwner ?? this.roomOwner
      ..wallpaperPropId = wallpaperPropId ?? this.wallpaperPropId
      ..wallpaperWearTime = wallpaperWearTime ?? this.wallpaperWearTime
      ..wearStatus = wearStatus ?? this.wearStatus
      ..wallpaperPropInfo = wallpaperPropInfo ?? this.wallpaperPropInfo
      ..defaultWallpaperPropId = defaultWallpaperPropId ??
          this.defaultWallpaperPropId
      ..defaultWallpaperPropInfo = defaultWallpaperPropInfo ??
          this.defaultWallpaperPropInfo
      ..guildId = guildId ?? this.guildId
      ..userName = userName ?? this.userName
      ..userAvatar = userAvatar ?? this.userAvatar
      ..otherType = otherType ?? this.otherType
      ..otherBusinessId = otherBusinessId ?? this.otherBusinessId
      ..otherValue = otherValue ?? this.otherValue
      ..otherAvatar = otherAvatar ?? this.otherAvatar
      ..kolId = kolId ?? this.kolId
      ..businessRoomType = businessRoomType ?? this.businessRoomType
      ..micUsers = micUsers ?? this.micUsers
      ..gloryBorder = gloryBorder ?? this.gloryBorder;
  }
}

PlayRoomResponseDataRecordsWallpaperPropInfo $PlayRoomResponseDataRecordsWallpaperPropInfoFromJson(
    Map<String, dynamic> json) {
  final PlayRoomResponseDataRecordsWallpaperPropInfo playRoomResponseDataRecordsWallpaperPropInfo = PlayRoomResponseDataRecordsWallpaperPropInfo();
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    playRoomResponseDataRecordsWallpaperPropInfo.userId = userId;
  }
  final int? propId = jsonConvert.convert<int>(json['propId']);
  if (propId != null) {
    playRoomResponseDataRecordsWallpaperPropInfo.propId = propId;
  }
  final String? propName = jsonConvert.convert<String>(json['propName']);
  if (propName != null) {
    playRoomResponseDataRecordsWallpaperPropInfo.propName = propName;
  }
  final int? propType = jsonConvert.convert<int>(json['propType']);
  if (propType != null) {
    playRoomResponseDataRecordsWallpaperPropInfo.propType = propType;
  }
  final String? propFormat = jsonConvert.convert<String>(json['propFormat']);
  if (propFormat != null) {
    playRoomResponseDataRecordsWallpaperPropInfo.propFormat = propFormat;
  }
  final String? dynamicEffect = jsonConvert.convert<String>(
      json['dynamicEffect']);
  if (dynamicEffect != null) {
    playRoomResponseDataRecordsWallpaperPropInfo.dynamicEffect = dynamicEffect;
  }
  final String? pcDynamicEffect = jsonConvert.convert<String>(
      json['pcDynamicEffect']);
  if (pcDynamicEffect != null) {
    playRoomResponseDataRecordsWallpaperPropInfo.pcDynamicEffect =
        pcDynamicEffect;
  }
  final String? iosDynamicEffect = jsonConvert.convert<String>(
      json['iosDynamicEffect']);
  if (iosDynamicEffect != null) {
    playRoomResponseDataRecordsWallpaperPropInfo.iosDynamicEffect =
        iosDynamicEffect;
  }
  final String? vapJson = jsonConvert.convert<String>(json['vapJson']);
  if (vapJson != null) {
    playRoomResponseDataRecordsWallpaperPropInfo.vapJson = vapJson;
  }
  final String? vapText = jsonConvert.convert<String>(json['vapText']);
  if (vapText != null) {
    playRoomResponseDataRecordsWallpaperPropInfo.vapText = vapText;
  }
  return playRoomResponseDataRecordsWallpaperPropInfo;
}

Map<String, dynamic> $PlayRoomResponseDataRecordsWallpaperPropInfoToJson(
    PlayRoomResponseDataRecordsWallpaperPropInfo entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['userId'] = entity.userId;
  data['propId'] = entity.propId;
  data['propName'] = entity.propName;
  data['propType'] = entity.propType;
  data['propFormat'] = entity.propFormat;
  data['dynamicEffect'] = entity.dynamicEffect;
  data['pcDynamicEffect'] = entity.pcDynamicEffect;
  data['iosDynamicEffect'] = entity.iosDynamicEffect;
  data['vapJson'] = entity.vapJson;
  data['vapText'] = entity.vapText;
  return data;
}

extension PlayRoomResponseDataRecordsWallpaperPropInfoExtension on PlayRoomResponseDataRecordsWallpaperPropInfo {
  PlayRoomResponseDataRecordsWallpaperPropInfo copyWith({
    int? userId,
    int? propId,
    String? propName,
    int? propType,
    String? propFormat,
    String? dynamicEffect,
    String? pcDynamicEffect,
    String? iosDynamicEffect,
    String? vapJson,
    String? vapText,
  }) {
    return PlayRoomResponseDataRecordsWallpaperPropInfo()
      ..userId = userId ?? this.userId
      ..propId = propId ?? this.propId
      ..propName = propName ?? this.propName
      ..propType = propType ?? this.propType
      ..propFormat = propFormat ?? this.propFormat
      ..dynamicEffect = dynamicEffect ?? this.dynamicEffect
      ..pcDynamicEffect = pcDynamicEffect ?? this.pcDynamicEffect
      ..iosDynamicEffect = iosDynamicEffect ?? this.iosDynamicEffect
      ..vapJson = vapJson ?? this.vapJson
      ..vapText = vapText ?? this.vapText;
  }
}

PlayRoomResponseDataRecordsDefaultWallpaperPropInfo $PlayRoomResponseDataRecordsDefaultWallpaperPropInfoFromJson(
    Map<String, dynamic> json) {
  final PlayRoomResponseDataRecordsDefaultWallpaperPropInfo playRoomResponseDataRecordsDefaultWallpaperPropInfo = PlayRoomResponseDataRecordsDefaultWallpaperPropInfo();
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    playRoomResponseDataRecordsDefaultWallpaperPropInfo.userId = userId;
  }
  final int? propId = jsonConvert.convert<int>(json['propId']);
  if (propId != null) {
    playRoomResponseDataRecordsDefaultWallpaperPropInfo.propId = propId;
  }
  final String? propName = jsonConvert.convert<String>(json['propName']);
  if (propName != null) {
    playRoomResponseDataRecordsDefaultWallpaperPropInfo.propName = propName;
  }
  final int? propType = jsonConvert.convert<int>(json['propType']);
  if (propType != null) {
    playRoomResponseDataRecordsDefaultWallpaperPropInfo.propType = propType;
  }
  final String? propFormat = jsonConvert.convert<String>(json['propFormat']);
  if (propFormat != null) {
    playRoomResponseDataRecordsDefaultWallpaperPropInfo.propFormat = propFormat;
  }
  final String? dynamicEffect = jsonConvert.convert<String>(
      json['dynamicEffect']);
  if (dynamicEffect != null) {
    playRoomResponseDataRecordsDefaultWallpaperPropInfo.dynamicEffect =
        dynamicEffect;
  }
  final String? pcDynamicEffect = jsonConvert.convert<String>(
      json['pcDynamicEffect']);
  if (pcDynamicEffect != null) {
    playRoomResponseDataRecordsDefaultWallpaperPropInfo.pcDynamicEffect =
        pcDynamicEffect;
  }
  final String? iosDynamicEffect = jsonConvert.convert<String>(
      json['iosDynamicEffect']);
  if (iosDynamicEffect != null) {
    playRoomResponseDataRecordsDefaultWallpaperPropInfo.iosDynamicEffect =
        iosDynamicEffect;
  }
  final String? vapJson = jsonConvert.convert<String>(json['vapJson']);
  if (vapJson != null) {
    playRoomResponseDataRecordsDefaultWallpaperPropInfo.vapJson = vapJson;
  }
  final String? vapText = jsonConvert.convert<String>(json['vapText']);
  if (vapText != null) {
    playRoomResponseDataRecordsDefaultWallpaperPropInfo.vapText = vapText;
  }
  return playRoomResponseDataRecordsDefaultWallpaperPropInfo;
}

Map<String, dynamic> $PlayRoomResponseDataRecordsDefaultWallpaperPropInfoToJson(
    PlayRoomResponseDataRecordsDefaultWallpaperPropInfo entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['userId'] = entity.userId;
  data['propId'] = entity.propId;
  data['propName'] = entity.propName;
  data['propType'] = entity.propType;
  data['propFormat'] = entity.propFormat;
  data['dynamicEffect'] = entity.dynamicEffect;
  data['pcDynamicEffect'] = entity.pcDynamicEffect;
  data['iosDynamicEffect'] = entity.iosDynamicEffect;
  data['vapJson'] = entity.vapJson;
  data['vapText'] = entity.vapText;
  return data;
}

extension PlayRoomResponseDataRecordsDefaultWallpaperPropInfoExtension on PlayRoomResponseDataRecordsDefaultWallpaperPropInfo {
  PlayRoomResponseDataRecordsDefaultWallpaperPropInfo copyWith({
    int? userId,
    int? propId,
    String? propName,
    int? propType,
    String? propFormat,
    String? dynamicEffect,
    String? pcDynamicEffect,
    String? iosDynamicEffect,
    String? vapJson,
    String? vapText,
  }) {
    return PlayRoomResponseDataRecordsDefaultWallpaperPropInfo()
      ..userId = userId ?? this.userId
      ..propId = propId ?? this.propId
      ..propName = propName ?? this.propName
      ..propType = propType ?? this.propType
      ..propFormat = propFormat ?? this.propFormat
      ..dynamicEffect = dynamicEffect ?? this.dynamicEffect
      ..pcDynamicEffect = pcDynamicEffect ?? this.pcDynamicEffect
      ..iosDynamicEffect = iosDynamicEffect ?? this.iosDynamicEffect
      ..vapJson = vapJson ?? this.vapJson
      ..vapText = vapText ?? this.vapText;
  }
}

PlayRoomResponseDataRecordsMicUsers $PlayRoomResponseDataRecordsMicUsersFromJson(
    Map<String, dynamic> json) {
  final PlayRoomResponseDataRecordsMicUsers playRoomResponseDataRecordsMicUsers = PlayRoomResponseDataRecordsMicUsers();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    playRoomResponseDataRecordsMicUsers.id = id;
  }
  final String? userNo = jsonConvert.convert<String>(json['userNo']);
  if (userNo != null) {
    playRoomResponseDataRecordsMicUsers.userNo = userNo;
  }
  final String? luckyNo = jsonConvert.convert<String>(json['luckyNo']);
  if (luckyNo != null) {
    playRoomResponseDataRecordsMicUsers.luckyNo = luckyNo;
  }
  final String? sex = jsonConvert.convert<String>(json['sex']);
  if (sex != null) {
    playRoomResponseDataRecordsMicUsers.sex = sex;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    playRoomResponseDataRecordsMicUsers.name = name;
  }
  final String? nickName = jsonConvert.convert<String>(json['nickName']);
  if (nickName != null) {
    playRoomResponseDataRecordsMicUsers.nickName = nickName;
  }
  final String? avatar = jsonConvert.convert<String>(json['avatar']);
  if (avatar != null) {
    playRoomResponseDataRecordsMicUsers.avatar = avatar;
  }
  final String? phoneCountryCode = jsonConvert.convert<String>(
      json['phoneCountryCode']);
  if (phoneCountryCode != null) {
    playRoomResponseDataRecordsMicUsers.phoneCountryCode = phoneCountryCode;
  }
  final String? telephone = jsonConvert.convert<String>(json['telephone']);
  if (telephone != null) {
    playRoomResponseDataRecordsMicUsers.telephone = telephone;
  }
  final String? avatarId = jsonConvert.convert<String>(json['avatarId']);
  if (avatarId != null) {
    playRoomResponseDataRecordsMicUsers.avatarId = avatarId;
  }
  final int? accompanyId = jsonConvert.convert<int>(json['accompanyId']);
  if (accompanyId != null) {
    playRoomResponseDataRecordsMicUsers.accompanyId = accompanyId;
  }
  final String? introduced = jsonConvert.convert<String>(json['introduced']);
  if (introduced != null) {
    playRoomResponseDataRecordsMicUsers.introduced = introduced;
  }
  final int? level = jsonConvert.convert<int>(json['level']);
  if (level != null) {
    playRoomResponseDataRecordsMicUsers.level = level;
  }
  final int? roomLevel = jsonConvert.convert<int>(json['roomLevel']);
  if (roomLevel != null) {
    playRoomResponseDataRecordsMicUsers.roomLevel = roomLevel;
  }
  final String? accompanyLevel = jsonConvert.convert<String>(
      json['accompanyLevel']);
  if (accompanyLevel != null) {
    playRoomResponseDataRecordsMicUsers.accompanyLevel = accompanyLevel;
  }
  final int? childMode = jsonConvert.convert<int>(json['childMode']);
  if (childMode != null) {
    playRoomResponseDataRecordsMicUsers.childMode = childMode;
  }
  final int? onlineFlag = jsonConvert.convert<int>(json['onlineFlag']);
  if (onlineFlag != null) {
    playRoomResponseDataRecordsMicUsers.onlineFlag = onlineFlag;
  }
  final String? onlineTime = jsonConvert.convert<String>(json['onlineTime']);
  if (onlineTime != null) {
    playRoomResponseDataRecordsMicUsers.onlineTime = onlineTime;
  }
  final String? identityNumber = jsonConvert.convert<String>(
      json['identityNumber']);
  if (identityNumber != null) {
    playRoomResponseDataRecordsMicUsers.identityNumber = identityNumber;
  }
  final int? userType = jsonConvert.convert<int>(json['userType']);
  if (userType != null) {
    playRoomResponseDataRecordsMicUsers.userType = userType;
  }
  final String? customIdentityImage = jsonConvert.convert<String>(
      json['customIdentityImage']);
  if (customIdentityImage != null) {
    playRoomResponseDataRecordsMicUsers.customIdentityImage =
        customIdentityImage;
  }
  final int? authFlag = jsonConvert.convert<int>(json['authFlag']);
  if (authFlag != null) {
    playRoomResponseDataRecordsMicUsers.authFlag = authFlag;
  }
  final String? registerTime = jsonConvert.convert<String>(
      json['registerTime']);
  if (registerTime != null) {
    playRoomResponseDataRecordsMicUsers.registerTime = registerTime;
  }
  final String? birthday = jsonConvert.convert<String>(json['birthday']);
  if (birthday != null) {
    playRoomResponseDataRecordsMicUsers.birthday = birthday;
  }
  final int? enterRoomInvisibleFlag = jsonConvert.convert<int>(
      json['enterRoomInvisibleFlag']);
  if (enterRoomInvisibleFlag != null) {
    playRoomResponseDataRecordsMicUsers.enterRoomInvisibleFlag =
        enterRoomInvisibleFlag;
  }
  final String? mainLabelId = jsonConvert.convert<String>(json['mainLabelId']);
  if (mainLabelId != null) {
    playRoomResponseDataRecordsMicUsers.mainLabelId = mainLabelId;
  }
  final String? mainLabel = jsonConvert.convert<String>(json['mainLabel']);
  if (mainLabel != null) {
    playRoomResponseDataRecordsMicUsers.mainLabel = mainLabel;
  }
  final String? moduleAvatar = jsonConvert.convert<String>(
      json['moduleAvatar']);
  if (moduleAvatar != null) {
    playRoomResponseDataRecordsMicUsers.moduleAvatar = moduleAvatar;
  }
  final int? robotFlag = jsonConvert.convert<int>(json['robotFlag']);
  if (robotFlag != null) {
    playRoomResponseDataRecordsMicUsers.robotFlag = robotFlag;
  }
  return playRoomResponseDataRecordsMicUsers;
}

Map<String, dynamic> $PlayRoomResponseDataRecordsMicUsersToJson(
    PlayRoomResponseDataRecordsMicUsers entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['userNo'] = entity.userNo;
  data['luckyNo'] = entity.luckyNo;
  data['sex'] = entity.sex;
  data['name'] = entity.name;
  data['nickName'] = entity.nickName;
  data['avatar'] = entity.avatar;
  data['phoneCountryCode'] = entity.phoneCountryCode;
  data['telephone'] = entity.telephone;
  data['avatarId'] = entity.avatarId;
  data['accompanyId'] = entity.accompanyId;
  data['introduced'] = entity.introduced;
  data['level'] = entity.level;
  data['roomLevel'] = entity.roomLevel;
  data['accompanyLevel'] = entity.accompanyLevel;
  data['childMode'] = entity.childMode;
  data['onlineFlag'] = entity.onlineFlag;
  data['onlineTime'] = entity.onlineTime;
  data['identityNumber'] = entity.identityNumber;
  data['userType'] = entity.userType;
  data['customIdentityImage'] = entity.customIdentityImage;
  data['authFlag'] = entity.authFlag;
  data['registerTime'] = entity.registerTime;
  data['birthday'] = entity.birthday;
  data['enterRoomInvisibleFlag'] = entity.enterRoomInvisibleFlag;
  data['mainLabelId'] = entity.mainLabelId;
  data['mainLabel'] = entity.mainLabel;
  data['moduleAvatar'] = entity.moduleAvatar;
  data['robotFlag'] = entity.robotFlag;
  return data;
}

extension PlayRoomResponseDataRecordsMicUsersExtension on PlayRoomResponseDataRecordsMicUsers {
  PlayRoomResponseDataRecordsMicUsers copyWith({
    int? id,
    String? userNo,
    String? luckyNo,
    String? sex,
    String? name,
    String? nickName,
    String? avatar,
    String? phoneCountryCode,
    String? telephone,
    String? avatarId,
    int? accompanyId,
    String? introduced,
    int? level,
    int? roomLevel,
    String? accompanyLevel,
    int? childMode,
    int? onlineFlag,
    String? onlineTime,
    String? identityNumber,
    int? userType,
    String? customIdentityImage,
    int? authFlag,
    String? registerTime,
    String? birthday,
    int? enterRoomInvisibleFlag,
    String? mainLabelId,
    String? mainLabel,
    String? moduleAvatar,
    int? robotFlag,
  }) {
    return PlayRoomResponseDataRecordsMicUsers()
      ..id = id ?? this.id
      ..userNo = userNo ?? this.userNo
      ..luckyNo = luckyNo ?? this.luckyNo
      ..sex = sex ?? this.sex
      ..name = name ?? this.name
      ..nickName = nickName ?? this.nickName
      ..avatar = avatar ?? this.avatar
      ..phoneCountryCode = phoneCountryCode ?? this.phoneCountryCode
      ..telephone = telephone ?? this.telephone
      ..avatarId = avatarId ?? this.avatarId
      ..accompanyId = accompanyId ?? this.accompanyId
      ..introduced = introduced ?? this.introduced
      ..level = level ?? this.level
      ..roomLevel = roomLevel ?? this.roomLevel
      ..accompanyLevel = accompanyLevel ?? this.accompanyLevel
      ..childMode = childMode ?? this.childMode
      ..onlineFlag = onlineFlag ?? this.onlineFlag
      ..onlineTime = onlineTime ?? this.onlineTime
      ..identityNumber = identityNumber ?? this.identityNumber
      ..userType = userType ?? this.userType
      ..customIdentityImage = customIdentityImage ?? this.customIdentityImage
      ..authFlag = authFlag ?? this.authFlag
      ..registerTime = registerTime ?? this.registerTime
      ..birthday = birthday ?? this.birthday
      ..enterRoomInvisibleFlag = enterRoomInvisibleFlag ??
          this.enterRoomInvisibleFlag
      ..mainLabelId = mainLabelId ?? this.mainLabelId
      ..mainLabel = mainLabel ?? this.mainLabel
      ..moduleAvatar = moduleAvatar ?? this.moduleAvatar
      ..robotFlag = robotFlag ?? this.robotFlag;
  }
}