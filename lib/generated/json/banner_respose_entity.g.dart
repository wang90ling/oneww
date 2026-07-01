import 'package:oneww/generated/json/base/json_convert_content.dart';
import 'package:oneww/models/banner_respose_entity.dart';

BannerResposeEntity $BannerResposeEntityFromJson(Map<String, dynamic> json) {
  final BannerResposeEntity bannerResposeEntity = BannerResposeEntity();
  final String? requestId = jsonConvert.convert<String>(json['request_id']);
  if (requestId != null) {
    bannerResposeEntity.requestId = requestId;
  }
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    bannerResposeEntity.code = code;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    bannerResposeEntity.message = message;
  }
  final List<BannerResposeData>? data = (json['data'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<BannerResposeData>(e) as BannerResposeData)
      .toList();
  if (data != null) {
    bannerResposeEntity.data = data;
  }
  return bannerResposeEntity;
}

Map<String, dynamic> $BannerResposeEntityToJson(BannerResposeEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['request_id'] = entity.requestId;
  data['code'] = entity.code;
  data['message'] = entity.message;
  data['data'] = entity.data.map((v) => v.toJson()).toList();
  return data;
}

extension BannerResposeEntityExtension on BannerResposeEntity {
  BannerResposeEntity copyWith({
    String? requestId,
    int? code,
    String? message,
    List<BannerResposeData>? data,
  }) {
    return BannerResposeEntity()
      ..requestId = requestId ?? this.requestId
      ..code = code ?? this.code
      ..message = message ?? this.message
      ..data = data ?? this.data;
  }
}

BannerResposeData $BannerResposeDataFromJson(Map<String, dynamic> json) {
  final BannerResposeData bannerResposeData = BannerResposeData();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    bannerResposeData.id = id;
  }
  final String? recommendName = jsonConvert.convert<String>(
      json['recommendName']);
  if (recommendName != null) {
    bannerResposeData.recommendName = recommendName;
  }
  final String? showPosition = jsonConvert.convert<String>(
      json['showPosition']);
  if (showPosition != null) {
    bannerResposeData.showPosition = showPosition;
  }
  final String? jumpType = jsonConvert.convert<String>(json['jumpType']);
  if (jumpType != null) {
    bannerResposeData.jumpType = jumpType;
  }
  final String? jumpUrl = jsonConvert.convert<String>(json['jumpUrl']);
  if (jumpUrl != null) {
    bannerResposeData.jumpUrl = jumpUrl;
  }
  final String? jumpPosition = jsonConvert.convert<String>(
      json['jumpPosition']);
  if (jumpPosition != null) {
    bannerResposeData.jumpPosition = jumpPosition;
  }
  final String? jumpArgs = jsonConvert.convert<String>(json['jumpArgs']);
  if (jumpArgs != null) {
    bannerResposeData.jumpArgs = jumpArgs;
  }
  final String? showType = jsonConvert.convert<String>(json['showType']);
  if (showType != null) {
    bannerResposeData.showType = showType;
  }
  final String? fileName = jsonConvert.convert<String>(json['fileName']);
  if (fileName != null) {
    bannerResposeData.fileName = fileName;
  }
  final String? fileUrl = jsonConvert.convert<String>(json['fileUrl']);
  if (fileUrl != null) {
    bannerResposeData.fileUrl = fileUrl;
  }
  final int? sort = jsonConvert.convert<int>(json['sort']);
  if (sort != null) {
    bannerResposeData.sort = sort;
  }
  final int? weighted = jsonConvert.convert<int>(json['weighted']);
  if (weighted != null) {
    bannerResposeData.weighted = weighted;
  }
  final String? createTime = jsonConvert.convert<String>(json['createTime']);
  if (createTime != null) {
    bannerResposeData.createTime = createTime;
  }
  return bannerResposeData;
}

Map<String, dynamic> $BannerResposeDataToJson(BannerResposeData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['recommendName'] = entity.recommendName;
  data['showPosition'] = entity.showPosition;
  data['jumpType'] = entity.jumpType;
  data['jumpUrl'] = entity.jumpUrl;
  data['jumpPosition'] = entity.jumpPosition;
  data['jumpArgs'] = entity.jumpArgs;
  data['showType'] = entity.showType;
  data['fileName'] = entity.fileName;
  data['fileUrl'] = entity.fileUrl;
  data['sort'] = entity.sort;
  data['weighted'] = entity.weighted;
  data['createTime'] = entity.createTime;
  return data;
}

extension BannerResposeDataExtension on BannerResposeData {
  BannerResposeData copyWith({
    int? id,
    String? recommendName,
    String? showPosition,
    String? jumpType,
    String? jumpUrl,
    String? jumpPosition,
    String? jumpArgs,
    String? showType,
    String? fileName,
    String? fileUrl,
    int? sort,
    int? weighted,
    String? createTime,
  }) {
    return BannerResposeData()
      ..id = id ?? this.id
      ..recommendName = recommendName ?? this.recommendName
      ..showPosition = showPosition ?? this.showPosition
      ..jumpType = jumpType ?? this.jumpType
      ..jumpUrl = jumpUrl ?? this.jumpUrl
      ..jumpPosition = jumpPosition ?? this.jumpPosition
      ..jumpArgs = jumpArgs ?? this.jumpArgs
      ..showType = showType ?? this.showType
      ..fileName = fileName ?? this.fileName
      ..fileUrl = fileUrl ?? this.fileUrl
      ..sort = sort ?? this.sort
      ..weighted = weighted ?? this.weighted
      ..createTime = createTime ?? this.createTime;
  }
}