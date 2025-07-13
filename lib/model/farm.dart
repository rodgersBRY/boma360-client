import 'package:json_annotation/json_annotation.dart';

part 'farm.g.dart';

@JsonSerializable(includeIfNull: false)
class FarmModel {
  final String? id;

  @JsonKey(name: 'user_id')
  final String userId;

  final String name;

  String? location;

  FarmModel({required this.userId, required this.name, this.id, this.location});

  factory FarmModel.fromJson(Map<String, dynamic> json) =>
      _$FarmModelFromJson(json);

  Map<String, dynamic> toJson() => _$FarmModelToJson(this);
}
