import 'package:oneww/generated/json/base/json_field.dart';
import 'package:oneww/generated/json/form_data_upload_request_entity.g.dart';
import 'dart:convert';
export 'package:oneww/generated/json/form_data_upload_request_entity.g.dart';

@JsonSerializable()
class FormDataUploadRequestEntity {
	String bucketType = '';
	String fileName = '';

	FormDataUploadRequestEntity();

	factory FormDataUploadRequestEntity.fromJson(Map<String, dynamic> json) => $FormDataUploadRequestEntityFromJson(json);

	Map<String, dynamic> toJson() => $FormDataUploadRequestEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}