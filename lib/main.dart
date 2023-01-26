import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_custom.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zsz/Constant.dart';
import 'package:zsz/Functions/Push_Notification/Function/BroadCast/Broadcast_Push_Notification.dart';
import 'package:zsz/Functions/Push_Notification/Function/General/General_Push_Notification.dart';
import 'package:zsz/Functions/Push_Notification/Function/Maintenance/Maintenance_Push_Notification.dart';
import 'package:zsz/Functions/Push_Notification/Function/Tanker/Tanker_Push_Notification.dart';
import 'package:zsz/Functions/Shared_Pref_Login_Id_func/shared_Pref_Login_Id_func.dart';
import 'package:zsz/Provider/Left_Tanker_Count_Provider/left_tanker_count_provider.dart';
import 'package:zsz/Provider/Notification_Icon_Provider/notification_icon_provider.dart';
import 'package:zsz/Provider/Order_screen_refresh_provider.dart/order_screen_refresh_provider.dart';
import 'package:zsz/Screens/Home_Screen/home_screen.dart';
import 'package:zsz/Screens/Login_Screen/Pages/Forget_Change_Password/provider/forget_change_pass_provider.dart';
import 'package:zsz/Screens/Login_Screen/Pages/Forget_Password/provider/Contact_no_visibility_provider.dart';
import 'package:zsz/Screens/Login_Screen/Pages/Otp_Screen/Provider/Otp_Validation_Status_Provider.dart';
import 'package:zsz/Screens/Login_Screen/Provider/society_name_visibility_provider.dart';
import 'package:zsz/Screens/Sign_Up_Screen/Provider/signup_society_visibility_provider.dart';

import 'package:zsz/Screens/Splash_Screen/splash_screen.dart';
import 'package:zsz/Theme/theme.dart';
import 'package:http/http.dart' as http;
import 'package:workmanager/workmanager.dart';
import 'package:zsz/Provider/Notification_Icon_Provider/notification_icon_provider.dart';

//this is the name given to the background fetch
const simplePeriodicTask = "PeriodicTask";
const generalPeriodicTask = "generalPeriodicTask";

