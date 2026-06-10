import 'dart:convert';

import 'package:oneww/generated/json/base/json_field.dart';
import 'package:oneww/generated/json/post_list_response_entity.g.dart';

export 'package:oneww/generated/json/post_list_response_entity.g.dart';

@JsonSerializable()
class PostListResponseEntity {
	@JSONField(name: 'request_id')
	String? requestId;
	int? code;
	String? message;
	List<PostListResponseData> data;

	PostListResponseEntity({
		this.requestId,
		this.code,
		this.message,
		List<PostListResponseData>? data,
	}) : data = data ?? <PostListResponseData>[];

	factory PostListResponseEntity.fromJson(Map<String, dynamic> json) {
		final entity = $PostListResponseEntityFromJson(json);
		entity.data = entity.data ?? <PostListResponseData>[];
		return entity;
	}

	Map<String, dynamic> toJson() => $PostListResponseEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PostListResponseData {
	int? id;
	int? userId;
	String? content;
	int? postType;
	int? mediaType;
	int? status;
	String? ipAddress;
	String? location;
	int? categoryId;
	int? goodsId;
	int? likesCount;
	int? commentCount;
	int? replyCount;
	int? shareCount;
	int? visibleScope;
	int? commentScope;
	int? topFlag;
	String? topTime;
	String? createTime;
	int? likedFlag;
	PostListResponseDataUserInfo? userInfo;
	List<String>? files;
	List<PostListResponseDataFileDetails>? fileDetails;
	List<PostListResponseDataSubjects>? subjects;
	PostListResponseDataComment? comment;
	PostListResponseDataUserPropDetailDto? userPropDetailDto;

	PostListResponseData();

	factory PostListResponseData.fromJson(Map<String, dynamic> json) => $PostListResponseDataFromJson(json);

	Map<String, dynamic> toJson() => $PostListResponseDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PostListResponseDataUserInfo {
	int? id;
	String? userNo;
	String? sex;
	String? nickName;
	String? avatar;
	int? onlineFlag;
	int? accompanyId;
	String? introduced;
	int? level;
	int? roomLevel;
	PostListResponseDataUserInfoRoomLevelConfigDto? roomLevelConfigDto;
	PostListResponseDataUserInfoNobleLevelDto? nobleLevelDto;
	String? accompanyLevel;
	String? onlineTime;
	String? customIdentityImage;
	List<String>? customIdentityImageList;
	int? userMic;
	String? birthday;
	String? mainLabelId;
	String? mainLabel;
	String? moduleAvatar;

	PostListResponseDataUserInfo();

	factory PostListResponseDataUserInfo.fromJson(Map<String, dynamic> json) => $PostListResponseDataUserInfoFromJson(json);

	Map<String, dynamic> toJson() => $PostListResponseDataUserInfoToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PostListResponseDataUserInfoRoomLevelConfigDto {
	int? id;
	String? levelName;
	String? icon;
	String? backdrop;
	String? medal;
	String? homeBackdrop;
	String? pcMedal;
	String? pcIcon;
	int? level;
	int? startPoints;
	int? endPoints;
	int? medalUsable;
	int? recommendUsable;
	int? recommendRate;
	int? giftUsable;
	int? avatarUsable;
	int? avatarConfigId;
	int? animationUsable;
	int? animationConfigId;
	int? nickColorUsable;
	int? nickColorConfigId;
	int? textColorUsable;
	int? textColorConfigId;
	int? birthdayUsable;
	int? birthdayRightsPackageId;
	int? invisibleRankUsable;
	String? invisibleRankNick;
	int? invisibleRoomUsable;
	int? supportUsable;
	int? productCreateUsable;

	PostListResponseDataUserInfoRoomLevelConfigDto();

	factory PostListResponseDataUserInfoRoomLevelConfigDto.fromJson(Map<String, dynamic> json) =>
			$PostListResponseDataUserInfoRoomLevelConfigDtoFromJson(json);

	Map<String, dynamic> toJson() => $PostListResponseDataUserInfoRoomLevelConfigDtoToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PostListResponseDataUserInfoNobleLevelDto {
	PostListResponseDataUserInfoNobleLevelDtoUserCurrent? userCurrent;
	PostListResponseDataUserInfoNobleLevelDtoLevelBase? levelBase;
	PostListResponseDataUserInfoNobleLevelDtoPurchaseRecord? purchaseRecord;
	List<PostListResponseDataUserInfoNobleLevelDtoPrivileges>? privileges;

	PostListResponseDataUserInfoNobleLevelDto();

	factory PostListResponseDataUserInfoNobleLevelDto.fromJson(Map<String, dynamic> json) =>
			$PostListResponseDataUserInfoNobleLevelDtoFromJson(json);

	Map<String, dynamic> toJson() => $PostListResponseDataUserInfoNobleLevelDtoToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PostListResponseDataUserInfoNobleLevelDtoUserCurrent {
	int? userId;
	int? nobleLevelId;
	String? nobleName;
	int? levelFlag;
	String? startTime;
	String? endTime;
	int? remainingDays;

	PostListResponseDataUserInfoNobleLevelDtoUserCurrent();

	factory PostListResponseDataUserInfoNobleLevelDtoUserCurrent.fromJson(Map<String, dynamic> json) =>
			$PostListResponseDataUserInfoNobleLevelDtoUserCurrentFromJson(json);

	Map<String, dynamic> toJson() => $PostListResponseDataUserInfoNobleLevelDtoUserCurrentToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PostListResponseDataUserInfoNobleLevelDtoLevelBase {
	int? id;
	int? goodsId;
	int? propId;
	String? levelName;
	int? levelFlag;
	String? mainImageUrl;
	String? badgeImageUrl;
	String? middleImageUrl;
	String? description;
	int? purchaseType;
	int? firstPrice;
	int? renewPrice;
	int? firstSkuId;
	int? renewSkuId;
	int? firstGiftType;
	int? firstGiftId;
	String? firstGiftName;
	String? firstGiftUrl;
	int? firstGiftAmount;
	int? firstGiftPurchaseType;
	int? firstGiftPrice;
	bool? directPurchase;
	int? purchaseDuration;

	PostListResponseDataUserInfoNobleLevelDtoLevelBase();

	factory PostListResponseDataUserInfoNobleLevelDtoLevelBase.fromJson(Map<String, dynamic> json) =>
			$PostListResponseDataUserInfoNobleLevelDtoLevelBaseFromJson(json);

	Map<String, dynamic> toJson() => $PostListResponseDataUserInfoNobleLevelDtoLevelBaseToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PostListResponseDataUserInfoNobleLevelDtoPurchaseRecord {
	int? id;
	int? userId;
	int? nobleLevelId;
	String? nobleLevelName;
	int? purchaseType;
	int? price;
	int? purchaseFlag;
	int? durationDays;
	String? purchaseTime;
	int? roomId;
	int? orderId;
	String? orderNo;

	PostListResponseDataUserInfoNobleLevelDtoPurchaseRecord();

	factory PostListResponseDataUserInfoNobleLevelDtoPurchaseRecord.fromJson(Map<String, dynamic> json) =>
			$PostListResponseDataUserInfoNobleLevelDtoPurchaseRecordFromJson(json);

	Map<String, dynamic> toJson() => $PostListResponseDataUserInfoNobleLevelDtoPurchaseRecordToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PostListResponseDataUserInfoNobleLevelDtoPrivileges {
	int? id;
	String? privilegeName;
	int? privilegeType;
	String? privilegeFunction;
	String? description;
	String? imageUrl;
	bool? enabled;

	PostListResponseDataUserInfoNobleLevelDtoPrivileges();

	factory PostListResponseDataUserInfoNobleLevelDtoPrivileges.fromJson(Map<String, dynamic> json) =>
			$PostListResponseDataUserInfoNobleLevelDtoPrivilegesFromJson(json);

	Map<String, dynamic> toJson() => $PostListResponseDataUserInfoNobleLevelDtoPrivilegesToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PostListResponseDataFileDetails {
	int? id;
	String? fileUrl;
	String? firstSnapshot;
	String? bucketType;

	PostListResponseDataFileDetails();

	factory PostListResponseDataFileDetails.fromJson(Map<String, dynamic> json) =>
			$PostListResponseDataFileDetailsFromJson(json);

	Map<String, dynamic> toJson() => $PostListResponseDataFileDetailsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PostListResponseDataSubjects {
	int? id;
	String? name;
	String? image;
	int? weight;

	PostListResponseDataSubjects();

	factory PostListResponseDataSubjects.fromJson(Map<String, dynamic> json) =>
			$PostListResponseDataSubjectsFromJson(json);

	Map<String, dynamic> toJson() => $PostListResponseDataSubjectsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PostListResponseDataComment {
	int? id;
	int? postId;
	int? userId;
	int? imageId;
	String? image;
	String? content;
	int? replyCommentId;
	int? replyUserId;
	int? parentCommentId;
	int? likesCount;
	int? commentCount;
	String? createTime;
	int? likedFlag;
	PostListResponseDataCommentUserInfo? userInfo;
	PostListResponseDataCommentReplyInfo? replyInfo;
	List<String>? subList;

	PostListResponseDataComment();

	factory PostListResponseDataComment.fromJson(Map<String, dynamic> json) =>
			$PostListResponseDataCommentFromJson(json);

	Map<String, dynamic> toJson() => $PostListResponseDataCommentToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PostListResponseDataCommentUserInfo {
	int? id;
	String? userNo;
	String? sex;
	String? nickName;
	String? avatar;
	int? onlineFlag;
	int? accompanyId;
	String? introduced;
	int? level;
	int? roomLevel;
	PostListResponseDataCommentUserInfoRoomLevelConfigDto? roomLevelConfigDto;
	PostListResponseDataCommentUserInfoNobleLevelDto? nobleLevelDto;
	String? accompanyLevel;
	String? onlineTime;
	String? customIdentityImage;
	List<String>? customIdentityImageList;
	int? userMic;
	String? birthday;
	String? mainLabelId;
	String? mainLabel;
	String? moduleAvatar;

	PostListResponseDataCommentUserInfo();

	factory PostListResponseDataCommentUserInfo.fromJson(Map<String, dynamic> json) =>
			$PostListResponseDataCommentUserInfoFromJson(json);

	Map<String, dynamic> toJson() => $PostListResponseDataCommentUserInfoToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PostListResponseDataCommentUserInfoRoomLevelConfigDto {
	int? id;
	String? levelName;
	String? icon;
	String? backdrop;
	String? medal;
	String? homeBackdrop;
	String? pcMedal;
	String? pcIcon;
	int? level;
	int? startPoints;
	int? endPoints;
	int? medalUsable;
	int? recommendUsable;
	int? recommendRate;
	int? giftUsable;
	int? avatarUsable;
	int? avatarConfigId;
	int? animationUsable;
	int? animationConfigId;
	int? nickColorUsable;
	int? nickColorConfigId;
	int? textColorUsable;
	int? textColorConfigId;
	int? birthdayUsable;
	int? birthdayRightsPackageId;
	int? invisibleRankUsable;
	String? invisibleRankNick;
	int? invisibleRoomUsable;
	int? supportUsable;
	int? productCreateUsable;

	PostListResponseDataCommentUserInfoRoomLevelConfigDto();

	factory PostListResponseDataCommentUserInfoRoomLevelConfigDto.fromJson(Map<String, dynamic> json) =>
			$PostListResponseDataCommentUserInfoRoomLevelConfigDtoFromJson(json);

	Map<String, dynamic> toJson() => $PostListResponseDataCommentUserInfoRoomLevelConfigDtoToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PostListResponseDataCommentUserInfoNobleLevelDto {
	PostListResponseDataCommentUserInfoNobleLevelDtoUserCurrent? userCurrent;
	PostListResponseDataCommentUserInfoNobleLevelDtoLevelBase? levelBase;
	PostListResponseDataCommentUserInfoNobleLevelDtoPurchaseRecord? purchaseRecord;
	List<PostListResponseDataCommentUserInfoNobleLevelDtoPrivileges>? privileges;

	PostListResponseDataCommentUserInfoNobleLevelDto();

	factory PostListResponseDataCommentUserInfoNobleLevelDto.fromJson(Map<String, dynamic> json) =>
			$PostListResponseDataCommentUserInfoNobleLevelDtoFromJson(json);

	Map<String, dynamic> toJson() => $PostListResponseDataCommentUserInfoNobleLevelDtoToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PostListResponseDataCommentUserInfoNobleLevelDtoUserCurrent {
	int? userId;
	int? nobleLevelId;
	String? nobleName;
	int? levelFlag;
	String? startTime;
	String? endTime;
	int? remainingDays;

	PostListResponseDataCommentUserInfoNobleLevelDtoUserCurrent();

	factory PostListResponseDataCommentUserInfoNobleLevelDtoUserCurrent.fromJson(Map<String, dynamic> json) =>
			$PostListResponseDataCommentUserInfoNobleLevelDtoUserCurrentFromJson(json);

	Map<String, dynamic> toJson() => $PostListResponseDataCommentUserInfoNobleLevelDtoUserCurrentToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PostListResponseDataCommentUserInfoNobleLevelDtoLevelBase {
	int? id;
	int? goodsId;
	int? propId;
	String? levelName;
	int? levelFlag;
	String? mainImageUrl;
	String? badgeImageUrl;
	String? middleImageUrl;
	String? description;
	int? purchaseType;
	int? firstPrice;
	int? renewPrice;
	int? firstSkuId;
	int? renewSkuId;
	int? firstGiftType;
	int? firstGiftId;
	String? firstGiftName;
	String? firstGiftUrl;
	int? firstGiftAmount;
	int? firstGiftPurchaseType;
	int? firstGiftPrice;
	bool? directPurchase;
	int? purchaseDuration;

	PostListResponseDataCommentUserInfoNobleLevelDtoLevelBase();

	factory PostListResponseDataCommentUserInfoNobleLevelDtoLevelBase.fromJson(Map<String, dynamic> json) =>
			$PostListResponseDataCommentUserInfoNobleLevelDtoLevelBaseFromJson(json);

	Map<String, dynamic> toJson() => $PostListResponseDataCommentUserInfoNobleLevelDtoLevelBaseToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PostListResponseDataCommentUserInfoNobleLevelDtoPurchaseRecord {
	int? id;
	int? userId;
	int? nobleLevelId;
	String? nobleLevelName;
	int? purchaseType;
	int? price;
	int? purchaseFlag;
	int? durationDays;
	String? purchaseTime;
	int? roomId;
	int? orderId;
	String? orderNo;

	PostListResponseDataCommentUserInfoNobleLevelDtoPurchaseRecord();

	factory PostListResponseDataCommentUserInfoNobleLevelDtoPurchaseRecord.fromJson(Map<String, dynamic> json) =>
			$PostListResponseDataCommentUserInfoNobleLevelDtoPurchaseRecordFromJson(json);

	Map<String, dynamic> toJson() => $PostListResponseDataCommentUserInfoNobleLevelDtoPurchaseRecordToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PostListResponseDataCommentUserInfoNobleLevelDtoPrivileges {
	int? id;
	String? privilegeName;
	int? privilegeType;
	String? privilegeFunction;
	String? description;
	String? imageUrl;
	bool? enabled;

	PostListResponseDataCommentUserInfoNobleLevelDtoPrivileges();

	factory PostListResponseDataCommentUserInfoNobleLevelDtoPrivileges.fromJson(Map<String, dynamic> json) =>
			$PostListResponseDataCommentUserInfoNobleLevelDtoPrivilegesFromJson(json);

	Map<String, dynamic> toJson() => $PostListResponseDataCommentUserInfoNobleLevelDtoPrivilegesToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PostListResponseDataCommentReplyInfo {
	int? id;
	String? userNo;
	String? sex;
	String? nickName;
	String? avatar;
	int? onlineFlag;
	int? accompanyId;
	String? introduced;
	int? level;
	int? roomLevel;
	PostListResponseDataCommentReplyInfoRoomLevelConfigDto? roomLevelConfigDto;
	PostListResponseDataCommentReplyInfoNobleLevelDto? nobleLevelDto;
	String? accompanyLevel;
	String? onlineTime;
	String? customIdentityImage;
	List<String>? customIdentityImageList;
	int? userMic;
	String? birthday;
	String? mainLabelId;
	String? mainLabel;
	String? moduleAvatar;

	PostListResponseDataCommentReplyInfo();

	factory PostListResponseDataCommentReplyInfo.fromJson(Map<String, dynamic> json) =>
			$PostListResponseDataCommentReplyInfoFromJson(json);

	Map<String, dynamic> toJson() => $PostListResponseDataCommentReplyInfoToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PostListResponseDataCommentReplyInfoRoomLevelConfigDto {
	int? id;
	String? levelName;
	String? icon;
	String? backdrop;
	String? medal;
	String? homeBackdrop;
	String? pcMedal;
	String? pcIcon;
	int? level;
	int? startPoints;
	int? endPoints;
	int? medalUsable;
	int? recommendUsable;
	int? recommendRate;
	int? giftUsable;
	int? avatarUsable;
	int? avatarConfigId;
	int? animationUsable;
	int? animationConfigId;
	int? nickColorUsable;
	int? nickColorConfigId;
	int? textColorUsable;
	int? textColorConfigId;
	int? birthdayUsable;
	int? birthdayRightsPackageId;
	int? invisibleRankUsable;
	String? invisibleRankNick;
	int? invisibleRoomUsable;
	int? supportUsable;
	int? productCreateUsable;

	PostListResponseDataCommentReplyInfoRoomLevelConfigDto();

	factory PostListResponseDataCommentReplyInfoRoomLevelConfigDto.fromJson(Map<String, dynamic> json) =>
			$PostListResponseDataCommentReplyInfoRoomLevelConfigDtoFromJson(json);

	Map<String, dynamic> toJson() => $PostListResponseDataCommentReplyInfoRoomLevelConfigDtoToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PostListResponseDataCommentReplyInfoNobleLevelDto {
	PostListResponseDataCommentReplyInfoNobleLevelDtoUserCurrent? userCurrent;
	PostListResponseDataCommentReplyInfoNobleLevelDtoLevelBase? levelBase;
	PostListResponseDataCommentReplyInfoNobleLevelDtoPurchaseRecord? purchaseRecord;
	List<PostListResponseDataCommentReplyInfoNobleLevelDtoPrivileges>? privileges;

	PostListResponseDataCommentReplyInfoNobleLevelDto();

	factory PostListResponseDataCommentReplyInfoNobleLevelDto.fromJson(Map<String, dynamic> json) =>
			$PostListResponseDataCommentReplyInfoNobleLevelDtoFromJson(json);

	Map<String, dynamic> toJson() => $PostListResponseDataCommentReplyInfoNobleLevelDtoToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PostListResponseDataCommentReplyInfoNobleLevelDtoUserCurrent {
	int? userId;
	int? nobleLevelId;
	String? nobleName;
	int? levelFlag;
	String? startTime;
	String? endTime;
	int? remainingDays;

	PostListResponseDataCommentReplyInfoNobleLevelDtoUserCurrent();

	factory PostListResponseDataCommentReplyInfoNobleLevelDtoUserCurrent.fromJson(Map<String, dynamic> json) =>
			$PostListResponseDataCommentReplyInfoNobleLevelDtoUserCurrentFromJson(json);

	Map<String, dynamic> toJson() => $PostListResponseDataCommentReplyInfoNobleLevelDtoUserCurrentToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PostListResponseDataCommentReplyInfoNobleLevelDtoLevelBase {
	int? id;
	int? goodsId;
	int? propId;
	String? levelName;
	int? levelFlag;
	String? mainImageUrl;
	String? badgeImageUrl;
	String? middleImageUrl;
	String? description;
	int? purchaseType;
	int? firstPrice;
	int? renewPrice;
	int? firstSkuId;
	int? renewSkuId;
	int? firstGiftType;
	int? firstGiftId;
	String? firstGiftName;
	String? firstGiftUrl;
	int? firstGiftAmount;
	int? firstGiftPurchaseType;
	int? firstGiftPrice;
	bool? directPurchase;
	int? purchaseDuration;

	PostListResponseDataCommentReplyInfoNobleLevelDtoLevelBase();

	factory PostListResponseDataCommentReplyInfoNobleLevelDtoLevelBase.fromJson(Map<String, dynamic> json) =>
			$PostListResponseDataCommentReplyInfoNobleLevelDtoLevelBaseFromJson(json);

	Map<String, dynamic> toJson() => $PostListResponseDataCommentReplyInfoNobleLevelDtoLevelBaseToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PostListResponseDataCommentReplyInfoNobleLevelDtoPurchaseRecord {
	int? id;
	int? userId;
	int? nobleLevelId;
	String? nobleLevelName;
	int? purchaseType;
	int? price;
	int? purchaseFlag;
	int? durationDays;
	String? purchaseTime;
	int? roomId;
	int? orderId;
	String? orderNo;

	PostListResponseDataCommentReplyInfoNobleLevelDtoPurchaseRecord();

	factory PostListResponseDataCommentReplyInfoNobleLevelDtoPurchaseRecord.fromJson(Map<String, dynamic> json) =>
			$PostListResponseDataCommentReplyInfoNobleLevelDtoPurchaseRecordFromJson(json);

	Map<String, dynamic> toJson() => $PostListResponseDataCommentReplyInfoNobleLevelDtoPurchaseRecordToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PostListResponseDataCommentReplyInfoNobleLevelDtoPrivileges {
	int? id;
	String? privilegeName;
	int? privilegeType;
	String? privilegeFunction;
	String? description;
	String? imageUrl;
	bool? enabled;

	PostListResponseDataCommentReplyInfoNobleLevelDtoPrivileges();

	factory PostListResponseDataCommentReplyInfoNobleLevelDtoPrivileges.fromJson(Map<String, dynamic> json) =>
			$PostListResponseDataCommentReplyInfoNobleLevelDtoPrivilegesFromJson(json);

	Map<String, dynamic> toJson() => $PostListResponseDataCommentReplyInfoNobleLevelDtoPrivilegesToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PostListResponseDataUserPropDetailDto {
	PostListResponseDataUserPropDetailDtoChatBubble? chatBubble;
	PostListResponseDataUserPropDetailDtoAvatarFrame? avatarFrame;
	PostListResponseDataUserPropDetailDtoLevelMedal? levelMedal;
	PostListResponseDataUserPropDetailDtoEntranceEffect? entranceEffect;
	PostListResponseDataUserPropDetailDtoCustomNickname? customNickname;
	PostListResponseDataUserPropDetailDtoHomepageEffect? homepageEffect;
	PostListResponseDataUserPropDetailDtoNameplate? nameplate;
	PostListResponseDataUserPropDetailDtoMount? mount;
	PostListResponseDataUserPropDetailDtoColorfulText? colorfulText;
	PostListResponseDataUserPropDetailDtoRoomWallpaper? roomWallpaper;
	PostListResponseDataUserPropDetailDtoNobleCard? nobleCard;

	PostListResponseDataUserPropDetailDto();

	factory PostListResponseDataUserPropDetailDto.fromJson(Map<String, dynamic> json) =>
			$PostListResponseDataUserPropDetailDtoFromJson(json);

	Map<String, dynamic> toJson() => $PostListResponseDataUserPropDetailDtoToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PostListResponseDataUserPropDetailDtoChatBubble {
	int? id;
	int? userId;
	int? propId;
	String? propName;
	int? propType;
	String? propFormat;
	String? dynamicEffect;
	String? pcDynamicEffect;
	String? iosDynamicEffect;
	int? customFlag;
	String? customInfo;
	int? useFlag;

	PostListResponseDataUserPropDetailDtoChatBubble();

	factory PostListResponseDataUserPropDetailDtoChatBubble.fromJson(Map<String, dynamic> json) =>
			$PostListResponseDataUserPropDetailDtoChatBubbleFromJson(json);

	Map<String, dynamic> toJson() => $PostListResponseDataUserPropDetailDtoChatBubbleToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PostListResponseDataUserPropDetailDtoAvatarFrame {
	int? id;
	int? userId;
	int? propId;
	String? propName;
	int? propType;
	String? propFormat;
	String? dynamicEffect;
	String? pcDynamicEffect;
	String? iosDynamicEffect;
	int? customFlag;
	String? customInfo;
	int? useFlag;

	PostListResponseDataUserPropDetailDtoAvatarFrame();

	factory PostListResponseDataUserPropDetailDtoAvatarFrame.fromJson(Map<String, dynamic> json) =>
			$PostListResponseDataUserPropDetailDtoAvatarFrameFromJson(json);

	Map<String, dynamic> toJson() => $PostListResponseDataUserPropDetailDtoAvatarFrameToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PostListResponseDataUserPropDetailDtoLevelMedal {
	int? id;
	int? userId;
	int? propId;
	String? propName;
	int? propType;
	String? propFormat;
	String? dynamicEffect;
	String? pcDynamicEffect;
	String? iosDynamicEffect;
	int? customFlag;
	String? customInfo;
	int? useFlag;

	PostListResponseDataUserPropDetailDtoLevelMedal();

	factory PostListResponseDataUserPropDetailDtoLevelMedal.fromJson(Map<String, dynamic> json) =>
			$PostListResponseDataUserPropDetailDtoLevelMedalFromJson(json);

	Map<String, dynamic> toJson() => $PostListResponseDataUserPropDetailDtoLevelMedalToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PostListResponseDataUserPropDetailDtoEntranceEffect {
	int? id;
	int? userId;
	int? propId;
	String? propName;
	int? propType;
	String? propFormat;
	String? dynamicEffect;
	String? pcDynamicEffect;
	String? iosDynamicEffect;
	int? customFlag;
	String? customInfo;
	int? useFlag;

	PostListResponseDataUserPropDetailDtoEntranceEffect();

	factory PostListResponseDataUserPropDetailDtoEntranceEffect.fromJson(Map<String, dynamic> json) =>
			$PostListResponseDataUserPropDetailDtoEntranceEffectFromJson(json);

	Map<String, dynamic> toJson() => $PostListResponseDataUserPropDetailDtoEntranceEffectToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PostListResponseDataUserPropDetailDtoCustomNickname {
	int? id;
	int? userId;
	int? propId;
	String? propName;
	int? propType;
	String? propFormat;
	String? dynamicEffect;
	String? pcDynamicEffect;
	String? iosDynamicEffect;
	int? customFlag;
	String? customInfo;
	int? useFlag;

	PostListResponseDataUserPropDetailDtoCustomNickname();

	factory PostListResponseDataUserPropDetailDtoCustomNickname.fromJson(Map<String, dynamic> json) =>
			$PostListResponseDataUserPropDetailDtoCustomNicknameFromJson(json);

	Map<String, dynamic> toJson() => $PostListResponseDataUserPropDetailDtoCustomNicknameToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PostListResponseDataUserPropDetailDtoHomepageEffect {
	int? id;
	int? userId;
	int? propId;
	String? propName;
	int? propType;
	String? propFormat;
	String? dynamicEffect;
	String? pcDynamicEffect;
	String? iosDynamicEffect;
	int? customFlag;
	String? customInfo;
	int? useFlag;

	PostListResponseDataUserPropDetailDtoHomepageEffect();

	factory PostListResponseDataUserPropDetailDtoHomepageEffect.fromJson(Map<String, dynamic> json) =>
			$PostListResponseDataUserPropDetailDtoHomepageEffectFromJson(json);

	Map<String, dynamic> toJson() => $PostListResponseDataUserPropDetailDtoHomepageEffectToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PostListResponseDataUserPropDetailDtoNameplate {
	int? id;
	int? userId;
	int? propId;
	String? propName;
	int? propType;
	String? propFormat;
	String? dynamicEffect;
	String? pcDynamicEffect;
	String? iosDynamicEffect;
	int? customFlag;
	String? customInfo;
	int? useFlag;

	PostListResponseDataUserPropDetailDtoNameplate();

	factory PostListResponseDataUserPropDetailDtoNameplate.fromJson(Map<String, dynamic> json) =>
			$PostListResponseDataUserPropDetailDtoNameplateFromJson(json);

	Map<String, dynamic> toJson() => $PostListResponseDataUserPropDetailDtoNameplateToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PostListResponseDataUserPropDetailDtoMount {
	int? id;
	int? userId;
	int? propId;
	String? propName;
	int? propType;
	String? propFormat;
	String? dynamicEffect;
	String? pcDynamicEffect;
	String? iosDynamicEffect;
	int? customFlag;
	String? customInfo;
	int? useFlag;

	PostListResponseDataUserPropDetailDtoMount();

	factory PostListResponseDataUserPropDetailDtoMount.fromJson(Map<String, dynamic> json) =>
			$PostListResponseDataUserPropDetailDtoMountFromJson(json);

	Map<String, dynamic> toJson() => $PostListResponseDataUserPropDetailDtoMountToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PostListResponseDataUserPropDetailDtoColorfulText {
	int? id;
	int? userId;
	int? propId;
	String? propName;
	int? propType;
	String? propFormat;
	String? dynamicEffect;
	String? pcDynamicEffect;
	String? iosDynamicEffect;
	int? customFlag;
	String? customInfo;
	int? useFlag;

	PostListResponseDataUserPropDetailDtoColorfulText();

	factory PostListResponseDataUserPropDetailDtoColorfulText.fromJson(Map<String, dynamic> json) =>
			$PostListResponseDataUserPropDetailDtoColorfulTextFromJson(json);

	Map<String, dynamic> toJson() => $PostListResponseDataUserPropDetailDtoColorfulTextToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PostListResponseDataUserPropDetailDtoRoomWallpaper {
	int? id;
	int? userId;
	int? propId;
	String? propName;
	int? propType;
	String? propFormat;
	String? dynamicEffect;
	String? pcDynamicEffect;
	String? iosDynamicEffect;
	int? customFlag;
	String? customInfo;
	int? useFlag;

	PostListResponseDataUserPropDetailDtoRoomWallpaper();

	factory PostListResponseDataUserPropDetailDtoRoomWallpaper.fromJson(Map<String, dynamic> json) =>
			$PostListResponseDataUserPropDetailDtoRoomWallpaperFromJson(json);

	Map<String, dynamic> toJson() => $PostListResponseDataUserPropDetailDtoRoomWallpaperToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PostListResponseDataUserPropDetailDtoNobleCard {
	int? id;
	int? userId;
	int? propId;
	String? propName;
	int? propType;
	String? propFormat;
	String? dynamicEffect;
	String? pcDynamicEffect;
	String? iosDynamicEffect;
	int? customFlag;
	String? customInfo;
	int? useFlag;

	PostListResponseDataUserPropDetailDtoNobleCard();

	factory PostListResponseDataUserPropDetailDtoNobleCard.fromJson(Map<String, dynamic> json) =>
			$PostListResponseDataUserPropDetailDtoNobleCardFromJson(json);

	Map<String, dynamic> toJson() => $PostListResponseDataUserPropDetailDtoNobleCardToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}