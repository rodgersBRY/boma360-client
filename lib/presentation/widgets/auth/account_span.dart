import 'package:client/config/theme/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class AccountSpan extends StatelessWidget {
  final TextTheme textTheme;
  final String prefixText;
  final String suffixText;
  final String route;

  const AccountSpan({
    super.key,
    required this.textTheme,
    required this.prefixText,
    required this.suffixText,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: '$prefixText an account? ',
        children: [
          TextSpan(
            text: suffixText,
            style: TextStyle(color: AppColors.secondary),
            recognizer:
                TapGestureRecognizer()..onTap = () => Get.toNamed(route),
          ),
        ],
      ),
      style: textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
    );
  }
}
