import 'package:collection/collection.dart';

class CurrentMonth {
  String? status;
  String? message;
  String? month;
  String? dueDate;
  int? amount;

  CurrentMonth({
    this.status,
    this.message,
    this.month,
    this.dueDate,
    this.amount,
  });

  factory CurrentMonth.fromJson(Map<dynamic, dynamic> json) => CurrentMonth(
        status: json['status'] as String?,
        message: json['message'] as String?,
        month: json['month'] as String?,
        dueDate: json['due_date'] as String?,
        amount: json['amount'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'month': month,
        'due_date': dueDate,
        'amount': amount,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! CurrentMonth) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      status.hashCode ^
      message.hashCode ^
      month.hashCode ^
      dueDate.hashCode ^
      amount.hashCode;
}
