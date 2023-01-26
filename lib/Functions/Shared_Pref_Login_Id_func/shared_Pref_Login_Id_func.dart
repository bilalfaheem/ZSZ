import 'package:flutter/material.dart';
import 'package:zsz/Constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

Shared_Pref_Login_Id_Func() async {
  WidgetsFlutterBinding.ensureInitialized();

  // print("Shared Pref Login Func hit");
  SharedPreferences pref = await SharedPreferences.getInstance();
  User_Login_id_S = pref.getString("User_Login_Id").toString();
  User_Login_name_S = pref.getString("User_Login_Name").toString();
  User_Login_Address_S = pref.getString("User_Login_Address").toString();
  User_Login_Address_Id_S = pref.getString("User_Login_Address_id").toString();
  User_Login_Password_S = pref.getString("User_Login_Password").toString();
  User_Login_update_S = pref.getString("User_Login_Update").toString();
  User_Login_Society_S = pref.getString("User_Login_Society").toString();
  User_Login_Society_id_S = pref.getString("User_Login_Society_Id").toString();

  debugPrint("${User_Login_id_S} User id shared pref in functions");
  // print("${User_Login_update_S} User id shared pref in functions update shared");
}

Shared_pref_Password_change_func(String New_password, New_Update) async {
  WidgetsFlutterBinding.ensureInitialized();
  // print( "Shared Pref password change Func hitttttttttttttttttttttttttttttttttttttttttttttt");

  SharedPreferences pref = await SharedPreferences.getInstance();

  pref.setString("User_Login_Password", New_password.toString());
  pref.setString("User_Login_Update", New_Update.toString());

  Shared_Pref_Login_Id_Func();
}

Shared_pref_Number_change_func(String New_Update) async {
  WidgetsFlutterBinding.ensureInitialized();
  // print("Shared Pref password change Func hitttttttttttttttttttttttttttttttttttttttttttttt");

  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setString("User_Login_Update", New_Update.toString());

  Shared_Pref_Login_Id_Func();
}
