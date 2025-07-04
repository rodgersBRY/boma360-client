import 'package:client/config/theme/colors.dart';
import 'package:flutter/material.dart';

class MyElevatedButton extends StatelessWidget {
  final TextTheme textTheme;
  final String label;
  final double height;
  final double? width;
  final VoidCallback? func;
  final Icon? icon;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final bool? fitText;

  const MyElevatedButton({
    super.key,
    required this.textTheme,
    required this.label,
    this.width,
    this.height = 60.0,
    this.func,
    this.icon,
    this.textStyle,
    this.backgroundColor = AppColors.primary,
    this.fitText = false,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width ?? screenWidth,
      height: height,
      child: ElevatedButton(
        onPressed: func,
        style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              icon ?? Container(),
              const SizedBox(width: 8),
            ],
            Text(label, style: textStyle),
          ],
        ),
      ),
    );
  }
}
