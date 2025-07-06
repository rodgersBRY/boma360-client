// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cattle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CattleModel _$CattleModelFromJson(Map<String, dynamic> json) => CattleModel(
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
);

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
