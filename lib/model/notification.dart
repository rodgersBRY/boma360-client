import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notification.g.dart';

enum NotificationPriority { low, medium, high }

enum NotificationTag { urgent, health, system, cattleYield }

@JsonSerializable()
class AppNotification {
  final String iconData;
  final NotificationTag tag;
  final String title;
  final String body;
  final DateTime date;
  final NotificationPriority priority;

  const AppNotification({
    required this.iconData,
    required this.tag,
    required this.title,
    required this.body,
    required this.date,
    required this.priority,
  });

  factory AppNotification.fromJson(Map<String, dynamic> json) =>
      _$AppNotificationFromJson(json);

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

  static IconData iconFromString(String str) {
    switch (str) {
      case 'fa-exclamation-triangle':
        return FontAwesomeIcons.triangleExclamation;
      case 'fa-heartbeat':
        return FontAwesomeIcons.heartPulse;
      case 'fa-gears':
        return FontAwesomeIcons.gears;
      case 'fa-chart-line':
        return FontAwesomeIcons.chartLine;
      default:
        return FontAwesomeIcons.bell;
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
