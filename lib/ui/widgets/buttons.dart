import 'package:client/config/theme/colors.dart';
import 'package:client/ui/widgets/spin_widget.dart';
import 'package:flutter/material.dart';

class MyElevatedButton extends StatelessWidget {
  final Widget label;
  final double height;
  final double? width;
  final VoidCallback? onPressed;
  final Icon? icon;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final Color? loadingBackgroundColor;
  final bool? fitText;
  final bool? loading;

  const MyElevatedButton({
    super.key,
    required this.label,
    this.loadingBackgroundColor,
    this.width,
    this.height = 50.0,
    this.onPressed,
    this.icon,
    this.textStyle,
    this.loading = false,
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
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              loading == true ? loadingBackgroundColor : backgroundColor,
        ),
        child:
            loading == true
                ? SpinWidget()
                : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (icon != null) ...[
                      icon ?? Container(),
                      const SizedBox(width: 8),
                    ],
                    label,
                  ],
                ),
      ),
    );
  }
}
