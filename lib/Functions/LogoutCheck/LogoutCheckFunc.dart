import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:zsz/Constant.dart';
import 'package:zsz/Functions/LogOut_Func/logout_func.dart';
import 'package:zsz/Functions/Shared_Pref_Login_Id_func/shared_Pref_Login_Id_func.dart';
import 'package:shared_preferences/shared_preferences.dart';

void LogoutCheckFunc(String userId, context) async {
  final Response = await http
      .post(Uri.parse("${Api_Address}single_user.php"), body: {"id": userId});

  if (Response.statusCode == 200) {
    var UpdateData = jsonDecode(Response.body.toString());

    // print("${UpdateData[0]["is_updated"]} User Updated ");

    // print("${userLoginupdate_S} shared update");

    if (userLoginupdate_S != UpdateData[0]["is_updated"].toString() ||
        userLoginIdShared == null ||
        userLoginIdShared == "null") {
      LogOut_Func(context, false);
      // print("LogOut");
    }
  }
}

void LogOutCheckUpdateFunc(String userId, String New_password) async {
  final Response = await http
      .post(Uri.parse("${Api_Address}single_user.php"), body: {"id": userId});

  if (Response.statusCode == 200) {
    var UpdateData = jsonDecode(Response.body.toString());
    Shared_pref_Password_change_func(
        New_password, UpdateData[0]["is_updated"].toString());
  }
}

void LogOutCheckUpdateNumberFunc(String userId) async {
  final Response = await http
      .post(Uri.parse("${Api_Address}single_user.php"), body: {"id": userId});

  if (Response.statusCode == 200) {
    var UpdateData = jsonDecode(Response.body.toString());

    Shared_pref_Number_change_func(UpdateData[0]["is_updated"].toString());
  }
}
