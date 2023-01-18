import 'package:collection/collection.dart';

class AddressModelAll {
  String? id;
  String? address;

  AddressModelAll({this.id, this.address});

  factory AddressModelAll.fromJson(Map<dynamic, dynamic> json) {
    return AddressModelAll(
      id: json['id'] as String?,
      address: json['address'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'address': address,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! AddressModelAll) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => id.hashCode ^ address.hashCode;
}
