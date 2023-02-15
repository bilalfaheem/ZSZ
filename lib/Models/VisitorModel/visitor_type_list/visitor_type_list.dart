import 'package:collection/collection.dart';

class VisitorTypeList {
  String? id;
  String? name;
  String? createdAt;
  dynamic updatedAt;
  dynamic deletedAt;

  VisitorTypeList({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory VisitorTypeList.fromJson(Map<dynamic, dynamic> json) {
    return VisitorTypeList(
      id: json['id'] as String?,
      name: json['name'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as dynamic,
      deletedAt: json['deleted_at'] as dynamic,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'deleted_at': deletedAt,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! VisitorTypeList) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      deletedAt.hashCode;
}
