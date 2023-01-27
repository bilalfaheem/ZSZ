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

var Change_Contact_Status = "44";

//validation
String Change_Contact_Validation = "false";

Future<void> Update_Contact_Func(context, h_size, w_size, theme, user_id,
    Contact, update_contact_form_keyy) async {
  final response =
      await http.post(Uri.parse("${Api_Address}update_contact.php"), body: {
    "id": user_id,
    "contact": Contact,
  });

  Change_Contact_Status = "43";

  if (response.statusCode == 200) {
    print("status code 20000000000");
    var data = jsonDecode(response.body.toString());

    Change_Contact_Status = "${data["status"]}";
    print("Change password Statussssssssssssssssss $Change_Contact_Status");

    //validation
    Change_Contact_Validation = "true";
    update_contact_form_keyy.currentState!.validate();

    if (Change_Contact_Status == "1") {
      print("Successfully change Contacttttttt");
      LogOutCheckUpdateNumberFunc(user_id);
      Pass_Success_dialog_box(
          context, h_size, w_size, theme, "Successfully Change Contact");

      // profile list reload for validation of same password
//ios
      // Active_User_Func(userLoginIdShared.toString(),context);

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
    } else if (Change_Contact_Status == "0") {
      print("Failed to Change Contactttttt");
      Pass_Failed_dialog_box(
          context, h_size, w_size, theme, "Failed To Change Contact");

      //navigation
      Timer(Duration(milliseconds: 5050), () {
        Navigator.pop(context);
        Navigator.pop(context);
        // Navigator.pushReplacement(
        //             context,
        //             MaterialPageRoute(
        //                 builder: (context) =>  Setting_screen()),
        //           );
      });
    } else if (Change_Contact_Status == "4") {
      print("error in change number");
    } else if (Change_Contact_Status == "2") {
      print("contact already existed");
    } else {
      // Pass_Failed_dialog_box(
      //     context, h_size, w_size, theme, "Failed To Change Contact");
      print("Error Occur");
    }

    // Validation
    // Current_Pass_Key.currentState.validate();

    // if(Change_Pass_Status == "1"){
    //   print("Successfully change Password");
    // }
    // else if (Change_Pass_Status == "0"){
    //   print("Failed to Change password");
    // }
    //  else if (Change_Pass_Status == "2"){
    //   print("Wrong Password");
    // }
    // else {
    //   print("Error Occur");
    // }

  } else {
    print("Error In Else Api Function");
    // return data;
  }
}
