import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:zsz/Functions/LogoutCheck/LogoutCheckFunc.dart';
import 'package:zsz/Functions/Push_Notification/Function/NotificationCount/NotiCountApiFunc.dart';
import 'package:zsz/Provider/Order_screen_refresh_provider.dart/order_screen_refresh_provider.dart';
import 'package:zsz/Screens/Orders_Screen/Pages/Order/Order_Dialog_Box/order_dialog_Error_Msg.dart';
import 'package:zsz/Screens/Orders_Screen/Pages/Order/Order_Dialog_Box/order_dialog_Success_Msg.dart';
import 'package:zsz/Constant.dart';
import 'package:zsz/main.dart';

String Order_Deliver_Status = "56";

void Order_Deliver_Api_Func(
    context, h_size, w_size, theme, Order_Id, Driver_Id) async {
  LogoutCheckFunc(User_Login_id_S, context);
  print(Order_Id);
  print(Driver_Id);
  print("Order Id Driver Id");
  final order_screen_r =
      Provider.of<Order_Screen_refresh_provider>(context, listen: false);
  final Response = await post(Uri.parse("${Api_Address}order_complete.php"),
      body: {"order_id": Order_Id, "driver_id": Driver_Id});

  if (Response.statusCode == 200) {
    Order_Deliver_Status = "45";
    print("${Order_Deliver_Status} Order Deliver status before hitting");
    var data = jsonDecode(Response.body.toString());
    Order_Deliver_Status = "${data["status"]}";
    print("${Order_Deliver_Status} Order Deliver status");

    if (Order_Deliver_Status == "0") {
      Navigator.pop(context);
      Order_dialog_Error_Msg(
          context, h_size, w_size, theme, "${data["message"]}");
      // "To Request Tanker, Kindly Clear the Dues.");
      print("Request Not Created Due to Pending Dues");
    } else if (Order_Deliver_Status == "1") {
      // Navigator.pop(context);
      order_screen_r.Order_Screen_Refresh_Status_Func();
      Navigator.pop(context);
      Order_dialog_Success_Msg(
          context, h_size, w_size, theme, "${data["message"]}", true);
      // "Your Order has been Created.");

// create order notification
      // Timer(Duration(seconds: 5), () async {
      //   // remove
      //   await Notification_Count_Function(context);
      //   // await Tanker_Push_Notification_Function();       //remove 23/1/23
      // });

      print("Successfully Tanker Delivered");
    } else {
      Navigator.pop(context);
      Order_dialog_Error_Msg(
          context, h_size, w_size, theme, "Something went wrong.");
      print("Some thing went wronggggggggggggggggggggg");
    }
  } else {
    Order_dialog_Error_Msg(context, h_size, w_size, theme, "Error Msg ");
    print(" status is not 200");
  }
}
