import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:zsz/Functions/Shared_Pref_Login_Id_func/shared_Pref_Login_Id_func.dart';
import 'package:zsz/Models/login_user_model/login_user_model.dart';
import 'package:zsz/Screens/Home_Screen/home_screen.dart';
import 'package:zsz/Screens/Login_Screen/Provider/society_name_visibility_provider.dart';
import 'package:zsz/Widgets/Loading/loading.dart';
import 'package:zsz/Constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

var L_status = 100;

List<LoginUserModel> Profile_List = [];
var User_Login_Data;

// for first and second round validation
bool Login_Cnic_Validation = false;
bool Login_Password_validation = false;

// Future<List<UserProfileModel>>
Future<void> Login_Post_Api(
    context, Login_key, String cnic, String password, String Society_Id) async {
  final response = await post(Uri.parse('${Api_Address_Test}login.php'),
      body: {"cnic": cnic, 'password': password, 'project_id': Society_Id});
  print("$Society_Id society id");
  L_status = 99;
  // Login_key.currentState!.validate();

  if (response.statusCode == 200) {
    User_Login_Data = jsonDecode(response.body.toString());

    print('Post Succesfull');
    L_status = User_Login_Data[0]["status"];
    print("Status $L_status");

// second round validation start
    Login_validation_status(true);
// validate
    Login_key.currentState!.validate();

    // if (L_status == 0) {
    //   print("not register");
    // } else
    if (L_status == 1) {
      Loading_Indicator(context);

      Profile_List.clear();
      for (Map i in User_Login_Data) {
        Profile_List.add(LoginUserModel.fromJson(i));
      }

      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString("User_Login_Id", Profile_List[0].id!);
      pref.setString("User_Login_Name", Profile_List.first.fullName!);
      pref.setString("User_Login_Address", Profile_List.first.unitNo!);
      pref.setString("User_Login_Address_id", Profile_List.first.address!);
      pref.setString("User_Login_Password", Profile_List.first.password!);
      pref.setString("User_Login_Update", User_Login_Data[0]["is_updated"]);
      pref.setString("User_Login_Society", User_Login_Data[0]["project_title"]);
      pref.setString("User_Login_Society_Id", User_Login_Data[0]["project_id"]);

      //1.0.3
      Shared_Pref_Login_Id_Func();
      // 1.0.3

      // for society name visibility provider
      final Society_Name_Visibility_provider =
          Provider.of<SocietyNameVisibilityProvider>(context, listen: false);

      Timer(Duration(seconds: 3), () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Home_Screen()),
            (route) => false);
        // second round validation end
        Login_validation_status(false);
        Society_Name_Visibility_provider.SocietyNameVisibilityStatus_Func(
            false);
      });
    } else {
      print("some thing has gone wrong");
      // return Profile_List;
    }
  } else {
    print('failed');
    Login_key.currentState!.validate();
    // return Profile_List;

  }
  // } catch (e) {
  //   print(e.toString());
  // }
}

void Login_validation_status(bool status) {
  print("Login validation changes $status");
  Login_Cnic_Validation = status;
  Login_Password_validation = status;
}
