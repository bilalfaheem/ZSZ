import 'package:flutter/material.dart';
import 'package:zsz/Constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

Shared_Pref_Login_Id_Func() async {
  WidgetsFlutterBinding.ensureInitialized();

  // print("Shared Pref Login Func hit");
  SharedPreferences pref = await SharedPreferences.getInstance();
  userLoginIdShared = pref.getString("userLoginId").toString();
  userLoginname_S = pref.getString("userLoginName").toString();
  userLoginAddress_S = pref.getString("userLoginAddress").toString();
  userLoginAddress_Id_S = pref.getString("userLoginAddress_id").toString();
  userLoginPassword_S = pref.getString("userLoginPassword").toString();
  userLoginupdate_S = pref.getString("userLoginUpdate").toString();
  userLoginSociety_S = pref.getString("userLoginSociety").toString();
  userLoginSociety_id_S = pref.getString("userLoginSociety_Id").toString();
  userLoginQr_S = pref.getString("userLoginQr").toString();
  print("<<<<<<<<<<<<<<<<<<<$userLoginQr_S>>>>>>>>>>>>>>>>>>>");

  debugPrint("${userLoginIdShared} User id shared pref in functions");
  // print("${userLoginupdate_S} User id shared pref in functions update shared");
}

Shared_pref_Password_change_func(String New_password, New_Update) async {
  WidgetsFlutterBinding.ensureInitialized();
  // print( "Shared Pref password change Func hitttttttttttttttttttttttttttttttttttttttttttttt");

  SharedPreferences pref = await SharedPreferences.getInstance();

  pref.setString("userLoginPassword", New_password.toString());
  pref.setString("userLoginUpdate", New_Update.toString());

  Shared_Pref_Login_Id_Func();
}

Shared_pref_Number_change_func(String New_Update) async {
  WidgetsFlutterBinding.ensureInitialized();
  // print("Shared Pref password change Func hitttttttttttttttttttttttttttttttttttttttttttttt");

  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setString("userLoginUpdate", New_Update.toString());

  Shared_Pref_Login_Id_Func();
}
