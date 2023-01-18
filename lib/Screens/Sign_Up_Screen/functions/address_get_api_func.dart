// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:zsz/Models/address_model/address_model/address_model.dart';
// import 'package:http/http.dart' as http;
// import 'package:zsz/Screens/Sign_Up_Screen/functions/address_dropdown_list.dart';

// List<AddressModel> Address_List = [];

// // Future<List<AddressModel>> Address_function(){
// //   return
// // }

// Future<List<AddressModel>> Address_function() async {
//   final response = await http
//       .get(Uri.parse("http://192.168.100.4//saima_group_api/address.php"));
//   var data = jsonDecode(response.body.toString());
//   if (response.statusCode == 200) {
//     Address_List.clear();
//     // Categories_Api_dropdown_List.clear();
//     for (Map i in data) {
//       Address_List.add(AddressModel.fromJson(i));
//     }

//     // get address name in list Address_Dropdown_List
//     Address_Dropdown_Name_Func();

//     // print(get_cat_name());
//     print(Address_List);
//     print(Address_List.length);

//     return Address_List;
//   } else {
//     return Address_List;
//   }
// }
