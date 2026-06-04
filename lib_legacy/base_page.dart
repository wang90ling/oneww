import 'package:flutter/material.dart';

/**
 * 基础页面page
 */
class BasePage extends StatelessWidget {
  const BasePage({
    super.key,
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: child,
    );
  }
}
