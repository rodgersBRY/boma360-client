import 'package:client/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Priority { medium, urgent, info }

class AlertNotificationModel {
  final String title;
  final String content;
  final IconData icon;
  final DateTime notificationDate;
  final Priority priority;

  const AlertNotificationModel({
    required this.title,
    required this.content,
    required this.icon,
    required this.notificationDate,
    required this.priority,
  });
}

extension PriorityColorExtension on Priority {
  Color get color {
    switch (this) {
      case Priority.urgent:
        return AppColors.danger;
      case Priority.medium:
        return AppColors.warning;
      case Priority.info:
        return AppColors.info;
    }
  }
}

final List<AlertNotificationModel> kNotifications = [
  AlertNotificationModel(
    title: 'Vaccination Reminder',
    content: 'Cow #203 is due for a Foot-and-Mouth vaccine today.',
    icon: FontAwesomeIcons.houseMedicalCircleExclamation,
    notificationDate: DateTime.now().subtract(const Duration(hours: 3)),
    priority: Priority.urgent,
  ),
  AlertNotificationModel(
    title: 'Heat Detection Alert',
    content: 'Heifer #125 is showing signs of estrus.',
    icon: FontAwesomeIcons.heart,
    notificationDate: DateTime.now().subtract(const Duration(hours: 5)),
    priority: Priority.medium,
  ),
  AlertNotificationModel(
    title: 'Feeding Schedule Missed',
    content: 'Morning feed was not logged for Barn B.',
    icon: FontAwesomeIcons.notesMedical,
    notificationDate: DateTime.now().subtract(const Duration(days: 1)),
    priority: Priority.urgent,
  ),
  AlertNotificationModel(
    title: 'Daily Health Check Complete',
    content: 'All cattle passed the morning health inspection.',
    icon: FontAwesomeIcons.check,
    notificationDate: DateTime.now().subtract(const Duration(hours: 2)),
    priority: Priority.info,
  ),
];
