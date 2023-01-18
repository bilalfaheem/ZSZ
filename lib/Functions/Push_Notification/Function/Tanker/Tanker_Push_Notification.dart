import 'dart:async';
import 'dart:convert';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:zsz/Constant.dart';
import 'package:zsz/main.dart';

// Future<void> Tanker_Push_Notification_Function() async {
//   // FlutterLocalNotificationsPlugin flp = FlutterLocalNotificationsPlugin();
//   var response =
//       await http.post(Uri.parse("${Api_Address}tanker_notification.php"),
//           // push_notification.php"),
//           body: {"user_id": User_Login_id_S.toString()});
//   if (response.statusCode == 200) {
//     var data = jsonDecode(response.body.toString());
//     print("Tanker Notification Statua ${data.first["status"]}");
//     print("notificationnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn");

// // 10 for notification present
//     if (data.first["status"].toString() == "10") {
//       print(data.first["status"].toString());
//       print("push tanker notification statussss");
//       show_Tanker_Notification(data.first["message"].toString());
//       // seen status 1
//       // Timer(
//       //     Duration(seconds: 10),
//       //     () =>
//       // seen notification func
//       await Tanker_Seen_Push_Notification_Function();
//       // );

//       print(" Notification for tanker");

//       // notification_count= notification_count++;
//     } else if (data.first["status"].toString() == "0") {
//       print("No Notification for tanker");
//     } else {
//       print("no message tanker");
//     }
//     data;
//   } else {
//     var data = jsonDecode(response.body.toString());
//     data;
//   }
// }

// Future<void> Tanker_Seen_Push_Notification_Function() async {
//   var response =
//       await http.post(Uri.parse("${Api_Address}tanker_notification.php"),
//           // push_notification.php"),
//           body: {"user_id": User_Login_id_S.toString(), "is_seen": "1"}
//           //  User_Login_id_S.toString()}
//           );
// }
