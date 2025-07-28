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
        isRead: json['isRead'] as bool? ?? false,
      )
      ..id = json['id'] as String?
      ..createdAt =
          json['created_at'] == null
              ? null
              : DateTime.parse(json['created_at'] as String)
      ..updatedAt =
          json['updated_at'] == null
              ? null
              : DateTime.parse(json['updated_at'] as String)
      ..deleted = json['deleted'] as bool?
      ..deletedAt =
          json['deleted_at'] == null
              ? null
              : DateTime.parse(json['deleted_at'] as String);

Map<String, dynamic> _$AppNotificationToJson(AppNotification instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.createdAt?.toIso8601String() case final value?)
        'created_at': value,
      if (instance.updatedAt?.toIso8601String() case final value?)
        'updated_at': value,
      if (instance.deleted case final value?) 'deleted': value,
      if (instance.deletedAt?.toIso8601String() case final value?)
        'deleted_at': value,
      'iconData': instance.iconData,
      'tag': _$NotificationTagEnumMap[instance.tag]!,
      'title': instance.title,
      'body': instance.body,
      'date': instance.date.toIso8601String(),
      'priority': _$NotificationPriorityEnumMap[instance.priority]!,
      'isRead': instance.isRead,
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
