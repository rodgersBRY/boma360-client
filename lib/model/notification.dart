import 'package:flutter/material.dart';

enum NotificationPriority { low, medium, high }

enum NotificationTag { urgent, health, system, cattleYield }

class AppNotification {
  final IconData icon;
  final NotificationTag tag;
  final String title;
  final String body;
  final DateTime date;
  final NotificationPriority priority;

  const AppNotification({
    required this.icon,
    required this.tag,
    required this.title,
    required this.body,
    required this.date,
    required this.priority,
  });

  static NotificationTag tagFromString(String str) {
    switch (str) {
      case 'urgent':
        return NotificationTag.urgent;
      case 'health':
        return NotificationTag.health;
      case 'system':
        return NotificationTag.system;
      case 'yield':
        return NotificationTag.cattleYield;
      default:
        return NotificationTag.system;
    }
  }

  static NotificationPriority priorityFromString(String str) {
    switch (str) {
      case 'low':
        return NotificationPriority.low;
      case 'medium':
        return NotificationPriority.medium;
      case 'high':
        return NotificationPriority.high;
      default:
        return NotificationPriority.low;
    }
  }

  static int hexToColor(String hex) {
    hex = hex.replaceAll('#', '');
    return int.parse('FF$hex', radix: 16); // add opacity
  }
}

extension NotificationPriorityColor on NotificationPriority {
  Color get color {
    switch (this) {
      case NotificationPriority.low:
        return const Color(0xFF5AC8FA); // Light Blue
      case NotificationPriority.medium:
        return const Color(0xFFFF9500); // Orange
      case NotificationPriority.high:
        return const Color(0xFFFF3B30); // Red
    }
  }
}
