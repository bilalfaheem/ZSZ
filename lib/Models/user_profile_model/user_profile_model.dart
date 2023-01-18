// import 'package:collection/collection.dart';

// class UserProfileModel {
//   String? id;
//   String? fullName;
//   String? password;
//   String? userType;
//   String? ownerCnic;
//   String? tenantCnic;
//   String? unitNo;
//   String? houseCategory;
//   String? contact;
//   String? isActive;
//   String? isBlock;
//   String? createdAt;
//   String? updatedAt;
//   int? status;

//   UserProfileModel({
//     this.id,
//     this.fullName,
//     this.password,
//     this.userType,
//     this.ownerCnic,
//     this.tenantCnic,
//     this.unitNo,
//     this.houseCategory,
//     this.contact,
//     this.isActive,
//     this.isBlock,
//     this.createdAt,
//     this.updatedAt,
//     this.status,
//   });

//   factory UserProfileModel.fromJson(Map<dynamic, dynamic> json) {
//     return UserProfileModel(
//       id: json['id'] as String?,
//       fullName: json['full_name'] as String?,
//       password: json['password'] as String?,
//       userType: json['user_type'] as String?,
//       ownerCnic: json['owner_cnic'] as String?,
//       tenantCnic: json['tenant_cnic'] as String?,
//       unitNo: json['unit_no'] as String?,
//       houseCategory: json['house_category'] as String?,
//       contact: json['contact'] as String?,
//       isActive: json['is_active'] as String?,
//       isBlock: json['is_block'] as String?,
//       createdAt: json['created_at'] as String?,
//       updatedAt: json['updated_at'] as String?,
//       status: json['status'] as int?,
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'full_name': fullName,
//         'password': password,
//         'user_type': userType,
//         'owner_cnic': ownerCnic,
//         'tenant_cnic': tenantCnic,
//         'unit_no': unitNo,
//         'house_category': houseCategory,
//         'contact': contact,
//         'is_active': isActive,
//         'is_block': isBlock,
//         'created_at': createdAt,
//         'updated_at': updatedAt,
//         'status': status,
//       };

//   @override
//   bool operator ==(Object other) {
//     if (identical(other, this)) return true;
//     if (other is! UserProfileModel) return false;
//     final mapEquals = const DeepCollectionEquality().equals;
//     return mapEquals(other.toJson(), toJson());
//   }

//   @override
//   int get hashCode =>
//       id.hashCode ^
//       fullName.hashCode ^
//       password.hashCode ^
//       userType.hashCode ^
//       ownerCnic.hashCode ^
//       tenantCnic.hashCode ^
//       unitNo.hashCode ^
//       houseCategory.hashCode ^
//       contact.hashCode ^
//       isActive.hashCode ^
//       isBlock.hashCode ^
//       createdAt.hashCode ^
//       updatedAt.hashCode ^
//       status.hashCode;
// }
