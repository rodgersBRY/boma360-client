import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:delightful_toast/toast/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:delightful_toast/delight_toast.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/utils.dart';

// Enum for different toast types
enum ToastType { success, error, warning, info, custom }

// Configuration class for toast customization
class ToastConfig {
  final String title;
  final String? subtitle;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? iconColor;
  final Duration duration;
  final DelightSnackbarPosition position;
  final bool autoDismiss;
  final VoidCallback? onTap;
  final Widget? leading;
  final Widget? trailing;

  const ToastConfig({
    required this.title,
    this.subtitle,
    this.icon,
    this.backgroundColor,
    this.textColor,
    this.iconColor,
    this.duration = const Duration(seconds: 3),
    this.position = DelightSnackbarPosition.top,
    this.autoDismiss = true,
    this.onTap,
    this.leading,
    this.trailing,
  });
}

// Main Toast Utility Class
class ToastUtils {
  // Success Toast
  static void showSuccess({
    required String title,
    String? subtitle,
    Duration duration = const Duration(seconds: 3),
    DelightSnackbarPosition position = DelightSnackbarPosition.top,
    VoidCallback? onTap,
  }) {
    _showToast(
      config: ToastConfig(
        title: title,
        subtitle: subtitle,
        duration: duration,
        position: position,
        onTap: onTap,
      ),
      type: ToastType.success,
    );
  }

  // Error Toast
  static void showError({
    required String title,
    String? subtitle,
    Duration duration = const Duration(seconds: 3),
    DelightSnackbarPosition position = DelightSnackbarPosition.top,
    VoidCallback? onTap,
  }) {
    _showToast(
      config: ToastConfig(
        title: title,
        subtitle: subtitle,
        duration: duration,
        position: position,
        onTap: onTap,
      ),
      type: ToastType.error,
    );
  }

  // Warning Toast
  static void showWarning({
    required String title,
    String? subtitle,
    Duration duration = const Duration(seconds: 3),
    DelightSnackbarPosition position = DelightSnackbarPosition.top,
    VoidCallback? onTap,
  }) {
    _showToast(
      config: ToastConfig(
        title: title,
        subtitle: subtitle,
        duration: duration,
        position: position,
        onTap: onTap,
      ),
      type: ToastType.warning,
    );
  }

  // Info Toast
  static void showInfo({
    required String title,
    String? subtitle,
    Duration duration = const Duration(seconds: 3),
    DelightSnackbarPosition position = DelightSnackbarPosition.top,
    VoidCallback? onTap,
  }) {
    _showToast(
      config: ToastConfig(
        title: title,
        subtitle: subtitle,
        duration: duration,
        position: position,
        onTap: onTap,
      ),
      type: ToastType.info,
    );
  }

  // Custom Toast with full customization
  static void showCustom({
    required String title,
    String? subtitle,
    IconData? icon,
    Color? backgroundColor,
    Color? textColor,
    Color? iconColor,
    Duration duration = const Duration(seconds: 3),
    DelightSnackbarPosition position = DelightSnackbarPosition.top,
    bool autoDismiss = true,
    VoidCallback? onTap,
    Widget? leading,
    Widget? trailing,
  }) {
    _showToast(
      config: ToastConfig(
        title: title,
        subtitle: subtitle,
        icon: icon,
        backgroundColor: backgroundColor,
        textColor: textColor,
        iconColor: iconColor,
        duration: duration,
        position: position,
        autoDismiss: autoDismiss,
        onTap: onTap,
        leading: leading,
        trailing: trailing,
      ),
      type: ToastType.custom,
    );
  }

  // Simple toast with just a message
  static void show(String message) {
    showInfo(title: message);
  }

  // Loading toast (doesn't auto-dismiss)
  static DelightToastBar? showLoading({
    String title = 'Loading...',
    String? subtitle,
    DelightSnackbarPosition position = DelightSnackbarPosition.top,
  }) {
    final context = Get.context;
    if (context == null) return null;

    return DelightToastBar(
      builder:
          (context) => ToastCard(
            leading: const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            ),
            title: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
            subtitle:
                subtitle != null
                    ? Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    )
                    : null,
            color: Colors.blue.shade50,
            shadowColor: Colors.blue.withValues(alpha: 0.2),
          ),
      autoDismiss: false,
      position: position,
    )..show(context);
  }

  // Private method to show toast based on type and config
  static void _showToast({
    required ToastConfig config,
    required ToastType type,
  }) {
    final context = Get.context;
    if (context == null) return;

    final toastData = _getToastData(type);

    DelightToastBar(
      builder:
          (context) => ToastCard(
            leading:
                config.leading ??
                Icon(
                  config.icon ?? toastData.icon,
                  color: config.iconColor ?? toastData.iconColor,
                  size: 24,
                ),
            title: Text(
              config.title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: config.textColor ?? toastData.textColor,
              ),
            ),
            subtitle:
                config.subtitle != null
                    ? Text(
                      config.subtitle!,
                      style: TextStyle(
                        fontSize: 12,
                        color: (config.textColor ?? toastData.textColor)
                            .withValues(alpha: 0.7),
                      ),
                    )
                    : null,
            trailing: config.trailing,
            color: config.backgroundColor ?? toastData.backgroundColor,
            shadowColor: (config.backgroundColor ?? toastData.backgroundColor)
                .withValues(alpha: 0.3),
            onTap: config.onTap,
          ),
      autoDismiss: config.autoDismiss,
      animationDuration: const Duration(milliseconds: 300),
      snackbarDuration: config.duration,
      position: config.position,
    ).show(context);
  }

  // Get predefined toast data based on type
  static _ToastData _getToastData(ToastType type) {
    switch (type) {
      case ToastType.success:
        return _ToastData(
          icon: Icons.check_circle,
          iconColor: Colors.green,
          backgroundColor: Colors.green.shade50,
          textColor: Colors.green.shade800,
        );
      case ToastType.error:
        return _ToastData(
          icon: Icons.error,
          iconColor: Colors.red,
          backgroundColor: Colors.red.shade50,
          textColor: Colors.red.shade800,
        );
      case ToastType.warning:
        return _ToastData(
          icon: Icons.warning_amber,
          iconColor: Colors.orange,
          backgroundColor: Colors.orange.shade50,
          textColor: Colors.orange.shade800,
        );
      case ToastType.info:
        return _ToastData(
          icon: Icons.info,
          iconColor: Colors.blue,
          backgroundColor: Colors.blue.shade50,
          textColor: Colors.blue.shade800,
        );
      case ToastType.custom:
        return _ToastData(
          icon: Icons.notifications,
          iconColor: Colors.grey,
          backgroundColor: Colors.grey.shade100,
          textColor: Colors.grey.shade800,
        );
    }
  }
}

// Helper class for toast data
class _ToastData {
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final Color textColor;

  const _ToastData({
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
    required this.textColor,
  });
}

// Global navigator key (add this to your main.dart)
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

// Extension for easy access
extension ToastExtension on String {
  void showAsToast() => ToastUtils.show(this);
  void showAsSuccess() => ToastUtils.showSuccess(title: this);
  void showAsError() => ToastUtils.showError(title: this);
  void showAsWarning() => ToastUtils.showWarning(title: this);
  void showAsInfo() => ToastUtils.showInfo(title: this);
}
