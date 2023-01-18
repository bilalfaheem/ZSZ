import 'dart:async';
import 'package:flutter/material.dart';
import 'package:zsz/Screens/Login_Screen/login_screen.dart';
import 'package:zsz/Constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

LogOut_Func(context, bool Loading) async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();

  pref.clear();

// variable Clear
  User_Login_id_S = "null";
  User_Login_name_S = "null";
  User_Login_Address_S = "null";
  User_Login_Address_Id_S = "null";
  User_Login_Password_S = "null";
  User_Login_update_S = "null";
  User_Login_Society_S = "null";
  User_Login_Society_id_S = "null";

  Timer(
      Duration(seconds: Loading ? 2 : 0),
      () => Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const Login_Screen()),
          (route) => false));
}
