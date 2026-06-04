import 'package:flutter/material.dart';

class DeviceUtils {
  static bool isKeyboardVisible(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom > 0;
  }

  static double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

  static double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
}
