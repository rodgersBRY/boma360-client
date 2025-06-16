import 'package:client/config/theme/colors.dart';
import 'package:flutter/cupertino.dart';

class AppTextStyles {
  static const title = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const altTitle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  static const subtitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );

  static const body = TextStyle(fontSize: 16, color: AppColors.textPrimary);
}
