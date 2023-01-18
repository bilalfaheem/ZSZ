import 'package:collection/collection.dart';

class NotificationHistoryModel {
  String? id;
  String? type;
  String? message;
  String? userId;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? isSeen;

  NotificationHistoryModel({
    this.id,
    this.type,
    this.message,
    this.userId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.isSeen,
  });

  factory NotificationHistoryModel.fromJson(Map<dynamic, dynamic> json) {
    return NotificationHistoryModel(
      id: json['id'] as String?,
      type: json['type'] as String?,
      message: json['message'] as String?,
      userId: json['user_id'] as String?,
      status: json['status'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      isSeen: json['is_seen'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'message': message,
        'user_id': userId,
        'status': status,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'is_seen': isSeen,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! NotificationHistoryModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      type.hashCode ^
      message.hashCode ^
      userId.hashCode ^
      status.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      isSeen.hashCode;
}
