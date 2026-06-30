import 'package:oneww/generated/json/base/json_convert_content.dart';
import 'package:oneww/models/user_gift_wall_request_entity.dart';

UserGiftWallRequestEntity $UserGiftWallRequestEntityFromJson(
    Map<String, dynamic> json) {
  final UserGiftWallRequestEntity userGiftWallRequestEntity = UserGiftWallRequestEntity(lightType: 1, pageNo: 1, pageSize: 20, userId: '');
  final int? lightType = jsonConvert.convert<int>(json['lightType']);
  if (lightType != null) {
    userGiftWallRequestEntity.lightType = lightType;
  }
  final int? pageNo = jsonConvert.convert<int>(json['pageNo']);
  if (pageNo != null) {
    userGiftWallRequestEntity.pageNo = pageNo;
  }
  final int? pageSize = jsonConvert.convert<int>(json['pageSize']);
  if (pageSize != null) {
    userGiftWallRequestEntity.pageSize = pageSize;
  }
  final String? userId = jsonConvert.convert<String>(json['userId']);
  if (userId != null) {
    userGiftWallRequestEntity.userId = userId;
  }
  return userGiftWallRequestEntity;
}

Map<String, dynamic> $UserGiftWallRequestEntityToJson(
    UserGiftWallRequestEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['lightType'] = entity.lightType;
  data['pageNo'] = entity.pageNo;
  data['pageSize'] = entity.pageSize;
  data['userId'] = entity.userId;
  return data;
}

extension UserGiftWallRequestEntityExtension on UserGiftWallRequestEntity {
  UserGiftWallRequestEntity copyWith({
    int? lightType,
    int? pageNo,
    int? pageSize,
    String? userId,
  }) {
    return UserGiftWallRequestEntity(lightType: 1, pageNo: 1, pageSize: 20, userId: '')
      ..lightType = lightType ?? this.lightType
      ..pageNo = pageNo ?? this.pageNo
      ..pageSize = pageSize ?? this.pageSize
      ..userId = userId ?? this.userId;
  }
}