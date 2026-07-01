import 'package:oneww/generated/json/base/json_convert_content.dart';
import 'package:oneww/models/form_data_upload_request_entity.dart';

FormDataUploadRequestEntity $FormDataUploadRequestEntityFromJson(
    Map<String, dynamic> json) {
  final FormDataUploadRequestEntity formDataUploadRequestEntity = FormDataUploadRequestEntity();
  final String? bucketType = jsonConvert.convert<String>(json['bucketType']);
  if (bucketType != null) {
    formDataUploadRequestEntity.bucketType = bucketType;
  }
  final String? fileName = jsonConvert.convert<String>(json['fileName']);
  if (fileName != null) {
    formDataUploadRequestEntity.fileName = fileName;
  }
  return formDataUploadRequestEntity;
}

Map<String, dynamic> $FormDataUploadRequestEntityToJson(
    FormDataUploadRequestEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['bucketType'] = entity.bucketType;
  data['fileName'] = entity.fileName;
  return data;
}

extension FormDataUploadRequestEntityExtension on FormDataUploadRequestEntity {
  FormDataUploadRequestEntity copyWith({
    String? bucketType,
    String? fileName,
  }) {
    return FormDataUploadRequestEntity()
      ..bucketType = bucketType ?? this.bucketType
      ..fileName = fileName ?? this.fileName;
  }
}