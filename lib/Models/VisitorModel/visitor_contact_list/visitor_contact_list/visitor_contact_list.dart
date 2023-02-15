import 'package:collection/collection.dart';

class VisitorContactList {
  String? id;
  String? userId;
  String? contactName;
  String? contactPhone;
  String? createdAt;
  dynamic updatedAt;
  dynamic deletedAt;

  VisitorContactList({
    this.id,
    this.userId,
    this.contactName,
    this.contactPhone,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory VisitorContactList.fromJson(Map<dynamic, dynamic> json) {
    return VisitorContactList(
      id: json['id'] as String?,
      userId: json['user_id'] as String?,
      contactName: json['contact_name'] as String?,
      contactPhone: json['contact_phone'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as dynamic,
      deletedAt: json['deleted_at'] as dynamic,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'contact_name': contactName,
        'contact_phone': contactPhone,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'deleted_at': deletedAt,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! VisitorContactList) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      userId.hashCode ^
      contactName.hashCode ^
      contactPhone.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      deletedAt.hashCode;
}
