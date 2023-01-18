import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:zsz/Functions/LogoutCheck/LogoutCheckFunc.dart';
import 'package:zsz/Functions/Shared_Pref_Login_Id_func/shared_Pref_Login_Id_func.dart';
import 'package:zsz/Screens/Setting/Pages/Update_Password.dart/Dialog_box/Failed_Success_Dialog_Box.dart';
import 'package:zsz/Screens/Setting/Pages/Update_Password.dart/Dialog_box/Pass_Success_Dialog_Box.dart';
import 'package:zsz/Constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

var Change_Pass_Status = "44";

Future<void> Update_Password_Func(
    context,
    h_size,
    w_size,
    theme,
    Current_Pass_Key,
    user_id,
    Current_Pas,
    New_Pas,
    Confirm_Pas,
    Change_Pass_Key) async {
  final response =
      await http.post(Uri.parse("${Api_Address}update_password.php"), body: {
    "id": user_id,
    "current_password": Current_Pas,
    "new_password": New_Pas,
    "confirm_password": Confirm_Pas
  });

  Change_Pass_Status = "43";

  if (response.statusCode == 200) {
    print("status code 20000000000");
    var data = jsonDecode(response.body.toString());

    Change_Pass_Status = "${data["status"]}";
    print("Change password Statussssssssssssssssss $Change_Pass_Status");

    // Validation
    Current_Pass_Key.currentState.validate();
    Change_Pass_Key.currentState.validate();

    if (Change_Pass_Status == "1" && Current_Pas != New_Pas) {
// change password shared pref store func
      LogOutCheckUpdateFunc(user_id, New_Pas.toString());
      // Shared_pref_Password_change_func(New_Pas.toString());

      print("Successfully change Passwordddddddddddddddd");
      Pass_Success_dialog_box(
          context, h_size, w_size, theme, "Successfully Change Password");

      //navigations
      Timer(Duration(milliseconds: 5050), () {
        Navigator.pop(context);
        Navigator.pop(context);
        // Navigator.pushReplacement(
        //             context,
        //             MaterialPageRoute(
        //                 builder: (context) =>  Setting_screen()),
        //           );
      });

      // Timer(Duration(seconds: 5),(){
      //     Navigator.pushReplacement(
      //                 context,
      //                 MaterialPageRoute(
      //                     builder: (context) =>  Setting_screen()),
      //               );

      // }
      // );
    } else if (Change_Pass_Status == "0") {
      print("Failed to Change password");
      Pass_Failed_dialog_box(
          context, h_size, w_size, theme, "Failed To Change Password");
      //navigations
      Timer(Duration(milliseconds: 5050), () {
        Navigator.pop(context);
        Navigator.pop(context);
        // Navigator.pushReplacement(
        //             context,
        //             MaterialPageRoute(
        //                 builder: (context) =>  Setting_screen()),
        //           );
      });
      //  Timer(Duration(seconds: 5),(){
      //     Navigator.pushReplacement(
      //                 context,
      //                 MaterialPageRoute(
      //                     builder: (context) =>  Setting_screen()),
      //               );

      // });

    } else if (Change_Pass_Status == "2") {
      print("Wrong Password");
    } else if (Change_Pass_Status == "3") {
      print("Password not match");
    } else {
      print("Error Occur");
    }
  } else {
    print("Error In Else Api Function");
    // return data;
  }
}
