import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:zsz/Models/Address_Swap_Model_All/address_swap_model_all/address_swap_model_all.dart';
import 'package:zsz/Constant.dart';

// List Address_List_Swap_Id = [];
// List Address_List_Swap_Address = [];

class Address_Swap {
  final String id;
  final String address;

  const Address_Swap({required this.id, required this.address});

  static Address_Swap fromJson(Map<String, dynamic> json) =>
      Address_Swap(id: json['id'], address: json['address']);
}

class Address_Swap_Api {
  static Future<List<Address_Swap>> get_Address_suggestion(String query) async {
    final url = Uri.parse("${Api_Address}to_user.php");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List Address_List_Swap = json.decode(response.body);
      // Address_List_Swap_Id.clear();
      // Address_List_Swap_Address.clear();

      //  Address_List_Swap_Id = Address_List_Swap;
      //  print(Address_List_Swap_Id);

      return Address_List_Swap.map((json) => Address_Swap.fromJson(json))
          .where((addr_s) {
        // Address_List_Swap_Id.add(addr_s.id);
        // Address_List_Swap_Address.add(addr_s.address);

        final Address_Lower = addr_s.address.toLowerCase();
        final queryLower = query.toLowerCase();

        return Address_Lower.contains(queryLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}

// To User swap all address

List<AddressSwapModelAll> Address_Swap_All_List = [];

Future<List<AddressSwapModelAll>> Address_Swap_All_Func() async {
  final response = await http.get(Uri.parse("${Api_Address}to_user.php"));
  var data = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    Address_Swap_All_List.clear();

    for (Map i in data) {
      Address_Swap_All_List.add(AddressSwapModelAll.fromJson(i));
    }

    // print(Address_Swap_All_List);

    return Address_Swap_All_List;
  } else {
    return Address_Swap_All_List;
  }
}
