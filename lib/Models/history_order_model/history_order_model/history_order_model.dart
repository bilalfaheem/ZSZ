// import 'package:collection/collection.dart';

// class HistoryOrderModel {
//   String? id;
//   String? fullName;
//   String? unitNo;
//   String? isCompleted;
//   String? isFailed;
//   String? type;
//   String? createdAt;
//   String? status;

//   HistoryOrderModel({
//     this.id,
//     this.fullName,
//     this.unitNo,
//     this.isCompleted,
//     this.isFailed,
//     this.type,
//     this.createdAt,
//     this.status,
//   });

//   factory HistoryOrderModel.fromJson(Map<dynamic, dynamic> json) {
//     return HistoryOrderModel(
//       id: json['id'] as String?,
//       fullName: json['full_name'] as String?,
//       unitNo: json['unit_no'] as String?,
//       isCompleted: json['is_completed'] as String?,
//       isFailed: json['is_failed'] as String?,
//       type: json['type'] as String?,
//       createdAt: json['created_at'] as String?,
//       status: json['status'] as String?,
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'full_name': fullName,
//         'unit_no': unitNo,
//         'is_completed': isCompleted,
//         'is_failed': isFailed,
//         'type': type,
//         'created_at': createdAt,
//         'status': status,
//       };

//   @override
//   bool operator ==(Object other) {
//     if (identical(other, this)) return true;
//     if (other is! HistoryOrderModel) return false;
//     final mapEquals = const DeepCollectionEquality().equals;
//     return mapEquals(other.toJson(), toJson());
//   }

//   @override
//   int get hashCode =>
//       id.hashCode ^
//       fullName.hashCode ^
//       unitNo.hashCode ^
//       isCompleted.hashCode ^
//       isFailed.hashCode ^
//       type.hashCode ^
//       createdAt.hashCode ^
//       status.hashCode;
// }
