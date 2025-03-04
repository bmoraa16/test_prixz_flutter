import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:prueba_prix/theme/app_colors.dart';

class Helpers {
  static Future<String> fixture(String name) async {
    final result = await rootBundle.loadString('assets/json/$name');
    return result;
  }

  static String? getStateAbbreviation(String stateName) {
    // Map of state names to their two-letter abbreviations
    Map<String, String> states = {
      'Alabama': 'AL',
      'Alaska': 'AK',
      'Arizona': 'AZ',
      'Arkansas': 'AR',
      'California': 'CA',
      'Colorado': 'CO',
      'Connecticut': 'CT',
      'Delaware': 'DE',
      'Florida': 'FL',
      'Georgia': 'GA',
      'Hawaii': 'HI',
      'Idaho': 'ID',
      'Illinois': 'IL',
      'Indiana': 'IN',
      'Iowa': 'IA',
      'Kansas': 'KS',
      'Kentucky': 'KY',
      'Louisiana': 'LA',
      'Maine': 'ME',
      'Maryland': 'MD',
      'Massachusetts': 'MA',
      'Michigan': 'MI',
      'Minnesota': 'MN',
      'Mississippi': 'MS',
      'Missouri': 'MO',
      'Montana': 'MT',
      'Nebraska': 'NE',
      'Nevada': 'NV',
      'New Hampshire': 'NH',
      'New Jersey': 'NJ',
      'New Mexico': 'NM',
      'New York': 'NY',
      'North Carolina': 'NC',
      'North Dakota': 'ND',
      'Ohio': 'OH',
      'Oklahoma': 'OK',
      'Oregon': 'OR',
      'Pennsylvania': 'PA',
      'Rhode Island': 'RI',
      'South Carolina': 'SC',
      'South Dakota': 'SD',
      'Tennessee': 'TN',
      'Texas': 'TX',
      'Utah': 'UT',
      'Vermont': 'VT',
      'Virginia': 'VA',
      'Washington': 'WA',
      'West Virginia': 'WV',
      'Wisconsin': 'WI',
      'Wyoming': 'WY',
    };

    // Return the abbreviation if it exists, or null if not found
    return states[stateName];
  }

  static bool isSameDay(DateTime a, DateTime b) {
    if (a.year == b.year && a.month == b.month && a.day == b.day) {
      return true;
    }
    return false;
  }

  static String formatDate(DateTime date) {
    DateFormat formatter = DateFormat('MMM dd, yyyy');
    String formattedDate = formatter.format(date);
    return formattedDate;
  }

  static String dateToString(DateTime dateTime) {
    final String day =
        dateTime.day < 10 ? '0${dateTime.day}' : '${dateTime.day}';
    final String month =
        dateTime.month < 10 ? '0${dateTime.month}' : '${dateTime.month}';
    final String year = '${dateTime.year}';

    return '$year/$month/$day';
  }

  static String dateWithTimeToString(DateTime dateTime) {
    final day = dateTime.day < 10 ? '0${dateTime.day}' : '${dateTime.day}';
    final month =
        dateTime.month < 10 ? '0${dateTime.month}' : '${dateTime.month}';
    final year = '${dateTime.year}';
    final hour = dateTime.hour < 10 ? '0${dateTime.hour}' : '${dateTime.hour}';
    final minute =
        dateTime.minute < 10 ? '0${dateTime.minute}' : '${dateTime.minute}';
    final seconds =
        dateTime.second < 10 ? '0${dateTime.second}' : '${dateTime.second}';
    final date = '$day-$month-$year $hour:$minute:$seconds';
    return date;
  }

  static Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  static double getScreenMultiplier() {
    final screenHeight = MediaQueryData.fromView(
            WidgetsBinding.instance.platformDispatcher.views.first)
        .size
        .height;
    if (screenHeight == 667) return 0.18;
    if (screenHeight == 736) return 0.17;
    if (screenHeight == 812) return 0.17;
    if (screenHeight == 844) return 0.17;
    if (screenHeight == 852) return 0.16;
    if (screenHeight == 896) return 0.16;
    if (screenHeight == 926) return 0.16;
    if (screenHeight == 932) return 0.16;
    return 0.16;
  }

  static double getHalfScreenMultiplier() {
    final screenHeight = MediaQueryData.fromView(
            WidgetsBinding.instance.platformDispatcher.views.first)
        .size
        .height;
    if (screenHeight == 667) return 0.65;
    if (screenHeight == 736) return 0.60;
    if (screenHeight == 812) return 0.60;
    if (screenHeight == 844) return 0.55;
    if (screenHeight == 852) return 0.55;
    if (screenHeight == 896) return 0.55;
    if (screenHeight == 926) return 0.55;
    if (screenHeight == 932) return 0.55;
    return 0.55;
  }

