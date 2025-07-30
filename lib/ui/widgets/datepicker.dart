import 'package:client/ui/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DatePickerField extends StatelessWidget {
  final String label;
  final Rx<DateTime?> selectedDate;

  const DatePickerField({
    super.key,
    required this.label,
    required this.selectedDate,
  });

  Future<void> _pickDate(BuildContext context) async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value ?? now,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      selectedDate.value = picked;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final displayDate =
          selectedDate.value != null
              ? DateFormat.yMMMd().format(selectedDate.value ?? DateTime.now())
              : 'Select date';

      return GestureDetector(
        onTap: () => _pickDate(context),
        child: InputField(
          hintText: 'select date',
          enabled: false,
          textController: TextEditingController(text: displayDate),
        ),
      );
    });
  }
}
