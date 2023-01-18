import 'package:collection/collection.dart';

class MaintenanceModel {
  String? status;
  String? message;
  String? month;
  String? payDate;
  String? dueDate;
  String? amount;

  MaintenanceModel({
    this.status,
    this.message,
    this.month,
    this.payDate,
    this.dueDate,
    this.amount,
  });

  factory MaintenanceModel.fromJson(Map<dynamic, dynamic> json) {
    return MaintenanceModel(
      status: json['status'] as String?,
      message: json['message'] as String?,
      month: json['month'] as String?,
      payDate: json['pay_date'] as String?,
      dueDate: json['due_date'] as String?,
      amount: json['amount'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'month': month,
        'pay_date': payDate,
        'due_date': dueDate,
        'amount': amount,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! MaintenanceModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      status.hashCode ^
      message.hashCode ^
      month.hashCode ^
      payDate.hashCode ^
      dueDate.hashCode ^
      amount.hashCode;
}
