import 'package:flutter/services.dart';

class AliyunOssUploadProgress {
  AliyunOssUploadProgress._();

  static const EventChannel _eventChannel = EventChannel('aliyun_oss_upload_progress');

  static Stream<double> progressStream() {
    return _eventChannel.receiveBroadcastStream().map((event) {
      if (event is num) {
        return event.toDouble().clamp(0.0, 1.0);
      }
      return 0.0;
    });
  }
}
