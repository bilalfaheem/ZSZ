import 'package:collection/collection.dart';

class ChatHistory {
  String? id;
  String? threadId;
  String? type;
  String? message;
  String? file;
  String? createdAt;
  dynamic updatedAt;

  ChatHistory({
    this.id,
    this.threadId,
    this.type,
    this.message,
    this.file,
    this.createdAt,
    this.updatedAt,
  });

  factory ChatHistory.fromJson(Map<dynamic, dynamic> json) => ChatHistory(
        id: json['id'] as String?,
        threadId: json['thread_id'] as String?,
        type: json['type'] as String?,
        message: json['message'] as String?,
        file: json['file'] as String?,
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'thread_id': threadId,
        'type': type,
        'message': message,
        'file': file,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ChatHistory) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      threadId.hashCode ^
      type.hashCode ^
      message.hashCode ^
      file.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode;
}
