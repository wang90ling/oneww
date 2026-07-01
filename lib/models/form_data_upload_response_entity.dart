import 'package:oneww/generated/json/base/json_field.dart';
import 'package:oneww/generated/json/form_data_upload_response_entity.g.dart';
import 'dart:convert';
export 'package:oneww/generated/json/form_data_upload_response_entity.g.dart';

@JsonSerializable()
class FormDataUploadResponseEntity {
	@JSONField(name: 'request_id')
	String requestId = '';
	int code = 0;
	String message = '';
	late FormDataUploadResponseData data;

	FormDataUploadResponseEntity();

	factory FormDataUploadResponseEntity.fromJson(Map<String, dynamic> json) => $FormDataUploadResponseEntityFromJson(json);

	Map<String, dynamic> toJson() => $FormDataUploadResponseEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class FormDataUploadResponseData {
	String accessKeyId = '';
	String policy = '';
	String signature = '';
	String secretId = '';
	String secretKey = '';
	String sessionToken = '';
	String endpoint = '';
	String filePath = '';
	int startTime = 0;
	int expiredTime = 0;
	String requestId = '';
	late FormDataUploadResponseDataSignMap signMap;

	FormDataUploadResponseData();

	factory FormDataUploadResponseData.fromJson(Map<String, dynamic> json) => $FormDataUploadResponseDataFromJson(json);

	Map<String, dynamic> toJson() => $FormDataUploadResponseDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class FormDataUploadResponseDataSignMap {
	late FormDataUploadResponseDataSignMapAdditionalProp1 additionalProp1;
	late FormDataUploadResponseDataSignMapAdditionalProp2 additionalProp2;
	late FormDataUploadResponseDataSignMapAdditionalProp3 additionalProp3;

	FormDataUploadResponseDataSignMap();

	factory FormDataUploadResponseDataSignMap.fromJson(Map<String, dynamic> json) => $FormDataUploadResponseDataSignMapFromJson(json);

	Map<String, dynamic> toJson() => $FormDataUploadResponseDataSignMapToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class FormDataUploadResponseDataSignMapAdditionalProp1 {


	FormDataUploadResponseDataSignMapAdditionalProp1();

	factory FormDataUploadResponseDataSignMapAdditionalProp1.fromJson(Map<String, dynamic> json) => $FormDataUploadResponseDataSignMapAdditionalProp1FromJson(json);

	Map<String, dynamic> toJson() => $FormDataUploadResponseDataSignMapAdditionalProp1ToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class FormDataUploadResponseDataSignMapAdditionalProp2 {


	FormDataUploadResponseDataSignMapAdditionalProp2();

	factory FormDataUploadResponseDataSignMapAdditionalProp2.fromJson(Map<String, dynamic> json) => $FormDataUploadResponseDataSignMapAdditionalProp2FromJson(json);

	Map<String, dynamic> toJson() => $FormDataUploadResponseDataSignMapAdditionalProp2ToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class FormDataUploadResponseDataSignMapAdditionalProp3 {


	FormDataUploadResponseDataSignMapAdditionalProp3();

	factory FormDataUploadResponseDataSignMapAdditionalProp3.fromJson(Map<String, dynamic> json) => $FormDataUploadResponseDataSignMapAdditionalProp3FromJson(json);

	Map<String, dynamic> toJson() => $FormDataUploadResponseDataSignMapAdditionalProp3ToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}