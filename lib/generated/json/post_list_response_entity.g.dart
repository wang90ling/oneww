import 'package:oneww/core/helpers/app_logger.dart';
import 'package:oneww/generated/json/base/json_convert_content.dart';
import 'package:oneww/models/post_list_response_entity.dart';

PostListResponseEntity $PostListResponseEntityFromJson(
    Map<String, dynamic> json) {
  final PostListResponseEntity postListResponseEntity = PostListResponseEntity();
  final String? requestId = jsonConvert.convert<String>(json['request_id']);
  if (requestId != null) {
    postListResponseEntity.requestId = requestId;
  }
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    postListResponseEntity.code = code;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    postListResponseEntity.message = message;
  }
  final List<PostListResponseData>? data = (json['data'] as List<dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<PostListResponseData>(e) as PostListResponseData)
      .toList();
  if (data != null) {
    postListResponseEntity.data = data;
  }
  AppLogger.info('postListResponseEntity data:'+postListResponseEntity.toString(),tag: "wangling");
  return postListResponseEntity;
}

Map<String, dynamic> $PostListResponseEntityToJson(
    PostListResponseEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['request_id'] = entity.requestId;
  data['code'] = entity.code;
  data['message'] = entity.message;
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  return data;
}

extension PostListResponseEntityExtension on PostListResponseEntity {
  PostListResponseEntity copyWith({
    String? requestId,
    int? code,
    String? message,
    List<PostListResponseData>? data,
  }) {
    return PostListResponseEntity()
      ..requestId = requestId ?? this.requestId
      ..code = code ?? this.code
      ..message = message ?? this.message
      ..data = data ?? this.data;
  }
}

