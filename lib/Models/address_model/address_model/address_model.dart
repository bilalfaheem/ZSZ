import 'package:collection/collection.dart';

class AddressModel {
  String? id;
  String? address;

  AddressModel({this.id, this.address});

  factory AddressModel.fromJson(Map<dynamic, dynamic> json) => AddressModel(
        id: json['id'] as String?,
        address: json['address'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'address': address,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! AddressModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => id.hashCode ^ address.hashCode;
}
