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
      ..deleted = json['deleted'] as bool?;

Map<String, dynamic> _$YieldModelToJson(YieldModel instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.createdAt?.toIso8601String() case final value?)
        'created_at': value,
      if (instance.updatedAt?.toIso8601String() case final value?)
        'updated_at': value,
      if (instance.deleted case final value?) 'deleted': value,
      'yield_type': _$YieldTypeEnumMap[instance.yieldType]!,
      'quantity': instance.quantity,
      'date': instance.date.toIso8601String(),
      if (instance.notes case final value?) 'notes': value,
    };

const _$YieldTypeEnumMap = {
  YieldType.milk: 'Milk',
  YieldType.weight: 'Weight',
  YieldType.meat: 'Meat',
};
