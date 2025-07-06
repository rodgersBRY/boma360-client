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
      )
      ..id = json['id'] as String?
      ..createdAt =
          json['createdAt'] == null
              ? null
              : DateTime.parse(json['createdAt'] as String)
      ..updatedAt =
          json['updatedAt'] == null
              ? null
              : DateTime.parse(json['updatedAt'] as String)
      ..deleted = json['deleted'] as bool?;

Map<String, dynamic> _$AppNotificationToJson(AppNotification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'deleted': instance.deleted,
      'iconData': instance.iconData,
      'tag': _$NotificationTagEnumMap[instance.tag]!,
      'title': instance.title,
      'body': instance.body,
      'date': instance.date.toIso8601String(),
      'priority': _$NotificationPriorityEnumMap[instance.priority]!,
    };

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
