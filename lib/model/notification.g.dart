// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppNotification _$AppNotificationFromJson(Map<String, dynamic> json) =>
    AppNotification(
      iconData: json['iconData'] as String,
      tag: $enumDecode(_$NotificationTagEnumMap, json['tag']),
      title: json['title'] as String,
      body: json['body'] as String,
      date: DateTime.parse(json['date'] as String),
      priority: $enumDecode(_$NotificationPriorityEnumMap, json['priority']),
    );

const _$NotificationTagEnumMap = {
  NotificationTag.urgent: 'urgent',
  NotificationTag.health: 'health',
  NotificationTag.system: 'system',
  NotificationTag.cattleYield: 'cattleYield',
};

const _$NotificationPriorityEnumMap = {
  NotificationPriority.low: 'low',
  NotificationPriority.medium: 'medium',
  NotificationPriority.high: 'high',
};
