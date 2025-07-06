import 'package:client/config/constants.dart';
import 'package:client/config/theme/colors.dart';
import 'package:flutter/material.dart';

class LogoAvatar extends StatelessWidget {
  final double logoSize;

  const LogoAvatar({super.key, required this.logoSize});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColors.primary,
      radius: 70,
      child: CircleAvatar(
        backgroundColor: AppColors.background,
        radius: 40,
        child: Image.asset(kCowLogoImage, width: logoSize, height: logoSize),
      ),
    );
  }
}
