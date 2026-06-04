enum AppPermission {
  camera,
  microphone,
  photos,
  storage,
  location,
  notifications,
}

extension AppPermissionExtension on AppPermission {
  String get description {
    switch (this) {
      case AppPermission.camera:
        return '相机';
      case AppPermission.microphone:
        return '麦克风';
      case AppPermission.photos:
        return '相册';
      case AppPermission.storage:
        return '存储';
      case AppPermission.location:
        return '位置';
      case AppPermission.notifications:
        return '通知';
    }
  }

  String get rationale {
    switch (this) {
      case AppPermission.camera:
        return '需要相机权限来拍摄照片和视频';
      case AppPermission.microphone:
        return '需要麦克风权限来录制音频';
      case AppPermission.photos:
        return '需要相册权限来访问和保存图片';
      case AppPermission.storage:
        return '需要存储权限来保存文件';
      case AppPermission.location:
        return '需要位置权限来获取当前位置';
      case AppPermission.notifications:
        return '需要通知权限来接收推送消息';
    }
  }
}
