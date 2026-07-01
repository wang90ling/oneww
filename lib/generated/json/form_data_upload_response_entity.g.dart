import 'package:oneww/generated/json/base/json_convert_content.dart';
import 'package:oneww/models/form_data_upload_response_entity.dart';

FormDataUploadResponseEntity $FormDataUploadResponseEntityFromJson(
    Map<String, dynamic> json) {
  final FormDataUploadResponseEntity formDataUploadResponseEntity = FormDataUploadResponseEntity();
  final String? requestId = jsonConvert.convert<String>(json['request_id']);
  if (requestId != null) {
    formDataUploadResponseEntity.requestId = requestId;
  }
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    formDataUploadResponseEntity.code = code;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    formDataUploadResponseEntity.message = message;
  }
  final FormDataUploadResponseData? data = jsonConvert.convert<
      FormDataUploadResponseData>(json['data']);
  if (data != null) {
    formDataUploadResponseEntity.data = data;
  }
  return formDataUploadResponseEntity;
}

Map<String, dynamic> $FormDataUploadResponseEntityToJson(
    FormDataUploadResponseEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['request_id'] = entity.requestId;
  data['code'] = entity.code;
  data['message'] = entity.message;
  data['data'] = entity.data.toJson();
  return data;
}

extension FormDataUploadResponseEntityExtension on FormDataUploadResponseEntity {
  FormDataUploadResponseEntity copyWith({
    String? requestId,
    int? code,
    String? message,
    FormDataUploadResponseData? data,
  }) {
    return FormDataUploadResponseEntity()
      ..requestId = requestId ?? this.requestId
      ..code = code ?? this.code
      ..message = message ?? this.message
      ..data = data ?? this.data;
  }
}

FormDataUploadResponseData $FormDataUploadResponseDataFromJson(
    Map<String, dynamic> json) {
  final FormDataUploadResponseData formDataUploadResponseData = FormDataUploadResponseData();
  final String? accessKeyId = jsonConvert.convert<String>(json['accessKeyId']);
  if (accessKeyId != null) {
    formDataUploadResponseData.accessKeyId = accessKeyId;
  }
  final String? policy = jsonConvert.convert<String>(json['policy']);
  if (policy != null) {
    formDataUploadResponseData.policy = policy;
  }
  final String? signature = jsonConvert.convert<String>(json['signature']);
  if (signature != null) {
    formDataUploadResponseData.signature = signature;
  }
  final String? secretId = jsonConvert.convert<String>(json['secretId']);
  if (secretId != null) {
    formDataUploadResponseData.secretId = secretId;
  }
  final String? secretKey = jsonConvert.convert<String>(json['secretKey']);
  if (secretKey != null) {
    formDataUploadResponseData.secretKey = secretKey;
  }
  final String? sessionToken = jsonConvert.convert<String>(
      json['sessionToken']);
  if (sessionToken != null) {
    formDataUploadResponseData.sessionToken = sessionToken;
  }
  final String? endpoint = jsonConvert.convert<String>(json['endpoint']);
  if (endpoint != null) {
    formDataUploadResponseData.endpoint = endpoint;
  }
  final String? filePath = jsonConvert.convert<String>(json['filePath']);
  if (filePath != null) {
    formDataUploadResponseData.filePath = filePath;
  }
  final int? startTime = jsonConvert.convert<int>(json['startTime']);
  if (startTime != null) {
    formDataUploadResponseData.startTime = startTime;
  }
  final int? expiredTime = jsonConvert.convert<int>(json['expiredTime']);
  if (expiredTime != null) {
    formDataUploadResponseData.expiredTime = expiredTime;
  }
  final String? requestId = jsonConvert.convert<String>(json['requestId']);
  if (requestId != null) {
    formDataUploadResponseData.requestId = requestId;
  }
  final FormDataUploadResponseDataSignMap? signMap = jsonConvert.convert<
      FormDataUploadResponseDataSignMap>(json['signMap']);
  if (signMap != null) {
    formDataUploadResponseData.signMap = signMap;
  }
  return formDataUploadResponseData;
}

Map<String, dynamic> $FormDataUploadResponseDataToJson(
    FormDataUploadResponseData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['accessKeyId'] = entity.accessKeyId;
  data['policy'] = entity.policy;
  data['signature'] = entity.signature;
  data['secretId'] = entity.secretId;
  data['secretKey'] = entity.secretKey;
  data['sessionToken'] = entity.sessionToken;
  data['endpoint'] = entity.endpoint;
  data['filePath'] = entity.filePath;
  data['startTime'] = entity.startTime;
  data['expiredTime'] = entity.expiredTime;
  data['requestId'] = entity.requestId;
  data['signMap'] = entity.signMap.toJson();
  return data;
}

extension FormDataUploadResponseDataExtension on FormDataUploadResponseData {
  FormDataUploadResponseData copyWith({
    String? accessKeyId,
    String? policy,
    String? signature,
    String? secretId,
    String? secretKey,
    String? sessionToken,
    String? endpoint,
    String? filePath,
    int? startTime,
    int? expiredTime,
    String? requestId,
    FormDataUploadResponseDataSignMap? signMap,
  }) {
    return FormDataUploadResponseData()
      ..accessKeyId = accessKeyId ?? this.accessKeyId
      ..policy = policy ?? this.policy
      ..signature = signature ?? this.signature
      ..secretId = secretId ?? this.secretId
      ..secretKey = secretKey ?? this.secretKey
      ..sessionToken = sessionToken ?? this.sessionToken
      ..endpoint = endpoint ?? this.endpoint
      ..filePath = filePath ?? this.filePath
      ..startTime = startTime ?? this.startTime
      ..expiredTime = expiredTime ?? this.expiredTime
      ..requestId = requestId ?? this.requestId
      ..signMap = signMap ?? this.signMap;
  }
}

