import 'dart:async';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:zsz/Functions/LogoutCheck/LogoutCheckFunc.dart';
import 'package:zsz/Functions/Push_Notification/Function/NotificationCount/NotiCountApiFunc.dart';
import 'package:zsz/Functions/Push_Notification/Function/Tanker/Tanker_Push_Notification.dart';
import 'package:zsz/Provider/Order_screen_refresh_provider.dart/order_screen_refresh_provider.dart';
import 'package:zsz/Screens/Orders_Screen/Pages/Order/Order_Dialog_Box/order_dialog_Error_Msg.dart';
import 'package:zsz/Screens/Orders_Screen/Pages/Order/Order_Dialog_Box/order_dialog_Success_Msg.dart';
import 'package:zsz/Screens/Orders_Screen/Pages/Order/Order_Dialog_Box/order_dialog_loading.dart';
import 'package:zsz/Constant.dart';
import 'package:zsz/main.dart';

String Order_Create_Status = "56";

void Create_Order_Api_Func(context, h_size, w_size, theme, User_Id,
    String Tanker_Type, to_User) async {
  LogoutCheckFunc(User_Id, context);
  final order_screen_r =
      Provider.of<Order_Screen_refresh_provider>(context, listen: false);
  final Response = await post(Uri.parse("${Api_Address}tanker_request.php"),
      body: {"user_id": User_Id, "type": Tanker_Type, "to_user": to_User});

  if (Response.statusCode == 200) {
    Order_Create_Status = "45";
    print("${Order_Create_Status} Order Create status before hitting");
    var data = jsonDecode(Response.body.toString());
    Order_Create_Status = "${data["status"]}";
    print("${Order_Create_Status} Order Create status");

    if (Order_Create_Status == "0") {
      Navigator.pop(context);
      Order_dialog_Error_Msg(
          context, h_size, w_size, theme, "${data["message"]}");
      // "To Request Tanker, Kindly Clear the Dues.");
      print("Request Not Created Due to Pending Dues");
      //  Navigator.push(
      //           context,
      //           MaterialPageRoute(builder: (context) => Order_dialog_pending_dues(context, h_size, w_size, theme);),
      //         );

    } else if (Order_Create_Status == "1") {
      //order screen refresh func
      order_screen_r.Order_Screen_Refresh_Status_Func();
      Navigator.pop(context);
      Order_dialog_Success_Msg(
          context, h_size, w_size, theme, "${data["message"]}", false);
      // "Your Order has been Created.");

// create order notification
      Timer(Duration(seconds: 5), () async {
        // remove
        await notificationCountFunction(context);
        // await Tanker_Push_Notification_Function();
      });

      print("Successfully Created Request");
    } else if (Order_Create_Status == "2") {
      Navigator.pop(context);
      Order_dialog_Error_Msg(
          context, h_size, w_size, theme, "${data["message"]}");
      //  "Cannot Create Due to some Errors.");

      print("Can't Create Due to Any Other Reason");
    } else if (Order_Create_Status == "3") {
      Navigator.pop(context);
      Order_dialog_Error_Msg(
          context, h_size, w_size, theme, "${data["message"]}");
      // "Your Tanker Limit has been Exceeded.");
      print("If User Already Ordered 4 tanker in a single month");
    } else if (Order_Create_Status == "4") {
      Navigator.pop(context);
      Order_dialog_Error_Msg(
          context, h_size, w_size, theme, "${data["message"]}");
      // "You Already have an Order.");
    } else if (Order_Create_Status == "5") {
      Navigator.pop(context);
      Order_dialog_Error_Msg(
          context, h_size, w_size, theme, "${data["message"]}");
      // "Today's Tanker Limit has been Exceeded.");

      print("Today's Limit Reached i.e : 120");
    } else {
      Navigator.pop(context);
      Order_dialog_Error_Msg(
          context, h_size, w_size, theme, "Something went wrong.");
      print("Some thing went wronggggggggggggggggggggg");
    }
  } else {
    Navigator.pop(context);
    Order_dialog_Error_Msg(context, h_size, w_size, theme, "Failed ");
    print(" status is not 200");
  }
}
