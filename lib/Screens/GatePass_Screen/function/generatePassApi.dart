import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:zsz/Constant.dart';
import 'package:zsz/Models/chat_history/chat_history.dart';
import 'package:zsz/Screens/Setting/Pages/Update_Password.dart/Dialog_box/Failed_Success_Dialog_Box.dart';
import 'package:zsz/Screens/Setting/Pages/Update_Password.dart/Dialog_box/Pass_Success_Dialog_Box.dart';



Future generatePassFunc(context,bool status,String eventTypeId,passTypeId,passValidityId,visitorTypeId,userContacId,userContactName,userContactNo) async {
  print("Generate Pass");
  print(status);
  print(userContactName);
  print(userContactNo);
   print("eventID$eventTypeId passTypeId$passTypeId passDurationId$passValidityId passContactId$userContacId visitorTYpeID$visitorTypeId");
   final size = MediaQuery.of(context).size;
   final theme = Theme.of(context);
   
  final response = await https.post(
      Uri.parse("https://cybernsoft.com/api/passes/create_pass.php"),
      body: 
      status?
      {
        "address_id":userLoginAddress_Id_S,
      "event_type_id":eventTypeId.toString(),
      "pass_type_id":passTypeId.toString(),
      "pass_validity_id":passValidityId.toString(),
      "visitor_type_id":visitorTypeId.toString(),

      "pass_date":DateTime.now().toString(),
      
      "user_contact_name":userContactName,
      "user_contact_phone":userContactNo
      }
      :
      {
        "address_id":userLoginAddress_Id_S,
      "event_type_id":eventTypeId.toString(),
      "pass_type_id":passTypeId.toString(),
      "pass_validity_id":passValidityId.toString(),
      "user_contact_id":userContacId.toString(),
      "visitor_type_id":visitorTypeId.toString(),

      "pass_date":DateTime.now().toString(),
      }
      );
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body.toString());
    var dataStatus = data["status"].toString();
    print(dataStatus);

    if (dataStatus == "200") {
      print("<<<<<<<<<<<<<<<<<<<<<<<<<Succesful>>>>>>>>>>>>>>>>>>>>>>>>>");
      print(data["message"]);
      var dataResponse = data["response"];

            Pass_Success_dialog_box(
          context, size.height, size.width, theme, data["message"].toString());

    } else {
      print(data["message"]);
      var dataResponse = data["response"];
      Pass_Failed_dialog_box(
          context, size.height, size.width, theme, data["message"].toString());

    }
  } else {
    print("erroe");
  }
}


Future generate() async {
  print("generate");
  final Response = await https.post(Uri.parse("https://cybernsoft.com/api/passes/create_pass.php"), body: {
    "address_id": "1",
    "pass_type_id":"1",
    "pass_date":"2023-02-02 05:05:05",
    "event_type_id":"1",
    "visitor_type_id":"1",
    "pass_validity_id":"1",
    "user_contact_id":"3"
    });

  if (Response.statusCode == 200) {
    var data = jsonDecode(Response.body.toString());
    print(data);
  } else {
    print("Error");
  }
}

// Future<List> getNotification() async {
//   final response = await https
//       .post(Uri.parse("${apiAddress}notification.php"), body: {"user_id": "1"});

//   if (response.statusCode == 200) {
//     var data = jsonDecode(response.body.toString());
//     var dataStatus = data["status"].toString();
//     if (dataStatus == "1") {
//       notificationList.clear();
//       var dataResponse = data["response"];
//       for (Map i in dataResponse) {
//         notificationList.add(Notification.fromJson(i));
//       }
//     }
//     return notificationList;
//   } else {
//     return notificationList;
//   }
// }


