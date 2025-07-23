import 'package:client/config/theme/colors.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final Widget? suffixIcon;
  final IconData? prefixIcon;
  final TextInputType? inputType;
  final TextEditingController? textController;
  final VoidCallback? onPressed;

  const InputField({
    super.key,
    required this.hintText,
    this.textController,
    this.validator,
    this.obscureText,
    this.suffixIcon,
    this.prefixIcon,
    this.onPressed,
    this.inputType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      validator: validator,
      controller: textController,
      keyboardType: inputType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
        fillColor: AppColors.danger.withValues(alpha: .1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.danger.withValues(alpha: .2),
            width: 3.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.danger.withValues(alpha: .2),
            width: 3.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.danger.withValues(alpha: .2),
            width: 3.0,
          ),
        ),
        prefix:
            prefixIcon != null
                ? Icon(
                  prefixIcon,
                  color: AppColors.danger.withValues(alpha: .5),
                )
                : null,
        suffixIcon: suffixIcon != null ? IconButton(
          icon: suffixIcon!,
          onPressed: onPressed,
        ) : null,
      ),
    );
  }
}
