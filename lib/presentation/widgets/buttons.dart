import 'package:client/config/theme/colors.dart';
import 'package:flutter/material.dart';

class MyElevatedButton extends StatelessWidget {
  final TextTheme textTheme;
  final String label;
  final double height;
  final double? width;
  final VoidCallback? func;

  const MyElevatedButton({
    super.key,
    required this.textTheme,
    required this.label,
    this.width,
    this.height = 60.0,
    this.func,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width ?? screenWidth,
      height: height,
      child: ElevatedButton(
        onPressed: func,
        child: Text(
          label,
          style: textTheme.headlineLarge?.copyWith(color: AppColors.white),
        ),
      ),
    );
  }
}
