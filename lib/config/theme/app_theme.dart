import 'package:client/config/constants.dart';
import 'package:client/config/theme/colors.dart';
import 'package:client/config/theme/text_styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.secondary,
        foregroundColor: AppColors.white,
        elevation: 0,
      ),
      textTheme: TextTheme(
        headlineLarge: AppTextStyles.title,
        headlineMedium: AppTextStyles.subtitle,
        headlineSmall: AppTextStyles.body,
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: AppColors.secondary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kDefaultRadius),
          ),
        ),
      ),
    );
  }
}
