// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cattle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CattleModel _$CattleModelFromJson(Map<String, dynamic> json) =>
    CattleModel(
        tag: json['tag'] as String,
        status: $enumDecode(_$StatusEnumMap, json['status']),
        breed: json['breed'] as String,
        type: $enumDecode(_$BreedTypeEnumMap, json['type']),
        age: json['age'] as String,
        name: json['name'] as String?,
        gender: json['gender'] as String?,
        lastCheck:
            json['lastCheck'] == null
                ? null
                : DateTime.parse(json['lastCheck'] as String),
        dueDate:
            json['dueDate'] == null
                ? null
                : DateTime.parse(json['dueDate'] as String),
        imageUrl: json['imageUrl'] as String?,
        vaccinationDue: json['vaccinationDue'] as bool?,
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

Map<String, dynamic> _$CattleModelToJson(CattleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'deleted': instance.deleted,
      'tag': instance.tag,
      'name': instance.name,
      'status': _$StatusEnumMap[instance.status]!,
      'breed': instance.breed,
      'type': _$BreedTypeEnumMap[instance.type]!,
      'age': instance.age,
      'gender': instance.gender,
      'lastCheck': instance.lastCheck?.toIso8601String(),
      'dueDate': instance.dueDate?.toIso8601String(),
      'imageUrl': instance.imageUrl,
      'vaccinationDue': instance.vaccinationDue,
    };

const _$StatusEnumMap = {
  Status.healthy: 'healthy',
  Status.attention: 'attention',
  Status.treatment: 'treatment',
  Status.observation: 'observation',
  Status.pregnant: 'pregnant',
};

const _$BreedTypeEnumMap = {
  BreedType.dairy: 'dairy',
  BreedType.beef: 'beef',
  BreedType.dualPurpose: 'dualPurpose',
};
