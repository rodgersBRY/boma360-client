// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cattle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CattleModel _$CattleModelFromJson(Map<String, dynamic> json) =>
    CattleModel(
        userId: json['user_id'] as String,
        farmId: json['farm_id'] as String,
        tag: json['tag'] as String,
        status: $enumDecode(_$StatusEnumMap, json['status']),
        breed: json['breed'] as String,
        type: json['type'] as String,
        age: json['age'] as String,
        name: json['name'] as String?,
        gender: json['gender'] as String?,
        weight: json['weight'] as String?,
        lastCheck:
            json['last_check'] == null
                ? null
                : DateTime.parse(json['last_check'] as String),
        dueDate:
            json['due_date'] == null
                ? null
                : DateTime.parse(json['due_date'] as String),
        imageUrl: json['image_url'] as String?,
        vaccinationDue: json['vaccination_due'] as bool?,
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

Map<String, dynamic> _$CattleModelToJson(
  CattleModel instance,
) => <String, dynamic>{
  if (instance.id case final value?) 'id': value,
  if (instance.createdAt?.toIso8601String() case final value?)
    'created_at': value,
  if (instance.updatedAt?.toIso8601String() case final value?)
    'updated_at': value,
  if (instance.deleted case final value?) 'deleted': value,
  if (instance.deletedAt?.toIso8601String() case final value?)
    'deleted_at': value,
  'tag': instance.tag,
  if (instance.name case final value?) 'name': value,
  'status': _$StatusEnumMap[instance.status]!,
  'breed': instance.breed,
  'type': instance.type,
  'age': instance.age,
  if (instance.gender case final value?) 'gender': value,
  'user_id': instance.userId,
  'farm_id': instance.farmId,
  if (instance.weight case final value?) 'weight': value,
  if (instance.lastCheck?.toIso8601String() case final value?)
    'last_check': value,
  if (instance.dueDate?.toIso8601String() case final value?) 'due_date': value,
  if (instance.imageUrl case final value?) 'image_url': value,
  if (instance.vaccinationDue case final value?) 'vaccination_due': value,
};

const _$StatusEnumMap = {
  Status.healthy: 'healthy',
  Status.attention: 'attention',
  Status.treatment: 'treatment',
  Status.observation: 'observation',
  Status.pregnant: 'pregnant',
};
