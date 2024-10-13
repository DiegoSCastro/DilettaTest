import 'package:flutter/material.dart';

import '../../../app.dart';

class ThemeConfig {
  static final theme = ThemeData(
    primaryColor: AppColors.primary,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      secondary: AppColors.secondary,
      tertiary: AppColors.yellow,
      outline: AppColors.gray,
    ),
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
    ),
  );
}
