import 'dart:convert';

import 'package:http/http.dart' as https;
import 'package:zsz/Functions/LogoutCheck/LogoutCheckFunc.dart';

import 'package:zsz/Models/active_order_model/active_order_modell/active_order_modell.dart';
import 'package:zsz/Constant.dart';

List<ActiveOrderModell> Active_Order_List = [];

Future<List<ActiveOrderModell>> Active_Order_Function(
    String userId, context) async {
  LogoutCheckFunc(userId, context);

  final Response = await https.post(Uri.parse("${Api_Address}active_order.php"),
      body: {"user_id": userId});

  if (Response.statusCode == 200) {
    Active_Order_List.clear();
    var data = jsonDecode(Response.body.toString());

    for (Map i in data) {
      Active_Order_List.add(ActiveOrderModell.fromJson(i));
    }

    return Active_Order_List;
  } else {
    return Active_Order_List;
  }
}