  static double getFullScreenMultiplier() {
    final screenHeight = MediaQueryData.fromView(
            WidgetsBinding.instance.platformDispatcher.views.first)
        .size
        .height;
    if (screenHeight == 667) return 0.90;
    if (screenHeight == 736) return 0.80;
    if (screenHeight == 812) return 0.80;
    if (screenHeight == 844) return 0.80;
    if (screenHeight == 852) return 0.80;
    if (screenHeight == 896) return 0.80;
    if (screenHeight == 926) return 0.80;
    if (screenHeight == 932) return 0.80;
    return 0.80;
  }

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

  static double getFirstStepMultiplier() {
    final screenHeight = MediaQueryData.fromView(
            WidgetsBinding.instance.platformDispatcher.views.first)
        .size
        .height;
    if (screenHeight == 667) return 0.40;
    if (screenHeight == 736) return 0.36;
    if (screenHeight == 812) return 0.35;
    if (screenHeight == 844) return 0.33;
    if (screenHeight == 852) return 0.33;
    if (screenHeight == 896) return 0.31;
    if (screenHeight == 926) return 0.30;
    if (screenHeight == 932) return 0.30;
    return 0.23;
  }

  static double getSecondStepStepMultiplier() {
    final screenHeight = MediaQueryData.fromView(
            WidgetsBinding.instance.platformDispatcher.views.first)
        .size
        .height;
    if (screenHeight == 667) return 0.47;
    if (screenHeight == 736) return 0.42;
    if (screenHeight == 812) return 0.42;
    if (screenHeight == 844) return 0.33;
    if (screenHeight == 852) return 0.33;
    if (screenHeight == 896) return 0.33;
    if (screenHeight == 926) return 0.33;
    if (screenHeight == 932) return 0.33;
    return 0.33;
  }

  static double getThirdStepStepMultiplier() {
    final screenHeight = MediaQueryData.fromView(
            WidgetsBinding.instance.platformDispatcher.views.first)
        .size
        .height;
    if (screenHeight == 667) return 0.47;
    if (screenHeight == 736) return 0.44;
    if (screenHeight == 812) return 0.40;
    if (screenHeight == 844) return 0.38;
    if (screenHeight == 852) return 0.38;
    if (screenHeight == 896) return 0.36;
    if (screenHeight == 926) return 0.35;
    if (screenHeight == 932) return 0.33;
    return 0.33;
  }

  static double getFourthFifthStepStepMultiplier() {
    final screenHeight = MediaQueryData.fromView(
            WidgetsBinding.instance.platformDispatcher.views.first)
        .size
        .height;
    if (screenHeight == 667) return 0.70;
    if (screenHeight == 736) return 0.65;
    if (screenHeight == 812) return 0.65;
    if (screenHeight == 844) return 0.58;
    if (screenHeight == 852) return 0.58;
    if (screenHeight == 896) return 0.58;
    if (screenHeight == 926) return 0.58;
    if (screenHeight == 932) return 0.58;
    return 0.58;
  }

  static double getPolicyCardWidthMultiplier() {
    final screenHeight = MediaQueryData.fromView(
            WidgetsBinding.instance.platformDispatcher.views.first)
        .size
        .height;
    if (screenHeight == 667) return 0.90;
    if (screenHeight == 736) return 0.80;
    if (screenHeight == 812) return 0.80;
    if (screenHeight == 844) return 0.75;
    if (screenHeight == 852) return 0.75;
    if (screenHeight == 896) return 0.75;
    if (screenHeight == 926) return 0.75;
    if (screenHeight == 932) return 0.75;
    return 0.75;
  }

  static double getPolicyCardWidthPadding() {
    final screenHeight = MediaQueryData.fromView(
            WidgetsBinding.instance.platformDispatcher.views.first)
        .size
        .height;
    if (screenHeight < 667) return 8;
    if (screenHeight == 667) return 8;
    if (screenHeight == 736) return 10;
    if (screenHeight == 812) return 9;
    if (screenHeight == 844) return 10;
    if (screenHeight == 852) return 10;
    if (screenHeight == 896) return 12;
    if (screenHeight == 926) return 12;
    if (screenHeight == 932) return 12;
    return 12;
  }

