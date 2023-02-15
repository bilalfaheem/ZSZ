import 'package:collection/collection.dart';

class ComplainListResponse {
  String? id;
  String? projectId;
  String? userId;
  String? threadReasonId;
  String? createdAt;
  dynamic updatedAt;
  String? isActive;
  String? isCompleted;
  String? isBlock;
  String? reason;
  String? status;
  String? count;

  ComplainListResponse(
      {this.id,
      this.projectId,
      this.userId,
      this.threadReasonId,
      this.createdAt,
      this.updatedAt,
      this.isActive,
      this.isCompleted,
      this.isBlock,
      this.reason,
      this.status,
      this.count});

  factory ComplainListResponse.fromJson(Map<dynamic, dynamic> json) {
    return ComplainListResponse(
      id: json['id'] as String?,
      projectId: json['project_id'] as String?,
      userId: json['user_id'] as String?,
      threadReasonId: json['thread_reason_id'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as dynamic,
      isActive: json['is_active'] as String?,
      isCompleted: json['is_completed'] as String?,
      isBlock: json['is_block'] as String?,
      reason: json['reason'] as String?,
      status: json['status'] as String?,
      count: json['count'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'project_id': projectId,
        'user_id': userId,
        'thread_reason_id': threadReasonId,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'is_active': isActive,
        'is_completed': isCompleted,
        'is_block': isBlock,
        'reason': reason,
        'status': status,
        'count': count,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ComplainListResponse) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      projectId.hashCode ^
      userId.hashCode ^
      threadReasonId.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      isActive.hashCode ^
      isCompleted.hashCode ^
      isBlock.hashCode ^
      reason.hashCode ^
      status.hashCode ^
      count.hashCode;
}
