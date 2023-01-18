import 'package:collection/collection.dart';

class MaintenanceHistoryModel {
  String? id;
  String? userId;
  String? amount;
  String? date;
  String? createdAt;

  MaintenanceHistoryModel({
    this.id,
    this.userId,
    this.amount,
    this.date,
    this.createdAt,
  });

  factory MaintenanceHistoryModel.fromJson(Map<dynamic, dynamic> json) {
    return MaintenanceHistoryModel(
      id: json['id'] as String?,
      userId: json['user_id'] as String?,
      amount: json['amount'] as String?,
      date: json['date'] as String?,
      createdAt: json['created_at'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'amount': amount,
        'date': date,
        'created_at': createdAt,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! MaintenanceHistoryModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      userId.hashCode ^
      amount.hashCode ^
      date.hashCode ^
      createdAt.hashCode;
}
