import 'dart:convert';

import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:zsz/Screens/Login_Screen/Pages/Forget_Password/provider/Contact_no_visibility_provider.dart';
import 'package:zsz/Constant.dart';

// String no = "";
bool enter_contact_forget_Password_Visibility = false;

void Get_Phone_Api_Func(context, String House_Id) async {
  final Contact_No_visibility_provider =
      Provider.of<Contact_No_Visibility_Provider>(context, listen: false);
// Loading Start 2
  Contact_No_visibility_provider.Forget_Change_Password_Screen_Navigation_Func(
      "2");

  final Response = await post(Uri.parse("${Api_Address}get_phone.php"),
      body: {"address": House_Id});

  if (Response.statusCode == 200) {
    var data = jsonDecode(Response.body.toString());
    // print("${data["status"]} visibility SStatusssssssssss");
    // print(data["response"]["id"]);
    // print(data["response"]["contact"]);
    // no = data["response"]["contact"];

    Contact_No_visibility_provider.Change_Contact_No_Func(
        data["status"].toString() == "1",
        data["response"]["contact"].toString(),
        data["response"]["id"].toString());
// loading end 3
    Contact_No_visibility_provider
        .Forget_Change_Password_Screen_Navigation_Func("3");
  } else {
    print(" status is not 200");
  }
}
