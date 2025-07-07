// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'farm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FarmModel _$FarmModelFromJson(Map<String, dynamic> json) =>
    FarmModel(
        userId: json['user_id'] as String,
        name: json['name'] as String,
        location: json['location'] as String?,
      )
      ..id = json['id'] as String?
      ..createdAt =
          json['created_at'] == null
              ? null
              : DateTime.parse(json['created_at'] as String)
      ..updatedAt =
          json['updatedAt'] == null
              ? null
              : DateTime.parse(json['updatedAt'] as String)
      ..deleted = json['deleted'] as bool?;

Map<String, dynamic> _$FarmModelToJson(FarmModel instance) => <String, dynamic>{
  'id': instance.id,
  'created_at': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'deleted': instance.deleted,
  'user_id': instance.userId,
  'name': instance.name,
  'location': instance.location,
};
