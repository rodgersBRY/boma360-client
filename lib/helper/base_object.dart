import 'package:json_annotation/json_annotation.dart';

abstract class BaseObject {
  String? id;

  @JsonKey(name: 'created_at')
  DateTime? createdAt;

  DateTime? updatedAt;

  bool? deleted;

  @override
  String toString() {
    return id ?? super.toString();
  }
}
