import 'package:collection/collection.dart';

class GasBillingCurrentResponse {
  String? status;
  String? message;
  String? month;
  String? payment;
  String? payDate;
  String? dueDate;
  String? previousReading;
  String? currentReading;

  GasBillingCurrentResponse({
    this.status,
    this.message,
    this.month,
    this.payment,
    this.payDate,
    this.dueDate,
    this.previousReading,
    this.currentReading,
  });

  factory GasBillingCurrentResponse.fromJson(Map<dynamic, dynamic> json) {
    return GasBillingCurrentResponse(
      status: json['status'] as String?,
      message: json['message'] as String?,
      month: json['month'] as String?,
      payment: json['payment'] as String?,
      payDate: json['pay_date'] as String?,
      dueDate: json['due_date'] as String?,
      previousReading: json['previous_reading'] as String?,
      currentReading: json['current_reading'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'month': month,
        'payment': payment,
        'pay_date': payDate,
        'due_date': dueDate,
        'previous_reading': previousReading,
        'current_reading': currentReading,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! GasBillingCurrentResponse) return false;
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
      dueDate.hashCode ^
      previousReading.hashCode ^
      currentReading.hashCode;
}
