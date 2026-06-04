import 'package:permission_handler/permission_handler.dart';

import '../helpers/app_logger.dart';
import '../helpers/permission_types.dart';

class PermissionService {
  static Future<bool> requestPermission(AppPermission permission) async {
    final status = await _requestPermission(permission);
    AppLogger.info('${permission.description}权限状态: $status', tag: 'Permission');
    return status.isGranted;
  }

  static Future<bool> requestPermissions(List<AppPermission> permissions) async {
    final Map<Permission, PermissionStatus> statuses = await _requestPermissions(permissions);
    
    bool allGranted = true;
    for (int i = 0; i < permissions.length; i++) {
      final permission = permissions[i];
      final status = statuses[_getPermission(permission)];
      AppLogger.info('${permission.description}权限状态: $status', tag: 'Permission');
      if (status != null && !status.isGranted) {
        allGranted = false;
      }
    }
    
    return allGranted;
  }

  static Future<bool> checkPermission(AppPermission permission) async {
    final status = await _checkPermission(permission);
    AppLogger.info('检查${permission.description}权限: $status', tag: 'Permission');
    return status.isGranted;
  }

  static Future<bool> shouldShowRequestRationale(AppPermission permission) async {
    return await _getPermission(permission).shouldShowRequestRationale;
  }

  static Future<void> openAppSettings() async {
    await openAppSettings();
    AppLogger.info('已打开应用设置', tag: 'Permission');
  }

  static Permission _getPermission(AppPermission permission) {
    switch (permission) {
      case AppPermission.camera:
        return Permission.camera;
      case AppPermission.microphone:
        return Permission.microphone;
      case AppPermission.photos:
        return Permission.photos;
      case AppPermission.storage:
        return Permission.storage;
      case AppPermission.location:
        return Permission.location;
      case AppPermission.notifications:
        return Permission.notification;
    }
  }

  static Future<PermissionStatus> _requestPermission(AppPermission permission) async {
    final perm = _getPermission(permission);
    return await perm.request();
  }

  static Future<Map<Permission, PermissionStatus>> _requestPermissions(List<AppPermission> permissions) async {
    final List<Permission> perms = permissions.map(_getPermission).toList();
    return await perms.request();
  }

  static Future<PermissionStatus> _checkPermission(AppPermission permission) async {
    final perm = _getPermission(permission);
    return await perm.status;
  }
}
