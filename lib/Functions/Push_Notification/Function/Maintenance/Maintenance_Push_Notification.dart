import 'dart:async';
import 'dart:convert';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:zsz/Constant.dart';
import 'package:zsz/main.dart';

// Future<void> Maintenance_Push_Notification_Function() async {
//   // FlutterLocalNotificationsPlugin maintenance_flp =
//   //     FlutterLocalNotificationsPlugin();

//   var response = await http.post(
//       Uri.parse("${Api_Address}maintenance_notification.php"),
//       body: {"user_id": userLoginIdShared.toString()});
//   if (response.statusCode == 200) {
//     var data = jsonDecode(response.body.toString());
//     print("Maintenance Notification Status ${data.first["status"]}");
//     print("notificationnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn");
//     if (data.first["status"].toString() == "10") {
//       // return
//       show_Maintenance_Notification(
//           data.first["message"].toString());

//       // Timer(
//       //     Duration(seconds: 10),
//       //     () =>
//       // seen notification func
//       await Maintenance_Seen_Push_Notification_Function();
//       // );
//     } else if (data.first["status"].toString() == "0") {
//       print("No Notification for Maintenance");
//     } else {
//       print("no message");
//     }
//     data;
//   } else {
//     var data = jsonDecode(response.body.toString());
//     data;
//   }
// }

// Future<void> Maintenance_Seen_Push_Notification_Function() async {
//   var response =
//       await http.post(Uri.parse("${Api_Address}maintenance_notification.php"),
//           // push_notification.php"),
//           body: {"user_id": userLoginIdShared.toString(), "is_seen": "1"}
//           //  userLoginIdShared.toString()}
//           );
// }
