import 'package:client/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cattle.g.dart';

enum Status { healthy, attention, treatment, observation, pregnant }

@JsonSerializable()
class CattleModel {
  final String tag;
  final String name;
  final Status status;
  final String breed;
  final String age;
  final String? gender;
  final DateTime? lastCheck;
  final DateTime? dueDate;
  final String? imageUrl;
  final bool? vaccinationDue;

  const CattleModel({
    required this.tag,
    required this.name,
    required this.status,
    required this.breed,
    required this.age,
    this.gender,
    this.lastCheck,
    this.dueDate,
    this.imageUrl,
    this.vaccinationDue,
  });

  factory CattleModel.fromJson(Map<String, dynamic> json) =>
      _$CattleModelFromJson(json);
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
