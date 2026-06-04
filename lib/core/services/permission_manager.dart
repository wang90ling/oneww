import '../helpers/app_logger.dart';
import '../helpers/permission_types.dart';
import 'permission_service.dart';

typedef PermissionCallback = void Function(bool granted);
typedef ShowRationaleCallback = Future<bool> Function(AppPermission permission);

class PermissionManager {
  final ShowRationaleCallback? showRationaleCallback;

  PermissionManager({this.showRationaleCallback});

  Future<bool> requestWithCheck(
    AppPermission permission, {
    bool showRationale = true,
  }) async {
    AppLogger.info('请求权限: ${permission.description}', tag: 'PermissionManager');

    final currentStatus = await PermissionService.checkPermission(permission);
    
    if (currentStatus) {
      AppLogger.info('${permission.description}权限已授予', tag: 'PermissionManager');
      return true;
    }

    if (showRationale) {
      final shouldShow = await PermissionService.shouldShowRequestRationale(permission);
      if (shouldShow && showRationaleCallback != null) {
        final proceed = await showRationaleCallback!(permission);
        if (!proceed) {
          AppLogger.info('用户拒绝了权限说明', tag: 'PermissionManager');
          return false;
        }
      }
    }

    final granted = await PermissionService.requestPermission(permission);
    
    if (granted) {
      AppLogger.info('${permission.description}权限请求成功', tag: 'PermissionManager');
    } else {
      AppLogger.info('${permission.description}权限请求失败', tag: 'PermissionManager');
    }

    return granted;
  }

  Future<bool> requestMultipleWithCheck(
    List<AppPermission> permissions, {
    bool showRationale = true,
  }) async {
    AppLogger.info('批量请求权限: ${permissions.map((p) => p.description).join(', ')}', 
      tag: 'PermissionManager');

    final grantedPermissions = <AppPermission>[];
    final needRequestPermissions = <AppPermission>[];

    for (final permission in permissions) {
      if (await PermissionService.checkPermission(permission)) {
        grantedPermissions.add(permission);
      } else {
        needRequestPermissions.add(permission);
      }
    }

    if (grantedPermissions.length == permissions.length) {
      AppLogger.info('所有权限已授予', tag: 'PermissionManager');
      return true;
    }

    if (showRationale && showRationaleCallback != null) {
      final proceed = await showRationaleCallback!(needRequestPermissions.first);
      if (!proceed) {
        AppLogger.info('用户拒绝了权限说明', tag: 'PermissionManager');
        return false;
      }
    }

    final granted = await PermissionService.requestPermissions(needRequestPermissions);
    
    if (granted) {
      AppLogger.info('批量权限请求成功', tag: 'PermissionManager');
    } else {
      AppLogger.info('批量权限请求失败', tag: 'PermissionManager');
    }

    return granted;
  }

  Future<void> ensurePermissions(List<AppPermission> permissions) async {
    AppLogger.info('确保权限: ${permissions.map((p) => p.description).join(', ')}', 
      tag: 'PermissionManager');
    
    for (final permission in permissions) {
      await requestWithCheck(permission);
    }
  }
}