// notification api function
@pragma('vm:entry-point')
void callbackDispatcher() async {
  String userLoginIdNotification = "null";
  print("call back dispatcher call back dispatcher2");
  // await Shared_Pref_Login_Id_Func();
  // final FlutterLocalNotificationsPlugin flutterLocalNoti =
  //   FlutterLocalNotificationsPlugin();
  // NotificationsService notificationsService = NotificationsService();
  // notificationsService.

  // int notification_count = 0;
  Workmanager().executeTask((task, inputData) async {
    userLoginIdFunctionNotification() async {
      WidgetsFlutterBinding.ensureInitialized();
      SharedPreferences pref = await SharedPreferences.getInstance();
      userLoginIdNotification = pref.getString("User_Login_Id").toString();
      print("${userLoginIdNotification} user login id for notification");
    }

//function part
    final FlutterLocalNotificationsPlugin flutterLocalNoti =
        FlutterLocalNotificationsPlugin();

    final AndroidInitializationSettings androidInitSetting =
        AndroidInitializationSettings("mipmap/ic_launcher");

    void initialiseNotifications() async {
      InitializationSettings initializationSettings =
          InitializationSettings(android: androidInitSetting);

      await flutterLocalNoti.initialize(initializationSettings);
    }

    void sendNotification(String channelId, String channelName, int notiId,
        String title, String body) async {
      AndroidNotificationDetails androidNotificationDetails =
          AndroidNotificationDetails(channelId, channelName,
              // "WMSID", "WMSNOTO",
              importance: Importance.max,
              priority: Priority.high);
      NotificationDetails notificationDetails =
          NotificationDetails(android: androidNotificationDetails);
      await flutterLocalNoti.show(notiId, title, body, notificationDetails);
    }

    //Api Call Function
    Future<void> tankerSeenPushNotificationFunction() async {
      var response = await http.post(
          Uri.parse("https://cybernsoft.com/api/tanker_notification.php"),
          // push_notification.php"),
          body: {"user_id": userLoginIdNotification.toString(), "is_seen": "1"}
          //  User_Login_id_S.toString()}
          );
    }

    Future<void> generalSeenPushNotificationFunction() async {
      var response = await http.post(
          Uri.parse("https://cybernsoft.com/api/general_notification.php"),
          // push_notification.php"),
          body: {"user_id": userLoginIdNotification.toString(), "is_seen": "1"}
          //  User_Login_id_S.toString()}
          );
    }

    Future<void> maintenanceSeenPushNotificationFunction() async {
      var response = await http.post(
          Uri.parse("https://cybernsoft.com/api/maintenance_notification.php"),
          // push_notification.php"),
          body: {"user_id": userLoginIdNotification.toString(), "is_seen": "1"}
          //  User_Login_id_S.toString()}
          );
    }

    Future<void> broadcastSeenPushNotificationFunction(broadCastId) async {
      var response = await http
          .post(Uri.parse("https://cybernsoft.com/api/general_broadcast.php"),
              // push_notification.php"),
              body: {
            "user_id": userLoginIdNotification.toString(),
            "broadcast_id": broadCastId.toString()
            //  "is_seen": "1"
          });
    }

    Future<void> tankerPushNotificationFunction() async {
      var response = await http.post(
          Uri.parse("https://cybernsoft.com/api/tanker_notification.php"),
          body: {"user_id": userLoginIdNotification.toString()});
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data.first["status"].toString());
// 10 for notification present
        if (data.first["status"].toString() == "10") {
          sendNotification("WMSTankerId", "WMSTanker", 20, "WMS Tanker",
              data.first["message"].toString());
          await tankerSeenPushNotificationFunction();
        } else if (data.first["status"].toString() == "0") {
        } else {}
        data;
      } else {
        var data = jsonDecode(response.body.toString());
        data;
      }
    }

    Future<void> generalPushNotificationFunction() async {
      var response = await http.post(
          Uri.parse("https://cybernsoft.com/api/general_notification.php"),
          body: {"user_id": userLoginIdNotification.toString()});
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data.first["status"].toString());
// 10 for notification present
        if (data.first["status"].toString() == "10") {
          sendNotification("WMSGeneralId", "WMSGeneral", 21, "WMS General",
              data.first["message"].toString());
          await generalSeenPushNotificationFunction();
        } else if (data.first["status"].toString() == "0") {
        } else {}
        data;
      } else {
        var data = jsonDecode(response.body.toString());
        data;
      }
    }

    Future<void> maintenancePushNotificationFunction() async {
      var response = await http.post(
          Uri.parse("https://cybernsoft.com/api/maintenance_notification.php"),
          body: {"user_id": userLoginIdNotification.toString()});
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data.first["status"].toString());
// 10 for notification present
        if (data.first["status"].toString() == "10") {
          sendNotification("WMSMaintenanceId", "WMSMaintenance", 22,
              "WMS Maintenance", data.first["message"].toString());
          await maintenanceSeenPushNotificationFunction();
          // await Tanker_Seen_Push_Notification_Function();
        } else if (data.first["status"].toString() == "0") {
        } else {}
        data;
      } else {
        var data = jsonDecode(response.body.toString());
        data;
      }
    }

    Future<void> broadcastPushNotificationFunction() async {
      var response = await http.post(
          Uri.parse("https://cybernsoft.com/api/general_broadcast.php"),
          body: {"user_id": userLoginIdNotification.toString()});
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data.first["status"].toString());
// 10 for notification present
        if (data.first["status"].toString() == "1") {
          sendNotification("WMSBroadcastId", "WMSBroadcast", 23,
              "WMS Broadcast", data.first["message"].toString());
          // showTankerNotification(data.first["message"].toString());
          await broadcastSeenPushNotificationFunction(
              data.first["id"].toString());
          // await Tanker_Seen_Push_Notification_Function();
        } else if (data.first["status"].toString() == "0") {
        } else {}
        data;
      } else {
        var data = jsonDecode(response.body.toString());
        data;
      }
    }

//execution part
    userLoginIdFunctionNotification();
    initialiseNotifications();
    //  sendNotification("www", "wwww", 95, "www", "wwww");
    await tankerPushNotificationFunction();
    await maintenancePushNotificationFunction();
    await generalPushNotificationFunction();
    await broadcastPushNotificationFunction();

    return Future.value(true);
  });
}

// class NotificationsService {
// final FlutterLocalNotificationsPlugin flutterLocalNoti =
//     FlutterLocalNotificationsPlugin();

