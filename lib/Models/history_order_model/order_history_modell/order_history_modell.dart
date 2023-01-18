import 'package:collection/collection.dart';

class OrderHistoryModell {
  String? id;
  String? fullName;
  String? orderId;
  String? isCompleted;
  String? isFailed;
  String? type;
  String? createdAt;
  String? updatedAt;
  String? deliveryAt;
  String? unitNo;
  String? status;

  OrderHistoryModell({
    this.id,
    this.fullName,
    this.orderId,
    this.isCompleted,
    this.isFailed,
    this.type,
    this.createdAt,
    this.updatedAt,
    this.deliveryAt,
    this.unitNo,
    this.status,
  });

  factory OrderHistoryModell.fromJson(Map<dynamic, dynamic> json) {
    return OrderHistoryModell(
      id: json['id'] as String?,
      fullName: json['full_name'] as String?,
      orderId: json['orderId'] as String?,
      isCompleted: json['is_completed'] as String?,
      isFailed: json['is_failed'] as String?,
      type: json['type'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      deliveryAt: json['delivery_at'] as String?,
      unitNo: json['unit_no'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'full_name': fullName,
        'orderId': orderId,
        'is_completed': isCompleted,
        'is_failed': isFailed,
        'type': type,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'delivery_at': deliveryAt,
        'unit_no': unitNo,
        'status': status,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! OrderHistoryModell) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      fullName.hashCode ^
      orderId.hashCode ^
      isCompleted.hashCode ^
      isFailed.hashCode ^
      type.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      deliveryAt.hashCode ^
      unitNo.hashCode ^
      status.hashCode;
}
