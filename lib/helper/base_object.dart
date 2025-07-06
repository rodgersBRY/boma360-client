abstract class BaseObject {
  String? id;

  DateTime? createdAt;

  DateTime? updatedAt;

  bool? deleted;

  @override
  String toString() {
    return id ?? super.toString();
  }
}
