import 'package:client/presentation/widgets/dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Enum to define dialog types
enum DialogType { confirmation, custom }

// Model class for dialog configuration
class DialogConfig {
  final DialogType type;
  final String title;
  final String? message;
  final Widget? customContent;
  final String? confirmText;
  final String? cancelText;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final Color? confirmButtonColor;
  final Color? cancelButtonColor;
  final bool barrierDismissible;
  final IconData? icon;
  final Color? iconColor;
  final Color? color;

  DialogConfig({
    required this.type,
    required this.title,
    this.message,
    this.customContent,
    this.confirmText,
    this.cancelText,
    this.onConfirm,
    this.onCancel,
    this.confirmButtonColor,
    this.cancelButtonColor,
    this.barrierDismissible = true,
    this.icon,
    this.iconColor,
    this.color,
  });
}

// Custom Dialog Service
class CustomDialogService {
  static void showConfirmationDialog({
    required String title,
    required String message,
    String confirmText = 'Confirm',
    String cancelText = 'Cancel',
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    Color? confirmButtonColor,
    Color? cancelButtonColor,
    bool barrierDismissible = true,
    IconData? icon,
    Color? iconColor,
  }) {
    final config = DialogConfig(
      type: DialogType.confirmation,
      title: title,
      message: message,
      confirmText: confirmText,
      cancelText: cancelText,
      onConfirm: onConfirm,
      onCancel: onCancel,
      confirmButtonColor: confirmButtonColor,
      cancelButtonColor: cancelButtonColor,
      barrierDismissible: barrierDismissible,
      icon: icon,
      iconColor: iconColor,
    );

    _showDialog(config);
  }

  static void showCustomDialog({
    required String title,
    required Widget customContent,
    String? confirmText,
    String? cancelText,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    Color? confirmButtonColor,
    Color? cancelButtonColor,
    bool barrierDismissible = true,
    IconData? icon,
    Color? iconColor,
  }) {
    final config = DialogConfig(
      type: DialogType.custom,
      title: title,
      customContent: customContent,
      confirmText: confirmText,
      cancelText: cancelText,
      onConfirm: onConfirm,
      onCancel: onCancel,
      confirmButtonColor: confirmButtonColor,
      cancelButtonColor: cancelButtonColor,
      barrierDismissible: barrierDismissible,
      icon: icon,
      iconColor: iconColor,
    );

    _showDialog(config);
  }

  static void _showDialog(DialogConfig config) {
    Get.dialog(
      CustomDialogWidget(config: config),
      barrierDismissible: config.barrierDismissible,
    );
  }
}
