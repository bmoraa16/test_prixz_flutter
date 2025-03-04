import 'package:flutter/material.dart';

class ScreenHelper {
  static double getNavbarMultiplier() {
    final screenHeight = MediaQueryData.fromView(
            WidgetsBinding.instance.platformDispatcher.views.first)
        .size
        .height;
    if (screenHeight == 667) return 0.1;
    if (screenHeight == 736) return 0.1;
    if (screenHeight == 812) return 0.11;
    if (screenHeight == 844) return 0.11;
    if (screenHeight == 852) return 0.11;
    if (screenHeight == 896) return 0.1;
    if (screenHeight == 926) return 0.1;
    if (screenHeight == 932) return 0.1;
    return 0.1;
  }
}