// final AndroidInitializationSettings androidInitSetting =
//     AndroidInitializationSettings("mipmap/ic_launcher");

// void initialiseNotifications() async {
//   InitializationSettings initializationSettings =
//       InitializationSettings(android: androidInitSetting);

//   await flutterLocalNoti.initialize(initializationSettings);
// }

// void sendNotification(String channelId,String channelName,int notiId, String title, String body) async {
//   AndroidNotificationDetails androidNotificationDetails =
//       AndroidNotificationDetails(channelId,channelName,
//         // "WMSID", "WMSNOTO",
//           importance: Importance.max, priority: Priority.high);
//   NotificationDetails notificationDetails =
//       NotificationDetails(android: androidNotificationDetails);
//   await flutterLocalNoti.show(notiId, title, body, notificationDetails);
// }

//   //Api Call Function
//   Future<void> tankerSeenPushNotificationFunction() async {
//   var response =
//       await http.post(Uri.parse("https://cybernsoft.com/api/tanker_notification.php"),
//           // push_notification.php"),
//           body: {"user_id": User_Login_id_S.toString(), "is_seen": "1"}
//           //  User_Login_id_S.toString()}
//           );
// }
//   Future<void> generalSeenPushNotificationFunction() async {
//   var response =
//       await http.post(Uri.parse("https://cybernsoft.com/api/general_notification.php"),
//           // push_notification.php"),
//           body: {"user_id": User_Login_id_S.toString(), "is_seen": "1"}
//           //  User_Login_id_S.toString()}
//           );
// }
//   Future<void> maintenanceSeenPushNotificationFunction() async {
//   var response =
//       await http.post(Uri.parse("https://cybernsoft.com/api/maintenance_notification.php"),
//           // push_notification.php"),
//           body: {"user_id": User_Login_id_S.toString(), "is_seen": "1"}
//           //  User_Login_id_S.toString()}
//           );
// }
//   Future<void> broadcastSeenPushNotificationFunction(broadCastId) async {
//   var response =
//       await http.post(Uri.parse("https://cybernsoft.com/api/general_broadcast.php"),
//           // push_notification.php"),
//           body: {
//             "user_id": User_Login_id_S.toString(),
//             "broadcast_id": broadCastId.toString()
//           //  "is_seen": "1"
//           }
//           );
// }
//   Future<void> tankerPushNotificationFunction() async {
//   var response = await http.post(Uri.parse("https://cybernsoft.com/api/tanker_notification.php"),
//           body: {"user_id": User_Login_id_S.toString()});
//   if (response.statusCode == 200) {
//     var data = jsonDecode(response.body.toString());
//   print(data.first["status"].toString() );
// // 10 for notification present
//     if (data.first["status"].toString() == "10") {
//       sendNotification("WMSTankerId", "WMSTanker", 20, "WMS Tanker", data.first["message"].toString());
//       // await tankerSeenPushNotificationFunction(); remove
//     } else if (data.first["status"].toString() == "0") {
//     } else {
//     }
//     data;
//   } else {
//     var data = jsonDecode(response.body.toString());
//     data;
//   }
// }

