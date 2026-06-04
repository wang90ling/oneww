import 'package:flutter/material.dart';

import '../../core/helpers/app_logger.dart';
import '../../core/helpers/permission_types.dart';
import '../../core/services/permission_manager.dart';
import '../../core/widgets/app_card.dart';

class PermissionDemoPage extends StatefulWidget {
  const PermissionDemoPage({super.key});

  @override
  State<PermissionDemoPage> createState() => _PermissionDemoPageState();
}

class _PermissionDemoPageState extends State<PermissionDemoPage> {
  late PermissionManager _permissionManager;
  String _statusMessage = '';

  @override
  void initState() {
    super.initState();
    _permissionManager = PermissionManager(
      showRationaleCallback: (permission) async {
        return await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('需要${permission.description}权限'),
            content: Text(permission.rationale),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('取消'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text('确定'),
              ),
            ],
          ),
        ) ?? false;
      },
    );
  }

  Future<void> _requestCamera() async {
    AppLogger.info('开始请求相机权限', tag: 'PermissionDemo');
    final granted = await _permissionManager.requestWithCheck(AppPermission.camera);
    setState(() {
      _statusMessage = granted ? '相机权限已授予' : '相机权限被拒绝';
    });
  }

  Future<void> _requestMicrophone() async {
    AppLogger.info('开始请求麦克风权限', tag: 'PermissionDemo');
    final granted = await _permissionManager.requestWithCheck(AppPermission.microphone);
    setState(() {
      _statusMessage = granted ? '麦克风权限已授予' : '麦克风权限被拒绝';
    });
  }

  Future<void> _requestPhotos() async {
    AppLogger.info('开始请求相册权限', tag: 'PermissionDemo');
    final granted = await _permissionManager.requestWithCheck(AppPermission.photos);
    setState(() {
      _statusMessage = granted ? '相册权限已授予' : '相册权限被拒绝';
    });
  }

  Future<void> _requestRecordPermissions() async {
    AppLogger.info('开始请求录音和视频权限', tag: 'PermissionDemo');
    final granted = await _permissionManager.requestMultipleWithCheck([
      AppPermission.camera,
      AppPermission.microphone,
    ]);
    setState(() {
      _statusMessage = granted ? '录音/录像权限已授予' : '录音/录像权限被拒绝';
    });
  }

  Widget _buildPermissionButton({
    required String title,
    required String description,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return AppCard(
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(icon, size: 28),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 18),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('权限管理'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (_statusMessage.isNotEmpty)
            AppCard(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  _statusMessage,
                  style: TextStyle(
                    color: _statusMessage.contains('已授予') ? Colors.green : Colors.red,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          const SizedBox(height: 16),
          _buildPermissionButton(
            title: '相机权限',
            description: '用于拍照和扫描',
            icon: Icons.camera,
            onPressed: _requestCamera,
          ),
          const SizedBox(height: 12),
          _buildPermissionButton(
            title: '麦克风权限',
            description: '用于录音',
            icon: Icons.mic,
            onPressed: _requestMicrophone,
          ),
          const SizedBox(height: 12),
          _buildPermissionButton(
            title: '相册权限',
            description: '用于访问图片',
            icon: Icons.photo_library,
            onPressed: _requestPhotos,
          ),
          const SizedBox(height: 12),
          _buildPermissionButton(
            title: '录音/录像',
            description: '同时请求相机和麦克风',
            icon: Icons.videocam,
            onPressed: _requestRecordPermissions,
          ),
        ],
      ),
    );
  }
}
