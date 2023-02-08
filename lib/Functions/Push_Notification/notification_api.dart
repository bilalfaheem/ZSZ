import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:zsz/Constant.dart';

    Future<void> notificationCountApi() async {
    var response = await http.post(
        Uri.parse("https://cybernsoft.com/api/new_notification_count.php"),
        body: {"user_id": userLoginIdShared.toString()});
    if (response.statusCode == 200) {

      var data = jsonDecode(response.body.toString());

      print("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<${data.first["notification"].toString()}>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
       print("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<${data.first["notification"]["count"].toString()}>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
        print("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<${data.first["notification"]["remaining_tanker"].toString()}>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");




// 10 for notification present
      // if (data.first["status"].toString() == "10") {
      //   sendNotification("WMSTankerId", "WMSTanker", 20, "WMS Tanker",
      //       data.first["message"].toString());
      //   await tankerSeenPushNotificationFunction();
      // } else if (data.first["status"].toString() == "0") {
      // } else {}
      data;
    } else {
      var data = jsonDecode(response.body.toString());
      data;
    }
  }