PostListResponseData $PostListResponseDataFromJson(Map<String, dynamic> json) {
  final PostListResponseData postListResponseData = PostListResponseData();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    postListResponseData.id = id;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    postListResponseData.userId = userId;
  }
  final String? content = jsonConvert.convert<String>(json['content']);
  if (content != null) {
    postListResponseData.content = content;
  }
  final int? postType = jsonConvert.convert<int>(json['postType']);
  if (postType != null) {
    postListResponseData.postType = postType;
  }
  final int? mediaType = jsonConvert.convert<int>(json['mediaType']);
  if (mediaType != null) {
    postListResponseData.mediaType = mediaType;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    postListResponseData.status = status;
  }
  final String? ipAddress = jsonConvert.convert<String>(json['ipAddress']);
  if (ipAddress != null) {
    postListResponseData.ipAddress = ipAddress;
  }
  final String? location = jsonConvert.convert<String>(json['location']);
  if (location != null) {
    postListResponseData.location = location;
  }
  final int? categoryId = jsonConvert.convert<int>(json['categoryId']);
  if (categoryId != null) {
    postListResponseData.categoryId = categoryId;
  }
  final int? goodsId = jsonConvert.convert<int>(json['goodsId']);
  if (goodsId != null) {
    postListResponseData.goodsId = goodsId;
  }
  final int? likesCount = jsonConvert.convert<int>(json['likesCount']);
  if (likesCount != null) {
    postListResponseData.likesCount = likesCount;
  }
  final int? commentCount = jsonConvert.convert<int>(json['commentCount']);
  if (commentCount != null) {
    postListResponseData.commentCount = commentCount;
  }
  final int? replyCount = jsonConvert.convert<int>(json['replyCount']);
  if (replyCount != null) {
    postListResponseData.replyCount = replyCount;
  }
  final int? shareCount = jsonConvert.convert<int>(json['shareCount']);
  if (shareCount != null) {
    postListResponseData.shareCount = shareCount;
  }
  final int? visibleScope = jsonConvert.convert<int>(json['visibleScope']);
  if (visibleScope != null) {
    postListResponseData.visibleScope = visibleScope;
  }
  final int? commentScope = jsonConvert.convert<int>(json['commentScope']);
  if (commentScope != null) {
    postListResponseData.commentScope = commentScope;
  }
  final int? topFlag = jsonConvert.convert<int>(json['topFlag']);
  if (topFlag != null) {
    postListResponseData.topFlag = topFlag;
  }
  final String? topTime = jsonConvert.convert<String>(json['topTime']);
  if (topTime != null) {
    postListResponseData.topTime = topTime;
  }
  final String? createTime = jsonConvert.convert<String>(json['createTime']);
  if (createTime != null) {
    postListResponseData.createTime = createTime;
  }
  final int? likedFlag = jsonConvert.convert<int>(json['likedFlag']);
  if (likedFlag != null) {
    postListResponseData.likedFlag = likedFlag;
  }
  final PostListResponseDataUserInfo? userInfo = jsonConvert.convert<
      PostListResponseDataUserInfo>(json['userInfo']);
  if (userInfo != null) {
    postListResponseData.userInfo = userInfo;
  }
  final List<String>? files = (json['files'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (files != null) {
    postListResponseData.files = files;
  }
  final List<
      PostListResponseDataFileDetails>? fileDetails = (json['fileDetails'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<PostListResponseDataFileDetails>(
          e) as PostListResponseDataFileDetails).toList();
  if (fileDetails != null) {
    postListResponseData.fileDetails = fileDetails;
  }
  final List<
      PostListResponseDataSubjects>? subjects = (json['subjects'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<PostListResponseDataSubjects>(
          e) as PostListResponseDataSubjects).toList();
  if (subjects != null) {
    postListResponseData.subjects = subjects;
  }
  final PostListResponseDataComment? comment = jsonConvert.convert<
      PostListResponseDataComment>(json['comment']);
  if (comment != null) {
    postListResponseData.comment = comment;
  }
  final PostListResponseDataUserPropDetailDto? userPropDetailDto = jsonConvert
      .convert<PostListResponseDataUserPropDetailDto>(
      json['userPropDetailDto']);
  if (userPropDetailDto != null) {
    postListResponseData.userPropDetailDto = userPropDetailDto;
  }
  return postListResponseData;
}

Map<String, dynamic> $PostListResponseDataToJson(PostListResponseData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['userId'] = entity.userId;
  data['content'] = entity.content;
  data['postType'] = entity.postType;
  data['mediaType'] = entity.mediaType;
  data['status'] = entity.status;
  data['ipAddress'] = entity.ipAddress;
  data['location'] = entity.location;
  data['categoryId'] = entity.categoryId;
  data['goodsId'] = entity.goodsId;
  data['likesCount'] = entity.likesCount;
  data['commentCount'] = entity.commentCount;
  data['replyCount'] = entity.replyCount;
  data['shareCount'] = entity.shareCount;
  data['visibleScope'] = entity.visibleScope;
  data['commentScope'] = entity.commentScope;
  data['topFlag'] = entity.topFlag;
  data['topTime'] = entity.topTime;
  data['createTime'] = entity.createTime;
  data['likedFlag'] = entity.likedFlag;
  data['userInfo'] = entity.userInfo?.toJson();
  data['files'] = entity.files;
  data['fileDetails'] = entity.fileDetails?.map((v) => v.toJson()).toList();
  data['subjects'] = entity.subjects?.map((v) => v.toJson()).toList();
  data['comment'] = entity.comment?.toJson();
  data['userPropDetailDto'] = entity.userPropDetailDto?.toJson();
  return data;
}

extension PostListResponseDataExtension on PostListResponseData {
  PostListResponseData copyWith({
    int? id,
    int? userId,
    String? content,
    int? postType,
    int? mediaType,
    int? status,
    String? ipAddress,
    String? location,
    int? categoryId,
    int? goodsId,
    int? likesCount,
    int? commentCount,
    int? replyCount,
    int? shareCount,
    int? visibleScope,
    int? commentScope,
    int? topFlag,
    String? topTime,
    String? createTime,
    int? likedFlag,
    PostListResponseDataUserInfo? userInfo,
    List<String>? files,
    List<PostListResponseDataFileDetails>? fileDetails,
    List<PostListResponseDataSubjects>? subjects,
    PostListResponseDataComment? comment,
    PostListResponseDataUserPropDetailDto? userPropDetailDto,
  }) {
    return PostListResponseData()
      ..id = id ?? this.id
      ..userId = userId ?? this.userId
      ..content = content ?? this.content
      ..postType = postType ?? this.postType
      ..mediaType = mediaType ?? this.mediaType
      ..status = status ?? this.status
      ..ipAddress = ipAddress ?? this.ipAddress
      ..location = location ?? this.location
      ..categoryId = categoryId ?? this.categoryId
      ..goodsId = goodsId ?? this.goodsId
      ..likesCount = likesCount ?? this.likesCount
      ..commentCount = commentCount ?? this.commentCount
      ..replyCount = replyCount ?? this.replyCount
      ..shareCount = shareCount ?? this.shareCount
      ..visibleScope = visibleScope ?? this.visibleScope
      ..commentScope = commentScope ?? this.commentScope
      ..topFlag = topFlag ?? this.topFlag
      ..topTime = topTime ?? this.topTime
      ..createTime = createTime ?? this.createTime
      ..likedFlag = likedFlag ?? this.likedFlag
      ..userInfo = userInfo ?? this.userInfo
      ..files = files ?? this.files
      ..fileDetails = fileDetails ?? this.fileDetails
      ..subjects = subjects ?? this.subjects
      ..comment = comment ?? this.comment
      ..userPropDetailDto = userPropDetailDto ?? this.userPropDetailDto;
  }
}

PostListResponseDataUserInfo $PostListResponseDataUserInfoFromJson(
    Map<String, dynamic> json) {
  final PostListResponseDataUserInfo postListResponseDataUserInfo = PostListResponseDataUserInfo();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    postListResponseDataUserInfo.id = id;
  }
  final String? userNo = jsonConvert.convert<String>(json['userNo']);
  if (userNo != null) {
    postListResponseDataUserInfo.userNo = userNo;
  }
  final String? sex = jsonConvert.convert<String>(json['sex']);
  if (sex != null) {
    postListResponseDataUserInfo.sex = sex;
  }
  final String? nickName = jsonConvert.convert<String>(json['nickName']);
  if (nickName != null) {
    postListResponseDataUserInfo.nickName = nickName;
  }
  final String? avatar = jsonConvert.convert<String>(json['avatar']);
  if (avatar != null) {
    postListResponseDataUserInfo.avatar = avatar;
  }
  final int? onlineFlag = jsonConvert.convert<int>(json['onlineFlag']);
  if (onlineFlag != null) {
    postListResponseDataUserInfo.onlineFlag = onlineFlag;
  }
  final int? accompanyId = jsonConvert.convert<int>(json['accompanyId']);
  if (accompanyId != null) {
    postListResponseDataUserInfo.accompanyId = accompanyId;
  }
  final String? introduced = jsonConvert.convert<String>(json['introduced']);
  if (introduced != null) {
    postListResponseDataUserInfo.introduced = introduced;
  }
  final int? level = jsonConvert.convert<int>(json['level']);
  if (level != null) {
    postListResponseDataUserInfo.level = level;
  }
  final int? roomLevel = jsonConvert.convert<int>(json['roomLevel']);
  if (roomLevel != null) {
    postListResponseDataUserInfo.roomLevel = roomLevel;
  }
  final PostListResponseDataUserInfoRoomLevelConfigDto? roomLevelConfigDto = jsonConvert
      .convert<PostListResponseDataUserInfoRoomLevelConfigDto>(
      json['roomLevelConfigDto']);
  if (roomLevelConfigDto != null) {
    postListResponseDataUserInfo.roomLevelConfigDto = roomLevelConfigDto;
  }
  final PostListResponseDataUserInfoNobleLevelDto? nobleLevelDto = jsonConvert
      .convert<PostListResponseDataUserInfoNobleLevelDto>(
      json['nobleLevelDto']);
  if (nobleLevelDto != null) {
    postListResponseDataUserInfo.nobleLevelDto = nobleLevelDto;
  }
  final String? accompanyLevel = jsonConvert.convert<String>(
      json['accompanyLevel']);
  if (accompanyLevel != null) {
    postListResponseDataUserInfo.accompanyLevel = accompanyLevel;
  }
  final String? onlineTime = jsonConvert.convert<String>(json['onlineTime']);
  if (onlineTime != null) {
    postListResponseDataUserInfo.onlineTime = onlineTime;
  }
  final String? customIdentityImage = jsonConvert.convert<String>(
      json['customIdentityImage']);
  if (customIdentityImage != null) {
    postListResponseDataUserInfo.customIdentityImage = customIdentityImage;
  }
  final List<
      String>? customIdentityImageList = (json['customIdentityImageList'] as List<
      dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (customIdentityImageList != null) {
    postListResponseDataUserInfo.customIdentityImageList =
        customIdentityImageList;
  }
  final int? userMic = jsonConvert.convert<int>(json['userMic']);
  if (userMic != null) {
    postListResponseDataUserInfo.userMic = userMic;
  }
  final String? birthday = jsonConvert.convert<String>(json['birthday']);
  if (birthday != null) {
    postListResponseDataUserInfo.birthday = birthday;
  }
  final String? mainLabelId = jsonConvert.convert<String>(json['mainLabelId']);
  if (mainLabelId != null) {
    postListResponseDataUserInfo.mainLabelId = mainLabelId;
  }
  final String? mainLabel = jsonConvert.convert<String>(json['mainLabel']);
  if (mainLabel != null) {
    postListResponseDataUserInfo.mainLabel = mainLabel;
  }
  final String? moduleAvatar = jsonConvert.convert<String>(
      json['moduleAvatar']);
  if (moduleAvatar != null) {
    postListResponseDataUserInfo.moduleAvatar = moduleAvatar;
  }
  return postListResponseDataUserInfo;
}

Map<String, dynamic> $PostListResponseDataUserInfoToJson(
    PostListResponseDataUserInfo entity) {
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
  data['roomLevelConfigDto'] = entity.roomLevelConfigDto?.toJson();
  data['nobleLevelDto'] = entity.nobleLevelDto?.toJson();
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

extension PostListResponseDataUserInfoExtension on PostListResponseDataUserInfo {
  PostListResponseDataUserInfo copyWith({
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
    PostListResponseDataUserInfoRoomLevelConfigDto? roomLevelConfigDto,
    PostListResponseDataUserInfoNobleLevelDto? nobleLevelDto,
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
    return PostListResponseDataUserInfo()
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

PostListResponseDataUserInfoRoomLevelConfigDto $PostListResponseDataUserInfoRoomLevelConfigDtoFromJson(
    Map<String, dynamic> json) {
  final PostListResponseDataUserInfoRoomLevelConfigDto postListResponseDataUserInfoRoomLevelConfigDto = PostListResponseDataUserInfoRoomLevelConfigDto();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    postListResponseDataUserInfoRoomLevelConfigDto.id = id;
  }
  final String? levelName = jsonConvert.convert<String>(json['levelName']);
  if (levelName != null) {
    postListResponseDataUserInfoRoomLevelConfigDto.levelName = levelName;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    postListResponseDataUserInfoRoomLevelConfigDto.icon = icon;
  }
  final String? backdrop = jsonConvert.convert<String>(json['backdrop']);
  if (backdrop != null) {
    postListResponseDataUserInfoRoomLevelConfigDto.backdrop = backdrop;
  }
  final String? medal = jsonConvert.convert<String>(json['medal']);
  if (medal != null) {
    postListResponseDataUserInfoRoomLevelConfigDto.medal = medal;
  }
  final String? homeBackdrop = jsonConvert.convert<String>(
      json['homeBackdrop']);
  if (homeBackdrop != null) {
    postListResponseDataUserInfoRoomLevelConfigDto.homeBackdrop = homeBackdrop;
  }
  final String? pcMedal = jsonConvert.convert<String>(json['pcMedal']);
  if (pcMedal != null) {
    postListResponseDataUserInfoRoomLevelConfigDto.pcMedal = pcMedal;
  }
  final String? pcIcon = jsonConvert.convert<String>(json['pcIcon']);
  if (pcIcon != null) {
    postListResponseDataUserInfoRoomLevelConfigDto.pcIcon = pcIcon;
  }
  final int? level = jsonConvert.convert<int>(json['level']);
  if (level != null) {
    postListResponseDataUserInfoRoomLevelConfigDto.level = level;
  }
  final int? startPoints = jsonConvert.convert<int>(json['startPoints']);
  if (startPoints != null) {
    postListResponseDataUserInfoRoomLevelConfigDto.startPoints = startPoints;
  }
  final int? endPoints = jsonConvert.convert<int>(json['endPoints']);
  if (endPoints != null) {
    postListResponseDataUserInfoRoomLevelConfigDto.endPoints = endPoints;
  }
  final int? medalUsable = jsonConvert.convert<int>(json['medalUsable']);
  if (medalUsable != null) {
    postListResponseDataUserInfoRoomLevelConfigDto.medalUsable = medalUsable;
  }
  final int? recommendUsable = jsonConvert.convert<int>(
      json['recommendUsable']);
  if (recommendUsable != null) {
    postListResponseDataUserInfoRoomLevelConfigDto.recommendUsable =
        recommendUsable;
  }
  final int? recommendRate = jsonConvert.convert<int>(json['recommendRate']);
  if (recommendRate != null) {
    postListResponseDataUserInfoRoomLevelConfigDto.recommendRate =
        recommendRate;
  }
  final int? giftUsable = jsonConvert.convert<int>(json['giftUsable']);
  if (giftUsable != null) {
    postListResponseDataUserInfoRoomLevelConfigDto.giftUsable = giftUsable;
  }
  final int? avatarUsable = jsonConvert.convert<int>(json['avatarUsable']);
  if (avatarUsable != null) {
    postListResponseDataUserInfoRoomLevelConfigDto.avatarUsable = avatarUsable;
  }
  final int? avatarConfigId = jsonConvert.convert<int>(json['avatarConfigId']);
  if (avatarConfigId != null) {
    postListResponseDataUserInfoRoomLevelConfigDto.avatarConfigId =
        avatarConfigId;
  }
  final int? animationUsable = jsonConvert.convert<int>(
      json['animationUsable']);
  if (animationUsable != null) {
    postListResponseDataUserInfoRoomLevelConfigDto.animationUsable =
        animationUsable;
  }
  final int? animationConfigId = jsonConvert.convert<int>(
      json['animationConfigId']);
  if (animationConfigId != null) {
    postListResponseDataUserInfoRoomLevelConfigDto.animationConfigId =
        animationConfigId;
  }
  final int? nickColorUsable = jsonConvert.convert<int>(
      json['nickColorUsable']);
  if (nickColorUsable != null) {
    postListResponseDataUserInfoRoomLevelConfigDto.nickColorUsable =
        nickColorUsable;
  }
  final int? nickColorConfigId = jsonConvert.convert<int>(
      json['nickColorConfigId']);
  if (nickColorConfigId != null) {
    postListResponseDataUserInfoRoomLevelConfigDto.nickColorConfigId =
        nickColorConfigId;
  }
  final int? textColorUsable = jsonConvert.convert<int>(
      json['textColorUsable']);
  if (textColorUsable != null) {
    postListResponseDataUserInfoRoomLevelConfigDto.textColorUsable =
        textColorUsable;
  }
  final int? textColorConfigId = jsonConvert.convert<int>(
      json['textColorConfigId']);
  if (textColorConfigId != null) {
    postListResponseDataUserInfoRoomLevelConfigDto.textColorConfigId =
        textColorConfigId;
  }
  final int? birthdayUsable = jsonConvert.convert<int>(json['birthdayUsable']);
  if (birthdayUsable != null) {
    postListResponseDataUserInfoRoomLevelConfigDto.birthdayUsable =
        birthdayUsable;
  }
  final int? birthdayRightsPackageId = jsonConvert.convert<int>(
      json['birthdayRightsPackageId']);
  if (birthdayRightsPackageId != null) {
    postListResponseDataUserInfoRoomLevelConfigDto.birthdayRightsPackageId =
        birthdayRightsPackageId;
  }
  final int? invisibleRankUsable = jsonConvert.convert<int>(
      json['invisibleRankUsable']);
  if (invisibleRankUsable != null) {
    postListResponseDataUserInfoRoomLevelConfigDto.invisibleRankUsable =
        invisibleRankUsable;
  }
  final String? invisibleRankNick = jsonConvert.convert<String>(
      json['invisibleRankNick']);
  if (invisibleRankNick != null) {
    postListResponseDataUserInfoRoomLevelConfigDto.invisibleRankNick =
        invisibleRankNick;
  }
  final int? invisibleRoomUsable = jsonConvert.convert<int>(
      json['invisibleRoomUsable']);
  if (invisibleRoomUsable != null) {
    postListResponseDataUserInfoRoomLevelConfigDto.invisibleRoomUsable =
        invisibleRoomUsable;
  }
  final int? supportUsable = jsonConvert.convert<int>(json['supportUsable']);
  if (supportUsable != null) {
    postListResponseDataUserInfoRoomLevelConfigDto.supportUsable =
        supportUsable;
  }
  final int? productCreateUsable = jsonConvert.convert<int>(
      json['productCreateUsable']);
  if (productCreateUsable != null) {
    postListResponseDataUserInfoRoomLevelConfigDto.productCreateUsable =
        productCreateUsable;
  }
  return postListResponseDataUserInfoRoomLevelConfigDto;
}

Map<String, dynamic> $PostListResponseDataUserInfoRoomLevelConfigDtoToJson(
    PostListResponseDataUserInfoRoomLevelConfigDto entity) {
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

extension PostListResponseDataUserInfoRoomLevelConfigDtoExtension on PostListResponseDataUserInfoRoomLevelConfigDto {
  PostListResponseDataUserInfoRoomLevelConfigDto copyWith({
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
    return PostListResponseDataUserInfoRoomLevelConfigDto()
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

PostListResponseDataUserInfoNobleLevelDto $PostListResponseDataUserInfoNobleLevelDtoFromJson(
    Map<String, dynamic> json) {
  final PostListResponseDataUserInfoNobleLevelDto postListResponseDataUserInfoNobleLevelDto = PostListResponseDataUserInfoNobleLevelDto();
  final PostListResponseDataUserInfoNobleLevelDtoUserCurrent? userCurrent = jsonConvert
      .convert<PostListResponseDataUserInfoNobleLevelDtoUserCurrent>(
      json['userCurrent']);
  if (userCurrent != null) {
    postListResponseDataUserInfoNobleLevelDto.userCurrent = userCurrent;
  }
  final PostListResponseDataUserInfoNobleLevelDtoLevelBase? levelBase = jsonConvert
      .convert<PostListResponseDataUserInfoNobleLevelDtoLevelBase>(
      json['levelBase']);
  if (levelBase != null) {
    postListResponseDataUserInfoNobleLevelDto.levelBase = levelBase;
  }
  final PostListResponseDataUserInfoNobleLevelDtoPurchaseRecord? purchaseRecord = jsonConvert
      .convert<PostListResponseDataUserInfoNobleLevelDtoPurchaseRecord>(
      json['purchaseRecord']);
  if (purchaseRecord != null) {
    postListResponseDataUserInfoNobleLevelDto.purchaseRecord = purchaseRecord;
  }
  final List<
      PostListResponseDataUserInfoNobleLevelDtoPrivileges>? privileges = (json['privileges'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<
          PostListResponseDataUserInfoNobleLevelDtoPrivileges>(
          e) as PostListResponseDataUserInfoNobleLevelDtoPrivileges).toList();
  if (privileges != null) {
    postListResponseDataUserInfoNobleLevelDto.privileges = privileges;
  }
  return postListResponseDataUserInfoNobleLevelDto;
}

Map<String, dynamic> $PostListResponseDataUserInfoNobleLevelDtoToJson(
    PostListResponseDataUserInfoNobleLevelDto entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['userCurrent'] = entity.userCurrent?.toJson();
  data['levelBase'] = entity.levelBase?.toJson();
  data['purchaseRecord'] = entity.purchaseRecord?.toJson();
  data['privileges'] = entity.privileges?.map((v) => v.toJson()).toList();
  return data;
}

extension PostListResponseDataUserInfoNobleLevelDtoExtension on PostListResponseDataUserInfoNobleLevelDto {
  PostListResponseDataUserInfoNobleLevelDto copyWith({
    PostListResponseDataUserInfoNobleLevelDtoUserCurrent? userCurrent,
    PostListResponseDataUserInfoNobleLevelDtoLevelBase? levelBase,
    PostListResponseDataUserInfoNobleLevelDtoPurchaseRecord? purchaseRecord,
    List<PostListResponseDataUserInfoNobleLevelDtoPrivileges>? privileges,
  }) {
    return PostListResponseDataUserInfoNobleLevelDto()
      ..userCurrent = userCurrent ?? this.userCurrent
      ..levelBase = levelBase ?? this.levelBase
      ..purchaseRecord = purchaseRecord ?? this.purchaseRecord
      ..privileges = privileges ?? this.privileges;
  }
}

PostListResponseDataUserInfoNobleLevelDtoUserCurrent $PostListResponseDataUserInfoNobleLevelDtoUserCurrentFromJson(
    Map<String, dynamic> json) {
  final PostListResponseDataUserInfoNobleLevelDtoUserCurrent postListResponseDataUserInfoNobleLevelDtoUserCurrent = PostListResponseDataUserInfoNobleLevelDtoUserCurrent();
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    postListResponseDataUserInfoNobleLevelDtoUserCurrent.userId = userId;
  }
  final int? nobleLevelId = jsonConvert.convert<int>(json['nobleLevelId']);
  if (nobleLevelId != null) {
    postListResponseDataUserInfoNobleLevelDtoUserCurrent.nobleLevelId =
        nobleLevelId;
  }
  final String? nobleName = jsonConvert.convert<String>(json['nobleName']);
  if (nobleName != null) {
    postListResponseDataUserInfoNobleLevelDtoUserCurrent.nobleName = nobleName;
  }
  final int? levelFlag = jsonConvert.convert<int>(json['levelFlag']);
  if (levelFlag != null) {
    postListResponseDataUserInfoNobleLevelDtoUserCurrent.levelFlag = levelFlag;
  }
  final String? startTime = jsonConvert.convert<String>(json['startTime']);
  if (startTime != null) {
    postListResponseDataUserInfoNobleLevelDtoUserCurrent.startTime = startTime;
  }
  final String? endTime = jsonConvert.convert<String>(json['endTime']);
  if (endTime != null) {
    postListResponseDataUserInfoNobleLevelDtoUserCurrent.endTime = endTime;
  }
  final int? remainingDays = jsonConvert.convert<int>(json['remainingDays']);
  if (remainingDays != null) {
    postListResponseDataUserInfoNobleLevelDtoUserCurrent.remainingDays =
        remainingDays;
  }
  return postListResponseDataUserInfoNobleLevelDtoUserCurrent;
}

Map<String,
    dynamic> $PostListResponseDataUserInfoNobleLevelDtoUserCurrentToJson(
    PostListResponseDataUserInfoNobleLevelDtoUserCurrent entity) {
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

extension PostListResponseDataUserInfoNobleLevelDtoUserCurrentExtension on PostListResponseDataUserInfoNobleLevelDtoUserCurrent {
  PostListResponseDataUserInfoNobleLevelDtoUserCurrent copyWith({
    int? userId,
    int? nobleLevelId,
    String? nobleName,
    int? levelFlag,
    String? startTime,
    String? endTime,
    int? remainingDays,
  }) {
    return PostListResponseDataUserInfoNobleLevelDtoUserCurrent()
      ..userId = userId ?? this.userId
      ..nobleLevelId = nobleLevelId ?? this.nobleLevelId
      ..nobleName = nobleName ?? this.nobleName
      ..levelFlag = levelFlag ?? this.levelFlag
      ..startTime = startTime ?? this.startTime
      ..endTime = endTime ?? this.endTime
      ..remainingDays = remainingDays ?? this.remainingDays;
  }
}

PostListResponseDataUserInfoNobleLevelDtoLevelBase $PostListResponseDataUserInfoNobleLevelDtoLevelBaseFromJson(
    Map<String, dynamic> json) {
  final PostListResponseDataUserInfoNobleLevelDtoLevelBase postListResponseDataUserInfoNobleLevelDtoLevelBase = PostListResponseDataUserInfoNobleLevelDtoLevelBase();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    postListResponseDataUserInfoNobleLevelDtoLevelBase.id = id;
  }
  final int? goodsId = jsonConvert.convert<int>(json['goodsId']);
  if (goodsId != null) {
    postListResponseDataUserInfoNobleLevelDtoLevelBase.goodsId = goodsId;
  }
  final int? propId = jsonConvert.convert<int>(json['propId']);
  if (propId != null) {
    postListResponseDataUserInfoNobleLevelDtoLevelBase.propId = propId;
  }
  final String? levelName = jsonConvert.convert<String>(json['levelName']);
  if (levelName != null) {
    postListResponseDataUserInfoNobleLevelDtoLevelBase.levelName = levelName;
  }
  final int? levelFlag = jsonConvert.convert<int>(json['levelFlag']);
  if (levelFlag != null) {
    postListResponseDataUserInfoNobleLevelDtoLevelBase.levelFlag = levelFlag;
  }
  final String? mainImageUrl = jsonConvert.convert<String>(
      json['mainImageUrl']);
  if (mainImageUrl != null) {
    postListResponseDataUserInfoNobleLevelDtoLevelBase.mainImageUrl =
        mainImageUrl;
  }
  final String? badgeImageUrl = jsonConvert.convert<String>(
      json['badgeImageUrl']);
  if (badgeImageUrl != null) {
    postListResponseDataUserInfoNobleLevelDtoLevelBase.badgeImageUrl =
        badgeImageUrl;
  }
  final String? middleImageUrl = jsonConvert.convert<String>(
      json['middleImageUrl']);
  if (middleImageUrl != null) {
    postListResponseDataUserInfoNobleLevelDtoLevelBase.middleImageUrl =
        middleImageUrl;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    postListResponseDataUserInfoNobleLevelDtoLevelBase.description =
        description;
  }
  final int? purchaseType = jsonConvert.convert<int>(json['purchaseType']);
  if (purchaseType != null) {
    postListResponseDataUserInfoNobleLevelDtoLevelBase.purchaseType =
        purchaseType;
  }
  final int? firstPrice = jsonConvert.convert<int>(json['firstPrice']);
  if (firstPrice != null) {
    postListResponseDataUserInfoNobleLevelDtoLevelBase.firstPrice = firstPrice;
  }
  final int? renewPrice = jsonConvert.convert<int>(json['renewPrice']);
  if (renewPrice != null) {
    postListResponseDataUserInfoNobleLevelDtoLevelBase.renewPrice = renewPrice;
  }
  final int? firstSkuId = jsonConvert.convert<int>(json['firstSkuId']);
  if (firstSkuId != null) {
    postListResponseDataUserInfoNobleLevelDtoLevelBase.firstSkuId = firstSkuId;
  }
  final int? renewSkuId = jsonConvert.convert<int>(json['renewSkuId']);
  if (renewSkuId != null) {
    postListResponseDataUserInfoNobleLevelDtoLevelBase.renewSkuId = renewSkuId;
  }
  final int? firstGiftType = jsonConvert.convert<int>(json['firstGiftType']);
  if (firstGiftType != null) {
    postListResponseDataUserInfoNobleLevelDtoLevelBase.firstGiftType =
        firstGiftType;
  }
  final int? firstGiftId = jsonConvert.convert<int>(json['firstGiftId']);
  if (firstGiftId != null) {
    postListResponseDataUserInfoNobleLevelDtoLevelBase.firstGiftId =
        firstGiftId;
  }
  final String? firstGiftName = jsonConvert.convert<String>(
      json['firstGiftName']);
  if (firstGiftName != null) {
    postListResponseDataUserInfoNobleLevelDtoLevelBase.firstGiftName =
        firstGiftName;
  }
  final String? firstGiftUrl = jsonConvert.convert<String>(
      json['firstGiftUrl']);
  if (firstGiftUrl != null) {
    postListResponseDataUserInfoNobleLevelDtoLevelBase.firstGiftUrl =
        firstGiftUrl;
  }
  final int? firstGiftAmount = jsonConvert.convert<int>(
      json['firstGiftAmount']);
  if (firstGiftAmount != null) {
    postListResponseDataUserInfoNobleLevelDtoLevelBase.firstGiftAmount =
        firstGiftAmount;
  }
  final int? firstGiftPurchaseType = jsonConvert.convert<int>(
      json['firstGiftPurchaseType']);
  if (firstGiftPurchaseType != null) {
    postListResponseDataUserInfoNobleLevelDtoLevelBase.firstGiftPurchaseType =
        firstGiftPurchaseType;
  }
  final int? firstGiftPrice = jsonConvert.convert<int>(json['firstGiftPrice']);
  if (firstGiftPrice != null) {
    postListResponseDataUserInfoNobleLevelDtoLevelBase.firstGiftPrice =
        firstGiftPrice;
  }
  final bool? directPurchase = jsonConvert.convert<bool>(
      json['directPurchase']);
  if (directPurchase != null) {
    postListResponseDataUserInfoNobleLevelDtoLevelBase.directPurchase =
        directPurchase;
  }
  final int? purchaseDuration = jsonConvert.convert<int>(
      json['purchaseDuration']);
  if (purchaseDuration != null) {
    postListResponseDataUserInfoNobleLevelDtoLevelBase.purchaseDuration =
        purchaseDuration;
  }
  return postListResponseDataUserInfoNobleLevelDtoLevelBase;
}

Map<String, dynamic> $PostListResponseDataUserInfoNobleLevelDtoLevelBaseToJson(
    PostListResponseDataUserInfoNobleLevelDtoLevelBase entity) {
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

extension PostListResponseDataUserInfoNobleLevelDtoLevelBaseExtension on PostListResponseDataUserInfoNobleLevelDtoLevelBase {
  PostListResponseDataUserInfoNobleLevelDtoLevelBase copyWith({
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
    return PostListResponseDataUserInfoNobleLevelDtoLevelBase()
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

PostListResponseDataUserInfoNobleLevelDtoPurchaseRecord $PostListResponseDataUserInfoNobleLevelDtoPurchaseRecordFromJson(
    Map<String, dynamic> json) {
  final PostListResponseDataUserInfoNobleLevelDtoPurchaseRecord postListResponseDataUserInfoNobleLevelDtoPurchaseRecord = PostListResponseDataUserInfoNobleLevelDtoPurchaseRecord();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    postListResponseDataUserInfoNobleLevelDtoPurchaseRecord.id = id;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    postListResponseDataUserInfoNobleLevelDtoPurchaseRecord.userId = userId;
  }
  final int? nobleLevelId = jsonConvert.convert<int>(json['nobleLevelId']);
  if (nobleLevelId != null) {
    postListResponseDataUserInfoNobleLevelDtoPurchaseRecord.nobleLevelId =
        nobleLevelId;
  }
  final String? nobleLevelName = jsonConvert.convert<String>(
      json['nobleLevelName']);
  if (nobleLevelName != null) {
    postListResponseDataUserInfoNobleLevelDtoPurchaseRecord.nobleLevelName =
        nobleLevelName;
  }
  final int? purchaseType = jsonConvert.convert<int>(json['purchaseType']);
  if (purchaseType != null) {
    postListResponseDataUserInfoNobleLevelDtoPurchaseRecord.purchaseType =
        purchaseType;
  }
  final int? price = jsonConvert.convert<int>(json['price']);
  if (price != null) {
    postListResponseDataUserInfoNobleLevelDtoPurchaseRecord.price = price;
  }
  final int? purchaseFlag = jsonConvert.convert<int>(json['purchaseFlag']);
  if (purchaseFlag != null) {
    postListResponseDataUserInfoNobleLevelDtoPurchaseRecord.purchaseFlag =
        purchaseFlag;
  }
  final int? durationDays = jsonConvert.convert<int>(json['durationDays']);
  if (durationDays != null) {
    postListResponseDataUserInfoNobleLevelDtoPurchaseRecord.durationDays =
        durationDays;
  }
  final String? purchaseTime = jsonConvert.convert<String>(
      json['purchaseTime']);
  if (purchaseTime != null) {
    postListResponseDataUserInfoNobleLevelDtoPurchaseRecord.purchaseTime =
        purchaseTime;
  }
  final int? roomId = jsonConvert.convert<int>(json['roomId']);
  if (roomId != null) {
    postListResponseDataUserInfoNobleLevelDtoPurchaseRecord.roomId = roomId;
  }
  final int? orderId = jsonConvert.convert<int>(json['orderId']);
  if (orderId != null) {
    postListResponseDataUserInfoNobleLevelDtoPurchaseRecord.orderId = orderId;
  }
  final String? orderNo = jsonConvert.convert<String>(json['orderNo']);
  if (orderNo != null) {
    postListResponseDataUserInfoNobleLevelDtoPurchaseRecord.orderNo = orderNo;
  }
  return postListResponseDataUserInfoNobleLevelDtoPurchaseRecord;
}

Map<String,
    dynamic> $PostListResponseDataUserInfoNobleLevelDtoPurchaseRecordToJson(
    PostListResponseDataUserInfoNobleLevelDtoPurchaseRecord entity) {
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

extension PostListResponseDataUserInfoNobleLevelDtoPurchaseRecordExtension on PostListResponseDataUserInfoNobleLevelDtoPurchaseRecord {
  PostListResponseDataUserInfoNobleLevelDtoPurchaseRecord copyWith({
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
    return PostListResponseDataUserInfoNobleLevelDtoPurchaseRecord()
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

PostListResponseDataUserInfoNobleLevelDtoPrivileges $PostListResponseDataUserInfoNobleLevelDtoPrivilegesFromJson(
    Map<String, dynamic> json) {
  final PostListResponseDataUserInfoNobleLevelDtoPrivileges postListResponseDataUserInfoNobleLevelDtoPrivileges = PostListResponseDataUserInfoNobleLevelDtoPrivileges();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    postListResponseDataUserInfoNobleLevelDtoPrivileges.id = id;
  }
  final String? privilegeName = jsonConvert.convert<String>(
      json['privilegeName']);
  if (privilegeName != null) {
    postListResponseDataUserInfoNobleLevelDtoPrivileges.privilegeName =
        privilegeName;
  }
  final int? privilegeType = jsonConvert.convert<int>(json['privilegeType']);
  if (privilegeType != null) {
    postListResponseDataUserInfoNobleLevelDtoPrivileges.privilegeType =
        privilegeType;
  }
  final String? privilegeFunction = jsonConvert.convert<String>(
      json['privilegeFunction']);
  if (privilegeFunction != null) {
    postListResponseDataUserInfoNobleLevelDtoPrivileges.privilegeFunction =
        privilegeFunction;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    postListResponseDataUserInfoNobleLevelDtoPrivileges.description =
        description;
  }
  final String? imageUrl = jsonConvert.convert<String>(json['imageUrl']);
  if (imageUrl != null) {
    postListResponseDataUserInfoNobleLevelDtoPrivileges.imageUrl = imageUrl;
  }
  final bool? enabled = jsonConvert.convert<bool>(json['enabled']);
  if (enabled != null) {
    postListResponseDataUserInfoNobleLevelDtoPrivileges.enabled = enabled;
  }
  return postListResponseDataUserInfoNobleLevelDtoPrivileges;
}

Map<String, dynamic> $PostListResponseDataUserInfoNobleLevelDtoPrivilegesToJson(
    PostListResponseDataUserInfoNobleLevelDtoPrivileges entity) {
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

extension PostListResponseDataUserInfoNobleLevelDtoPrivilegesExtension on PostListResponseDataUserInfoNobleLevelDtoPrivileges {
  PostListResponseDataUserInfoNobleLevelDtoPrivileges copyWith({
    int? id,
    String? privilegeName,
    int? privilegeType,
    String? privilegeFunction,
    String? description,
    String? imageUrl,
    bool? enabled,
  }) {
    return PostListResponseDataUserInfoNobleLevelDtoPrivileges()
      ..id = id ?? this.id
      ..privilegeName = privilegeName ?? this.privilegeName
      ..privilegeType = privilegeType ?? this.privilegeType
      ..privilegeFunction = privilegeFunction ?? this.privilegeFunction
      ..description = description ?? this.description
      ..imageUrl = imageUrl ?? this.imageUrl
      ..enabled = enabled ?? this.enabled;
  }
}

PostListResponseDataFileDetails $PostListResponseDataFileDetailsFromJson(
    Map<String, dynamic> json) {
  final PostListResponseDataFileDetails postListResponseDataFileDetails = PostListResponseDataFileDetails();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    postListResponseDataFileDetails.id = id;
  }
  final String? fileUrl = jsonConvert.convert<String>(json['fileUrl']);
  if (fileUrl != null) {
    postListResponseDataFileDetails.fileUrl = fileUrl;
  }
  final String? firstSnapshot = jsonConvert.convert<String>(
      json['firstSnapshot']);
  if (firstSnapshot != null) {
    postListResponseDataFileDetails.firstSnapshot = firstSnapshot;
  }
  final String? bucketType = jsonConvert.convert<String>(json['bucketType']);
  if (bucketType != null) {
    postListResponseDataFileDetails.bucketType = bucketType;
  }
  return postListResponseDataFileDetails;
}

Map<String, dynamic> $PostListResponseDataFileDetailsToJson(
    PostListResponseDataFileDetails entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['fileUrl'] = entity.fileUrl;
  data['firstSnapshot'] = entity.firstSnapshot;
  data['bucketType'] = entity.bucketType;
  return data;
}

extension PostListResponseDataFileDetailsExtension on PostListResponseDataFileDetails {
  PostListResponseDataFileDetails copyWith({
    int? id,
    String? fileUrl,
    String? firstSnapshot,
    String? bucketType,
  }) {
    return PostListResponseDataFileDetails()
      ..id = id ?? this.id
      ..fileUrl = fileUrl ?? this.fileUrl
      ..firstSnapshot = firstSnapshot ?? this.firstSnapshot
      ..bucketType = bucketType ?? this.bucketType;
  }
}

PostListResponseDataSubjects $PostListResponseDataSubjectsFromJson(
    Map<String, dynamic> json) {
  final PostListResponseDataSubjects postListResponseDataSubjects = PostListResponseDataSubjects();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    postListResponseDataSubjects.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    postListResponseDataSubjects.name = name;
  }
  final String? image = jsonConvert.convert<String>(json['image']);
  if (image != null) {
    postListResponseDataSubjects.image = image;
  }
  final int? weight = jsonConvert.convert<int>(json['weight']);
  if (weight != null) {
    postListResponseDataSubjects.weight = weight;
  }
  return postListResponseDataSubjects;
}

Map<String, dynamic> $PostListResponseDataSubjectsToJson(
    PostListResponseDataSubjects entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['image'] = entity.image;
  data['weight'] = entity.weight;
  return data;
}

extension PostListResponseDataSubjectsExtension on PostListResponseDataSubjects {
  PostListResponseDataSubjects copyWith({
    int? id,
    String? name,
    String? image,
    int? weight,
  }) {
    return PostListResponseDataSubjects()
      ..id = id ?? this.id
      ..name = name ?? this.name
      ..image = image ?? this.image
      ..weight = weight ?? this.weight;
  }
}

PostListResponseDataComment $PostListResponseDataCommentFromJson(
    Map<String, dynamic> json) {
  final PostListResponseDataComment postListResponseDataComment = PostListResponseDataComment();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    postListResponseDataComment.id = id;
  }
  final int? postId = jsonConvert.convert<int>(json['postId']);
  if (postId != null) {
    postListResponseDataComment.postId = postId;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    postListResponseDataComment.userId = userId;
  }
  final int? imageId = jsonConvert.convert<int>(json['imageId']);
  if (imageId != null) {
    postListResponseDataComment.imageId = imageId;
  }
  final String? image = jsonConvert.convert<String>(json['image']);
  if (image != null) {
    postListResponseDataComment.image = image;
  }
  final String? content = jsonConvert.convert<String>(json['content']);
  if (content != null) {
    postListResponseDataComment.content = content;
  }
  final int? replyCommentId = jsonConvert.convert<int>(json['replyCommentId']);
  if (replyCommentId != null) {
    postListResponseDataComment.replyCommentId = replyCommentId;
  }
  final int? replyUserId = jsonConvert.convert<int>(json['replyUserId']);
  if (replyUserId != null) {
    postListResponseDataComment.replyUserId = replyUserId;
  }
  final int? parentCommentId = jsonConvert.convert<int>(
      json['parentCommentId']);
  if (parentCommentId != null) {
    postListResponseDataComment.parentCommentId = parentCommentId;
  }
  final int? likesCount = jsonConvert.convert<int>(json['likesCount']);
  if (likesCount != null) {
    postListResponseDataComment.likesCount = likesCount;
  }
  final int? commentCount = jsonConvert.convert<int>(json['commentCount']);
  if (commentCount != null) {
    postListResponseDataComment.commentCount = commentCount;
  }
  final String? createTime = jsonConvert.convert<String>(json['createTime']);
  if (createTime != null) {
    postListResponseDataComment.createTime = createTime;
  }
  final int? likedFlag = jsonConvert.convert<int>(json['likedFlag']);
  if (likedFlag != null) {
    postListResponseDataComment.likedFlag = likedFlag;
  }
  final PostListResponseDataCommentUserInfo? userInfo = jsonConvert.convert<
      PostListResponseDataCommentUserInfo>(json['userInfo']);
  if (userInfo != null) {
    postListResponseDataComment.userInfo = userInfo;
  }
  final PostListResponseDataCommentReplyInfo? replyInfo = jsonConvert.convert<
      PostListResponseDataCommentReplyInfo>(json['replyInfo']);
  if (replyInfo != null) {
    postListResponseDataComment.replyInfo = replyInfo;
  }
  final List<String>? subList = (json['subList'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (subList != null) {
    postListResponseDataComment.subList = subList;
  }
  return postListResponseDataComment;
}

Map<String, dynamic> $PostListResponseDataCommentToJson(
    PostListResponseDataComment entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['postId'] = entity.postId;
  data['userId'] = entity.userId;
  data['imageId'] = entity.imageId;
  data['image'] = entity.image;
  data['content'] = entity.content;
  data['replyCommentId'] = entity.replyCommentId;
  data['replyUserId'] = entity.replyUserId;
  data['parentCommentId'] = entity.parentCommentId;
  data['likesCount'] = entity.likesCount;
  data['commentCount'] = entity.commentCount;
  data['createTime'] = entity.createTime;
  data['likedFlag'] = entity.likedFlag;
  data['userInfo'] = entity.userInfo?.toJson();
  data['replyInfo'] = entity.replyInfo?.toJson();
  data['subList'] = entity.subList;
  return data;
}

extension PostListResponseDataCommentExtension on PostListResponseDataComment {
  PostListResponseDataComment copyWith({
    int? id,
    int? postId,
    int? userId,
    int? imageId,
    String? image,
    String? content,
    int? replyCommentId,
    int? replyUserId,
    int? parentCommentId,
    int? likesCount,
    int? commentCount,
    String? createTime,
    int? likedFlag,
    PostListResponseDataCommentUserInfo? userInfo,
    PostListResponseDataCommentReplyInfo? replyInfo,
    List<String>? subList,
  }) {
    return PostListResponseDataComment()
      ..id = id ?? this.id
      ..postId = postId ?? this.postId
      ..userId = userId ?? this.userId
      ..imageId = imageId ?? this.imageId
      ..image = image ?? this.image
      ..content = content ?? this.content
      ..replyCommentId = replyCommentId ?? this.replyCommentId
      ..replyUserId = replyUserId ?? this.replyUserId
      ..parentCommentId = parentCommentId ?? this.parentCommentId
      ..likesCount = likesCount ?? this.likesCount
      ..commentCount = commentCount ?? this.commentCount
      ..createTime = createTime ?? this.createTime
      ..likedFlag = likedFlag ?? this.likedFlag
      ..userInfo = userInfo ?? this.userInfo
      ..replyInfo = replyInfo ?? this.replyInfo
      ..subList = subList ?? this.subList;
  }
}

PostListResponseDataCommentUserInfo $PostListResponseDataCommentUserInfoFromJson(
    Map<String, dynamic> json) {
  final PostListResponseDataCommentUserInfo postListResponseDataCommentUserInfo = PostListResponseDataCommentUserInfo();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    postListResponseDataCommentUserInfo.id = id;
  }
  final String? userNo = jsonConvert.convert<String>(json['userNo']);
  if (userNo != null) {
    postListResponseDataCommentUserInfo.userNo = userNo;
  }
  final String? sex = jsonConvert.convert<String>(json['sex']);
  if (sex != null) {
    postListResponseDataCommentUserInfo.sex = sex;
  }
  final String? nickName = jsonConvert.convert<String>(json['nickName']);
  if (nickName != null) {
    postListResponseDataCommentUserInfo.nickName = nickName;
  }
  final String? avatar = jsonConvert.convert<String>(json['avatar']);
  if (avatar != null) {
    postListResponseDataCommentUserInfo.avatar = avatar;
  }
  final int? onlineFlag = jsonConvert.convert<int>(json['onlineFlag']);
  if (onlineFlag != null) {
    postListResponseDataCommentUserInfo.onlineFlag = onlineFlag;
  }
  final int? accompanyId = jsonConvert.convert<int>(json['accompanyId']);
  if (accompanyId != null) {
    postListResponseDataCommentUserInfo.accompanyId = accompanyId;
  }
  final String? introduced = jsonConvert.convert<String>(json['introduced']);
  if (introduced != null) {
    postListResponseDataCommentUserInfo.introduced = introduced;
  }
  final int? level = jsonConvert.convert<int>(json['level']);
  if (level != null) {
    postListResponseDataCommentUserInfo.level = level;
  }
  final int? roomLevel = jsonConvert.convert<int>(json['roomLevel']);
  if (roomLevel != null) {
    postListResponseDataCommentUserInfo.roomLevel = roomLevel;
  }
  final PostListResponseDataCommentUserInfoRoomLevelConfigDto? roomLevelConfigDto = jsonConvert
      .convert<PostListResponseDataCommentUserInfoRoomLevelConfigDto>(
      json['roomLevelConfigDto']);
  if (roomLevelConfigDto != null) {
    postListResponseDataCommentUserInfo.roomLevelConfigDto = roomLevelConfigDto;
  }
  final PostListResponseDataCommentUserInfoNobleLevelDto? nobleLevelDto = jsonConvert
      .convert<PostListResponseDataCommentUserInfoNobleLevelDto>(
      json['nobleLevelDto']);
  if (nobleLevelDto != null) {
    postListResponseDataCommentUserInfo.nobleLevelDto = nobleLevelDto;
  }
  final String? accompanyLevel = jsonConvert.convert<String>(
      json['accompanyLevel']);
  if (accompanyLevel != null) {
    postListResponseDataCommentUserInfo.accompanyLevel = accompanyLevel;
  }
  final String? onlineTime = jsonConvert.convert<String>(json['onlineTime']);
  if (onlineTime != null) {
    postListResponseDataCommentUserInfo.onlineTime = onlineTime;
  }
  final String? customIdentityImage = jsonConvert.convert<String>(
      json['customIdentityImage']);
  if (customIdentityImage != null) {
    postListResponseDataCommentUserInfo.customIdentityImage =
        customIdentityImage;
  }
  final List<
      String>? customIdentityImageList = (json['customIdentityImageList'] as List<
      dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (customIdentityImageList != null) {
    postListResponseDataCommentUserInfo.customIdentityImageList =
        customIdentityImageList;
  }
  final int? userMic = jsonConvert.convert<int>(json['userMic']);
  if (userMic != null) {
    postListResponseDataCommentUserInfo.userMic = userMic;
  }
  final String? birthday = jsonConvert.convert<String>(json['birthday']);
  if (birthday != null) {
    postListResponseDataCommentUserInfo.birthday = birthday;
  }
  final String? mainLabelId = jsonConvert.convert<String>(json['mainLabelId']);
  if (mainLabelId != null) {
    postListResponseDataCommentUserInfo.mainLabelId = mainLabelId;
  }
  final String? mainLabel = jsonConvert.convert<String>(json['mainLabel']);
  if (mainLabel != null) {
    postListResponseDataCommentUserInfo.mainLabel = mainLabel;
  }
  final String? moduleAvatar = jsonConvert.convert<String>(
      json['moduleAvatar']);
  if (moduleAvatar != null) {
    postListResponseDataCommentUserInfo.moduleAvatar = moduleAvatar;
  }
  return postListResponseDataCommentUserInfo;
}

Map<String, dynamic> $PostListResponseDataCommentUserInfoToJson(
    PostListResponseDataCommentUserInfo entity) {
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
  data['roomLevelConfigDto'] = entity.roomLevelConfigDto?.toJson();
  data['nobleLevelDto'] = entity.nobleLevelDto?.toJson();
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

extension PostListResponseDataCommentUserInfoExtension on PostListResponseDataCommentUserInfo {
  PostListResponseDataCommentUserInfo copyWith({
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
    PostListResponseDataCommentUserInfoRoomLevelConfigDto? roomLevelConfigDto,
    PostListResponseDataCommentUserInfoNobleLevelDto? nobleLevelDto,
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
    return PostListResponseDataCommentUserInfo()
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

PostListResponseDataCommentUserInfoRoomLevelConfigDto $PostListResponseDataCommentUserInfoRoomLevelConfigDtoFromJson(
    Map<String, dynamic> json) {
  final PostListResponseDataCommentUserInfoRoomLevelConfigDto postListResponseDataCommentUserInfoRoomLevelConfigDto = PostListResponseDataCommentUserInfoRoomLevelConfigDto();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    postListResponseDataCommentUserInfoRoomLevelConfigDto.id = id;
  }
  final String? levelName = jsonConvert.convert<String>(json['levelName']);
  if (levelName != null) {
    postListResponseDataCommentUserInfoRoomLevelConfigDto.levelName = levelName;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    postListResponseDataCommentUserInfoRoomLevelConfigDto.icon = icon;
  }
  final String? backdrop = jsonConvert.convert<String>(json['backdrop']);
  if (backdrop != null) {
    postListResponseDataCommentUserInfoRoomLevelConfigDto.backdrop = backdrop;
  }
  final String? medal = jsonConvert.convert<String>(json['medal']);
  if (medal != null) {
    postListResponseDataCommentUserInfoRoomLevelConfigDto.medal = medal;
  }
  final String? homeBackdrop = jsonConvert.convert<String>(
      json['homeBackdrop']);
  if (homeBackdrop != null) {
    postListResponseDataCommentUserInfoRoomLevelConfigDto.homeBackdrop =
        homeBackdrop;
  }
  final String? pcMedal = jsonConvert.convert<String>(json['pcMedal']);
  if (pcMedal != null) {
    postListResponseDataCommentUserInfoRoomLevelConfigDto.pcMedal = pcMedal;
  }
  final String? pcIcon = jsonConvert.convert<String>(json['pcIcon']);
  if (pcIcon != null) {
    postListResponseDataCommentUserInfoRoomLevelConfigDto.pcIcon = pcIcon;
  }
  final int? level = jsonConvert.convert<int>(json['level']);
  if (level != null) {
    postListResponseDataCommentUserInfoRoomLevelConfigDto.level = level;
  }
  final int? startPoints = jsonConvert.convert<int>(json['startPoints']);
  if (startPoints != null) {
    postListResponseDataCommentUserInfoRoomLevelConfigDto.startPoints =
        startPoints;
  }
  final int? endPoints = jsonConvert.convert<int>(json['endPoints']);
  if (endPoints != null) {
    postListResponseDataCommentUserInfoRoomLevelConfigDto.endPoints = endPoints;
  }
  final int? medalUsable = jsonConvert.convert<int>(json['medalUsable']);
  if (medalUsable != null) {
    postListResponseDataCommentUserInfoRoomLevelConfigDto.medalUsable =
        medalUsable;
  }
  final int? recommendUsable = jsonConvert.convert<int>(
      json['recommendUsable']);
  if (recommendUsable != null) {
    postListResponseDataCommentUserInfoRoomLevelConfigDto.recommendUsable =
        recommendUsable;
  }
  final int? recommendRate = jsonConvert.convert<int>(json['recommendRate']);
  if (recommendRate != null) {
    postListResponseDataCommentUserInfoRoomLevelConfigDto.recommendRate =
        recommendRate;
  }
  final int? giftUsable = jsonConvert.convert<int>(json['giftUsable']);
  if (giftUsable != null) {
    postListResponseDataCommentUserInfoRoomLevelConfigDto.giftUsable =
        giftUsable;
  }
  final int? avatarUsable = jsonConvert.convert<int>(json['avatarUsable']);
  if (avatarUsable != null) {
    postListResponseDataCommentUserInfoRoomLevelConfigDto.avatarUsable =
        avatarUsable;
  }
  final int? avatarConfigId = jsonConvert.convert<int>(json['avatarConfigId']);
  if (avatarConfigId != null) {
    postListResponseDataCommentUserInfoRoomLevelConfigDto.avatarConfigId =
        avatarConfigId;
  }
  final int? animationUsable = jsonConvert.convert<int>(
      json['animationUsable']);
  if (animationUsable != null) {
    postListResponseDataCommentUserInfoRoomLevelConfigDto.animationUsable =
        animationUsable;
  }
  final int? animationConfigId = jsonConvert.convert<int>(
      json['animationConfigId']);
  if (animationConfigId != null) {
    postListResponseDataCommentUserInfoRoomLevelConfigDto.animationConfigId =
        animationConfigId;
  }
  final int? nickColorUsable = jsonConvert.convert<int>(
      json['nickColorUsable']);
  if (nickColorUsable != null) {
    postListResponseDataCommentUserInfoRoomLevelConfigDto.nickColorUsable =
        nickColorUsable;
  }
  final int? nickColorConfigId = jsonConvert.convert<int>(
      json['nickColorConfigId']);
  if (nickColorConfigId != null) {
    postListResponseDataCommentUserInfoRoomLevelConfigDto.nickColorConfigId =
        nickColorConfigId;
  }
  final int? textColorUsable = jsonConvert.convert<int>(
      json['textColorUsable']);
  if (textColorUsable != null) {
    postListResponseDataCommentUserInfoRoomLevelConfigDto.textColorUsable =
        textColorUsable;
  }
  final int? textColorConfigId = jsonConvert.convert<int>(
      json['textColorConfigId']);
  if (textColorConfigId != null) {
    postListResponseDataCommentUserInfoRoomLevelConfigDto.textColorConfigId =
        textColorConfigId;
  }
  final int? birthdayUsable = jsonConvert.convert<int>(json['birthdayUsable']);
  if (birthdayUsable != null) {
    postListResponseDataCommentUserInfoRoomLevelConfigDto.birthdayUsable =
        birthdayUsable;
  }
  final int? birthdayRightsPackageId = jsonConvert.convert<int>(
      json['birthdayRightsPackageId']);
  if (birthdayRightsPackageId != null) {
    postListResponseDataCommentUserInfoRoomLevelConfigDto
        .birthdayRightsPackageId = birthdayRightsPackageId;
  }
  final int? invisibleRankUsable = jsonConvert.convert<int>(
      json['invisibleRankUsable']);
  if (invisibleRankUsable != null) {
    postListResponseDataCommentUserInfoRoomLevelConfigDto.invisibleRankUsable =
        invisibleRankUsable;
  }
  final String? invisibleRankNick = jsonConvert.convert<String>(
      json['invisibleRankNick']);
  if (invisibleRankNick != null) {
    postListResponseDataCommentUserInfoRoomLevelConfigDto.invisibleRankNick =
        invisibleRankNick;
  }
  final int? invisibleRoomUsable = jsonConvert.convert<int>(
      json['invisibleRoomUsable']);
  if (invisibleRoomUsable != null) {
    postListResponseDataCommentUserInfoRoomLevelConfigDto.invisibleRoomUsable =
        invisibleRoomUsable;
  }
  final int? supportUsable = jsonConvert.convert<int>(json['supportUsable']);
  if (supportUsable != null) {
    postListResponseDataCommentUserInfoRoomLevelConfigDto.supportUsable =
        supportUsable;
  }
  final int? productCreateUsable = jsonConvert.convert<int>(
      json['productCreateUsable']);
  if (productCreateUsable != null) {
    postListResponseDataCommentUserInfoRoomLevelConfigDto.productCreateUsable =
        productCreateUsable;
  }
  return postListResponseDataCommentUserInfoRoomLevelConfigDto;
}

Map<String,
    dynamic> $PostListResponseDataCommentUserInfoRoomLevelConfigDtoToJson(
    PostListResponseDataCommentUserInfoRoomLevelConfigDto entity) {
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

extension PostListResponseDataCommentUserInfoRoomLevelConfigDtoExtension on PostListResponseDataCommentUserInfoRoomLevelConfigDto {
  PostListResponseDataCommentUserInfoRoomLevelConfigDto copyWith({
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
    return PostListResponseDataCommentUserInfoRoomLevelConfigDto()
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

PostListResponseDataCommentUserInfoNobleLevelDto $PostListResponseDataCommentUserInfoNobleLevelDtoFromJson(
    Map<String, dynamic> json) {
  final PostListResponseDataCommentUserInfoNobleLevelDto postListResponseDataCommentUserInfoNobleLevelDto = PostListResponseDataCommentUserInfoNobleLevelDto();
  final PostListResponseDataCommentUserInfoNobleLevelDtoUserCurrent? userCurrent = jsonConvert
      .convert<PostListResponseDataCommentUserInfoNobleLevelDtoUserCurrent>(
      json['userCurrent']);
  if (userCurrent != null) {
    postListResponseDataCommentUserInfoNobleLevelDto.userCurrent = userCurrent;
  }
  final PostListResponseDataCommentUserInfoNobleLevelDtoLevelBase? levelBase = jsonConvert
      .convert<PostListResponseDataCommentUserInfoNobleLevelDtoLevelBase>(
      json['levelBase']);
  if (levelBase != null) {
    postListResponseDataCommentUserInfoNobleLevelDto.levelBase = levelBase;
  }
  final PostListResponseDataCommentUserInfoNobleLevelDtoPurchaseRecord? purchaseRecord = jsonConvert
      .convert<PostListResponseDataCommentUserInfoNobleLevelDtoPurchaseRecord>(
      json['purchaseRecord']);
  if (purchaseRecord != null) {
    postListResponseDataCommentUserInfoNobleLevelDto.purchaseRecord =
        purchaseRecord;
  }
  final List<
      PostListResponseDataCommentUserInfoNobleLevelDtoPrivileges>? privileges = (json['privileges'] as List<
      dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<
          PostListResponseDataCommentUserInfoNobleLevelDtoPrivileges>(
          e) as PostListResponseDataCommentUserInfoNobleLevelDtoPrivileges)
      .toList();
  if (privileges != null) {
    postListResponseDataCommentUserInfoNobleLevelDto.privileges = privileges;
  }
  return postListResponseDataCommentUserInfoNobleLevelDto;
}

Map<String, dynamic> $PostListResponseDataCommentUserInfoNobleLevelDtoToJson(
    PostListResponseDataCommentUserInfoNobleLevelDto entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['userCurrent'] = entity.userCurrent?.toJson();
  data['levelBase'] = entity.levelBase?.toJson();
  data['purchaseRecord'] = entity.purchaseRecord?.toJson();
  data['privileges'] = entity.privileges?.map((v) => v.toJson()).toList();
  return data;
}

extension PostListResponseDataCommentUserInfoNobleLevelDtoExtension on PostListResponseDataCommentUserInfoNobleLevelDto {
  PostListResponseDataCommentUserInfoNobleLevelDto copyWith({
    PostListResponseDataCommentUserInfoNobleLevelDtoUserCurrent? userCurrent,
    PostListResponseDataCommentUserInfoNobleLevelDtoLevelBase? levelBase,
    PostListResponseDataCommentUserInfoNobleLevelDtoPurchaseRecord? purchaseRecord,
    List<
        PostListResponseDataCommentUserInfoNobleLevelDtoPrivileges>? privileges,
  }) {
    return PostListResponseDataCommentUserInfoNobleLevelDto()
      ..userCurrent = userCurrent ?? this.userCurrent
      ..levelBase = levelBase ?? this.levelBase
      ..purchaseRecord = purchaseRecord ?? this.purchaseRecord
      ..privileges = privileges ?? this.privileges;
  }
}

PostListResponseDataCommentUserInfoNobleLevelDtoUserCurrent $PostListResponseDataCommentUserInfoNobleLevelDtoUserCurrentFromJson(
    Map<String, dynamic> json) {
  final PostListResponseDataCommentUserInfoNobleLevelDtoUserCurrent postListResponseDataCommentUserInfoNobleLevelDtoUserCurrent = PostListResponseDataCommentUserInfoNobleLevelDtoUserCurrent();
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    postListResponseDataCommentUserInfoNobleLevelDtoUserCurrent.userId = userId;
  }
  final int? nobleLevelId = jsonConvert.convert<int>(json['nobleLevelId']);
  if (nobleLevelId != null) {
    postListResponseDataCommentUserInfoNobleLevelDtoUserCurrent.nobleLevelId =
        nobleLevelId;
  }
  final String? nobleName = jsonConvert.convert<String>(json['nobleName']);
  if (nobleName != null) {
    postListResponseDataCommentUserInfoNobleLevelDtoUserCurrent.nobleName =
        nobleName;
  }
  final int? levelFlag = jsonConvert.convert<int>(json['levelFlag']);
  if (levelFlag != null) {
    postListResponseDataCommentUserInfoNobleLevelDtoUserCurrent.levelFlag =
        levelFlag;
  }
  final String? startTime = jsonConvert.convert<String>(json['startTime']);
  if (startTime != null) {
    postListResponseDataCommentUserInfoNobleLevelDtoUserCurrent.startTime =
        startTime;
  }
  final String? endTime = jsonConvert.convert<String>(json['endTime']);
  if (endTime != null) {
    postListResponseDataCommentUserInfoNobleLevelDtoUserCurrent.endTime =
        endTime;
  }
  final int? remainingDays = jsonConvert.convert<int>(json['remainingDays']);
  if (remainingDays != null) {
    postListResponseDataCommentUserInfoNobleLevelDtoUserCurrent.remainingDays =
        remainingDays;
  }
  return postListResponseDataCommentUserInfoNobleLevelDtoUserCurrent;
}

Map<String,
    dynamic> $PostListResponseDataCommentUserInfoNobleLevelDtoUserCurrentToJson(
    PostListResponseDataCommentUserInfoNobleLevelDtoUserCurrent entity) {
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

extension PostListResponseDataCommentUserInfoNobleLevelDtoUserCurrentExtension on PostListResponseDataCommentUserInfoNobleLevelDtoUserCurrent {
  PostListResponseDataCommentUserInfoNobleLevelDtoUserCurrent copyWith({
    int? userId,
    int? nobleLevelId,
    String? nobleName,
    int? levelFlag,
    String? startTime,
    String? endTime,
    int? remainingDays,
  }) {
    return PostListResponseDataCommentUserInfoNobleLevelDtoUserCurrent()
      ..userId = userId ?? this.userId
      ..nobleLevelId = nobleLevelId ?? this.nobleLevelId
      ..nobleName = nobleName ?? this.nobleName
      ..levelFlag = levelFlag ?? this.levelFlag
      ..startTime = startTime ?? this.startTime
      ..endTime = endTime ?? this.endTime
      ..remainingDays = remainingDays ?? this.remainingDays;
  }
}

PostListResponseDataCommentUserInfoNobleLevelDtoLevelBase $PostListResponseDataCommentUserInfoNobleLevelDtoLevelBaseFromJson(
    Map<String, dynamic> json) {
  final PostListResponseDataCommentUserInfoNobleLevelDtoLevelBase postListResponseDataCommentUserInfoNobleLevelDtoLevelBase = PostListResponseDataCommentUserInfoNobleLevelDtoLevelBase();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    postListResponseDataCommentUserInfoNobleLevelDtoLevelBase.id = id;
  }
  final int? goodsId = jsonConvert.convert<int>(json['goodsId']);
  if (goodsId != null) {
    postListResponseDataCommentUserInfoNobleLevelDtoLevelBase.goodsId = goodsId;
  }
  final int? propId = jsonConvert.convert<int>(json['propId']);
  if (propId != null) {
    postListResponseDataCommentUserInfoNobleLevelDtoLevelBase.propId = propId;
  }
  final String? levelName = jsonConvert.convert<String>(json['levelName']);
  if (levelName != null) {
    postListResponseDataCommentUserInfoNobleLevelDtoLevelBase.levelName =
        levelName;
  }
  final int? levelFlag = jsonConvert.convert<int>(json['levelFlag']);
  if (levelFlag != null) {
    postListResponseDataCommentUserInfoNobleLevelDtoLevelBase.levelFlag =
        levelFlag;
  }
  final String? mainImageUrl = jsonConvert.convert<String>(
      json['mainImageUrl']);
  if (mainImageUrl != null) {
    postListResponseDataCommentUserInfoNobleLevelDtoLevelBase.mainImageUrl =
        mainImageUrl;
  }
  final String? badgeImageUrl = jsonConvert.convert<String>(
      json['badgeImageUrl']);
  if (badgeImageUrl != null) {
    postListResponseDataCommentUserInfoNobleLevelDtoLevelBase.badgeImageUrl =
        badgeImageUrl;
  }
  final String? middleImageUrl = jsonConvert.convert<String>(
      json['middleImageUrl']);
  if (middleImageUrl != null) {
    postListResponseDataCommentUserInfoNobleLevelDtoLevelBase.middleImageUrl =
        middleImageUrl;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    postListResponseDataCommentUserInfoNobleLevelDtoLevelBase.description =
        description;
  }
  final int? purchaseType = jsonConvert.convert<int>(json['purchaseType']);
  if (purchaseType != null) {
    postListResponseDataCommentUserInfoNobleLevelDtoLevelBase.purchaseType =
        purchaseType;
  }
  final int? firstPrice = jsonConvert.convert<int>(json['firstPrice']);
  if (firstPrice != null) {
    postListResponseDataCommentUserInfoNobleLevelDtoLevelBase.firstPrice =
        firstPrice;
  }
  final int? renewPrice = jsonConvert.convert<int>(json['renewPrice']);
  if (renewPrice != null) {
    postListResponseDataCommentUserInfoNobleLevelDtoLevelBase.renewPrice =
        renewPrice;
  }
  final int? firstSkuId = jsonConvert.convert<int>(json['firstSkuId']);
  if (firstSkuId != null) {
    postListResponseDataCommentUserInfoNobleLevelDtoLevelBase.firstSkuId =
        firstSkuId;
  }
  final int? renewSkuId = jsonConvert.convert<int>(json['renewSkuId']);
  if (renewSkuId != null) {
    postListResponseDataCommentUserInfoNobleLevelDtoLevelBase.renewSkuId =
        renewSkuId;
  }
  final int? firstGiftType = jsonConvert.convert<int>(json['firstGiftType']);
  if (firstGiftType != null) {
    postListResponseDataCommentUserInfoNobleLevelDtoLevelBase.firstGiftType =
        firstGiftType;
  }
  final int? firstGiftId = jsonConvert.convert<int>(json['firstGiftId']);
  if (firstGiftId != null) {
    postListResponseDataCommentUserInfoNobleLevelDtoLevelBase.firstGiftId =
        firstGiftId;
  }
  final String? firstGiftName = jsonConvert.convert<String>(
      json['firstGiftName']);
  if (firstGiftName != null) {
    postListResponseDataCommentUserInfoNobleLevelDtoLevelBase.firstGiftName =
        firstGiftName;
  }
  final String? firstGiftUrl = jsonConvert.convert<String>(
      json['firstGiftUrl']);
  if (firstGiftUrl != null) {
    postListResponseDataCommentUserInfoNobleLevelDtoLevelBase.firstGiftUrl =
        firstGiftUrl;
  }
  final int? firstGiftAmount = jsonConvert.convert<int>(
      json['firstGiftAmount']);
  if (firstGiftAmount != null) {
    postListResponseDataCommentUserInfoNobleLevelDtoLevelBase.firstGiftAmount =
        firstGiftAmount;
  }
  final int? firstGiftPurchaseType = jsonConvert.convert<int>(
      json['firstGiftPurchaseType']);
  if (firstGiftPurchaseType != null) {
    postListResponseDataCommentUserInfoNobleLevelDtoLevelBase
        .firstGiftPurchaseType = firstGiftPurchaseType;
  }
  final int? firstGiftPrice = jsonConvert.convert<int>(json['firstGiftPrice']);
  if (firstGiftPrice != null) {
    postListResponseDataCommentUserInfoNobleLevelDtoLevelBase.firstGiftPrice =
        firstGiftPrice;
  }
  final bool? directPurchase = jsonConvert.convert<bool>(
      json['directPurchase']);
  if (directPurchase != null) {
    postListResponseDataCommentUserInfoNobleLevelDtoLevelBase.directPurchase =
        directPurchase;
  }
  final int? purchaseDuration = jsonConvert.convert<int>(
      json['purchaseDuration']);
  if (purchaseDuration != null) {
    postListResponseDataCommentUserInfoNobleLevelDtoLevelBase.purchaseDuration =
        purchaseDuration;
  }
  return postListResponseDataCommentUserInfoNobleLevelDtoLevelBase;
}

Map<String,
    dynamic> $PostListResponseDataCommentUserInfoNobleLevelDtoLevelBaseToJson(
    PostListResponseDataCommentUserInfoNobleLevelDtoLevelBase entity) {
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

extension PostListResponseDataCommentUserInfoNobleLevelDtoLevelBaseExtension on PostListResponseDataCommentUserInfoNobleLevelDtoLevelBase {
  PostListResponseDataCommentUserInfoNobleLevelDtoLevelBase copyWith({
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
    return PostListResponseDataCommentUserInfoNobleLevelDtoLevelBase()
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

PostListResponseDataCommentUserInfoNobleLevelDtoPurchaseRecord $PostListResponseDataCommentUserInfoNobleLevelDtoPurchaseRecordFromJson(
    Map<String, dynamic> json) {
  final PostListResponseDataCommentUserInfoNobleLevelDtoPurchaseRecord postListResponseDataCommentUserInfoNobleLevelDtoPurchaseRecord = PostListResponseDataCommentUserInfoNobleLevelDtoPurchaseRecord();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    postListResponseDataCommentUserInfoNobleLevelDtoPurchaseRecord.id = id;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    postListResponseDataCommentUserInfoNobleLevelDtoPurchaseRecord.userId =
        userId;
  }
  final int? nobleLevelId = jsonConvert.convert<int>(json['nobleLevelId']);
  if (nobleLevelId != null) {
    postListResponseDataCommentUserInfoNobleLevelDtoPurchaseRecord
        .nobleLevelId = nobleLevelId;
  }
  final String? nobleLevelName = jsonConvert.convert<String>(
      json['nobleLevelName']);
  if (nobleLevelName != null) {
    postListResponseDataCommentUserInfoNobleLevelDtoPurchaseRecord
        .nobleLevelName = nobleLevelName;
  }
  final int? purchaseType = jsonConvert.convert<int>(json['purchaseType']);
  if (purchaseType != null) {
    postListResponseDataCommentUserInfoNobleLevelDtoPurchaseRecord
        .purchaseType = purchaseType;
  }
  final int? price = jsonConvert.convert<int>(json['price']);
  if (price != null) {
    postListResponseDataCommentUserInfoNobleLevelDtoPurchaseRecord.price =
        price;
  }
  final int? purchaseFlag = jsonConvert.convert<int>(json['purchaseFlag']);
  if (purchaseFlag != null) {
    postListResponseDataCommentUserInfoNobleLevelDtoPurchaseRecord
        .purchaseFlag = purchaseFlag;
  }
  final int? durationDays = jsonConvert.convert<int>(json['durationDays']);
  if (durationDays != null) {
    postListResponseDataCommentUserInfoNobleLevelDtoPurchaseRecord
        .durationDays = durationDays;
  }
  final String? purchaseTime = jsonConvert.convert<String>(
      json['purchaseTime']);
  if (purchaseTime != null) {
    postListResponseDataCommentUserInfoNobleLevelDtoPurchaseRecord
        .purchaseTime = purchaseTime;
  }
  final int? roomId = jsonConvert.convert<int>(json['roomId']);
  if (roomId != null) {
    postListResponseDataCommentUserInfoNobleLevelDtoPurchaseRecord.roomId =
        roomId;
  }
  final int? orderId = jsonConvert.convert<int>(json['orderId']);
  if (orderId != null) {
    postListResponseDataCommentUserInfoNobleLevelDtoPurchaseRecord.orderId =
        orderId;
  }
  final String? orderNo = jsonConvert.convert<String>(json['orderNo']);
  if (orderNo != null) {
    postListResponseDataCommentUserInfoNobleLevelDtoPurchaseRecord.orderNo =
        orderNo;
  }
  return postListResponseDataCommentUserInfoNobleLevelDtoPurchaseRecord;
}

Map<String,
    dynamic> $PostListResponseDataCommentUserInfoNobleLevelDtoPurchaseRecordToJson(
    PostListResponseDataCommentUserInfoNobleLevelDtoPurchaseRecord entity) {
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

extension PostListResponseDataCommentUserInfoNobleLevelDtoPurchaseRecordExtension on PostListResponseDataCommentUserInfoNobleLevelDtoPurchaseRecord {
  PostListResponseDataCommentUserInfoNobleLevelDtoPurchaseRecord copyWith({
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
    return PostListResponseDataCommentUserInfoNobleLevelDtoPurchaseRecord()
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

PostListResponseDataCommentUserInfoNobleLevelDtoPrivileges $PostListResponseDataCommentUserInfoNobleLevelDtoPrivilegesFromJson(
    Map<String, dynamic> json) {
  final PostListResponseDataCommentUserInfoNobleLevelDtoPrivileges postListResponseDataCommentUserInfoNobleLevelDtoPrivileges = PostListResponseDataCommentUserInfoNobleLevelDtoPrivileges();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    postListResponseDataCommentUserInfoNobleLevelDtoPrivileges.id = id;
  }
  final String? privilegeName = jsonConvert.convert<String>(
      json['privilegeName']);
  if (privilegeName != null) {
    postListResponseDataCommentUserInfoNobleLevelDtoPrivileges.privilegeName =
        privilegeName;
  }
  final int? privilegeType = jsonConvert.convert<int>(json['privilegeType']);
  if (privilegeType != null) {
    postListResponseDataCommentUserInfoNobleLevelDtoPrivileges.privilegeType =
        privilegeType;
  }
  final String? privilegeFunction = jsonConvert.convert<String>(
      json['privilegeFunction']);
  if (privilegeFunction != null) {
    postListResponseDataCommentUserInfoNobleLevelDtoPrivileges
        .privilegeFunction = privilegeFunction;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    postListResponseDataCommentUserInfoNobleLevelDtoPrivileges.description =
        description;
  }
  final String? imageUrl = jsonConvert.convert<String>(json['imageUrl']);
  if (imageUrl != null) {
    postListResponseDataCommentUserInfoNobleLevelDtoPrivileges.imageUrl =
        imageUrl;
  }
  final bool? enabled = jsonConvert.convert<bool>(json['enabled']);
  if (enabled != null) {
    postListResponseDataCommentUserInfoNobleLevelDtoPrivileges.enabled =
        enabled;
  }
  return postListResponseDataCommentUserInfoNobleLevelDtoPrivileges;
}

Map<String,
    dynamic> $PostListResponseDataCommentUserInfoNobleLevelDtoPrivilegesToJson(
    PostListResponseDataCommentUserInfoNobleLevelDtoPrivileges entity) {
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

extension PostListResponseDataCommentUserInfoNobleLevelDtoPrivilegesExtension on PostListResponseDataCommentUserInfoNobleLevelDtoPrivileges {
  PostListResponseDataCommentUserInfoNobleLevelDtoPrivileges copyWith({
    int? id,
    String? privilegeName,
    int? privilegeType,
    String? privilegeFunction,
    String? description,
    String? imageUrl,
    bool? enabled,
  }) {
    return PostListResponseDataCommentUserInfoNobleLevelDtoPrivileges()
      ..id = id ?? this.id
      ..privilegeName = privilegeName ?? this.privilegeName
      ..privilegeType = privilegeType ?? this.privilegeType
      ..privilegeFunction = privilegeFunction ?? this.privilegeFunction
      ..description = description ?? this.description
      ..imageUrl = imageUrl ?? this.imageUrl
      ..enabled = enabled ?? this.enabled;
  }
}

PostListResponseDataCommentReplyInfo $PostListResponseDataCommentReplyInfoFromJson(
    Map<String, dynamic> json) {
  final PostListResponseDataCommentReplyInfo postListResponseDataCommentReplyInfo = PostListResponseDataCommentReplyInfo();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    postListResponseDataCommentReplyInfo.id = id;
  }
  final String? userNo = jsonConvert.convert<String>(json['userNo']);
  if (userNo != null) {
    postListResponseDataCommentReplyInfo.userNo = userNo;
  }
  final String? sex = jsonConvert.convert<String>(json['sex']);
  if (sex != null) {
    postListResponseDataCommentReplyInfo.sex = sex;
  }
  final String? nickName = jsonConvert.convert<String>(json['nickName']);
  if (nickName != null) {
    postListResponseDataCommentReplyInfo.nickName = nickName;
  }
  final String? avatar = jsonConvert.convert<String>(json['avatar']);
  if (avatar != null) {
    postListResponseDataCommentReplyInfo.avatar = avatar;
  }
  final int? onlineFlag = jsonConvert.convert<int>(json['onlineFlag']);
  if (onlineFlag != null) {
    postListResponseDataCommentReplyInfo.onlineFlag = onlineFlag;
  }
  final int? accompanyId = jsonConvert.convert<int>(json['accompanyId']);
  if (accompanyId != null) {
    postListResponseDataCommentReplyInfo.accompanyId = accompanyId;
  }
  final String? introduced = jsonConvert.convert<String>(json['introduced']);
  if (introduced != null) {
    postListResponseDataCommentReplyInfo.introduced = introduced;
  }
  final int? level = jsonConvert.convert<int>(json['level']);
  if (level != null) {
    postListResponseDataCommentReplyInfo.level = level;
  }
  final int? roomLevel = jsonConvert.convert<int>(json['roomLevel']);
  if (roomLevel != null) {
    postListResponseDataCommentReplyInfo.roomLevel = roomLevel;
  }
  final PostListResponseDataCommentReplyInfoRoomLevelConfigDto? roomLevelConfigDto = jsonConvert
      .convert<PostListResponseDataCommentReplyInfoRoomLevelConfigDto>(
      json['roomLevelConfigDto']);
  if (roomLevelConfigDto != null) {
    postListResponseDataCommentReplyInfo.roomLevelConfigDto =
        roomLevelConfigDto;
  }
  final PostListResponseDataCommentReplyInfoNobleLevelDto? nobleLevelDto = jsonConvert
      .convert<PostListResponseDataCommentReplyInfoNobleLevelDto>(
      json['nobleLevelDto']);
  if (nobleLevelDto != null) {
    postListResponseDataCommentReplyInfo.nobleLevelDto = nobleLevelDto;
  }
  final String? accompanyLevel = jsonConvert.convert<String>(
      json['accompanyLevel']);
  if (accompanyLevel != null) {
    postListResponseDataCommentReplyInfo.accompanyLevel = accompanyLevel;
  }
  final String? onlineTime = jsonConvert.convert<String>(json['onlineTime']);
  if (onlineTime != null) {
    postListResponseDataCommentReplyInfo.onlineTime = onlineTime;
  }
  final String? customIdentityImage = jsonConvert.convert<String>(
      json['customIdentityImage']);
  if (customIdentityImage != null) {
    postListResponseDataCommentReplyInfo.customIdentityImage =
        customIdentityImage;
  }
  final List<
      String>? customIdentityImageList = (json['customIdentityImageList'] as List<
      dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (customIdentityImageList != null) {
    postListResponseDataCommentReplyInfo.customIdentityImageList =
        customIdentityImageList;
  }
  final int? userMic = jsonConvert.convert<int>(json['userMic']);
  if (userMic != null) {
    postListResponseDataCommentReplyInfo.userMic = userMic;
  }
  final String? birthday = jsonConvert.convert<String>(json['birthday']);
  if (birthday != null) {
    postListResponseDataCommentReplyInfo.birthday = birthday;
  }
  final String? mainLabelId = jsonConvert.convert<String>(json['mainLabelId']);
  if (mainLabelId != null) {
    postListResponseDataCommentReplyInfo.mainLabelId = mainLabelId;
  }
  final String? mainLabel = jsonConvert.convert<String>(json['mainLabel']);
  if (mainLabel != null) {
    postListResponseDataCommentReplyInfo.mainLabel = mainLabel;
  }
  final String? moduleAvatar = jsonConvert.convert<String>(
      json['moduleAvatar']);
  if (moduleAvatar != null) {
    postListResponseDataCommentReplyInfo.moduleAvatar = moduleAvatar;
  }
  return postListResponseDataCommentReplyInfo;
}

Map<String, dynamic> $PostListResponseDataCommentReplyInfoToJson(
    PostListResponseDataCommentReplyInfo entity) {
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
  data['roomLevelConfigDto'] = entity.roomLevelConfigDto?.toJson();
  data['nobleLevelDto'] = entity.nobleLevelDto?.toJson();
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

extension PostListResponseDataCommentReplyInfoExtension on PostListResponseDataCommentReplyInfo {
  PostListResponseDataCommentReplyInfo copyWith({
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
    PostListResponseDataCommentReplyInfoRoomLevelConfigDto? roomLevelConfigDto,
    PostListResponseDataCommentReplyInfoNobleLevelDto? nobleLevelDto,
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
    return PostListResponseDataCommentReplyInfo()
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

PostListResponseDataCommentReplyInfoRoomLevelConfigDto $PostListResponseDataCommentReplyInfoRoomLevelConfigDtoFromJson(
    Map<String, dynamic> json) {
  final PostListResponseDataCommentReplyInfoRoomLevelConfigDto postListResponseDataCommentReplyInfoRoomLevelConfigDto = PostListResponseDataCommentReplyInfoRoomLevelConfigDto();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    postListResponseDataCommentReplyInfoRoomLevelConfigDto.id = id;
  }
  final String? levelName = jsonConvert.convert<String>(json['levelName']);
  if (levelName != null) {
    postListResponseDataCommentReplyInfoRoomLevelConfigDto.levelName =
        levelName;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    postListResponseDataCommentReplyInfoRoomLevelConfigDto.icon = icon;
  }
  final String? backdrop = jsonConvert.convert<String>(json['backdrop']);
  if (backdrop != null) {
    postListResponseDataCommentReplyInfoRoomLevelConfigDto.backdrop = backdrop;
  }
  final String? medal = jsonConvert.convert<String>(json['medal']);
  if (medal != null) {
    postListResponseDataCommentReplyInfoRoomLevelConfigDto.medal = medal;
  }
  final String? homeBackdrop = jsonConvert.convert<String>(
      json['homeBackdrop']);
  if (homeBackdrop != null) {
    postListResponseDataCommentReplyInfoRoomLevelConfigDto.homeBackdrop =
        homeBackdrop;
  }
  final String? pcMedal = jsonConvert.convert<String>(json['pcMedal']);
  if (pcMedal != null) {
    postListResponseDataCommentReplyInfoRoomLevelConfigDto.pcMedal = pcMedal;
  }
  final String? pcIcon = jsonConvert.convert<String>(json['pcIcon']);
  if (pcIcon != null) {
    postListResponseDataCommentReplyInfoRoomLevelConfigDto.pcIcon = pcIcon;
  }
  final int? level = jsonConvert.convert<int>(json['level']);
  if (level != null) {
    postListResponseDataCommentReplyInfoRoomLevelConfigDto.level = level;
  }
  final int? startPoints = jsonConvert.convert<int>(json['startPoints']);
  if (startPoints != null) {
    postListResponseDataCommentReplyInfoRoomLevelConfigDto.startPoints =
        startPoints;
  }
  final int? endPoints = jsonConvert.convert<int>(json['endPoints']);
  if (endPoints != null) {
    postListResponseDataCommentReplyInfoRoomLevelConfigDto.endPoints =
        endPoints;
  }
  final int? medalUsable = jsonConvert.convert<int>(json['medalUsable']);
  if (medalUsable != null) {
    postListResponseDataCommentReplyInfoRoomLevelConfigDto.medalUsable =
        medalUsable;
  }
  final int? recommendUsable = jsonConvert.convert<int>(
      json['recommendUsable']);
  if (recommendUsable != null) {
    postListResponseDataCommentReplyInfoRoomLevelConfigDto.recommendUsable =
        recommendUsable;
  }
  final int? recommendRate = jsonConvert.convert<int>(json['recommendRate']);
  if (recommendRate != null) {
    postListResponseDataCommentReplyInfoRoomLevelConfigDto.recommendRate =
        recommendRate;
  }
  final int? giftUsable = jsonConvert.convert<int>(json['giftUsable']);
  if (giftUsable != null) {
    postListResponseDataCommentReplyInfoRoomLevelConfigDto.giftUsable =
        giftUsable;
  }
  final int? avatarUsable = jsonConvert.convert<int>(json['avatarUsable']);
  if (avatarUsable != null) {
    postListResponseDataCommentReplyInfoRoomLevelConfigDto.avatarUsable =
        avatarUsable;
  }
  final int? avatarConfigId = jsonConvert.convert<int>(json['avatarConfigId']);
  if (avatarConfigId != null) {
    postListResponseDataCommentReplyInfoRoomLevelConfigDto.avatarConfigId =
        avatarConfigId;
  }
  final int? animationUsable = jsonConvert.convert<int>(
      json['animationUsable']);
  if (animationUsable != null) {
    postListResponseDataCommentReplyInfoRoomLevelConfigDto.animationUsable =
        animationUsable;
  }
  final int? animationConfigId = jsonConvert.convert<int>(
      json['animationConfigId']);
  if (animationConfigId != null) {
    postListResponseDataCommentReplyInfoRoomLevelConfigDto.animationConfigId =
        animationConfigId;
  }
  final int? nickColorUsable = jsonConvert.convert<int>(
      json['nickColorUsable']);
  if (nickColorUsable != null) {
    postListResponseDataCommentReplyInfoRoomLevelConfigDto.nickColorUsable =
        nickColorUsable;
  }
  final int? nickColorConfigId = jsonConvert.convert<int>(
      json['nickColorConfigId']);
  if (nickColorConfigId != null) {
    postListResponseDataCommentReplyInfoRoomLevelConfigDto.nickColorConfigId =
        nickColorConfigId;
  }
  final int? textColorUsable = jsonConvert.convert<int>(
      json['textColorUsable']);
  if (textColorUsable != null) {
    postListResponseDataCommentReplyInfoRoomLevelConfigDto.textColorUsable =
        textColorUsable;
  }
  final int? textColorConfigId = jsonConvert.convert<int>(
      json['textColorConfigId']);
  if (textColorConfigId != null) {
    postListResponseDataCommentReplyInfoRoomLevelConfigDto.textColorConfigId =
        textColorConfigId;
  }
  final int? birthdayUsable = jsonConvert.convert<int>(json['birthdayUsable']);
  if (birthdayUsable != null) {
    postListResponseDataCommentReplyInfoRoomLevelConfigDto.birthdayUsable =
        birthdayUsable;
  }
  final int? birthdayRightsPackageId = jsonConvert.convert<int>(
      json['birthdayRightsPackageId']);
  if (birthdayRightsPackageId != null) {
    postListResponseDataCommentReplyInfoRoomLevelConfigDto
        .birthdayRightsPackageId = birthdayRightsPackageId;
  }
  final int? invisibleRankUsable = jsonConvert.convert<int>(
      json['invisibleRankUsable']);
  if (invisibleRankUsable != null) {
    postListResponseDataCommentReplyInfoRoomLevelConfigDto.invisibleRankUsable =
        invisibleRankUsable;
  }
  final String? invisibleRankNick = jsonConvert.convert<String>(
      json['invisibleRankNick']);
  if (invisibleRankNick != null) {
    postListResponseDataCommentReplyInfoRoomLevelConfigDto.invisibleRankNick =
        invisibleRankNick;
  }
  final int? invisibleRoomUsable = jsonConvert.convert<int>(
      json['invisibleRoomUsable']);
  if (invisibleRoomUsable != null) {
    postListResponseDataCommentReplyInfoRoomLevelConfigDto.invisibleRoomUsable =
        invisibleRoomUsable;
  }
  final int? supportUsable = jsonConvert.convert<int>(json['supportUsable']);
  if (supportUsable != null) {
    postListResponseDataCommentReplyInfoRoomLevelConfigDto.supportUsable =
        supportUsable;
  }
  final int? productCreateUsable = jsonConvert.convert<int>(
      json['productCreateUsable']);
  if (productCreateUsable != null) {
    postListResponseDataCommentReplyInfoRoomLevelConfigDto.productCreateUsable =
        productCreateUsable;
  }
  return postListResponseDataCommentReplyInfoRoomLevelConfigDto;
}

Map<String,
    dynamic> $PostListResponseDataCommentReplyInfoRoomLevelConfigDtoToJson(
    PostListResponseDataCommentReplyInfoRoomLevelConfigDto entity) {
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

extension PostListResponseDataCommentReplyInfoRoomLevelConfigDtoExtension on PostListResponseDataCommentReplyInfoRoomLevelConfigDto {
  PostListResponseDataCommentReplyInfoRoomLevelConfigDto copyWith({
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
    return PostListResponseDataCommentReplyInfoRoomLevelConfigDto()
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

PostListResponseDataCommentReplyInfoNobleLevelDto $PostListResponseDataCommentReplyInfoNobleLevelDtoFromJson(
    Map<String, dynamic> json) {
  final PostListResponseDataCommentReplyInfoNobleLevelDto postListResponseDataCommentReplyInfoNobleLevelDto = PostListResponseDataCommentReplyInfoNobleLevelDto();
  final PostListResponseDataCommentReplyInfoNobleLevelDtoUserCurrent? userCurrent = jsonConvert
      .convert<PostListResponseDataCommentReplyInfoNobleLevelDtoUserCurrent>(
      json['userCurrent']);
  if (userCurrent != null) {
    postListResponseDataCommentReplyInfoNobleLevelDto.userCurrent = userCurrent;
  }
  final PostListResponseDataCommentReplyInfoNobleLevelDtoLevelBase? levelBase = jsonConvert
      .convert<PostListResponseDataCommentReplyInfoNobleLevelDtoLevelBase>(
      json['levelBase']);
  if (levelBase != null) {
    postListResponseDataCommentReplyInfoNobleLevelDto.levelBase = levelBase;
  }
  final PostListResponseDataCommentReplyInfoNobleLevelDtoPurchaseRecord? purchaseRecord = jsonConvert
      .convert<PostListResponseDataCommentReplyInfoNobleLevelDtoPurchaseRecord>(
      json['purchaseRecord']);
  if (purchaseRecord != null) {
    postListResponseDataCommentReplyInfoNobleLevelDto.purchaseRecord =
        purchaseRecord;
  }
  final List<
      PostListResponseDataCommentReplyInfoNobleLevelDtoPrivileges>? privileges = (json['privileges'] as List<
      dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<
          PostListResponseDataCommentReplyInfoNobleLevelDtoPrivileges>(
          e) as PostListResponseDataCommentReplyInfoNobleLevelDtoPrivileges)
      .toList();
  if (privileges != null) {
    postListResponseDataCommentReplyInfoNobleLevelDto.privileges = privileges;
  }
  return postListResponseDataCommentReplyInfoNobleLevelDto;
}

Map<String, dynamic> $PostListResponseDataCommentReplyInfoNobleLevelDtoToJson(
    PostListResponseDataCommentReplyInfoNobleLevelDto entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['userCurrent'] = entity.userCurrent?.toJson();
  data['levelBase'] = entity.levelBase?.toJson();
  data['purchaseRecord'] = entity.purchaseRecord?.toJson();
  data['privileges'] = entity.privileges?.map((v) => v.toJson()).toList();
  return data;
}

extension PostListResponseDataCommentReplyInfoNobleLevelDtoExtension on PostListResponseDataCommentReplyInfoNobleLevelDto {
  PostListResponseDataCommentReplyInfoNobleLevelDto copyWith({
    PostListResponseDataCommentReplyInfoNobleLevelDtoUserCurrent? userCurrent,
    PostListResponseDataCommentReplyInfoNobleLevelDtoLevelBase? levelBase,
    PostListResponseDataCommentReplyInfoNobleLevelDtoPurchaseRecord? purchaseRecord,
    List<
        PostListResponseDataCommentReplyInfoNobleLevelDtoPrivileges>? privileges,
  }) {
    return PostListResponseDataCommentReplyInfoNobleLevelDto()
      ..userCurrent = userCurrent ?? this.userCurrent
      ..levelBase = levelBase ?? this.levelBase
      ..purchaseRecord = purchaseRecord ?? this.purchaseRecord
      ..privileges = privileges ?? this.privileges;
  }
}

PostListResponseDataCommentReplyInfoNobleLevelDtoUserCurrent $PostListResponseDataCommentReplyInfoNobleLevelDtoUserCurrentFromJson(
    Map<String, dynamic> json) {
  final PostListResponseDataCommentReplyInfoNobleLevelDtoUserCurrent postListResponseDataCommentReplyInfoNobleLevelDtoUserCurrent = PostListResponseDataCommentReplyInfoNobleLevelDtoUserCurrent();
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    postListResponseDataCommentReplyInfoNobleLevelDtoUserCurrent.userId =
        userId;
  }
  final int? nobleLevelId = jsonConvert.convert<int>(json['nobleLevelId']);
  if (nobleLevelId != null) {
    postListResponseDataCommentReplyInfoNobleLevelDtoUserCurrent.nobleLevelId =
        nobleLevelId;
  }
  final String? nobleName = jsonConvert.convert<String>(json['nobleName']);
  if (nobleName != null) {
    postListResponseDataCommentReplyInfoNobleLevelDtoUserCurrent.nobleName =
        nobleName;
  }
  final int? levelFlag = jsonConvert.convert<int>(json['levelFlag']);
  if (levelFlag != null) {
    postListResponseDataCommentReplyInfoNobleLevelDtoUserCurrent.levelFlag =
        levelFlag;
  }
  final String? startTime = jsonConvert.convert<String>(json['startTime']);
  if (startTime != null) {
    postListResponseDataCommentReplyInfoNobleLevelDtoUserCurrent.startTime =
        startTime;
  }
  final String? endTime = jsonConvert.convert<String>(json['endTime']);
  if (endTime != null) {
    postListResponseDataCommentReplyInfoNobleLevelDtoUserCurrent.endTime =
        endTime;
  }
  final int? remainingDays = jsonConvert.convert<int>(json['remainingDays']);
  if (remainingDays != null) {
    postListResponseDataCommentReplyInfoNobleLevelDtoUserCurrent.remainingDays =
        remainingDays;
  }
  return postListResponseDataCommentReplyInfoNobleLevelDtoUserCurrent;
}

Map<String,
    dynamic> $PostListResponseDataCommentReplyInfoNobleLevelDtoUserCurrentToJson(
    PostListResponseDataCommentReplyInfoNobleLevelDtoUserCurrent entity) {
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

extension PostListResponseDataCommentReplyInfoNobleLevelDtoUserCurrentExtension on PostListResponseDataCommentReplyInfoNobleLevelDtoUserCurrent {
  PostListResponseDataCommentReplyInfoNobleLevelDtoUserCurrent copyWith({
    int? userId,
    int? nobleLevelId,
    String? nobleName,
    int? levelFlag,
    String? startTime,
    String? endTime,
    int? remainingDays,
  }) {
    return PostListResponseDataCommentReplyInfoNobleLevelDtoUserCurrent()
      ..userId = userId ?? this.userId
      ..nobleLevelId = nobleLevelId ?? this.nobleLevelId
      ..nobleName = nobleName ?? this.nobleName
      ..levelFlag = levelFlag ?? this.levelFlag
      ..startTime = startTime ?? this.startTime
      ..endTime = endTime ?? this.endTime
      ..remainingDays = remainingDays ?? this.remainingDays;
  }
}

PostListResponseDataCommentReplyInfoNobleLevelDtoLevelBase $PostListResponseDataCommentReplyInfoNobleLevelDtoLevelBaseFromJson(
    Map<String, dynamic> json) {
  final PostListResponseDataCommentReplyInfoNobleLevelDtoLevelBase postListResponseDataCommentReplyInfoNobleLevelDtoLevelBase = PostListResponseDataCommentReplyInfoNobleLevelDtoLevelBase();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    postListResponseDataCommentReplyInfoNobleLevelDtoLevelBase.id = id;
  }
  final int? goodsId = jsonConvert.convert<int>(json['goodsId']);
  if (goodsId != null) {
    postListResponseDataCommentReplyInfoNobleLevelDtoLevelBase.goodsId =
        goodsId;
  }
  final int? propId = jsonConvert.convert<int>(json['propId']);
  if (propId != null) {
    postListResponseDataCommentReplyInfoNobleLevelDtoLevelBase.propId = propId;
  }
  final String? levelName = jsonConvert.convert<String>(json['levelName']);
  if (levelName != null) {
    postListResponseDataCommentReplyInfoNobleLevelDtoLevelBase.levelName =
        levelName;
  }
  final int? levelFlag = jsonConvert.convert<int>(json['levelFlag']);
  if (levelFlag != null) {
    postListResponseDataCommentReplyInfoNobleLevelDtoLevelBase.levelFlag =
        levelFlag;
  }
  final String? mainImageUrl = jsonConvert.convert<String>(
      json['mainImageUrl']);
  if (mainImageUrl != null) {
    postListResponseDataCommentReplyInfoNobleLevelDtoLevelBase.mainImageUrl =
        mainImageUrl;
  }
  final String? badgeImageUrl = jsonConvert.convert<String>(
      json['badgeImageUrl']);
  if (badgeImageUrl != null) {
    postListResponseDataCommentReplyInfoNobleLevelDtoLevelBase.badgeImageUrl =
        badgeImageUrl;
  }
  final String? middleImageUrl = jsonConvert.convert<String>(
      json['middleImageUrl']);
  if (middleImageUrl != null) {
    postListResponseDataCommentReplyInfoNobleLevelDtoLevelBase.middleImageUrl =
        middleImageUrl;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    postListResponseDataCommentReplyInfoNobleLevelDtoLevelBase.description =
        description;
  }
  final int? purchaseType = jsonConvert.convert<int>(json['purchaseType']);
  if (purchaseType != null) {
    postListResponseDataCommentReplyInfoNobleLevelDtoLevelBase.purchaseType =
        purchaseType;
  }
  final int? firstPrice = jsonConvert.convert<int>(json['firstPrice']);
  if (firstPrice != null) {
    postListResponseDataCommentReplyInfoNobleLevelDtoLevelBase.firstPrice =
        firstPrice;
  }
  final int? renewPrice = jsonConvert.convert<int>(json['renewPrice']);
  if (renewPrice != null) {
    postListResponseDataCommentReplyInfoNobleLevelDtoLevelBase.renewPrice =
        renewPrice;
  }
  final int? firstSkuId = jsonConvert.convert<int>(json['firstSkuId']);
  if (firstSkuId != null) {
    postListResponseDataCommentReplyInfoNobleLevelDtoLevelBase.firstSkuId =
        firstSkuId;
  }
  final int? renewSkuId = jsonConvert.convert<int>(json['renewSkuId']);
  if (renewSkuId != null) {
    postListResponseDataCommentReplyInfoNobleLevelDtoLevelBase.renewSkuId =
        renewSkuId;
  }
  final int? firstGiftType = jsonConvert.convert<int>(json['firstGiftType']);
  if (firstGiftType != null) {
    postListResponseDataCommentReplyInfoNobleLevelDtoLevelBase.firstGiftType =
        firstGiftType;
  }
  final int? firstGiftId = jsonConvert.convert<int>(json['firstGiftId']);
  if (firstGiftId != null) {
    postListResponseDataCommentReplyInfoNobleLevelDtoLevelBase.firstGiftId =
        firstGiftId;
  }
  final String? firstGiftName = jsonConvert.convert<String>(
      json['firstGiftName']);
  if (firstGiftName != null) {
    postListResponseDataCommentReplyInfoNobleLevelDtoLevelBase.firstGiftName =
        firstGiftName;
  }
  final String? firstGiftUrl = jsonConvert.convert<String>(
      json['firstGiftUrl']);
  if (firstGiftUrl != null) {
    postListResponseDataCommentReplyInfoNobleLevelDtoLevelBase.firstGiftUrl =
        firstGiftUrl;
  }
  final int? firstGiftAmount = jsonConvert.convert<int>(
      json['firstGiftAmount']);
  if (firstGiftAmount != null) {
    postListResponseDataCommentReplyInfoNobleLevelDtoLevelBase.firstGiftAmount =
        firstGiftAmount;
  }
  final int? firstGiftPurchaseType = jsonConvert.convert<int>(
      json['firstGiftPurchaseType']);
  if (firstGiftPurchaseType != null) {
    postListResponseDataCommentReplyInfoNobleLevelDtoLevelBase
        .firstGiftPurchaseType = firstGiftPurchaseType;
  }
  final int? firstGiftPrice = jsonConvert.convert<int>(json['firstGiftPrice']);
  if (firstGiftPrice != null) {
    postListResponseDataCommentReplyInfoNobleLevelDtoLevelBase.firstGiftPrice =
        firstGiftPrice;
  }
  final bool? directPurchase = jsonConvert.convert<bool>(
      json['directPurchase']);
  if (directPurchase != null) {
    postListResponseDataCommentReplyInfoNobleLevelDtoLevelBase.directPurchase =
        directPurchase;
  }
  final int? purchaseDuration = jsonConvert.convert<int>(
      json['purchaseDuration']);
  if (purchaseDuration != null) {
    postListResponseDataCommentReplyInfoNobleLevelDtoLevelBase
        .purchaseDuration = purchaseDuration;
  }
  return postListResponseDataCommentReplyInfoNobleLevelDtoLevelBase;
}

Map<String,
    dynamic> $PostListResponseDataCommentReplyInfoNobleLevelDtoLevelBaseToJson(
    PostListResponseDataCommentReplyInfoNobleLevelDtoLevelBase entity) {
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

extension PostListResponseDataCommentReplyInfoNobleLevelDtoLevelBaseExtension on PostListResponseDataCommentReplyInfoNobleLevelDtoLevelBase {
  PostListResponseDataCommentReplyInfoNobleLevelDtoLevelBase copyWith({
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
    return PostListResponseDataCommentReplyInfoNobleLevelDtoLevelBase()
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

PostListResponseDataCommentReplyInfoNobleLevelDtoPurchaseRecord $PostListResponseDataCommentReplyInfoNobleLevelDtoPurchaseRecordFromJson(
    Map<String, dynamic> json) {
  final PostListResponseDataCommentReplyInfoNobleLevelDtoPurchaseRecord postListResponseDataCommentReplyInfoNobleLevelDtoPurchaseRecord = PostListResponseDataCommentReplyInfoNobleLevelDtoPurchaseRecord();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    postListResponseDataCommentReplyInfoNobleLevelDtoPurchaseRecord.id = id;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    postListResponseDataCommentReplyInfoNobleLevelDtoPurchaseRecord.userId =
        userId;
  }
  final int? nobleLevelId = jsonConvert.convert<int>(json['nobleLevelId']);
  if (nobleLevelId != null) {
    postListResponseDataCommentReplyInfoNobleLevelDtoPurchaseRecord
        .nobleLevelId = nobleLevelId;
  }
  final String? nobleLevelName = jsonConvert.convert<String>(
      json['nobleLevelName']);
  if (nobleLevelName != null) {
    postListResponseDataCommentReplyInfoNobleLevelDtoPurchaseRecord
        .nobleLevelName = nobleLevelName;
  }
  final int? purchaseType = jsonConvert.convert<int>(json['purchaseType']);
  if (purchaseType != null) {
    postListResponseDataCommentReplyInfoNobleLevelDtoPurchaseRecord
        .purchaseType = purchaseType;
  }
  final int? price = jsonConvert.convert<int>(json['price']);
  if (price != null) {
    postListResponseDataCommentReplyInfoNobleLevelDtoPurchaseRecord.price =
        price;
  }
  final int? purchaseFlag = jsonConvert.convert<int>(json['purchaseFlag']);
  if (purchaseFlag != null) {
    postListResponseDataCommentReplyInfoNobleLevelDtoPurchaseRecord
        .purchaseFlag = purchaseFlag;
  }
  final int? durationDays = jsonConvert.convert<int>(json['durationDays']);
  if (durationDays != null) {
    postListResponseDataCommentReplyInfoNobleLevelDtoPurchaseRecord
        .durationDays = durationDays;
  }
  final String? purchaseTime = jsonConvert.convert<String>(
      json['purchaseTime']);
  if (purchaseTime != null) {
    postListResponseDataCommentReplyInfoNobleLevelDtoPurchaseRecord
        .purchaseTime = purchaseTime;
  }
  final int? roomId = jsonConvert.convert<int>(json['roomId']);
  if (roomId != null) {
    postListResponseDataCommentReplyInfoNobleLevelDtoPurchaseRecord.roomId =
        roomId;
  }
  final int? orderId = jsonConvert.convert<int>(json['orderId']);
  if (orderId != null) {
    postListResponseDataCommentReplyInfoNobleLevelDtoPurchaseRecord.orderId =
        orderId;
  }
  final String? orderNo = jsonConvert.convert<String>(json['orderNo']);
  if (orderNo != null) {
    postListResponseDataCommentReplyInfoNobleLevelDtoPurchaseRecord.orderNo =
        orderNo;
  }
  return postListResponseDataCommentReplyInfoNobleLevelDtoPurchaseRecord;
}

Map<String,
    dynamic> $PostListResponseDataCommentReplyInfoNobleLevelDtoPurchaseRecordToJson(
    PostListResponseDataCommentReplyInfoNobleLevelDtoPurchaseRecord entity) {
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

extension PostListResponseDataCommentReplyInfoNobleLevelDtoPurchaseRecordExtension on PostListResponseDataCommentReplyInfoNobleLevelDtoPurchaseRecord {
  PostListResponseDataCommentReplyInfoNobleLevelDtoPurchaseRecord copyWith({
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
    return PostListResponseDataCommentReplyInfoNobleLevelDtoPurchaseRecord()
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

PostListResponseDataCommentReplyInfoNobleLevelDtoPrivileges $PostListResponseDataCommentReplyInfoNobleLevelDtoPrivilegesFromJson(
    Map<String, dynamic> json) {
  final PostListResponseDataCommentReplyInfoNobleLevelDtoPrivileges postListResponseDataCommentReplyInfoNobleLevelDtoPrivileges = PostListResponseDataCommentReplyInfoNobleLevelDtoPrivileges();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    postListResponseDataCommentReplyInfoNobleLevelDtoPrivileges.id = id;
  }
  final String? privilegeName = jsonConvert.convert<String>(
      json['privilegeName']);
  if (privilegeName != null) {
    postListResponseDataCommentReplyInfoNobleLevelDtoPrivileges.privilegeName =
        privilegeName;
  }
  final int? privilegeType = jsonConvert.convert<int>(json['privilegeType']);
  if (privilegeType != null) {
    postListResponseDataCommentReplyInfoNobleLevelDtoPrivileges.privilegeType =
        privilegeType;
  }
  final String? privilegeFunction = jsonConvert.convert<String>(
      json['privilegeFunction']);
  if (privilegeFunction != null) {
    postListResponseDataCommentReplyInfoNobleLevelDtoPrivileges
        .privilegeFunction = privilegeFunction;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    postListResponseDataCommentReplyInfoNobleLevelDtoPrivileges.description =
        description;
  }
  final String? imageUrl = jsonConvert.convert<String>(json['imageUrl']);
  if (imageUrl != null) {
    postListResponseDataCommentReplyInfoNobleLevelDtoPrivileges.imageUrl =
        imageUrl;
  }
  final bool? enabled = jsonConvert.convert<bool>(json['enabled']);
  if (enabled != null) {
    postListResponseDataCommentReplyInfoNobleLevelDtoPrivileges.enabled =
        enabled;
  }
  return postListResponseDataCommentReplyInfoNobleLevelDtoPrivileges;
}

Map<String,
    dynamic> $PostListResponseDataCommentReplyInfoNobleLevelDtoPrivilegesToJson(
    PostListResponseDataCommentReplyInfoNobleLevelDtoPrivileges entity) {
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

extension PostListResponseDataCommentReplyInfoNobleLevelDtoPrivilegesExtension on PostListResponseDataCommentReplyInfoNobleLevelDtoPrivileges {
  PostListResponseDataCommentReplyInfoNobleLevelDtoPrivileges copyWith({
    int? id,
    String? privilegeName,
    int? privilegeType,
    String? privilegeFunction,
    String? description,
    String? imageUrl,
    bool? enabled,
  }) {
    return PostListResponseDataCommentReplyInfoNobleLevelDtoPrivileges()
      ..id = id ?? this.id
      ..privilegeName = privilegeName ?? this.privilegeName
      ..privilegeType = privilegeType ?? this.privilegeType
      ..privilegeFunction = privilegeFunction ?? this.privilegeFunction
      ..description = description ?? this.description
      ..imageUrl = imageUrl ?? this.imageUrl
      ..enabled = enabled ?? this.enabled;
  }
}

PostListResponseDataUserPropDetailDto $PostListResponseDataUserPropDetailDtoFromJson(
    Map<String, dynamic> json) {
  final PostListResponseDataUserPropDetailDto postListResponseDataUserPropDetailDto = PostListResponseDataUserPropDetailDto();
  final PostListResponseDataUserPropDetailDtoChatBubble? chatBubble = jsonConvert
      .convert<PostListResponseDataUserPropDetailDtoChatBubble>(
      json['chatBubble']);
  if (chatBubble != null) {
    postListResponseDataUserPropDetailDto.chatBubble = chatBubble;
  }
  final PostListResponseDataUserPropDetailDtoAvatarFrame? avatarFrame = jsonConvert
      .convert<PostListResponseDataUserPropDetailDtoAvatarFrame>(
      json['avatarFrame']);
  if (avatarFrame != null) {
    postListResponseDataUserPropDetailDto.avatarFrame = avatarFrame;
  }
  final PostListResponseDataUserPropDetailDtoLevelMedal? levelMedal = jsonConvert
      .convert<PostListResponseDataUserPropDetailDtoLevelMedal>(
      json['levelMedal']);
  if (levelMedal != null) {
    postListResponseDataUserPropDetailDto.levelMedal = levelMedal;
  }
  final PostListResponseDataUserPropDetailDtoEntranceEffect? entranceEffect = jsonConvert
      .convert<PostListResponseDataUserPropDetailDtoEntranceEffect>(
      json['entranceEffect']);
  if (entranceEffect != null) {
    postListResponseDataUserPropDetailDto.entranceEffect = entranceEffect;
  }
  final PostListResponseDataUserPropDetailDtoCustomNickname? customNickname = jsonConvert
      .convert<PostListResponseDataUserPropDetailDtoCustomNickname>(
      json['customNickname']);
  if (customNickname != null) {
    postListResponseDataUserPropDetailDto.customNickname = customNickname;
  }
  final PostListResponseDataUserPropDetailDtoHomepageEffect? homepageEffect = jsonConvert
      .convert<PostListResponseDataUserPropDetailDtoHomepageEffect>(
      json['homepageEffect']);
  if (homepageEffect != null) {
    postListResponseDataUserPropDetailDto.homepageEffect = homepageEffect;
  }
  final PostListResponseDataUserPropDetailDtoNameplate? nameplate = jsonConvert
      .convert<PostListResponseDataUserPropDetailDtoNameplate>(
      json['nameplate']);
  if (nameplate != null) {
    postListResponseDataUserPropDetailDto.nameplate = nameplate;
  }
  final PostListResponseDataUserPropDetailDtoMount? mount = jsonConvert.convert<
      PostListResponseDataUserPropDetailDtoMount>(json['mount']);
  if (mount != null) {
    postListResponseDataUserPropDetailDto.mount = mount;
  }
  final PostListResponseDataUserPropDetailDtoColorfulText? colorfulText = jsonConvert
      .convert<PostListResponseDataUserPropDetailDtoColorfulText>(
      json['colorfulText']);
  if (colorfulText != null) {
    postListResponseDataUserPropDetailDto.colorfulText = colorfulText;
  }
  final PostListResponseDataUserPropDetailDtoRoomWallpaper? roomWallpaper = jsonConvert
      .convert<PostListResponseDataUserPropDetailDtoRoomWallpaper>(
      json['roomWallpaper']);
  if (roomWallpaper != null) {
    postListResponseDataUserPropDetailDto.roomWallpaper = roomWallpaper;
  }
  final PostListResponseDataUserPropDetailDtoNobleCard? nobleCard = jsonConvert
      .convert<PostListResponseDataUserPropDetailDtoNobleCard>(
      json['nobleCard']);
  if (nobleCard != null) {
    postListResponseDataUserPropDetailDto.nobleCard = nobleCard;
  }
  return postListResponseDataUserPropDetailDto;
}

Map<String, dynamic> $PostListResponseDataUserPropDetailDtoToJson(
    PostListResponseDataUserPropDetailDto entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['chatBubble'] = entity.chatBubble?.toJson();
  data['avatarFrame'] = entity.avatarFrame?.toJson();
  data['levelMedal'] = entity.levelMedal?.toJson();
  data['entranceEffect'] = entity.entranceEffect?.toJson();
  data['customNickname'] = entity.customNickname?.toJson();
  data['homepageEffect'] = entity.homepageEffect?.toJson();
  data['nameplate'] = entity.nameplate?.toJson();
  data['mount'] = entity.mount?.toJson();
  data['colorfulText'] = entity.colorfulText?.toJson();
  data['roomWallpaper'] = entity.roomWallpaper?.toJson();
  data['nobleCard'] = entity.nobleCard?.toJson();
  return data;
}

extension PostListResponseDataUserPropDetailDtoExtension on PostListResponseDataUserPropDetailDto {
  PostListResponseDataUserPropDetailDto copyWith({
    PostListResponseDataUserPropDetailDtoChatBubble? chatBubble,
    PostListResponseDataUserPropDetailDtoAvatarFrame? avatarFrame,
    PostListResponseDataUserPropDetailDtoLevelMedal? levelMedal,
    PostListResponseDataUserPropDetailDtoEntranceEffect? entranceEffect,
    PostListResponseDataUserPropDetailDtoCustomNickname? customNickname,
    PostListResponseDataUserPropDetailDtoHomepageEffect? homepageEffect,
    PostListResponseDataUserPropDetailDtoNameplate? nameplate,
    PostListResponseDataUserPropDetailDtoMount? mount,
    PostListResponseDataUserPropDetailDtoColorfulText? colorfulText,
    PostListResponseDataUserPropDetailDtoRoomWallpaper? roomWallpaper,
    PostListResponseDataUserPropDetailDtoNobleCard? nobleCard,
  }) {
    return PostListResponseDataUserPropDetailDto()
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

PostListResponseDataUserPropDetailDtoChatBubble $PostListResponseDataUserPropDetailDtoChatBubbleFromJson(
    Map<String, dynamic> json) {
  final PostListResponseDataUserPropDetailDtoChatBubble postListResponseDataUserPropDetailDtoChatBubble = PostListResponseDataUserPropDetailDtoChatBubble();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    postListResponseDataUserPropDetailDtoChatBubble.id = id;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    postListResponseDataUserPropDetailDtoChatBubble.userId = userId;
  }
  final int? propId = jsonConvert.convert<int>(json['propId']);
  if (propId != null) {
    postListResponseDataUserPropDetailDtoChatBubble.propId = propId;
  }
  final String? propName = jsonConvert.convert<String>(json['propName']);
  if (propName != null) {
    postListResponseDataUserPropDetailDtoChatBubble.propName = propName;
  }
  final int? propType = jsonConvert.convert<int>(json['propType']);
  if (propType != null) {
    postListResponseDataUserPropDetailDtoChatBubble.propType = propType;
  }
  final String? propFormat = jsonConvert.convert<String>(json['propFormat']);
  if (propFormat != null) {
    postListResponseDataUserPropDetailDtoChatBubble.propFormat = propFormat;
  }
  final String? dynamicEffect = jsonConvert.convert<String>(
      json['dynamicEffect']);
  if (dynamicEffect != null) {
    postListResponseDataUserPropDetailDtoChatBubble.dynamicEffect =
        dynamicEffect;
  }
  final String? pcDynamicEffect = jsonConvert.convert<String>(
      json['pcDynamicEffect']);
  if (pcDynamicEffect != null) {
    postListResponseDataUserPropDetailDtoChatBubble.pcDynamicEffect =
        pcDynamicEffect;
  }
  final String? iosDynamicEffect = jsonConvert.convert<String>(
      json['iosDynamicEffect']);
  if (iosDynamicEffect != null) {
    postListResponseDataUserPropDetailDtoChatBubble.iosDynamicEffect =
        iosDynamicEffect;
  }
  final int? customFlag = jsonConvert.convert<int>(json['customFlag']);
  if (customFlag != null) {
    postListResponseDataUserPropDetailDtoChatBubble.customFlag = customFlag;
  }
  final String? customInfo = jsonConvert.convert<String>(json['customInfo']);
  if (customInfo != null) {
    postListResponseDataUserPropDetailDtoChatBubble.customInfo = customInfo;
  }
  final int? useFlag = jsonConvert.convert<int>(json['useFlag']);
  if (useFlag != null) {
    postListResponseDataUserPropDetailDtoChatBubble.useFlag = useFlag;
  }
  return postListResponseDataUserPropDetailDtoChatBubble;
}

Map<String, dynamic> $PostListResponseDataUserPropDetailDtoChatBubbleToJson(
    PostListResponseDataUserPropDetailDtoChatBubble entity) {
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

extension PostListResponseDataUserPropDetailDtoChatBubbleExtension on PostListResponseDataUserPropDetailDtoChatBubble {
  PostListResponseDataUserPropDetailDtoChatBubble copyWith({
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
    return PostListResponseDataUserPropDetailDtoChatBubble()
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

PostListResponseDataUserPropDetailDtoAvatarFrame $PostListResponseDataUserPropDetailDtoAvatarFrameFromJson(
    Map<String, dynamic> json) {
  final PostListResponseDataUserPropDetailDtoAvatarFrame postListResponseDataUserPropDetailDtoAvatarFrame = PostListResponseDataUserPropDetailDtoAvatarFrame();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    postListResponseDataUserPropDetailDtoAvatarFrame.id = id;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    postListResponseDataUserPropDetailDtoAvatarFrame.userId = userId;
  }
  final int? propId = jsonConvert.convert<int>(json['propId']);
  if (propId != null) {
    postListResponseDataUserPropDetailDtoAvatarFrame.propId = propId;
  }
  final String? propName = jsonConvert.convert<String>(json['propName']);
  if (propName != null) {
    postListResponseDataUserPropDetailDtoAvatarFrame.propName = propName;
  }
  final int? propType = jsonConvert.convert<int>(json['propType']);
  if (propType != null) {
    postListResponseDataUserPropDetailDtoAvatarFrame.propType = propType;
  }
  final String? propFormat = jsonConvert.convert<String>(json['propFormat']);
  if (propFormat != null) {
    postListResponseDataUserPropDetailDtoAvatarFrame.propFormat = propFormat;
  }
  final String? dynamicEffect = jsonConvert.convert<String>(
      json['dynamicEffect']);
  if (dynamicEffect != null) {
    postListResponseDataUserPropDetailDtoAvatarFrame.dynamicEffect =
        dynamicEffect;
  }
  final String? pcDynamicEffect = jsonConvert.convert<String>(
      json['pcDynamicEffect']);
  if (pcDynamicEffect != null) {
    postListResponseDataUserPropDetailDtoAvatarFrame.pcDynamicEffect =
        pcDynamicEffect;
  }
  final String? iosDynamicEffect = jsonConvert.convert<String>(
      json['iosDynamicEffect']);
  if (iosDynamicEffect != null) {
    postListResponseDataUserPropDetailDtoAvatarFrame.iosDynamicEffect =
        iosDynamicEffect;
  }
  final int? customFlag = jsonConvert.convert<int>(json['customFlag']);
  if (customFlag != null) {
    postListResponseDataUserPropDetailDtoAvatarFrame.customFlag = customFlag;
  }
  final String? customInfo = jsonConvert.convert<String>(json['customInfo']);
  if (customInfo != null) {
    postListResponseDataUserPropDetailDtoAvatarFrame.customInfo = customInfo;
  }
  final int? useFlag = jsonConvert.convert<int>(json['useFlag']);
  if (useFlag != null) {
    postListResponseDataUserPropDetailDtoAvatarFrame.useFlag = useFlag;
  }
  return postListResponseDataUserPropDetailDtoAvatarFrame;
}

Map<String, dynamic> $PostListResponseDataUserPropDetailDtoAvatarFrameToJson(
    PostListResponseDataUserPropDetailDtoAvatarFrame entity) {
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

extension PostListResponseDataUserPropDetailDtoAvatarFrameExtension on PostListResponseDataUserPropDetailDtoAvatarFrame {
  PostListResponseDataUserPropDetailDtoAvatarFrame copyWith({
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
    return PostListResponseDataUserPropDetailDtoAvatarFrame()
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

PostListResponseDataUserPropDetailDtoLevelMedal $PostListResponseDataUserPropDetailDtoLevelMedalFromJson(
    Map<String, dynamic> json) {
  final PostListResponseDataUserPropDetailDtoLevelMedal postListResponseDataUserPropDetailDtoLevelMedal = PostListResponseDataUserPropDetailDtoLevelMedal();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    postListResponseDataUserPropDetailDtoLevelMedal.id = id;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    postListResponseDataUserPropDetailDtoLevelMedal.userId = userId;
  }
  final int? propId = jsonConvert.convert<int>(json['propId']);
  if (propId != null) {
    postListResponseDataUserPropDetailDtoLevelMedal.propId = propId;
  }
  final String? propName = jsonConvert.convert<String>(json['propName']);
  if (propName != null) {
    postListResponseDataUserPropDetailDtoLevelMedal.propName = propName;
  }
  final int? propType = jsonConvert.convert<int>(json['propType']);
  if (propType != null) {
    postListResponseDataUserPropDetailDtoLevelMedal.propType = propType;
  }
  final String? propFormat = jsonConvert.convert<String>(json['propFormat']);
  if (propFormat != null) {
    postListResponseDataUserPropDetailDtoLevelMedal.propFormat = propFormat;
  }
  final String? dynamicEffect = jsonConvert.convert<String>(
      json['dynamicEffect']);
  if (dynamicEffect != null) {
    postListResponseDataUserPropDetailDtoLevelMedal.dynamicEffect =
        dynamicEffect;
  }
  final String? pcDynamicEffect = jsonConvert.convert<String>(
      json['pcDynamicEffect']);
  if (pcDynamicEffect != null) {
    postListResponseDataUserPropDetailDtoLevelMedal.pcDynamicEffect =
        pcDynamicEffect;
  }
  final String? iosDynamicEffect = jsonConvert.convert<String>(
      json['iosDynamicEffect']);
  if (iosDynamicEffect != null) {
    postListResponseDataUserPropDetailDtoLevelMedal.iosDynamicEffect =
        iosDynamicEffect;
  }
  final int? customFlag = jsonConvert.convert<int>(json['customFlag']);
  if (customFlag != null) {
    postListResponseDataUserPropDetailDtoLevelMedal.customFlag = customFlag;
  }
  final String? customInfo = jsonConvert.convert<String>(json['customInfo']);
  if (customInfo != null) {
    postListResponseDataUserPropDetailDtoLevelMedal.customInfo = customInfo;
  }
  final int? useFlag = jsonConvert.convert<int>(json['useFlag']);
  if (useFlag != null) {
    postListResponseDataUserPropDetailDtoLevelMedal.useFlag = useFlag;
  }
  return postListResponseDataUserPropDetailDtoLevelMedal;
}

Map<String, dynamic> $PostListResponseDataUserPropDetailDtoLevelMedalToJson(
    PostListResponseDataUserPropDetailDtoLevelMedal entity) {
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

extension PostListResponseDataUserPropDetailDtoLevelMedalExtension on PostListResponseDataUserPropDetailDtoLevelMedal {
  PostListResponseDataUserPropDetailDtoLevelMedal copyWith({
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
    return PostListResponseDataUserPropDetailDtoLevelMedal()
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

PostListResponseDataUserPropDetailDtoEntranceEffect $PostListResponseDataUserPropDetailDtoEntranceEffectFromJson(
    Map<String, dynamic> json) {
  final PostListResponseDataUserPropDetailDtoEntranceEffect postListResponseDataUserPropDetailDtoEntranceEffect = PostListResponseDataUserPropDetailDtoEntranceEffect();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    postListResponseDataUserPropDetailDtoEntranceEffect.id = id;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    postListResponseDataUserPropDetailDtoEntranceEffect.userId = userId;
  }
  final int? propId = jsonConvert.convert<int>(json['propId']);
  if (propId != null) {
    postListResponseDataUserPropDetailDtoEntranceEffect.propId = propId;
  }
  final String? propName = jsonConvert.convert<String>(json['propName']);
  if (propName != null) {
    postListResponseDataUserPropDetailDtoEntranceEffect.propName = propName;
  }
  final int? propType = jsonConvert.convert<int>(json['propType']);
  if (propType != null) {
    postListResponseDataUserPropDetailDtoEntranceEffect.propType = propType;
  }
  final String? propFormat = jsonConvert.convert<String>(json['propFormat']);
  if (propFormat != null) {
    postListResponseDataUserPropDetailDtoEntranceEffect.propFormat = propFormat;
  }
  final String? dynamicEffect = jsonConvert.convert<String>(
      json['dynamicEffect']);
  if (dynamicEffect != null) {
    postListResponseDataUserPropDetailDtoEntranceEffect.dynamicEffect =
        dynamicEffect;
  }
  final String? pcDynamicEffect = jsonConvert.convert<String>(
      json['pcDynamicEffect']);
  if (pcDynamicEffect != null) {
    postListResponseDataUserPropDetailDtoEntranceEffect.pcDynamicEffect =
        pcDynamicEffect;
  }
  final String? iosDynamicEffect = jsonConvert.convert<String>(
      json['iosDynamicEffect']);
  if (iosDynamicEffect != null) {
    postListResponseDataUserPropDetailDtoEntranceEffect.iosDynamicEffect =
        iosDynamicEffect;
  }
  final int? customFlag = jsonConvert.convert<int>(json['customFlag']);
  if (customFlag != null) {
    postListResponseDataUserPropDetailDtoEntranceEffect.customFlag = customFlag;
  }
  final String? customInfo = jsonConvert.convert<String>(json['customInfo']);
  if (customInfo != null) {
    postListResponseDataUserPropDetailDtoEntranceEffect.customInfo = customInfo;
  }
  final int? useFlag = jsonConvert.convert<int>(json['useFlag']);
  if (useFlag != null) {
    postListResponseDataUserPropDetailDtoEntranceEffect.useFlag = useFlag;
  }
  return postListResponseDataUserPropDetailDtoEntranceEffect;
}

Map<String, dynamic> $PostListResponseDataUserPropDetailDtoEntranceEffectToJson(
    PostListResponseDataUserPropDetailDtoEntranceEffect entity) {
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

extension PostListResponseDataUserPropDetailDtoEntranceEffectExtension on PostListResponseDataUserPropDetailDtoEntranceEffect {
  PostListResponseDataUserPropDetailDtoEntranceEffect copyWith({
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
    return PostListResponseDataUserPropDetailDtoEntranceEffect()
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

PostListResponseDataUserPropDetailDtoCustomNickname $PostListResponseDataUserPropDetailDtoCustomNicknameFromJson(
    Map<String, dynamic> json) {
  final PostListResponseDataUserPropDetailDtoCustomNickname postListResponseDataUserPropDetailDtoCustomNickname = PostListResponseDataUserPropDetailDtoCustomNickname();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    postListResponseDataUserPropDetailDtoCustomNickname.id = id;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    postListResponseDataUserPropDetailDtoCustomNickname.userId = userId;
  }
  final int? propId = jsonConvert.convert<int>(json['propId']);
  if (propId != null) {
    postListResponseDataUserPropDetailDtoCustomNickname.propId = propId;
  }
  final String? propName = jsonConvert.convert<String>(json['propName']);
  if (propName != null) {
    postListResponseDataUserPropDetailDtoCustomNickname.propName = propName;
  }
  final int? propType = jsonConvert.convert<int>(json['propType']);
  if (propType != null) {
    postListResponseDataUserPropDetailDtoCustomNickname.propType = propType;
  }
  final String? propFormat = jsonConvert.convert<String>(json['propFormat']);
  if (propFormat != null) {
    postListResponseDataUserPropDetailDtoCustomNickname.propFormat = propFormat;
  }
  final String? dynamicEffect = jsonConvert.convert<String>(
      json['dynamicEffect']);
  if (dynamicEffect != null) {
    postListResponseDataUserPropDetailDtoCustomNickname.dynamicEffect =
        dynamicEffect;
  }
  final String? pcDynamicEffect = jsonConvert.convert<String>(
      json['pcDynamicEffect']);
  if (pcDynamicEffect != null) {
    postListResponseDataUserPropDetailDtoCustomNickname.pcDynamicEffect =
        pcDynamicEffect;
  }
  final String? iosDynamicEffect = jsonConvert.convert<String>(
      json['iosDynamicEffect']);
  if (iosDynamicEffect != null) {
    postListResponseDataUserPropDetailDtoCustomNickname.iosDynamicEffect =
        iosDynamicEffect;
  }
  final int? customFlag = jsonConvert.convert<int>(json['customFlag']);
  if (customFlag != null) {
    postListResponseDataUserPropDetailDtoCustomNickname.customFlag = customFlag;
  }
  final String? customInfo = jsonConvert.convert<String>(json['customInfo']);
  if (customInfo != null) {
    postListResponseDataUserPropDetailDtoCustomNickname.customInfo = customInfo;
  }
  final int? useFlag = jsonConvert.convert<int>(json['useFlag']);
  if (useFlag != null) {
    postListResponseDataUserPropDetailDtoCustomNickname.useFlag = useFlag;
  }
  return postListResponseDataUserPropDetailDtoCustomNickname;
}

Map<String, dynamic> $PostListResponseDataUserPropDetailDtoCustomNicknameToJson(
    PostListResponseDataUserPropDetailDtoCustomNickname entity) {
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

extension PostListResponseDataUserPropDetailDtoCustomNicknameExtension on PostListResponseDataUserPropDetailDtoCustomNickname {
  PostListResponseDataUserPropDetailDtoCustomNickname copyWith({
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
    return PostListResponseDataUserPropDetailDtoCustomNickname()
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

PostListResponseDataUserPropDetailDtoHomepageEffect $PostListResponseDataUserPropDetailDtoHomepageEffectFromJson(
    Map<String, dynamic> json) {
  final PostListResponseDataUserPropDetailDtoHomepageEffect postListResponseDataUserPropDetailDtoHomepageEffect = PostListResponseDataUserPropDetailDtoHomepageEffect();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    postListResponseDataUserPropDetailDtoHomepageEffect.id = id;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    postListResponseDataUserPropDetailDtoHomepageEffect.userId = userId;
  }
  final int? propId = jsonConvert.convert<int>(json['propId']);
  if (propId != null) {
    postListResponseDataUserPropDetailDtoHomepageEffect.propId = propId;
  }
  final String? propName = jsonConvert.convert<String>(json['propName']);
  if (propName != null) {
    postListResponseDataUserPropDetailDtoHomepageEffect.propName = propName;
  }
  final int? propType = jsonConvert.convert<int>(json['propType']);
  if (propType != null) {
    postListResponseDataUserPropDetailDtoHomepageEffect.propType = propType;
  }
  final String? propFormat = jsonConvert.convert<String>(json['propFormat']);
  if (propFormat != null) {
    postListResponseDataUserPropDetailDtoHomepageEffect.propFormat = propFormat;
  }
  final String? dynamicEffect = jsonConvert.convert<String>(
      json['dynamicEffect']);
  if (dynamicEffect != null) {
    postListResponseDataUserPropDetailDtoHomepageEffect.dynamicEffect =
        dynamicEffect;
  }
  final String? pcDynamicEffect = jsonConvert.convert<String>(
      json['pcDynamicEffect']);
  if (pcDynamicEffect != null) {
    postListResponseDataUserPropDetailDtoHomepageEffect.pcDynamicEffect =
        pcDynamicEffect;
  }
  final String? iosDynamicEffect = jsonConvert.convert<String>(
      json['iosDynamicEffect']);
  if (iosDynamicEffect != null) {
    postListResponseDataUserPropDetailDtoHomepageEffect.iosDynamicEffect =
        iosDynamicEffect;
  }
  final int? customFlag = jsonConvert.convert<int>(json['customFlag']);
  if (customFlag != null) {
    postListResponseDataUserPropDetailDtoHomepageEffect.customFlag = customFlag;
  }
  final String? customInfo = jsonConvert.convert<String>(json['customInfo']);
  if (customInfo != null) {
    postListResponseDataUserPropDetailDtoHomepageEffect.customInfo = customInfo;
  }
  final int? useFlag = jsonConvert.convert<int>(json['useFlag']);
  if (useFlag != null) {
    postListResponseDataUserPropDetailDtoHomepageEffect.useFlag = useFlag;
  }
  return postListResponseDataUserPropDetailDtoHomepageEffect;
}

Map<String, dynamic> $PostListResponseDataUserPropDetailDtoHomepageEffectToJson(
    PostListResponseDataUserPropDetailDtoHomepageEffect entity) {
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

extension PostListResponseDataUserPropDetailDtoHomepageEffectExtension on PostListResponseDataUserPropDetailDtoHomepageEffect {
  PostListResponseDataUserPropDetailDtoHomepageEffect copyWith({
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
    return PostListResponseDataUserPropDetailDtoHomepageEffect()
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

PostListResponseDataUserPropDetailDtoNameplate $PostListResponseDataUserPropDetailDtoNameplateFromJson(
    Map<String, dynamic> json) {
  final PostListResponseDataUserPropDetailDtoNameplate postListResponseDataUserPropDetailDtoNameplate = PostListResponseDataUserPropDetailDtoNameplate();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    postListResponseDataUserPropDetailDtoNameplate.id = id;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    postListResponseDataUserPropDetailDtoNameplate.userId = userId;
  }
  final int? propId = jsonConvert.convert<int>(json['propId']);
  if (propId != null) {
    postListResponseDataUserPropDetailDtoNameplate.propId = propId;
  }
  final String? propName = jsonConvert.convert<String>(json['propName']);
  if (propName != null) {
    postListResponseDataUserPropDetailDtoNameplate.propName = propName;
  }
  final int? propType = jsonConvert.convert<int>(json['propType']);
  if (propType != null) {
    postListResponseDataUserPropDetailDtoNameplate.propType = propType;
  }
  final String? propFormat = jsonConvert.convert<String>(json['propFormat']);
  if (propFormat != null) {
    postListResponseDataUserPropDetailDtoNameplate.propFormat = propFormat;
  }
  final String? dynamicEffect = jsonConvert.convert<String>(
      json['dynamicEffect']);
  if (dynamicEffect != null) {
    postListResponseDataUserPropDetailDtoNameplate.dynamicEffect =
        dynamicEffect;
  }
  final String? pcDynamicEffect = jsonConvert.convert<String>(
      json['pcDynamicEffect']);
  if (pcDynamicEffect != null) {
    postListResponseDataUserPropDetailDtoNameplate.pcDynamicEffect =
        pcDynamicEffect;
  }
  final String? iosDynamicEffect = jsonConvert.convert<String>(
      json['iosDynamicEffect']);
  if (iosDynamicEffect != null) {
    postListResponseDataUserPropDetailDtoNameplate.iosDynamicEffect =
        iosDynamicEffect;
  }
  final int? customFlag = jsonConvert.convert<int>(json['customFlag']);
  if (customFlag != null) {
    postListResponseDataUserPropDetailDtoNameplate.customFlag = customFlag;
  }
  final String? customInfo = jsonConvert.convert<String>(json['customInfo']);
  if (customInfo != null) {
    postListResponseDataUserPropDetailDtoNameplate.customInfo = customInfo;
  }
  final int? useFlag = jsonConvert.convert<int>(json['useFlag']);
  if (useFlag != null) {
    postListResponseDataUserPropDetailDtoNameplate.useFlag = useFlag;
  }
  return postListResponseDataUserPropDetailDtoNameplate;
}

Map<String, dynamic> $PostListResponseDataUserPropDetailDtoNameplateToJson(
    PostListResponseDataUserPropDetailDtoNameplate entity) {
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

extension PostListResponseDataUserPropDetailDtoNameplateExtension on PostListResponseDataUserPropDetailDtoNameplate {
  PostListResponseDataUserPropDetailDtoNameplate copyWith({
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
    return PostListResponseDataUserPropDetailDtoNameplate()
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

PostListResponseDataUserPropDetailDtoMount $PostListResponseDataUserPropDetailDtoMountFromJson(
    Map<String, dynamic> json) {
  final PostListResponseDataUserPropDetailDtoMount postListResponseDataUserPropDetailDtoMount = PostListResponseDataUserPropDetailDtoMount();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    postListResponseDataUserPropDetailDtoMount.id = id;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    postListResponseDataUserPropDetailDtoMount.userId = userId;
  }
  final int? propId = jsonConvert.convert<int>(json['propId']);
  if (propId != null) {
    postListResponseDataUserPropDetailDtoMount.propId = propId;
  }
  final String? propName = jsonConvert.convert<String>(json['propName']);
  if (propName != null) {
    postListResponseDataUserPropDetailDtoMount.propName = propName;
  }
  final int? propType = jsonConvert.convert<int>(json['propType']);
  if (propType != null) {
    postListResponseDataUserPropDetailDtoMount.propType = propType;
  }
  final String? propFormat = jsonConvert.convert<String>(json['propFormat']);
  if (propFormat != null) {
    postListResponseDataUserPropDetailDtoMount.propFormat = propFormat;
  }
  final String? dynamicEffect = jsonConvert.convert<String>(
      json['dynamicEffect']);
  if (dynamicEffect != null) {
    postListResponseDataUserPropDetailDtoMount.dynamicEffect = dynamicEffect;
  }
  final String? pcDynamicEffect = jsonConvert.convert<String>(
      json['pcDynamicEffect']);
  if (pcDynamicEffect != null) {
    postListResponseDataUserPropDetailDtoMount.pcDynamicEffect =
        pcDynamicEffect;
  }
  final String? iosDynamicEffect = jsonConvert.convert<String>(
      json['iosDynamicEffect']);
  if (iosDynamicEffect != null) {
    postListResponseDataUserPropDetailDtoMount.iosDynamicEffect =
        iosDynamicEffect;
  }
  final int? customFlag = jsonConvert.convert<int>(json['customFlag']);
  if (customFlag != null) {
    postListResponseDataUserPropDetailDtoMount.customFlag = customFlag;
  }
  final String? customInfo = jsonConvert.convert<String>(json['customInfo']);
  if (customInfo != null) {
    postListResponseDataUserPropDetailDtoMount.customInfo = customInfo;
  }
  final int? useFlag = jsonConvert.convert<int>(json['useFlag']);
  if (useFlag != null) {
    postListResponseDataUserPropDetailDtoMount.useFlag = useFlag;
  }
  return postListResponseDataUserPropDetailDtoMount;
}

Map<String, dynamic> $PostListResponseDataUserPropDetailDtoMountToJson(
    PostListResponseDataUserPropDetailDtoMount entity) {
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

extension PostListResponseDataUserPropDetailDtoMountExtension on PostListResponseDataUserPropDetailDtoMount {
  PostListResponseDataUserPropDetailDtoMount copyWith({
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
    return PostListResponseDataUserPropDetailDtoMount()
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

PostListResponseDataUserPropDetailDtoColorfulText $PostListResponseDataUserPropDetailDtoColorfulTextFromJson(
    Map<String, dynamic> json) {
  final PostListResponseDataUserPropDetailDtoColorfulText postListResponseDataUserPropDetailDtoColorfulText = PostListResponseDataUserPropDetailDtoColorfulText();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    postListResponseDataUserPropDetailDtoColorfulText.id = id;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    postListResponseDataUserPropDetailDtoColorfulText.userId = userId;
  }
  final int? propId = jsonConvert.convert<int>(json['propId']);
  if (propId != null) {
    postListResponseDataUserPropDetailDtoColorfulText.propId = propId;
  }
  final String? propName = jsonConvert.convert<String>(json['propName']);
  if (propName != null) {
    postListResponseDataUserPropDetailDtoColorfulText.propName = propName;
  }
  final int? propType = jsonConvert.convert<int>(json['propType']);
  if (propType != null) {
    postListResponseDataUserPropDetailDtoColorfulText.propType = propType;
  }
  final String? propFormat = jsonConvert.convert<String>(json['propFormat']);
  if (propFormat != null) {
    postListResponseDataUserPropDetailDtoColorfulText.propFormat = propFormat;
  }
  final String? dynamicEffect = jsonConvert.convert<String>(
      json['dynamicEffect']);
  if (dynamicEffect != null) {
    postListResponseDataUserPropDetailDtoColorfulText.dynamicEffect =
        dynamicEffect;
  }
  final String? pcDynamicEffect = jsonConvert.convert<String>(
      json['pcDynamicEffect']);
  if (pcDynamicEffect != null) {
    postListResponseDataUserPropDetailDtoColorfulText.pcDynamicEffect =
        pcDynamicEffect;
  }
  final String? iosDynamicEffect = jsonConvert.convert<String>(
      json['iosDynamicEffect']);
  if (iosDynamicEffect != null) {
    postListResponseDataUserPropDetailDtoColorfulText.iosDynamicEffect =
        iosDynamicEffect;
  }
  final int? customFlag = jsonConvert.convert<int>(json['customFlag']);
  if (customFlag != null) {
    postListResponseDataUserPropDetailDtoColorfulText.customFlag = customFlag;
  }
  final String? customInfo = jsonConvert.convert<String>(json['customInfo']);
  if (customInfo != null) {
    postListResponseDataUserPropDetailDtoColorfulText.customInfo = customInfo;
  }
  final int? useFlag = jsonConvert.convert<int>(json['useFlag']);
  if (useFlag != null) {
    postListResponseDataUserPropDetailDtoColorfulText.useFlag = useFlag;
  }
  return postListResponseDataUserPropDetailDtoColorfulText;
}

Map<String, dynamic> $PostListResponseDataUserPropDetailDtoColorfulTextToJson(
    PostListResponseDataUserPropDetailDtoColorfulText entity) {
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

extension PostListResponseDataUserPropDetailDtoColorfulTextExtension on PostListResponseDataUserPropDetailDtoColorfulText {
  PostListResponseDataUserPropDetailDtoColorfulText copyWith({
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
    return PostListResponseDataUserPropDetailDtoColorfulText()
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

PostListResponseDataUserPropDetailDtoRoomWallpaper $PostListResponseDataUserPropDetailDtoRoomWallpaperFromJson(
    Map<String, dynamic> json) {
  final PostListResponseDataUserPropDetailDtoRoomWallpaper postListResponseDataUserPropDetailDtoRoomWallpaper = PostListResponseDataUserPropDetailDtoRoomWallpaper();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    postListResponseDataUserPropDetailDtoRoomWallpaper.id = id;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    postListResponseDataUserPropDetailDtoRoomWallpaper.userId = userId;
  }
  final int? propId = jsonConvert.convert<int>(json['propId']);
  if (propId != null) {
    postListResponseDataUserPropDetailDtoRoomWallpaper.propId = propId;
  }
  final String? propName = jsonConvert.convert<String>(json['propName']);
  if (propName != null) {
    postListResponseDataUserPropDetailDtoRoomWallpaper.propName = propName;
  }
  final int? propType = jsonConvert.convert<int>(json['propType']);
  if (propType != null) {
    postListResponseDataUserPropDetailDtoRoomWallpaper.propType = propType;
  }
  final String? propFormat = jsonConvert.convert<String>(json['propFormat']);
  if (propFormat != null) {
    postListResponseDataUserPropDetailDtoRoomWallpaper.propFormat = propFormat;
  }
  final String? dynamicEffect = jsonConvert.convert<String>(
      json['dynamicEffect']);
  if (dynamicEffect != null) {
    postListResponseDataUserPropDetailDtoRoomWallpaper.dynamicEffect =
        dynamicEffect;
  }
  final String? pcDynamicEffect = jsonConvert.convert<String>(
      json['pcDynamicEffect']);
  if (pcDynamicEffect != null) {
    postListResponseDataUserPropDetailDtoRoomWallpaper.pcDynamicEffect =
        pcDynamicEffect;
  }
  final String? iosDynamicEffect = jsonConvert.convert<String>(
      json['iosDynamicEffect']);
  if (iosDynamicEffect != null) {
    postListResponseDataUserPropDetailDtoRoomWallpaper.iosDynamicEffect =
        iosDynamicEffect;
  }
  final int? customFlag = jsonConvert.convert<int>(json['customFlag']);
  if (customFlag != null) {
    postListResponseDataUserPropDetailDtoRoomWallpaper.customFlag = customFlag;
  }
  final String? customInfo = jsonConvert.convert<String>(json['customInfo']);
  if (customInfo != null) {
    postListResponseDataUserPropDetailDtoRoomWallpaper.customInfo = customInfo;
  }
  final int? useFlag = jsonConvert.convert<int>(json['useFlag']);
  if (useFlag != null) {
    postListResponseDataUserPropDetailDtoRoomWallpaper.useFlag = useFlag;
  }
  return postListResponseDataUserPropDetailDtoRoomWallpaper;
}

Map<String, dynamic> $PostListResponseDataUserPropDetailDtoRoomWallpaperToJson(
    PostListResponseDataUserPropDetailDtoRoomWallpaper entity) {
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

extension PostListResponseDataUserPropDetailDtoRoomWallpaperExtension on PostListResponseDataUserPropDetailDtoRoomWallpaper {
  PostListResponseDataUserPropDetailDtoRoomWallpaper copyWith({
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
    return PostListResponseDataUserPropDetailDtoRoomWallpaper()
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

PostListResponseDataUserPropDetailDtoNobleCard $PostListResponseDataUserPropDetailDtoNobleCardFromJson(
    Map<String, dynamic> json) {
  final PostListResponseDataUserPropDetailDtoNobleCard postListResponseDataUserPropDetailDtoNobleCard = PostListResponseDataUserPropDetailDtoNobleCard();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    postListResponseDataUserPropDetailDtoNobleCard.id = id;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    postListResponseDataUserPropDetailDtoNobleCard.userId = userId;
  }
  final int? propId = jsonConvert.convert<int>(json['propId']);
  if (propId != null) {
    postListResponseDataUserPropDetailDtoNobleCard.propId = propId;
  }
  final String? propName = jsonConvert.convert<String>(json['propName']);
  if (propName != null) {
    postListResponseDataUserPropDetailDtoNobleCard.propName = propName;
  }
  final int? propType = jsonConvert.convert<int>(json['propType']);
  if (propType != null) {
    postListResponseDataUserPropDetailDtoNobleCard.propType = propType;
  }
  final String? propFormat = jsonConvert.convert<String>(json['propFormat']);
  if (propFormat != null) {
    postListResponseDataUserPropDetailDtoNobleCard.propFormat = propFormat;
  }
  final String? dynamicEffect = jsonConvert.convert<String>(
      json['dynamicEffect']);
  if (dynamicEffect != null) {
    postListResponseDataUserPropDetailDtoNobleCard.dynamicEffect =
        dynamicEffect;
  }
  final String? pcDynamicEffect = jsonConvert.convert<String>(
      json['pcDynamicEffect']);
  if (pcDynamicEffect != null) {
    postListResponseDataUserPropDetailDtoNobleCard.pcDynamicEffect =
        pcDynamicEffect;
  }
  final String? iosDynamicEffect = jsonConvert.convert<String>(
      json['iosDynamicEffect']);
  if (iosDynamicEffect != null) {
    postListResponseDataUserPropDetailDtoNobleCard.iosDynamicEffect =
        iosDynamicEffect;
  }
  final int? customFlag = jsonConvert.convert<int>(json['customFlag']);
  if (customFlag != null) {
    postListResponseDataUserPropDetailDtoNobleCard.customFlag = customFlag;
  }
  final String? customInfo = jsonConvert.convert<String>(json['customInfo']);
  if (customInfo != null) {
    postListResponseDataUserPropDetailDtoNobleCard.customInfo = customInfo;
  }
  final int? useFlag = jsonConvert.convert<int>(json['useFlag']);
  if (useFlag != null) {
    postListResponseDataUserPropDetailDtoNobleCard.useFlag = useFlag;
  }
  return postListResponseDataUserPropDetailDtoNobleCard;
}

Map<String, dynamic> $PostListResponseDataUserPropDetailDtoNobleCardToJson(
    PostListResponseDataUserPropDetailDtoNobleCard entity) {
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

extension PostListResponseDataUserPropDetailDtoNobleCardExtension on PostListResponseDataUserPropDetailDtoNobleCard {
  PostListResponseDataUserPropDetailDtoNobleCard copyWith({
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
    return PostListResponseDataUserPropDetailDtoNobleCard()
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