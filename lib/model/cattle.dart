import 'package:client/config/theme/colors.dart';
import 'package:client/helper/base_object.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cattle.g.dart';

enum Status { healthy, attention, treatment, observation, pregnant }

enum BreedType { dairy, beef, dualPurpose }

@JsonSerializable()
class CattleModel extends BaseObject {
  final String tag;
  final String? name;
  final Status status;
  final String breed;
  final BreedType type;
  final String age;
  final String? gender;
  final DateTime? lastCheck;
  final DateTime? dueDate;
  final String? imageUrl;
  final bool? vaccinationDue;

  CattleModel({
    required this.tag,
    required this.status,
    required this.breed,
    required this.type,
    required this.age,
    this.name,
    this.gender,
    this.lastCheck,
    this.dueDate,
    this.imageUrl,
    this.vaccinationDue,
  });

  factory CattleModel.fromJson(Map<String, dynamic> json) =>
      _$CattleModelFromJson(json);

  Map<String, dynamic> toJson() => _$CattleModelToJson(this);
}

extension StatusColorExtenstion on Status {
  Color get color {
    switch (this) {
      case Status.healthy:
        return AppColors.secondary;
      case Status.attention:
      case Status.treatment:
      case Status.observation:
        return AppColors.warning;
      case Status.pregnant:
        return AppColors.info;
    }
  }
}

extension BreedTypeExtension on BreedType {
  String get label {
    switch (this) {
      case BreedType.dairy:
        return 'Dairy';
      case BreedType.beef:
        return 'Beef';
      case BreedType.dualPurpose:
        return 'Dual-purpose';
    }
  }
}