  static double getTextSize() {
    final screenHeight = MediaQueryData.fromView(
            WidgetsBinding.instance.platformDispatcher.views.first)
        .size
        .height;
    // if (screenHeight == 667) return 13;
    // if (screenHeight == 736) return 13;
    if (screenHeight <= 812) return 13;
    if (screenHeight == 844) return 14;
    if (screenHeight == 852) return 14;
    if (screenHeight == 896) return 14;
    if (screenHeight == 926) return 14;
    if (screenHeight == 932) return 16;
    return 16;
  }

  static double getButtonWidthMultiplier() {
    final screenHeight = MediaQueryData.fromView(
            WidgetsBinding.instance.platformDispatcher.views.first)
        .size
        .height;
    if (screenHeight == 667) return 0.35;
    if (screenHeight == 736) return 0.38;
    if (screenHeight == 812) return 0.38;
    if (screenHeight == 844) return 0.30;
    if (screenHeight == 852) return 0.30;
    if (screenHeight == 896) return 0.30;
    if (screenHeight == 926) return 0.30;
    if (screenHeight == 932) return 0.30;
    return 0.30;
  }

  static double getTitleWidthMultiplier() {
    final screenHeight = MediaQueryData.fromView(
            WidgetsBinding.instance.platformDispatcher.views.first)
        .size
        .height;
    if (screenHeight == 667) return 0.35;
    if (screenHeight == 736) return 0.38;
    if (screenHeight == 812) return 0.38;
    if (screenHeight == 844) return 0.43;
    if (screenHeight == 852) return 0.43;
    if (screenHeight == 896) return 0.43;
    if (screenHeight == 926) return 0.43;
    if (screenHeight == 932) return 0.50;
    return 0.43;
  }

  static double getOnboardingPageViewMultiplier() {
    final screenHeight = MediaQueryData.fromView(
            WidgetsBinding.instance.platformDispatcher.views.first)
        .size
        .height;
    if (screenHeight == 667) return 0.75;
    if (screenHeight == 736) return 0.70;
    if (screenHeight == 812) return 0.70;
    if (screenHeight == 844) return 0.65;
    if (screenHeight == 852) return 0.65;
    if (screenHeight == 896) return 0.65;
    if (screenHeight == 926) return 0.65;
    if (screenHeight == 932) return 0.65;
    return 0.65;
  }

  static double getOnboardingImageMultiplier() {
    final screenHeight = MediaQueryData.fromView(
            WidgetsBinding.instance.platformDispatcher.views.first)
        .size
        .height;
    if (screenHeight == 667) return 0.55;
    if (screenHeight == 736) return 0.45;
    if (screenHeight == 812) return 0.45;
    if (screenHeight == 844) return 0.65;
    if (screenHeight == 852) return 0.65;
    if (screenHeight == 896) return 0.65;
    if (screenHeight == 926) return 0.65;
    if (screenHeight == 932) return 0.65;
    return 0.65;
  }

  static DateTime? stringToDate(String? date, {DateFormat? format}) {
    if (date == null) return null;
    format ??= DateFormat("dd-MM-yy HH:mm:ss");
    final DateTime dateTime = format.parse(date);
    return dateTime;
  }

  static String removeSeconds(String time) {
    List<String> parts = time.split(':');
    return '${parts[0]}:${parts[1]}';
  }

  static bool isSameDate(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  static String getDayName(int weekday) {
    switch (weekday) {
      case 1:
        return 'MON';
      case 2:
        return 'TUE';
      case 3:
        return 'WED';
      case 4:
        return 'THU';
      case 5:
        return 'FRI';
      case 6:
        return 'SAT';
      case 7:
        return 'SUN';
      default:
        return '?';
    }
  }

  static Color getTitleColor(
    bool hasMedications,
    DateTime calendarDate,
    DateTime selectedDate,
  ) {
    final dateStringOne = calendarDate.toString();
    final dateStringTwo =
        DateTime.utc(selectedDate.year, selectedDate.month, selectedDate.day)
            .toString();
    if (dateStringOne == dateStringTwo) {
      return Colors.white;
    } else if (hasMedications && dateStringOne != dateStringTwo) {
      return AppColors.hbVioletText;
    }
    return AppColors.hbBluishGrey;
  }

  static Color getBackgroundColor(
      bool hasMedications, DateTime calendarDate, DateTime selectedDate) {
    final dateStringOne = calendarDate.toString();
    final dateStringTwo = DateTime.utc(
            selectedDate.year, selectedDate.month, selectedDate.day, 0, 0, 0, 0)
        .toString();
    if (hasMedications && dateStringOne == dateStringTwo) {
      return Colors.white;
    } else if (hasMedications && dateStringOne != dateStringTwo) {
      return AppColors.hbVioletText;
    }
    return Colors.white;
  }
}

enum LaunchType { call, sms, whatsapp, web, map }
