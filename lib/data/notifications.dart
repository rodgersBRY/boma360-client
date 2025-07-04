import 'package:client/model/notification.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final List<AppNotification> kNotifications = [
  AppNotification(
    icon: FontAwesomeIcons.triangleExclamation,
    tag: NotificationTag.urgent,
    title: 'Emergency Alert',
    body: 'Cow #102 is showing severe symptoms of infection.',
    date: DateTime.parse('2025-06-15T08:30:00Z'),
    priority: NotificationPriority.high,
  ),
  AppNotification(
    icon: FontAwesomeIcons.heartPulse,
    tag: NotificationTag.health,
    title: 'Vaccination Due',
    body: 'Cattle #432 needs vaccination by end of the week.',
    date: DateTime.parse('2025-06-14T12:00:00Z'),
    priority: NotificationPriority.medium,
  ),
  AppNotification(
    icon: FontAwesomeIcons.gears,
    tag: NotificationTag.system,
    title: 'System Maintenance',
    body: 'The backend will undergo maintenance at midnight.',
    date: DateTime.parse('2025-06-13T18:45:00Z'),
    priority: NotificationPriority.low,
  ),
  AppNotification(
    icon: FontAwesomeIcons.chartLine,
    tag: NotificationTag.cattleYield,
    title: 'Milk Production Drop',
    body: 'Daily yield dropped by 10% compared to last week.',
    date: DateTime.parse('2025-06-12T06:15:00Z'),
    priority: NotificationPriority.medium,
  ),
  AppNotification(
    icon: FontAwesomeIcons.syringe,
    tag: NotificationTag.health,
    title: 'Health Check Required',
    body: 'Scheduled deworming for herd section B.',
    date: DateTime.parse('2025-06-11T09:00:00Z'),
    priority: NotificationPriority.medium,
  ),
  AppNotification(
    icon: FontAwesomeIcons.bug,
    tag: NotificationTag.system,
    
    title: 'Bug Reported',
    body: 'An error was detected in the weight tracker module.',
    date: DateTime.parse('2025-06-10T17:25:00Z'),
    priority: NotificationPriority.low,
  ),
  AppNotification(
    icon: FontAwesomeIcons.circleExclamation,
    tag: NotificationTag.urgent,
    
    title: 'Outbreak Warning',
    body: 'Nearby farms reported a case of foot-and-mouth disease.',
    date: DateTime.parse('2025-06-10T05:45:00Z'),
    priority: NotificationPriority.high,
  ),
  AppNotification(
    icon: FontAwesomeIcons.seedling,
    tag: NotificationTag.cattleYield,
    
    title: 'Fodder Low',
    body: 'Fodder stock is low, consider replenishing soon.',
    date: DateTime.parse('2025-06-09T14:10:00Z'),
    priority: NotificationPriority.medium,
  ),
  AppNotification(
    icon: FontAwesomeIcons.batteryQuarter,
    tag: NotificationTag.system,
    
    title: 'Sensor Battery Low',
    body: 'Battery for sensor #23 is below 15%.',
    date: DateTime.parse('2025-06-09T10:00:00Z'),
    priority: NotificationPriority.low,
  ),
  AppNotification(
    icon: FontAwesomeIcons.briefcaseMedical,
    tag: NotificationTag.health,
    
    title: 'Medical Review',
    body: 'Review the results of the recent vet inspection.',
    date: DateTime.parse('2025-06-08T16:20:00Z'),
    priority: NotificationPriority.medium,
  ),
];
