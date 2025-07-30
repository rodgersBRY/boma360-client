import 'package:client/helper/base_object.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'yield.g.dart';

@JsonSerializable(includeIfNull: false)
class YieldModel extends BaseObject {
  @JsonKey(name: 'yield_type')
  final YieldType yieldType;

  final double quantity;

  @JsonKey(name: 'farmer_id')
  final String farmerId;

  @JsonKey(name: 'cattle_id')
  final String cattleId;

  @JsonKey(name: 'date_collected')
  final DateTime dateCollected;

  @JsonKey(name: 'milking_session')
  final MilkingSession? milkingSession;

  @JsonKey(name: 'lactation_stage')
  final LactationStage? lactationStage;

  @JsonKey(name: 'milk_quality_score')
  final double? milkQualityScore;

  @JsonKey(name: 'slaughter_weight')
  final double? slaughterWeight;

  @JsonKey(name: 'carcass_weight')
  final double? carcassWeight;

  @JsonKey(name: 'meat_grade')
  final double? meatGrade;

  final String? notes;

  YieldModel({
    required this.yieldType,
    required this.quantity,
    required this.cattleId,
    required this.farmerId,
    required this.dateCollected,
    this.milkingSession,
    this.lactationStage,
    this.milkQualityScore,
    this.slaughterWeight,
    this.carcassWeight,
    this.meatGrade,
    this.notes,
  });

  factory YieldModel.fromJson(Map<String, dynamic> json) =>
      _$YieldModelFromJson(json);

  Map<String, dynamic> toJson() => _$YieldModelToJson(this);
}

enum LactationStage {
  @JsonValue('early')
  early,
  @JsonValue('milk')
  peak,
  @JsonValue('mid')
  mid,
  @JsonValue('late')
  late,
  @JsonValue('dry')
  dry,
}

enum MilkingSession {
  @JsonValue('morning')
  morning,
  @JsonValue('afternoon')
  afternoon,
  @JsonValue('evening')
  evening,
}

enum YieldType {
  @JsonValue('milk')
  milk,
  @JsonValue('meat')
  meat,
}

extension YieldTypeExtension on YieldType {
  String get name {
    switch (this) {
      case YieldType.meat:
        return 'meat';
      case YieldType.milk:
        return 'milk';
    }
  }

  IconData get icon {
    switch (this) {
      case YieldType.meat:
        return FontAwesomeIcons.bone;
      case YieldType.milk:
        return FontAwesomeIcons.bottleDroplet;
    }
  }

  String get unit {
    switch (this) {
      case YieldType.meat:
        return 'Kilograms';
      case YieldType.milk:
        return 'Liters';
    }
  }
}
