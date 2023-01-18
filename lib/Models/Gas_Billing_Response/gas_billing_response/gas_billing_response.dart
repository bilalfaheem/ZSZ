import 'package:collection/collection.dart';

class GasBillingResponse {
  String? status;
  String? message;
  String? month;
  String? payment;
  String? payDate;
  String? dueDate;

  GasBillingResponse({
    this.status,
    this.message,
    this.month,
    this.payment,
    this.payDate,
    this.dueDate,
  });

  factory GasBillingResponse.fromJson(Map<dynamic, dynamic> json) {
    return GasBillingResponse(
      status: json['status'] as String?,
      message: json['message'] as String?,
      month: json['month'] as String?,
      payment: json['payment'] as String?,
      payDate: json['pay_date'] as String?,
      dueDate: json['due_date'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'month': month,
        'payment': payment,
        'pay_date': payDate,
        'due_date': dueDate,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! GasBillingResponse) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      status.hashCode ^
      message.hashCode ^
      month.hashCode ^
      payment.hashCode ^
      payDate.hashCode ^
      dueDate.hashCode;
}
