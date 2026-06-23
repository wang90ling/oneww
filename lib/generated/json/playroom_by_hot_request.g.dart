import 'package:oneww/generated/json/base/json_convert_content.dart';
import 'package:oneww/models/playroom_by_hot_request.dart';

PlayroomByHotRequest $PlayroomByHotRequestFromJson(Map<String, dynamic> json) {
  final PlayroomByHotRequest playroomByHotRequest = PlayroomByHotRequest();
  final int? pageNo = jsonConvert.convert<int>(json['pageNo']);
  if (pageNo != null) {
    playroomByHotRequest.pageNo = pageNo;
  }
  final int? pageSize = jsonConvert.convert<int>(json['pageSize']);
  if (pageSize != null) {
    playroomByHotRequest.pageSize = pageSize;
  }
  return playroomByHotRequest;
}

Map<String, dynamic> $PlayroomByHotRequestToJson(PlayroomByHotRequest entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['pageNo'] = entity.pageNo;
  data['pageSize'] = entity.pageSize;
  return data;
}

extension PlayroomByHotRequestExtension on PlayroomByHotRequest {
  PlayroomByHotRequest copyWith({
    int? pageNo,
    int? pageSize,
  }) {
    return PlayroomByHotRequest()
      ..pageNo = pageNo ?? this.pageNo
      ..pageSize = pageSize ?? this.pageSize;
  }
}