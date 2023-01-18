// import 'package:collection/collection.dart';

// class BillingModel {
//   int? status;
//   String? user;
//   String? address;
//   String? month;
//   String? dueDate;
//   int? amount;

//   BillingModel({
//     this.status,
//     this.user,
//     this.address,
//     this.month,
//     this.dueDate,
//     this.amount,
//   });

//   factory BillingModel.fromJson(Map<dynamic, dynamic> json) => BillingModel(
//         status: json['status'] as int?,
//         user: json['user'] as String?,
//         address: json['address'] as String?,
//         month: json['month'] as String?,
//         dueDate: json['due_date'] as String?,
//         amount: json['amount'] as int?,
//       );

//   Map<String, dynamic> toJson() => {
//         'status': status,
//         'user': user,
//         'address': address,
//         'month': month,
//         'due_date': dueDate,
//         'amount': amount,
//       };

//   @override
//   bool operator ==(Object other) {
//     if (identical(other, this)) return true;
//     if (other is! BillingModel) return false;
//     final mapEquals = const DeepCollectionEquality().equals;
//     return mapEquals(other.toJson(), toJson());
//   }

//   @override
//   int get hashCode =>
//       status.hashCode ^
//       user.hashCode ^
//       address.hashCode ^
//       month.hashCode ^
//       dueDate.hashCode ^
//       amount.hashCode;
// }
