import 'package:collection/collection.dart';

class ActivePassModel {
  String? contactName;
  String? qrCode;
  String? passId;
  String? id;
  String? passTypeId;
  String? passEventId;
  String? visitorTypeId;
  String? passValidityId;
  String? startDate;
  String? endDate;
  String? addressId;
  String? createdAt;
  dynamic updatedAt;
  dynamic deletedAt;
  String? passEvent;
  String? passType;
  String? visitorType;

  ActivePassModel({
    this.contactName,
    this.qrCode,
    this.passId,
    this.id,
    this.passTypeId,
    this.passEventId,
    this.visitorTypeId,
    this.passValidityId,
    this.startDate,
    this.endDate,
    this.addressId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.passEvent,
    this.passType,
    this.visitorType,
  });

  factory ActivePassModel.fromJson(Map<dynamic, dynamic> json) {
    return ActivePassModel(
      contactName: json['contact_name'] as String?,
      qrCode: json['qr_code'] as String?,
      passId: json['pass_id'] as String?,
      id: json['id'] as String?,
      passTypeId: json['pass_type_id'] as String?,
      passEventId: json['pass_event_id'] as String?,
      visitorTypeId: json['visitor_type_id'] as String?,
      passValidityId: json['pass_validity_id'] as String?,
      startDate: json['start_date'] as String?,
      endDate: json['end_date'] as String?,
      addressId: json['address_id'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as dynamic,
      deletedAt: json['deleted_at'] as dynamic,
      passEvent: json['pass_event'] as String?,
      passType: json['pass_type'] as String?,
      visitorType: json['visitor_type'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'contact_name': contactName,
        'qr_code': qrCode,
        'pass_id': passId,
        'id': id,
        'pass_type_id': passTypeId,
        'pass_event_id': passEventId,
        'visitor_type_id': visitorTypeId,
        'pass_validity_id': passValidityId,
        'start_date': startDate,
        'end_date': endDate,
        'address_id': addressId,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'deleted_at': deletedAt,
        'pass_event': passEvent,
        'pass_type': passType,
        'visitor_type': visitorType,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ActivePassModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      contactName.hashCode ^
      qrCode.hashCode ^
      passId.hashCode ^
      id.hashCode ^
      passTypeId.hashCode ^
      passEventId.hashCode ^
      visitorTypeId.hashCode ^
      passValidityId.hashCode ^
      startDate.hashCode ^
      endDate.hashCode ^
      addressId.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      deletedAt.hashCode ^
      passEvent.hashCode ^
      passType.hashCode ^
      visitorType.hashCode;
}
