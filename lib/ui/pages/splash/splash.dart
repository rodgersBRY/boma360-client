import 'package:client/config/theme/colors.dart';
import 'package:client/ui/pages/splash/splash_controller.dart';
import 'package:client/ui/widgets/auth/logo_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class SplashWidget extends StatelessWidget {
  const SplashWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<SplashController>();

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SizedBox(
        width: screenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: Container()),
            LogoAvatar(logoSize: screenHeight),
            const SizedBox(height: 12),
            Text.rich(
              TextSpan(
                text: 'Boma',
                style: textTheme.displayLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: '360',
                    style: textTheme.displayLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.danger,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Text(
              '360° Control your Herd',
              style: textTheme.headlineLarge?.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Smart Livestock for Smart Farmers',
              style: textTheme.headlineMedium?.copyWith(
                color: AppColors.secondary,
              ),
            ),
            const SizedBox(height: 28),
            Text(
              'Welcome to your farm!',
              style: textTheme.headlineMedium?.copyWith(
                color: AppColors.secondary,
              ),
            ),
            const SizedBox(height: 28),
            SpinKitSpinningLines(color: AppColors.danger),
            Expanded(child: Container()),
            Text(
              'Version 1.0.0',
              style: textTheme.bodyMedium?.copyWith(color: AppColors.secondary),
            ),
            const SizedBox(height: 28),
          ],
        ),
      ),
    );
  }
}
