import 'package:client/config/theme/colors.dart';
import 'package:flutter/material.dart';

class MyDropDownWidget extends StatelessWidget {
  final String hint;
  final List<DropdownMenuItem<String>> itemList;
  final String errorText;

  const MyDropDownWidget({
    super.key,
    required this.hint,
    required this.itemList,
    required this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        hint: Text(hint),
        hintStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
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
      ),
      items: itemList,
      onChanged: (value) {
        if (value != null) {}
      },
      validator: (value) => value == null ? errorText : null,
    );
  }
}
