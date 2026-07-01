import 'package:oneww/generated/json/base/json_convert_content.dart';
import 'package:oneww/models/user_gift_wall_light_response_entity.dart';

UserGiftWallLightResponseEntity $UserGiftWallLightResponseEntityFromJson(
    Map<String, dynamic> json) {
  final UserGiftWallLightResponseEntity userGiftWallLightResponseEntity = UserGiftWallLightResponseEntity();
  final String? requestId = jsonConvert.convert<String>(json['request_id']);
  if (requestId != null) {
    userGiftWallLightResponseEntity.requestId = requestId;
  }
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    userGiftWallLightResponseEntity.code = code;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    userGiftWallLightResponseEntity.message = message;
  }
  final UserGiftWallLightResponseData? data = jsonConvert.convert<
      UserGiftWallLightResponseData>(json['data']);
  if (data != null) {
    userGiftWallLightResponseEntity.data = data;
  }
  return userGiftWallLightResponseEntity;
}

Map<String, dynamic> $UserGiftWallLightResponseEntityToJson(
    UserGiftWallLightResponseEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['request_id'] = entity.requestId;
  data['code'] = entity.code;
  data['message'] = entity.message;
  data['data'] = entity.data.toJson();
  return data;
}

extension UserGiftWallLightResponseEntityExtension on UserGiftWallLightResponseEntity {
  UserGiftWallLightResponseEntity copyWith({
    String? requestId,
    int? code,
    String? message,
    UserGiftWallLightResponseData? data,
  }) {
    return UserGiftWallLightResponseEntity()
      ..requestId = requestId ?? this.requestId
      ..code = code ?? this.code
      ..message = message ?? this.message
      ..data = data ?? this.data;
  }
}

UserGiftWallLightResponseData $UserGiftWallLightResponseDataFromJson(
    Map<String, dynamic> json) {
  final UserGiftWallLightResponseData userGiftWallLightResponseData = UserGiftWallLightResponseData();
  final int? totalCount = jsonConvert.convert<int>(json['totalCount']);
  if (totalCount != null) {
    userGiftWallLightResponseData.totalCount = totalCount;
  }
  final int? litCount = jsonConvert.convert<int>(json['litCount']);
  if (litCount != null) {
    userGiftWallLightResponseData.litCount = litCount;
  }
  final int? unlitCount = jsonConvert.convert<int>(json['unlitCount']);
  if (unlitCount != null) {
    userGiftWallLightResponseData.unlitCount = unlitCount;
  }
  return userGiftWallLightResponseData;
}

Map<String, dynamic> $UserGiftWallLightResponseDataToJson(
    UserGiftWallLightResponseData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['totalCount'] = entity.totalCount;
  data['litCount'] = entity.litCount;
  data['unlitCount'] = entity.unlitCount;
  return data;
}

extension UserGiftWallLightResponseDataExtension on UserGiftWallLightResponseData {
  UserGiftWallLightResponseData copyWith({
    int? totalCount,
    int? litCount,
    int? unlitCount,
  }) {
    return UserGiftWallLightResponseData()
      ..totalCount = totalCount ?? this.totalCount
      ..litCount = litCount ?? this.litCount
      ..unlitCount = unlitCount ?? this.unlitCount;
  }
}