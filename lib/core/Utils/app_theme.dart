 import 'package:flutter/material.dart';
import 'package:levado/Core/Utils/styles.dart';

import 'colors.dart';

abstract class AppTheme {
  static ThemeData appThemeData = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColor.primaryColor,
      selectedItemColor: AppColor.backColor,
      unselectedItemColor:  AppColor.textBodyGre,
      showUnselectedLabels: true,
      selectedIconTheme: const IconThemeData(
        size: 30,

      ),
    ),
    textTheme: TextTheme(
      bodyLarge: Styles.textStyle25,
      bodyMedium: Styles.textStyle17,
      bodySmall: Styles.textStyle16,
    ),
    scaffoldBackgroundColor: AppColor.backColor,
    colorScheme:
    ColorScheme.fromSwatch().copyWith(primary: AppColor.primaryColor),
  );
}
