import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:zsz/Models/Address_Model_All/address_model_all/address_model_all.dart';
import 'package:zsz/Constant.dart';

class Address_S {
  final String id;
  final String address;

  const Address_S({required this.id, required this.address});

  static Address_S fromJson(Map<String, dynamic> json) =>
      Address_S(id: json['id'], address: json['address']);
}

class Address_Api {
  static Future<List<Address_S>> get_Address_suggestion(String query) async {
    final url = Uri.parse("${Api_Address}address.php");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List Address_List_S = json.decode(response.body);

      return Address_List_S.map((json) => Address_S.fromJson(json))
          .where((addr) {
        final Address_Lower = addr.address.toLowerCase();
        final queryLower = query.toLowerCase();

        return Address_Lower.contains(queryLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}

// To User all address
// signup

List<AddressModelAll> Address_All_List = [];

Future<List<AddressModelAll>> Address_All_Func() async {
  final response = await http.get(Uri.parse("${Api_Address}address.php"));
  var data = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    Address_All_List.clear();

    for (Map i in data) {
      Address_All_List.add(AddressModelAll.fromJson(i));
    }

    // print(Address_All_List);

    return Address_All_List;
  } else {
    return Address_All_List;
  }
}
