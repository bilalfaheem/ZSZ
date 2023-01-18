import 'package:collection/collection.dart';

class MaintenanceAndBillingModel {
  String? month;
  String? billAmount;
  String? payment;
  String? payDate;
  String? payCreatedAt;

  MaintenanceAndBillingModel({
    this.month,
    this.billAmount,
    this.payment,
    this.payDate,
    this.payCreatedAt,
  });

  factory MaintenanceAndBillingModel.fromJson(Map<dynamic, dynamic> json) {
    return MaintenanceAndBillingModel(
      month: json['month'] as String?,
      billAmount: json['bill_amount'] as String?,
      payment: json['payment'] as String?,
      payDate: json['pay_date'] as String?,
      payCreatedAt: json['pay_created_at'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'month': month,
        'bill_amount': billAmount,
        'payment': payment,
        'pay_date': payDate,
        'pay_created_at': payCreatedAt,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! MaintenanceAndBillingModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      month.hashCode ^
      billAmount.hashCode ^
      payment.hashCode ^
      payDate.hashCode ^
      payCreatedAt.hashCode;
}
