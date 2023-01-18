// import 'package:collection/collection.dart';

// class BillingHistoryModel {
//   String? id;
//   String? userId;
//   String? amount;
//   String? date;

//   BillingHistoryModel({this.id, this.userId, this.amount, this.date});

//   factory BillingHistoryModel.fromJson(Map<dynamic, dynamic> json) {
//     return BillingHistoryModel(
//       id: json['id'] as String?,
//       userId: json['user_id'] as String?,
//       amount: json['amount'] as String?,
//       date: json['date'] as String?,
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'user_id': userId,
//         'amount': amount,
//         'date': date,
//       };

//   @override
//   bool operator ==(Object other) {
//     if (identical(other, this)) return true;
//     if (other is! BillingHistoryModel) return false;
//     final mapEquals = const DeepCollectionEquality().equals;
//     return mapEquals(other.toJson(), toJson());
//   }

//   @override
//   int get hashCode =>
//       id.hashCode ^ userId.hashCode ^ amount.hashCode ^ date.hashCode;
// }
