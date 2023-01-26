import 'dart:async';

import 'package:flutter/material.dart';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:zsz/Functions/LogoutCheck/LogoutCheckFunc.dart';
import 'package:zsz/Screens/Profile_Screen/functions/profile_get_api_func.dart';
import 'package:zsz/Screens/Setting/Pages/Update_Password.dart/Dialog_box/Failed_Success_Dialog_Box.dart';
import 'package:zsz/Screens/Setting/Pages/Update_Password.dart/Dialog_box/Pass_Success_Dialog_Box.dart';
import 'package:zsz/Screens/Setting/Screen/setting_screen.dart';
import 'package:zsz/main.dart';
import 'package:zsz/Constant.dart';

Future<void> generateComplainApiFunc(
    context, h_size, w_size, theme, threadReasonId) async {
  final response =
      await http.post(Uri.parse("${Api_Address}chat/create_thread.php"), body: {
    "project_id": User_Login_Society_id_S,
    // "user_id":"5",
    "user_id": User_Login_id_S,
    "thread_reason_id": threadReasonId.toString()
  });

  if (response.statusCode == 200) {
    print("status code 20000000000");
    var data = jsonDecode(response.body.toString());

    final createThreadStatus = data["status"].toString();
    print("$createThreadStatus thread status");

    if (createThreadStatus == "1") {
      print("Successfully created thread Contacttttttt");
      Navigator.pop(context);
      Pass_Success_dialog_box(
          context, h_size, w_size, theme, data["message"].toString());

      // profile list reload for validation of same password
//ios
      // Active_User_Func(User_Login_id_S.toString(),context);

    } else if (createThreadStatus == "2") {
      print("Failed to Change Contactttttt");
      Navigator.pop(context);
      Pass_Failed_dialog_box(
          context, h_size, w_size, theme, data["message"].toString());
    } else {
      Navigator.pop(context);
      Pass_Failed_dialog_box(context, h_size, w_size, theme, "failed");
      print("Error Occur");
    }
  } else {
    print("Error In Else Api Function");
    // return data;
  }
}