FormDataUploadResponseDataSignMap $FormDataUploadResponseDataSignMapFromJson(
    Map<String, dynamic> json) {
  final FormDataUploadResponseDataSignMap formDataUploadResponseDataSignMap = FormDataUploadResponseDataSignMap();
  final FormDataUploadResponseDataSignMapAdditionalProp1? additionalProp1 = jsonConvert
      .convert<FormDataUploadResponseDataSignMapAdditionalProp1>(
      json['additionalProp1']);
  if (additionalProp1 != null) {
    formDataUploadResponseDataSignMap.additionalProp1 = additionalProp1;
  }
  final FormDataUploadResponseDataSignMapAdditionalProp2? additionalProp2 = jsonConvert
      .convert<FormDataUploadResponseDataSignMapAdditionalProp2>(
      json['additionalProp2']);
  if (additionalProp2 != null) {
    formDataUploadResponseDataSignMap.additionalProp2 = additionalProp2;
  }
  final FormDataUploadResponseDataSignMapAdditionalProp3? additionalProp3 = jsonConvert
      .convert<FormDataUploadResponseDataSignMapAdditionalProp3>(
      json['additionalProp3']);
  if (additionalProp3 != null) {
    formDataUploadResponseDataSignMap.additionalProp3 = additionalProp3;
  }
  return formDataUploadResponseDataSignMap;
}

Map<String, dynamic> $FormDataUploadResponseDataSignMapToJson(
    FormDataUploadResponseDataSignMap entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['additionalProp1'] = entity.additionalProp1.toJson();
  data['additionalProp2'] = entity.additionalProp2.toJson();
  data['additionalProp3'] = entity.additionalProp3.toJson();
  return data;
}

extension FormDataUploadResponseDataSignMapExtension on FormDataUploadResponseDataSignMap {
  FormDataUploadResponseDataSignMap copyWith({
    FormDataUploadResponseDataSignMapAdditionalProp1? additionalProp1,
    FormDataUploadResponseDataSignMapAdditionalProp2? additionalProp2,
    FormDataUploadResponseDataSignMapAdditionalProp3? additionalProp3,
  }) {
    return FormDataUploadResponseDataSignMap()
      ..additionalProp1 = additionalProp1 ?? this.additionalProp1
      ..additionalProp2 = additionalProp2 ?? this.additionalProp2
      ..additionalProp3 = additionalProp3 ?? this.additionalProp3;
  }
}

FormDataUploadResponseDataSignMapAdditionalProp1 $FormDataUploadResponseDataSignMapAdditionalProp1FromJson(
    Map<String, dynamic> json) {
  final FormDataUploadResponseDataSignMapAdditionalProp1 formDataUploadResponseDataSignMapAdditionalProp1 = FormDataUploadResponseDataSignMapAdditionalProp1();
  return formDataUploadResponseDataSignMapAdditionalProp1;
}

Map<String, dynamic> $FormDataUploadResponseDataSignMapAdditionalProp1ToJson(
    FormDataUploadResponseDataSignMapAdditionalProp1 entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  return data;
}

extension FormDataUploadResponseDataSignMapAdditionalProp1Extension on FormDataUploadResponseDataSignMapAdditionalProp1 {
}

FormDataUploadResponseDataSignMapAdditionalProp2 $FormDataUploadResponseDataSignMapAdditionalProp2FromJson(
    Map<String, dynamic> json) {
  final FormDataUploadResponseDataSignMapAdditionalProp2 formDataUploadResponseDataSignMapAdditionalProp2 = FormDataUploadResponseDataSignMapAdditionalProp2();
  return formDataUploadResponseDataSignMapAdditionalProp2;
}

Map<String, dynamic> $FormDataUploadResponseDataSignMapAdditionalProp2ToJson(
    FormDataUploadResponseDataSignMapAdditionalProp2 entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  return data;
}

extension FormDataUploadResponseDataSignMapAdditionalProp2Extension on FormDataUploadResponseDataSignMapAdditionalProp2 {
}

FormDataUploadResponseDataSignMapAdditionalProp3 $FormDataUploadResponseDataSignMapAdditionalProp3FromJson(
    Map<String, dynamic> json) {
  final FormDataUploadResponseDataSignMapAdditionalProp3 formDataUploadResponseDataSignMapAdditionalProp3 = FormDataUploadResponseDataSignMapAdditionalProp3();
  return formDataUploadResponseDataSignMapAdditionalProp3;
}

Map<String, dynamic> $FormDataUploadResponseDataSignMapAdditionalProp3ToJson(
    FormDataUploadResponseDataSignMapAdditionalProp3 entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  return data;
}

extension FormDataUploadResponseDataSignMapAdditionalProp3Extension on FormDataUploadResponseDataSignMapAdditionalProp3 {
}