// Custom Dialog Widget
import 'package:client/config/constants.dart';
import 'package:client/config/theme/colors.dart';
import 'package:client/helper/dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDialogWidget extends StatelessWidget {
  final DialogConfig config;

  const CustomDialogWidget({super.key, required this.config});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 8,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(kDefaultRadius),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [_buildContent(textTheme), _buildActions()],
        ),
      ),
    );
  }

  Widget _buildContent(TextTheme textTheme) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child:
          config.type == DialogType.confirmation
              ? _buildConfirmationContent(textTheme)
              : _buildCustomContent(),
    );
  }

  Widget _buildConfirmationContent(TextTheme textTheme) {
    return Column(
      children: [
        if (config.icon != null) ...[
          Icon(config.icon, size: 50),
          const SizedBox(height: 12),
        ],
        Text(
          config.title,
          style: textTheme.headlineLarge?.copyWith(color: AppColors.primary),
          textAlign: TextAlign.center,
        ),
        Text(
          config.message ?? '',
          style: textTheme.bodyLarge?.copyWith(color: AppColors.textPrimary),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildCustomContent() {
    return config.customContent ?? const SizedBox.shrink();
  }

  Widget _buildActions() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (config.cancelText != null) ...[
            TextButton(
              onPressed: () {
                Get.back();
                config.onCancel?.call();
              },
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                config.cancelText!,
                style: TextStyle(
                  color: config.cancelButtonColor ?? Colors.grey[600],
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(width: 12),
          ],
          if (config.confirmText != null)
            ElevatedButton(
              onPressed: () {
                Get.back();
                config.onConfirm?.call();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    config.confirmButtonColor ?? Get.theme.primaryColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 2,
              ),
              child: Text(
                config.confirmText!,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
