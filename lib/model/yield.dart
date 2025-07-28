import 'package:client/helper/base_object.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'yield.g.dart';

@JsonSerializable(includeIfNull: false)
class YieldModel extends BaseObject {
  @JsonKey(name: 'yield_type')
  final YieldType yieldType;

  final String quantity;

  final DateTime date;

  @JsonKey(name: 'farmer_id')
  final String farmerId;

  @JsonKey(name: 'cattle_id')
  final String cattleId;

  @JsonKey(name: 'date_collected')
  final String dateCollected;

  @JsonKey(name: 'milking_session')
  final String? milkingSession;

  @JsonKey(name: 'lactation_stage')
  final String? lactationStage;

  @JsonKey(name: 'milk_quality_score')
  final String? milkQualityScore;

  @JsonKey(name: 'slaughter_weight')
  final String? slaughterWeight;

  @JsonKey(name: 'carcass_weight')
  final String? carcassWeight;

  @JsonKey(name: 'meat_grade')
  final String? meatGrade;

  final String? notes;

  YieldModel({
    required this.yieldType,
    required this.quantity,
    required this.date,
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

enum YieldType {
  @JsonValue('milk')
  milk,
  @JsonValue('weight')
  weight,
  @JsonValue('meat')
  meat,
}

extension YieldTypeExtension on YieldType {
  String get name {
    switch (this) {
      case YieldType.meat:
        return 'Meat';
      case YieldType.milk:
        return 'Milk';
      case YieldType.weight:
        return 'Weight';
    }
  }

  Widget get icon {
    switch (this) {
      case YieldType.meat:
        return Icon(FontAwesomeIcons.bone);
      case YieldType.milk:
        return Icon(FontAwesomeIcons.bottleDroplet);
      case YieldType.weight:
        return Icon(FontAwesomeIcons.weightScale);
    }
  }

  String get label {
    switch (this) {
      case YieldType.meat:
        return 'Kilograms';
      case YieldType.milk:
        return 'Liters';
      case YieldType.weight:
        return 'Kilograms';
    }
  }
}