//   Future<void> generalPushNotificationFunction() async {
//   var response = await http.post(Uri.parse("https://cybernsoft.com/api/general_notification.php"),
//           body: {"user_id": User_Login_id_S.toString()});
//   if (response.statusCode == 200) {
//     var data = jsonDecode(response.body.toString());
//   print(data.first["status"].toString() );
// // 10 for notification present
//     if (data.first["status"].toString() == "10") {
//       sendNotification("WMSGeneralId", "WMSGeneral", 21, "WMS General", data.first["message"].toString());
//       // await generalSeenPushNotificationFunction();   remove
//     } else if (data.first["status"].toString() == "0") {
//     } else {
//     }
//     data;
//   } else {
//     var data = jsonDecode(response.body.toString());
//     data;
//   }
// }
//   Future<void> maintenancePushNotificationFunction() async {
//   var response = await http.post(Uri.parse("https://cybernsoft.com/api/maintenance_notification.php"),
//           body: {"user_id": User_Login_id_S.toString()});
//   if (response.statusCode == 200) {
//     var data = jsonDecode(response.body.toString());
//   print(data.first["status"].toString() );
// // 10 for notification present
//     if (data.first["status"].toString() == "10") {
//       sendNotification("WMSMaintenanceId", "WMSMaintenance", 22, "WMS Maintenance", data.first["message"].toString());
//       await maintenanceSeenPushNotificationFunction();
//       // await Tanker_Seen_Push_Notification_Function();
//     } else if (data.first["status"].toString() == "0") {
//     } else {
//     }
//     data;
//   } else {
//     var data = jsonDecode(response.body.toString());
//     data;
//   }
// }
//   Future<void> broadcastPushNotificationFunction() async {
//   var response = await http.post(Uri.parse("https://cybernsoft.com/api/general_broadcast.php"),
//           body: {"user_id": User_Login_id_S.toString()});
//   if (response.statusCode == 200) {
//     var data = jsonDecode(response.body.toString());
//   print(data.first["status"].toString() );
// // 10 for notification present
//     if (data.first["status"].toString() == "1") {
//       sendNotification("WMSBroadcastId", "WMSBroadcast", 23, "WMS Broadcast", data.first["message"].toString());
//       // showTankerNotification(data.first["message"].toString());
//       await broadcastSeenPushNotificationFunction(data.first["id"].toString());
//       // await Tanker_Seen_Push_Notification_Function();
//     } else if (data.first["status"].toString() == "0") {
//     } else {
//     }
//     data;
//   } else {
//     var data = jsonDecode(response.body.toString());
//     data;
//   }
// }

//removeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee

// }

// // flutter local notification setup

// void showTankerNotification(v) async {
//   var android = AndroidNotificationDetails("51131", 'WMSTanker',
//       //  'CHANNEL DESCRIPTION',
//       priority: Priority.high,
//       importance: Importance.max);
//   //remove 1.0.4 T
//   // var iOS = IOSNotificationDetails();
//   var platform = NotificationDetails(android: android);
//   FlutterLocalNotificationsPlugin cast = FlutterLocalNotificationsPlugin();

//   // , iOS: iOS);
// await cast.show(51131,  'WMS Water Tanker', '$v', platform,payload:'VIS \n $v' );
//   // await flp.show(51131, 'WMS Water Tanker', '$v', platform,
//   //     payload: 'VIS \n $v');
// }

// void show_Maintenance_Notification(v) async {
//   var android = AndroidNotificationDetails("51132", 'WMSMaintenance',
//       //  'CHANNEL DESCRIPTION',
//       priority: Priority.high,
//       importance: Importance.max);
//   // var iOS = IOSNotificationDetails();
//   var platform = NotificationDetails(android: android);
//   FlutterLocalNotificationsPlugin main_cast = FlutterLocalNotificationsPlugin();
//   // , iOS: iOS);
//   // FlutterLocalNotificationsPlugin().show(3, "saima", "$v", platform, payload:)
//   await main_cast.show(51132, 'WMS Maintenance', '$v', platform,
//       payload: 'VIS \n $v');
// }

// void show_General_Notification(v) async {
//   var android = AndroidNotificationDetails('51133', 'WMSGeneral',
//       //  'CHANNEL DESCRIPTION',
//       priority: Priority.high,
//       importance: Importance.max);
//   // var iOS = IOSNotificationDetails();
//   var platform = NotificationDetails(android: android);
//   // , iOS: iOS);
// FlutterLocalNotificationsPlugin general_cast = FlutterLocalNotificationsPlugin();
//   await general_cast.show(51133, 'WMS', '$v', platform, payload: 'VIS \n $v');
// }

// void show_BroadCast_Notification(v) async {
//   var android = AndroidNotificationDetails('51134', 'WMSBroadcast',
//       //  'CHANNEL DESCRIPTION',
//       priority: Priority.high,
//       importance: Importance.max);
//   // var iOS = IOSNotificationDetails();
//   var platform = NotificationDetails(android: android);
//   // , iOS: iOS);
// FlutterLocalNotificationsPlugin broadcast_cast = FlutterLocalNotificationsPlugin();
//   await broadcast_cast.show(51134, 'WMS', '$v', platform, payload: 'VIS \n $v');
// }

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
// Future<void> Maintenance_Push_Notification_Function() async {
//   // FlutterLocalNotificationsPlugin maintenance_flp =
//   //     FlutterLocalNotificationsPlugin();

//   var response = await http.post(
//       Uri.parse("${Api_Address}maintenance_notification.php"),
//       body: {"user_id": User_Login_id_S.toString()});
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
//           body: {"user_id": User_Login_id_S.toString(), "is_seen": "1"}
//           //  User_Login_id_S.toString()}
//           );
// }
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

