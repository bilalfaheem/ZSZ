import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zsz/Screens/Login_Screen/Pages/Forget_Change_Password/provider/forget_change_pass_provider.dart';
import 'package:zsz/Screens/Login_Screen/login_screen.dart';
import 'package:zsz/Screens/Setting/Pages/Update_Password.dart/Dialog_box/Failed_Success_Dialog_Box.dart';
import 'package:zsz/Screens/Setting/Pages/Update_Password.dart/Dialog_box/Pass_Success_Dialog_Box.dart';
import 'package:zsz/Constant.dart';
import 'package:http/http.dart' as http;

Future<void> Forget_Change_Password_Func(
  context,
  user_id,
  New_Pas,
) async {
  final ForgetPassProvider =
      Provider.of<ForgetChangePasswordProvider>(context, listen: false);
  ForgetPassProvider.Loading_Func(true);
  final response =
      await http.post(Uri.parse("${Api_Address}change_password.php"), body: {
    "id": user_id,
    "new_password": New_Pas,
  });

  var data = jsonDecode(response.body.toString());
  print(user_id);
  print(New_Pas);

  if (response.statusCode == 200) {
    print("status code 20000000000");
    print("${data["status"]}");
    if (data["status"].toString() == "1") {
      print(
          "successfully Change passworddddddddddddddddddddddddddddddddddddddddddddddd success${data["status"]}");
      Pass_Success_dialog_box(
          context,
          MediaQuery.of(context).size.height,
          MediaQuery.of(context).size.width,
          Theme.of(context),
          "Successfully Change Password");
      Timer(Duration(milliseconds: 5050), () {
        Navigator.pop(context);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => Login_Screen()),
            (Route<dynamic> route) => route.isFirst
            // route.isFirst
            );
      });

      ForgetPassProvider.Loading_Func(false);
    } else if (data["status"] == "4") {
      print(
          "failed Change passwordddddddddddddddddddddddddddddddddddddddddddddddddddddd failed");
      Pass_Failed_dialog_box(
          context,
          MediaQuery.of(context).size.height,
          MediaQuery.of(context).size.width,
          Theme.of(context),
          "Failed To Change Password");
      Timer(Duration(milliseconds: 5050), () {
        Navigator.pop(context);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => Login_Screen()),
            (Route<dynamic> route) => route.isFirst
            // route.isFirst
            );
      });
      ForgetPassProvider.Loading_Func(false);
    }
  } else {
    print("status not 200 0000000000000000000000000000000000000 not");
    ForgetPassProvider.Loading_Func(false);
  }
}
