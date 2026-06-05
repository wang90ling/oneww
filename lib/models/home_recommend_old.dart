
import 'dart:ffi';

class HomeRecommendOld {
  const HomeRecommendOld({
    required this.pageNo,
    required this.pageSize,
    required this.pages,
    required this.records,
    required this.total,
  });

  final String? pageNo;
  final String? pageSize;
  final String? pages;
  final List<UserRecordOld>? records;
  final String? total;
}

class UserRecordOld {
  const UserRecordOld({
    required this.accompanyLevel,
    required this.avatar,
    required this.categoryId,
    required this.categoryName,
    required this.categoryList,
    required this.coverImage,
    required this.grade,
    required this.introduced,
    required this.level,
    required this.nickName,
    required this.orderAmount,
    required this.scoreAvg,
    required this.sex,
    required this.userId,
    required this.userPropListDto,
    required this.userPropDetailDto,
    required this.onlineFlag,
    required this.roomMedal,
    required this.roomLevel,
    required this.roomLevelConfigDto,
    required this.isAudioPlaying,
  });

  final int? accompanyLevel;
  final String? avatar;
  final String? categoryId;
  final String? categoryName;
  final List<Category>? categoryList;
  final String? coverImage;
  final String? grade;
  final String? introduced;
  final int? level;
  final String? nickName;

  final int? orderAmount;
  final int? scoreAvg;
  final String? sex;
  final String? userId;

  final List<UserPropListDto>? userPropListDto;  // 根据JSON数据，这个数组始终为空,
  final UserPropDetailDto? userPropDetailDto;  // 根据JSON数据，这个数组始终为空,
  final int? onlineFlag;

  final String? roomMedal;
  final String? roomLevel;

  final RoomLevelConfigDto? roomLevelConfigDto;
  final Bool? isAudioPlaying;
}


class Category {
  const Category({
    required this.maxStandard,
    required this.categoryCoverImageUrl,
    required this.categoryFileUrl,
    required this.categoryId,
    required this.categoryName,
    required this.introduced,
    required this.field1,
    required this.field2,
    required this.field3,
    required this.field4,
    required this.field5,
    required this.field6,
    required this.field7,
    required this.field8,
    required this.field9,
    required this.field10,
    required this.field11,
    required this.field12,
    required this.field13,
    required this.field14,
    required this.field15,
    required this.fileList,
    required this.id,
    required this.priceList,
    required this.roomLevel,
    required this.roomLevelConfigDto,
    required this.userId,
    required this.voiceIntroduced,
  });

  final String? maxStandard;
  final String? categoryCoverImageUrl;
  final String? categoryFileUrl;
  final String? categoryId;
  final String? categoryName;
  final String? introduced;
  final String? field1;
  final String? field2;
  final String? field3;
  final String? field4;
  final String? field5;
  final String? field6;
  final String? field7;
  final String? field8;
  final String? field9;
  final String? field10;
  final String? field11;
  final String? field12;
  final String? field13;
  final String? field14;
  final String? field15;
  final String? fileList;
  final String? id;
  final String? priceList;
  final String? roomLevel;
  final String? roomLevelConfigDto;
  final String? userId;
  final String? voiceIntroduced;

}

class UserPropListDto {
  const UserPropListDto({
    required this.customFlag,
    required this.customInfo,
    required this.dynamicEffect,
    required this.propFormat,
    required this.propId,
    required this.propName,
    required this.propType,
    required this.useFlag,
    required this.userId,
  });

  final int? customFlag;
  final String? customInfo;
  final String? dynamicEffect;
  final String? propFormat;
  final String? propId;
  final String? propName;
  final int? propType;
  final int? useFlag;
  final String? userId;
}

class UserPropDetailDto {
  const UserPropDetailDto({
    required this.avatarFrame,
    required this.chatBubble,
    required this.colorfulText,
    required this.customNickname,
    required this.entranceEffect,
    required this.homepageEffect,
    required this.levelMedal,
    required this.mount,
    required this.nameplate,
  });

  final AvatarFrame? avatarFrame;
  final ChatBubble? chatBubble;
  final ColorfulText? colorfulText;
  final CustomNickname? customNickname;
  final EntranceEffect? entranceEffect;
  final HomepageEffect? homepageEffect;
  final LevelMedal? levelMedal;
  final Mount? mount;
  final Nameplate? nameplate;
}

class RoomLevelConfigDto {
  const RoomLevelConfigDto({
    required this.id,
    required this.level,
    required this.backdrop,
    required this.icon,
    required this.medal,
    required this.levelName,
    required this.homeBackdrop,
    required this.pcIcon,
  });


  final String? id;
  final int? level;
  final String? backdrop;
  final String? icon;
  final String? medal;
  final String? levelName;
  final String? homeBackdrop;
  final String? pcIcon;
}

class AvatarFrame {
  const AvatarFrame({
    required this.userId,
    required this.propId,
    required this.propName,
    required this.propType,
    required this.propFormat,
    required this.dynamicEffect,
    required this.iosDynamicEffect,
    required this.pcDynamicEffect,
    required this.customFlag,
    required this.customInfo,
    required this.useFlag,
  });


