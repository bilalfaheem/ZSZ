// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as https;
// import 'package:zsz/Models/history_order_model/history_order_model/history_order_model.dart';

// List<HistoryOrderModel> History_Order_Lis = [];

// Future<List<HistoryOrderModel>> History_Order_Functio(userId) async {
//   final Response = await https.post(
//       Uri.parse("http://192.168.100.4//saima_group_api/order_history.php"),
//       body: {"user_id": userId});
//       print("hitt function Order History func");

//   if (Response.statusCode == 200) {
//     print("hit order history api function 200000");
//     History_Order_List.clear();
//     var data = jsonDecode(Response.body.toString());

//     for (Map i in data) {
//       History_Order_List.add(HistoryOrderModel.fromJson(i));
//     }
//     print("History Order Length {History_Order_List.length}");

//     return History_Order_List;
//   } else {
//     print("Else Order History Function");
//     return History_Order_List;
//   }
// }

import 'dart:convert';
import 'package:zsz/Constant.dart';
import 'package:http/http.dart' as https;
import 'package:zsz/Models/history_order_model/order_history_modell/order_history_modell.dart';

List<OrderHistoryModell> History_Order_List = [];

Future<List<OrderHistoryModell>> History_Order_Function(String userId) async {
  final Response = await https.post(
      Uri.parse("${Api_Address}order_history.php"),
      body: {"user_id": userId});
  print("hittttttttt");

  if (Response.statusCode == 200) {
    History_Order_List.clear();
    var data = jsonDecode(Response.body.toString());
    // print(data);

    for (Map r in data) {
      // print(r);
      History_Order_List.add(OrderHistoryModell.fromJson(r));
      //  print(i);
    }
    print("listttttttttt");
    // print(History_Order_List);
    // print(data);

    return History_Order_List;
  } else {
    return History_Order_List;
  }
}
