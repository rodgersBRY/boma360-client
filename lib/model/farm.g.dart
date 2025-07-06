// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'farm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FarmModel _$FarmModelFromJson(Map<String, dynamic> json) => FarmModel(
  userId: json['user_id'] as String,
  name: json['name'] as String,
  location: json['location'] as String?,
);

Map<String, dynamic> _$FarmModelToJson(FarmModel instance) => <String, dynamic>{
  'user_id': instance.userId,
  'name': instance.name,
  'location': instance.location,
};
