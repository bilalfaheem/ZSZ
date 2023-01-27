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
  userLoginIdShared = "null";
  userLoginname_S = "null";
  userLoginAddress_S = "null";
  userLoginAddress_Id_S = "null";
  userLoginPassword_S = "null";
  userLoginupdate_S = "null";
  userLoginSociety_S = "null";
  userLoginSociety_id_S = "null";

  Timer(
      Duration(seconds: Loading ? 2 : 0),
      () => Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const Login_Screen()),
          (route) => false));
}
