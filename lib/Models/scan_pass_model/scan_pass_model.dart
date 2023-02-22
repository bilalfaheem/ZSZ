import 'package:collection/collection.dart';

class ScanPassModel {
  String? id;
  String? passId;
  String? passUserContactId;
  String? qrCode;
  String? isScan;
  String? isSms;
  String? isWhatsapp;
  String? createdAt;
  dynamic updatedAt;
  dynamic deletedAt;
  String? contactName;

  ScanPassModel({
    this.id,
    this.passId,
    this.passUserContactId,
    this.qrCode,
    this.isScan,
    this.isSms,
    this.isWhatsapp,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.contactName
  });

  factory ScanPassModel.fromJson(Map<dynamic, dynamic> json) => ScanPassModel(
        id: json['id'] as String?,
        passId: json['pass_id'] as String?,
        passUserContactId: json['pass_user_contact_id'] as String?,
        qrCode: json['qr_code'] as String?,
        isScan: json['is_scan'] as String?,
        isSms: json['is_sms'] as String?,
        isWhatsapp: json['is_whatsapp'] as String?,
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as dynamic,
        deletedAt: json['deleted_at'] as dynamic,
        contactName: json['contact_name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'pass_id': passId,
        'pass_user_contact_id': passUserContactId,
        'qr_code': qrCode,
        'is_scan': isScan,
        'is_sms': isSms,
        'is_whatsapp': isWhatsapp,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'deleted_at': deletedAt,
        'contact_name':contactName
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ScanPassModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      passId.hashCode ^
      passUserContactId.hashCode ^
      qrCode.hashCode ^
      isScan.hashCode ^
      isSms.hashCode ^
      isWhatsapp.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      deletedAt.hashCode ^
      contactName.hashCode;
}
