import 'package:collection/collection.dart';

class SingleUserModell {
  String? id;
  String? fullName;
  String? userType;
  String? ownerCnic;
  String? tenantCnic;
  String? contact;
  String? password;
  String? address;
  String? createdAt;
  String? isUpdated;
  String? updatedAt;

  SingleUserModell({
    this.id,
    this.fullName,
    this.userType,
    this.ownerCnic,
    this.tenantCnic,
    this.contact,
    this.password,
    this.address,
    this.createdAt,
    this.isUpdated,
    this.updatedAt,
  });

  factory SingleUserModell.fromJson(Map<dynamic, dynamic> json) {
    return SingleUserModell(
      id: json['id'] as String?,
      fullName: json['full_name'] as String?,
      userType: json['user_type'] as String?,
      ownerCnic: json['owner_cnic'] as String?,
      tenantCnic: json['tenant_cnic'] as String?,
      contact: json['contact'] as String?,
      password: json['password'] as String?,
      address: json['address'] as String?,
      createdAt: json['created_at'] as String?,
      isUpdated: json['is_updated'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'full_name': fullName,
        'user_type': userType,
        'owner_cnic': ownerCnic,
        'tenant_cnic': tenantCnic,
        'contact': contact,
        'password': password,
        'address': address,
        'created_at': createdAt,
        'is_updated': isUpdated,
        'updated_at': updatedAt,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! SingleUserModell) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      fullName.hashCode ^
      userType.hashCode ^
      ownerCnic.hashCode ^
      tenantCnic.hashCode ^
      contact.hashCode ^
      password.hashCode ^
      address.hashCode ^
      createdAt.hashCode ^
      isUpdated.hashCode ^
      updatedAt.hashCode;
}
