// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'farm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FarmModel _$FarmModelFromJson(Map<String, dynamic> json) => FarmModel(
  userId: json['user_id'] as String,
  name: json['name'] as String,
  id: json['id'] as String?,
  location: json['location'] as String?,
);

Map<String, dynamic> _$FarmModelToJson(FarmModel instance) => <String, dynamic>{
  if (instance.id case final value?) 'id': value,
  'user_id': instance.userId,
  'name': instance.name,
  if (instance.location case final value?) 'location': value,
};
