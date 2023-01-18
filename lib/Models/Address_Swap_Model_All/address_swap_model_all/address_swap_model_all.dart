import 'package:collection/collection.dart';

class AddressSwapModelAll {
  String? id;
  String? address;

  AddressSwapModelAll({this.id, this.address});

  factory AddressSwapModelAll.fromJson(Map<dynamic, dynamic> json) {
    return AddressSwapModelAll(
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
    if (other is! AddressSwapModelAll) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => id.hashCode ^ address.hashCode;
}
