import 'package:json_annotation/json_annotation.dart';

abstract class BaseObject {
  String? id;

  @JsonKey(name: 'created_at')
  DateTime? createdAt;

  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;

  bool? deleted;

  @JsonKey(name: 'deleted_at')
  DateTime? deletedAt;

  @override
  String toString() {
    return id ?? super.toString();
  }
}
