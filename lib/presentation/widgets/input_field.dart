import 'package:client/config/theme/colors.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final IconData? suffixIcon;

  const InputField({
    super.key,
    required this.hintText,
    this.validator,
    this.obscureText,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      validator: validator,
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
        suffixIcon: IconButton(
          icon: Icon(suffixIcon, color: AppColors.danger.withValues(alpha: .5)),
          onPressed: () {},
        ),
      ),
    );
  }
}
