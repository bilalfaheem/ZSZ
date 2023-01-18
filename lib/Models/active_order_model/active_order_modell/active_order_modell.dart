import 'package:collection/collection.dart';

class ActiveOrderModell {
  String? id;
  String? fullName;
  String? address;
  String? orderId;
  String? isCompleted;
  String? isFailed;
  String? type;
  String? createdAt;
  String? deliveryAt;
  String? unitNo;
  String? date;
  String? time;
  String? status;

  ActiveOrderModell({
    this.id,
    this.fullName,
    this.address,
    this.orderId,
    this.isCompleted,
    this.isFailed,
    this.type,
    this.createdAt,
    this.deliveryAt,
    this.unitNo,
    this.date,
    this.time,
    this.status,
  });

  factory ActiveOrderModell.fromJson(Map<dynamic, dynamic> json) {
    return ActiveOrderModell(
      id: json['id'] as String?,
      fullName: json['full_name'] as String?,
      address: json['address'] as String?,
      orderId: json['orderId'] as String?,
      isCompleted: json['is_completed'] as String?,
      isFailed: json['is_failed'] as String?,
      type: json['type'] as String?,
      createdAt: json['created_at'] as String?,
      deliveryAt: json['delivery_at'] as String?,
      unitNo: json['unit_no'] as String?,
      date: json['date'] as String?,
      time: json['time'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'full_name': fullName,
        'address': address,
        'orderId': orderId,
        'is_completed': isCompleted,
        'is_failed': isFailed,
        'type': type,
        'created_at': createdAt,
        'delivery_at': deliveryAt,
        'unit_no': unitNo,
        'date': date,
        'time': time,
        'status': status,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ActiveOrderModell) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      fullName.hashCode ^
      address.hashCode ^
      orderId.hashCode ^
      isCompleted.hashCode ^
      isFailed.hashCode ^
      type.hashCode ^
      createdAt.hashCode ^
      deliveryAt.hashCode ^
      unitNo.hashCode ^
      date.hashCode ^
      time.hashCode ^
      status.hashCode;
}
