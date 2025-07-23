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

  final String? notes;

  YieldModel({
    required this.yieldType,
    required this.quantity,
    required this.date,
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
