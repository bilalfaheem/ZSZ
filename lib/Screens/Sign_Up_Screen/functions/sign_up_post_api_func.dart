import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:zsz/Constant.dart';
import 'package:zsz/Screens/Sign_Up_Screen/success_Or_Fail/sign_up_Failed.dart';
import 'package:zsz/Screens/Sign_Up_Screen/success_Or_Fail/sign_up_Success.dart';
import 'package:zsz/Widgets/Loading/loading.dart';
import 'package:zsz/main.dart';

var Sign_Up_Status_validation = 666;

// for first and second round validation
String Owner_C_validation = "false";
String Tenant_C_validation = "false";
String Phone_validation = "false";

Future<void> Sign_Up_Post_Api(
    context,
    _Sign_up_formKey,
    String name,
    String project_id,
    String owner_cnic,
    String tenant_cnic,
    String user_type,
    String contact,
    password,
    String address_id) async {
  // try {
  print("try");
  final response =
      await post(Uri.parse('${Api_Address_Test}signup.php'), body: {
    "full_name": name,
    "user_type": user_type,
    "project_id": project_id,
    'owner_cnic': owner_cnic,
    "tenant_cnic": tenant_cnic,
    "address": address_id,
    // "unit_no": unit_no,
    // "house_category": house_cat,

    "contact": contact,
    "password": password
  });

  //         var data = jsonDecode(response.body.toString());

  // print(data);
  // print("hit succesful");
  Sign_Up_Status_validation = 5;

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body.toString());

    print('Post Succesfull');
    Sign_Up_Status_validation = data["status"];
    print("Statusssss $Sign_Up_Status_validation");

    //validation
    Owner_C_validation = "true";
    Tenant_C_validation = "true";
    Phone_validation = "true";

    _Sign_up_formKey.currentState!.validate();

    if (Sign_Up_Status_validation == 1) {
      print("statsss");
      Loading_Indicator(context);
      Timer(Duration(milliseconds: 1500), () {
        Navigator.pop(context);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Sign_up_Success()),
        );
      });
    } else if (Sign_Up_Status_validation == 0) {
      print(Sign_Up_Status_validation);
      print("FAiled to sign up");

      Loading_Indicator(context);
      Timer(Duration(milliseconds: 1500), () {
        Navigator.pop(context);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Sign_Up_Failed()),
        );
      });
    } else {
      print("status is not 0 or 1");
    }
  } else {
    var data = jsonDecode(response.body.toString());
    _Sign_up_formKey.currentState!.validate();

    print('failed');
    print(data["status"]);
  }
}
// } catch (e) {
//   print(e.toString());
// }

// void Sub_Category_Fetch_Api(var cat_id) async {
//   // try {
//   http.Response response = await http.post(
//       Uri.parse(
//           'https://persecuted-admissio.000webhostapp.com/restaurant/restaurant_api/product_subcat_list.php'),
//       body: {"category_id": cat_id});

//             var data = jsonDecode(response.body.toString());

//     print(data);
//     print("hitttttttttttttt succesful");

//     if (response.statusCode == 200) {
//        var data = jsonDecode(response.body.toString());

//       print('Post Succesfulllllllllllllllllllllll');
//          print(data);
//     } else {
//                var data = jsonDecode(response.body.toString());

//           print('failed');
//       print(data["status"]);

//     }
//   // } catch (e) {
//   //   print(e.toString());
//   // }
// }
