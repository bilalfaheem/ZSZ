import 'package:collection/collection.dart';

class BillingModell {
  String? user;
  String? address;
  String? dueDate;
  String? payDate;
  int? status;
  int? amount;
  int? payAmount;
  String? month;

  BillingModell({
    this.user,
    this.address,
    this.dueDate,
    this.payDate,
    this.status,
    this.amount,
    this.payAmount,
    this.month,
  });

  factory BillingModell.fromJson(Map<dynamic, dynamic> json) => BillingModell(
        user: json['user'] as String?,
        address: json['address'] as String?,
        dueDate: json['due_date'] as String?,
        payDate: json['pay_date'] as String?,
        status: json['status'] as int?,
        amount: json['amount'] as int?,
        payAmount: json['pay_amount'] as int?,
        month: json['month'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'user': user,
        'address': address,
        'due_date': dueDate,
        'pay_date': payDate,
        'status': status,
        'amount': amount,
        'pay_amount': payAmount,
        'month': month,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! BillingModell) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      user.hashCode ^
      address.hashCode ^
      dueDate.hashCode ^
      payDate.hashCode ^
      status.hashCode ^
      amount.hashCode ^
      payAmount.hashCode ^
      month.hashCode;
}
