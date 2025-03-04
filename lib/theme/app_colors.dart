import 'package:flutter/material.dart';
import 'package:prueba_prix/core/extensions/string_extensions.dart';

abstract class AppColors {
  static final Color hbWhite = "#FFFDFAFC".toColor();
  static final Color hbBlue = "#503d76".toColor();
  static final Color hbBlueAccent = "#8A4ABD".toColor();
  static const Color twilight = Color(0xFF503d76);
  static final Color hbPink = "#FC3894".toColor();
  static final Color hbGreen = "#1FC690".toColor();
  static final Color hbGreenAccent = "#d1f0e7".toColor();
  static final Color hbGreenBackground = "#1fc690".toColor();
  static final Color hDarkPurple = "#513d76".toColor();
  static final Color hbGrey = "#666680".toColor();
  static final Color hbYellow = "#eda83a".toColor();
  static final Color hbGreyAccent = "#FDFAFC".toColor();
  static final Color hbBluishGrey = "#b2b3d5".toColor();
  static final Color hbGreyBlue = "#7C7EB2".toColor();
  static final Color hbGreyText = "#b2b3d5".toColor();
  static final Color hbGreySecondary = "#eae3ee".toColor();
  static final Color hbVioletText = "#956fab".toColor();
  static final Color newHbGrey = "#B2B3D5".toColor();
  static final Color newPaleGrey = "#f0f2f7".toColor();
  static final Color hbGreyBackground = "#d5d6e9".toColor();
  static final Color hbRed = "#ed3a4e".toColor();
  static final Color hbBlueAppointments = "#1f93c6".toColor();
  static final Color hbDefaultPolicyCardColor = "#0093D0".toColor();
  static final Color hbBlueText = "#3a2a5d".toColor();
  static final Color hbBrown = "#444444".toColor();
  static final Color hbYellowPolicy = "#fcfae8".toColor();
  static final Color hbRedPolicy = "#fdebed".toColor();
  static final Color hbGreyPolicy = "#f2f2f7".toColor();
  static final Color hbIconYellowPolicy = "#decf1d".toColor();
  static final Color hbIconRedPolicy = "#ed3b4e".toColor();
  static final Color hbIconGreenPolicy = "#1fc690".toColor();
  static final Color hbBrownishOrange = "#de9b1d".toColor();
  static final Color hbMossGreen = "#8aac49".toColor();
  static final Color hbLightGreyGreen = "#d0e6a5".toColor();
  static final Color hbLightGreen = "#ddf7ee".toColor();
  static final Color hbLightGreen2 = "#e8f9f4".toColor();
  static final Color hbLightRed = "#fde1e4".toColor();
  static final Color hbLightBlue = "#d2e9f4".toColor();
  static final Color hbLightYellow = "#fff9d5".toColor();
  static final Color hbLightOrange = "#ffead5".toColor();
  static final Color pivotGradient0 = "#0773c3".toColor();
  static final Color pivotGradient1 = "#334a84".toColor();
  static final Color hbViolet2 = "#9c9dc5".toColor();
  static final Color hbLightViolet2 = "#eaeaf4".toColor();
  static final Color hbMauve = "#e1c1ff".toColor();
  static final Color hbFoird = "#515B60".toColor();
  static final Color hbBlueViolet = "#9433F0".toColor();
  static final Color hbMagnolia = "#F4EAFD".toColor();
  static final Color hbPinkFlamingo = "#FF41FA".toColor();
  static final Color hbElectricPurple = "#A100FF".toColor();
  static final Color hbGorse = "#FFDB27".toColor();
  static final Color hbWisper = "#E9E9E9".toColor();
  static final Color hbAmethyst = "#9664CB".toColor();

  static List<Color> getHomeGradientColors() {
    final now = DateTime.now();
    final hour = now.hour;
    if (hour >= 6 && hour < 12) return [const Color(0xFFf0f0df), Colors.white];
    if (hour >= 12 && hour < 18) return [const Color(0xFFd8eaea), Colors.white];
    if (hour >= 18 && hour < 21) return [const Color(0xFFede3de), Colors.white];
    return [const Color(0xFFd6d9eb), Colors.white];
  }

// Gradients
  static final rxCardGradientColors = [
    hbBlue,
    hbBlue,
    hbBlue,
    hbPink,
    hbPink,
    hbPink,
  ];
}
