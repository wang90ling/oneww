import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
    try {
      // 延迟加载以确保平台通道已初始化
      await Future.delayed(const Duration(milliseconds: 100));
    } catch (_) {
      // 忽略初始化错误
    }
  }
  runApp(const MyApp());
}
