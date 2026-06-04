import 'package:flutter/widgets.dart';

class DeviceHelper {
  static double screenWidth(BuildContext context) => MediaQuery.sizeOf(context).width;

  static double screenHeight(BuildContext context) => MediaQuery.sizeOf(context).height;

  static EdgeInsets screenPadding(BuildContext context) => MediaQuery.paddingOf(context);

  static bool isTablet(BuildContext context) => screenWidth(context) >= 600;
}
