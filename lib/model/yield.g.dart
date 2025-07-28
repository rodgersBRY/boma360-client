// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yield.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YieldModel _$YieldModelFromJson(Map<String, dynamic> json) =>
    YieldModel(
        yieldType: $enumDecode(_$YieldTypeEnumMap, json['yield_type']),
        quantity: json['quantity'] as String,
        date: DateTime.parse(json['date'] as String),
        cattleId: json['cattle_id'] as String,
        farmerId: json['farmer_id'] as String,
        dateCollected: DateTime.parse(json['date_collected'] as String),
        milkingSession: $enumDecodeNullable(
          _$MilkingSessionEnumMap,
          json['milking_session'],
        ),
        lactationStage: $enumDecodeNullable(
          _$LactationStageEnumMap,
          json['lactation_stage'],
        ),
        milkQualityScore: json['milk_quality_score'] as String?,
        slaughterWeight: json['slaughter_weight'] as String?,
        carcassWeight: json['carcass_weight'] as String?,
        meatGrade: json['meat_grade'] as String?,
        notes: json['notes'] as String?,
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

Map<String, dynamic> _$YieldModelToJson(
  YieldModel instance,
) => <String, dynamic>{
  if (instance.id case final value?) 'id': value,
  if (instance.createdAt?.toIso8601String() case final value?)
    'created_at': value,
  if (instance.updatedAt?.toIso8601String() case final value?)
    'updated_at': value,
  if (instance.deleted case final value?) 'deleted': value,
  if (instance.deletedAt?.toIso8601String() case final value?)
    'deleted_at': value,
  'yield_type': _$YieldTypeEnumMap[instance.yieldType]!,
  'quantity': instance.quantity,
  'date': instance.date.toIso8601String(),
  'farmer_id': instance.farmerId,
  'cattle_id': instance.cattleId,
  'date_collected': instance.dateCollected.toIso8601String(),
  if (_$MilkingSessionEnumMap[instance.milkingSession] case final value?)
    'milking_session': value,
  if (_$LactationStageEnumMap[instance.lactationStage] case final value?)
    'lactation_stage': value,
  if (instance.milkQualityScore case final value?) 'milk_quality_score': value,
  if (instance.slaughterWeight case final value?) 'slaughter_weight': value,
  if (instance.carcassWeight case final value?) 'carcass_weight': value,
  if (instance.meatGrade case final value?) 'meat_grade': value,
  if (instance.notes case final value?) 'notes': value,
};

const _$YieldTypeEnumMap = {YieldType.milk: 'milk', YieldType.meat: 'meat'};

const _$MilkingSessionEnumMap = {
  MilkingSession.morning: 'morning',
  MilkingSession.afternoon: 'afternoon',
  MilkingSession.evening: 'evening',
};

const _$LactationStageEnumMap = {
  LactationStage.early: 'early',
  LactationStage.peak: 'milk',
  LactationStage.mid: 'mid',
  LactationStage.late: 'late',
  LactationStage.dry: 'dry',
};
