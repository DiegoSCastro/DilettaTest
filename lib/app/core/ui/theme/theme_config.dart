import 'package:flutter/material.dart';

import '../../../app.dart';

class ThemeConfig {
  static final theme = ThemeData(
    useMaterial3: false,
    primaryColor: AppColors.primary,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      secondary: AppColors.secondary,
    ),
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
    ),
  );
}
