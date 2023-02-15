import 'package:collection/collection.dart';

class VisitorPassValidity {
  String? id;
  String? hours;
  String? createdAt;
  dynamic updatedAt;
  dynamic deletedAt;

  VisitorPassValidity({
    this.id,
    this.hours,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory VisitorPassValidity.fromJson(Map<dynamic, dynamic> json) {
    return VisitorPassValidity(
      id: json['id'] as String?,
      hours: json['hours'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as dynamic,
      deletedAt: json['deleted_at'] as dynamic,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'hours': hours,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'deleted_at': deletedAt,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! VisitorPassValidity) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      hours.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      deletedAt.hashCode;
}