// Future<void> Notification_Seen_Count_Function(context) async {
//   final Noti_Count_Provider =
//       Provider.of<Notification_Icon_Provider>(context, listen: false);

//   var response = await http.post(
//       Uri.parse("${Api_Address}notification_count.php"),
//       body: {"user_id": User_Login_id_S.toString(), "is_seen": "1"});

//   if (response.statusCode == 200) {
//     var data = jsonDecode(response.body.toString());

//     Noti_Count_Provider.Current_Notification_Func(
//         data.first["count"].toString());
//   } else {
//     var data = jsonDecode(response.body.toString());
//   }
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //  await Permission.notification.isDenied.then((value) {
  //       if (value) {
  //         Permission.notification.request();
  //       }
  //     });

  // await Firebase.initializeApp(); //remove
  await Shared_Pref_Login_Id_Func();

  await Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
  await Workmanager().registerPeriodicTask("11311", simplePeriodicTask,
      existingWorkPolicy: ExistingWorkPolicy.replace,
      frequency: Duration(minutes: 15), //when should it check the link
      initialDelay:
          Duration(seconds: 5), //duration before showing the notification
      constraints: Constraints(
        networkType: NetworkType.connected,
      ));

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

// // notification api function
// Future<void> callbackDispatcher() async {
//   print("call back dispatcher call back dispatcher");
//   await Shared_Pref_Login_Id_Func();

//   // int notification_count = 0;
//   Workmanager().executeTask((task, inputData) async {
//     FlutterLocalNotificationsPlugin flp = FlutterLocalNotificationsPlugin();
//     var android = AndroidInitializationSettings('@mipmap/ic_launcher');
//     //  );
//     //remove 1.0.4t
//     // var iOS = IOSInitializationSettings(requestAlertPermission: true);
//     var initSetttings = InitializationSettings(android: android);
//     // , iOS: iOS);

//     flp.initialize(initSetttings);

// //tanker push notification
//     await Tanker_Push_Notification_Function();

// //Maintenance push notification
//     await Maintenance_Push_Notification_Function();

// // General Push Notification
//     await General_Push_Notification_Function();

//     //Broadcast Push Notication
//     await Broadcast_Push_Notification_Function();

//     return Future.value(true);
//   });
// }

// Future<void> callbackDispatcher_General() async {
//   Workmanager().executeTask((task, inputData) async {
//     FlutterLocalNotificationsPlugin flp_g = FlutterLocalNotificationsPlugin();
//     var android = AndroidInitializationSettings('@mipmap/ic_launcher');
//     //  );
//     // var iOS = IOSInitializationSettings();
//     var initSetttings = InitializationSettings(android: android);
//     // ,iOS: iOS);

//     flp_g.initialize(initSetttings);

// //tanker push notification
//     await Tanker_Push_Notification_Function();

// //Maintenance push notification
//     await Maintenance_Push_Notification_Function();

// // General Push Notification
//     await General_Push_Notification_Function();

//     return Future.value(true);
//   });
// }

double Media_context_height = 0.2;

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    // Media_context_height = MediaQuery.of(context).size.height;
    // print("${Media_context_height} height before");
    currentTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Notification_Icon_Provider()),
        ChangeNotifierProvider(create: (_) => Order_Screen_refresh_provider()),
        ChangeNotifierProvider(create: (_) => Left_Tanker_Count_Provider()),
        ChangeNotifierProvider(create: (_) => Contact_No_Visibility_Provider()),
        ChangeNotifierProvider(create: (_) => ForgetChangePasswordProvider()),
        ChangeNotifierProvider(create: (_) => Otp_Validation_Status_Provider()),
        ChangeNotifierProvider(create: (_) => SocietyNameVisibilityProvider()),
        ChangeNotifierProvider(
            create: (_) => SignUpSocietyNameVisibilityProvider()),
      ],
      child: Builder(builder: (BuildContext context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: User_Login_id_S == "null" ? Splash_Screen() : Home_Screen(),

          //  Splash_Screen(),

          theme: CustomTheme.lightTheme,
          darkTheme: CustomTheme.darkTheme,
          themeMode: currentTheme.currentTheme,
        );
      }),
    );
  }
}