  final String? userId;
  final String? propId;
  final String? propName;
  final String? propType;
  final String? propFormat;
  final String? dynamicEffect;
  final String? iosDynamicEffect;
  final String? pcDynamicEffect;
  final String? customFlag;
  final String? customInfo;
  final String? useFlag;
}

class ChatBubble {
  const ChatBubble({
    required this.userId,
    required this.propId,
    required this.propName,
    required this.propType,
    required this.propFormat,
    required this.dynamicEffect,
    required this.iosDynamicEffect,
    required this.pcDynamicEffect,
    required this.customFlag,
    required this.customInfo,
    required this.useFlag,
  });


  final String? userId;
  final String? propId;
  final String? propName;
  final String? propType;
  final String? propFormat;
  final String? dynamicEffect;
  final String? iosDynamicEffect;
  final String? pcDynamicEffect;
  final String? customFlag;
  final String? customInfo;
  final String? useFlag;
}

class ColorfulText {
  const ColorfulText({
    required this.userId,
    required this.propId,
    required this.propName,
    required this.propType,
    required this.propFormat,
    required this.dynamicEffect,
    required this.iosDynamicEffect,
    required this.pcDynamicEffect,
    required this.customFlag,
    required this.customInfo,
    required this.useFlag,
  });


  final String? userId;
  final String? propId;
  final String? propName;
  final String? propType;
  final String? propFormat;
  final String? dynamicEffect;
  final String? iosDynamicEffect;
  final String? pcDynamicEffect;
  final String? customFlag;
  final String? customInfo;
  final String? useFlag;
}

class CustomNickname {
  const CustomNickname({
    required this.userId,
    required this.propId,
    required this.propName,
    required this.propType,
    required this.propFormat,
    required this.dynamicEffect,
    required this.iosDynamicEffect,
    required this.pcDynamicEffect,
    required this.customFlag,
    required this.customInfo,
    required this.useFlag,
  });


  final String? userId;
  final String? propId;
  final String? propName;
  final String? propType;
  final String? propFormat;
  final String? dynamicEffect;
  final String? iosDynamicEffect;
  final String? pcDynamicEffect;
  final String? customFlag;
  final String? customInfo;
  final String? useFlag;
}

class EntranceEffect {
  const EntranceEffect({
    required this.userId,
    required this.propId,
    required this.propName,
    required this.propType,
    required this.propFormat,
    required this.dynamicEffect,
    required this.iosDynamicEffect,
    required this.pcDynamicEffect,
    required this.customFlag,
    required this.customInfo,
    required this.useFlag,
  });


  final String? userId;
  final String? propId;
  final String? propName;
  final String? propType;
  final String? propFormat;
  final String? dynamicEffect;
  final String? iosDynamicEffect;
  final String? pcDynamicEffect;
  final String? customFlag;
  final String? customInfo;
  final String? useFlag;
}

class HomepageEffect {
  const HomepageEffect({
    required this.userId,
    required this.propId,
    required this.propName,
    required this.propType,
    required this.propFormat,
    required this.dynamicEffect,
    required this.iosDynamicEffect,
    required this.pcDynamicEffect,
    required this.customFlag,
    required this.customInfo,
    required this.useFlag,
  });


  final String? userId;
  final String? propId;
  final String? propName;
  final String? propType;
  final String? propFormat;
  final String? dynamicEffect;
  final String? iosDynamicEffect;
  final String? pcDynamicEffect;
  final String? customFlag;
  final String? customInfo;
  final String? useFlag;
}

class LevelMedal {
  const LevelMedal({
    required this.userId,
    required this.propId,
    required this.propName,
    required this.propType,
    required this.propFormat,
    required this.dynamicEffect,
    required this.iosDynamicEffect,
    required this.pcDynamicEffect,
    required this.customFlag,
    required this.customInfo,
    required this.useFlag,
  });


  final String? userId;
  final String? propId;
  final String? propName;
  final String? propType;
  final String? propFormat;
  final String? dynamicEffect;
  final String? iosDynamicEffect;
  final String? pcDynamicEffect;
  final String? customFlag;
  final String? customInfo;
  final String? useFlag;
}

class Mount {
  const Mount({
    required this.userId,
    required this.propId,
    required this.propName,
    required this.propType,
    required this.propFormat,
    required this.dynamicEffect,
    required this.iosDynamicEffect,
    required this.pcDynamicEffect,
    required this.customFlag,
    required this.customInfo,
    required this.useFlag,
  });


  final String? userId;
  final String? propId;
  final String? propName;
  final String? propType;
  final String? propFormat;
  final String? dynamicEffect;
  final String? iosDynamicEffect;
  final String? pcDynamicEffect;
  final String? customFlag;
  final String? customInfo;
  final String? useFlag;
}

class Nameplate {
  const Nameplate({
    required this.userId,
    required this.propId,
    required this.propName,
    required this.propType,
    required this.propFormat,
    required this.dynamicEffect,
    required this.iosDynamicEffect,
    required this.pcDynamicEffect,
    required this.customFlag,
    required this.customInfo,
    required this.useFlag,
  });


  final String? userId;
  final String? propId;
  final String? propName;
  final String? propType;
  final String? propFormat;
  final String? dynamicEffect;
  final String? iosDynamicEffect;
  final String? pcDynamicEffect;
  final String? customFlag;
  final String? customInfo;
  final String? useFlag;
}