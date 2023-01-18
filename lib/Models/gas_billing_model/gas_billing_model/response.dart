import 'package:collection/collection.dart';

class Response {
  String? status;
  String? message;
  String? month;
  String? dueDate;
  int? amount;

  Response({
    this.status,
    this.message,
    this.month,
    this.dueDate,
    this.amount,
  });

  factory Response.fromJson(Map<dynamic, dynamic> json) => Response(
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
    if (other is! Response) return false;
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
