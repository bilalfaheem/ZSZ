import 'dart:async';
import 'dart:convert';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:zsz/Constant.dart';
import 'package:zsz/main.dart';

// Future<void> General_Push_Notification_Function() async {
//   // FlutterLocalNotificationsPlugin Broadcast_flp =
//   //     FlutterLocalNotificationsPlugin();

//   var response = await http.post(
//       Uri.parse("${Api_Address}general_notification.php"),
//       body: {"user_id": User_Login_id_S.toString()});
//   if (response.statusCode == 200) {
//     var data = jsonDecode(response.body.toString());
//     print("General Notification general Statua ${data.first["status"]}");
//     print("notificationnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn");
//     if (data.first["status"].toString() == "10") {
//       // return
//       show_General_Notification(
//           data.first["message"].toString());

//       // seen status 1
//       // Timer(
//       //     Duration(seconds: 10),
//       //     () =>
//       // seen notification func
//       await General_Seen_Push_Notification_Function();
//       // );
//     } else if (data.first["status"].toString() == "0") {
//       print("No General Notification");
//     } else {
//       print("no message");
//     }
//     data;
//   } else {
//     var data = jsonDecode(response.body.toString());
//     data;
//   }
// }

// Future<void> General_Seen_Push_Notification_Function() async {
//   var response =
//       await http.post(Uri.parse("${Api_Address}general_notification.php"),
//           // push_notification.php"),
//           body: {"user_id": User_Login_id_S.toString(), "is_seen": "1"}
//           //  User_Login_id_S.toString()}
//           );
// }
