import 'dart:async';
import 'dart:convert';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:zsz/Constant.dart';
import 'package:zsz/main.dart';

// Future<void> Broadcast_Push_Notification_Function() async {
//   // FlutterLocalNotificationsPlugin Broadcast_flp =
//   //     FlutterLocalNotificationsPlugin();

//   // var my_user_id = int.parse(User_Login_id_S.toString());
//   // assert(my_user_id is int);
//   //   print("broadcasttttttttttttttttttttttttttttttttttttttttttttt");
//   //   print(User_Login_id_S.toString());

//   // print(my_user_id);
//   // print(my_user_id.runtimeType);
//   // print("broadcasttttttttttttttttttttttttttttttttttttttttttttt");

//   var response = await http.post(
//       Uri.parse("${Api_Address}general_broadcast.php"),
//       body: {"user_id": User_Login_id_S.toString()});
//   //  my_user_id});
//   if (response.statusCode == 200) {
//     var data = jsonDecode(response.body.toString());
//     print("Broadcast Notification Status ${data.first["status"]}");
//     print("notificationnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn");

// // status 1 present
//     if (data.first["status"].toString() == "1") {
//       print(data.first["status"].toString());
//       print("broadcast statuss");
//       // return
//       show_BroadCast_Notification(
//           data.first["message"].toString());
//       print(data.first["id"].toString());
//       print("broadcast idd");

// // // seen notification func
// //       Timer(
// //           Duration(seconds: 10),
// //           () =>
//       // print("Timer");
//       await Broadcast_Seen_Push_Notification_Function(
//           data.first["id"].toString());
//       // );
//     }

// // status 0 noto not present
//     else if (data.first["status"].toString() == "0") {
//       print("No Notification for broadcast");
//     } else {
//       print("no message");
//     }
//     data;
//   } else {
//     var data = jsonDecode(response.body.toString());
//     data;
//   }
// }

// Future<void> Broadcast_Seen_Push_Notification_Function(broadcast_idd) async {
//   print(broadcast_idd);
//   print("Broadcast_Seen_Push_Notification_Function");
//   // remove
//   var response = await http.post(Uri.parse("${Api_Address}broadcast_seen.php"),
//       body: {
//         "user_id": User_Login_id_S.toString(),
//         "broadcast_id": broadcast_idd.toString()
//       }
//       //  User_Login_id_S.toString()}
//       );
// }
