

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:zsz/Constant.dart';
import 'package:http/http.dart' as http;

class NotificationsService2 {
  final FlutterLocalNotificationsPlugin flutterLocalNoti =
      FlutterLocalNotificationsPlugin();

  final AndroidInitializationSettings androidInitSetting =
      AndroidInitializationSettings("mipmap/ic_launcher");

  void initialiseNotifications() async {
    InitializationSettings initializationSettings =
        InitializationSettings(android: androidInitSetting);

    await flutterLocalNoti.initialize(initializationSettings);
  }

  void sendNotification(String title, String body) async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails("WMSID", "WMSNOTO",
            importance: Importance.max, priority: Priority.high);
            
// int.parse(DateTime.now().microsecondsSinceEpoch.toString());
// Random().nextInt(10000)
    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNoti.show(16, title, body, notificationDetails);
  }
     void sendNotification2(String channelId,String channelName,int notiId, String title, String body) async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(channelId,channelName,
          // "WMSID", "WMSNOTO",
            importance: Importance.max, priority: Priority.high);
    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNoti.show(notiId, title, body, notificationDetails);
  }

  // void scheduleNotification(String title, String body) async {
  //   AndroidNotificationDetails androidNotificationDetails =
  //       AndroidNotificationDetails("channelId", "channelName2",
  //           importance: Importance.max, priority: Priority.high);

  //   NotificationDetails notificationDetails =
  //       NotificationDetails(android: androidNotificationDetails);
  //   await flutterLocalNoti.periodicallyShow(
  //       1, title, body, RepeatInterval.everyMinute, notificationDetails);
  // }

  // void stopNotification() async {
  //   flutterLocalNoti.cancel(1);
  // }
}

Future<void> notificationFunctionInApp()async{

//  userLoginIdFunctionNotification() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   SharedPreferences pref = await SharedPreferences.getInstance();
//   User_Login_id_S = pref.getString("User_Login_Id").toString();
//   print("${User_Login_id_S} user login id for notification");

// }
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

   void sendNotification(String channelId,String channelName,int notiId, String title, String body) async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(channelId,channelName,
          // "WMSID", "WMSNOTO",
            importance: Importance.max, priority: Priority.high);
    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNoti.show(notiId, title, body, notificationDetails);
  }

   //Api Call Function
  Future<void> tankerSeenPushNotificationFunction() async {
  var response =
      await http.post(Uri.parse("https://cybernsoft.com/api/tanker_notification.php"),
          // push_notification.php"),
          body: {"user_id": User_Login_id_S.toString(), "is_seen": "1"}
          //  User_Login_id_S.toString()}
          );
}
  Future<void> generalSeenPushNotificationFunction() async {
  var response =
      await http.post(Uri.parse("https://cybernsoft.com/api/general_notification.php"),
          // push_notification.php"),
          body: {"user_id": User_Login_id_S.toString(), "is_seen": "1"}
          //  User_Login_id_S.toString()}
          );
}
  Future<void> maintenanceSeenPushNotificationFunction() async {
  var response =
      await http.post(Uri.parse("https://cybernsoft.com/api/maintenance_notification.php"),
          // push_notification.php"),
          body: {"user_id": User_Login_id_S.toString(), "is_seen": "1"}
          //  User_Login_id_S.toString()}
          );
}
  Future<void> broadcastSeenPushNotificationFunction(broadCastId) async {
  var response =
      await http.post(Uri.parse("https://cybernsoft.com/api/general_broadcast.php"),
          // push_notification.php"),
          body: {
            "user_id": User_Login_id_S.toString(),
            "broadcast_id": broadCastId.toString()
          //  "is_seen": "1"
          }
          );
}
  Future<void> tankerPushNotificationFunction() async {
  var response = await http.post(Uri.parse("https://cybernsoft.com/api/tanker_notification.php"),
          body: {"user_id": User_Login_id_S.toString()
          });
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body.toString());
  print(data.first["status"].toString() );
// 10 for notification present
    if (data.first["status"].toString() == "10") {
      sendNotification("WMSTankerId", "WMSTanker", 20, "WMS Tanker", data.first["message"].toString());
       await tankerSeenPushNotificationFunction(); 
    } else if (data.first["status"].toString() == "0") {
    } else {
    }
    data;
  } else {
    var data = jsonDecode(response.body.toString());
    data;
  }
}

  Future<void> generalPushNotificationFunction() async {
  var response = await http.post(Uri.parse("https://cybernsoft.com/api/general_notification.php"),
          body: {"user_id": User_Login_id_S.toString()
           });
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body.toString());
  print(data.first["status"].toString() );
// 10 for notification present
    if (data.first["status"].toString() == "10") {
      sendNotification("WMSGeneralId", "WMSGeneral", 21, "WMS General", data.first["message"].toString());
       await generalSeenPushNotificationFunction();   
    } else if (data.first["status"].toString() == "0") {
    } else {
    }
    data;
  } else {
    var data = jsonDecode(response.body.toString());
    data;
  }
}
  Future<void> maintenancePushNotificationFunction() async {
  var response = await http.post(Uri.parse("https://cybernsoft.com/api/maintenance_notification.php"),
          body: {"user_id": User_Login_id_S.toString()
          });
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body.toString());
  print(data.first["status"].toString() );
// 10 for notification present
    if (data.first["status"].toString() == "10") {
      sendNotification("WMSMaintenanceId", "WMSMaintenance", 22, "WMS Maintenance", data.first["message"].toString());
      await maintenanceSeenPushNotificationFunction();
      // await Tanker_Seen_Push_Notification_Function();
    } else if (data.first["status"].toString() == "0") {
    } else {
    }
    data;
  } else {
    var data = jsonDecode(response.body.toString());
    data;
  }
}
  Future<void> broadcastPushNotificationFunction() async {
  var response = await http.post(Uri.parse("https://cybernsoft.com/api/general_broadcast.php"),
          body: {"user_id":User_Login_id_S.toString()
          });
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body.toString());
  print(data.first["status"].toString() );
// 10 for notification present
    if (data.first["status"].toString() == "1") {
      sendNotification("WMSBroadcastId", "WMSBroadcast", 23, "WMS Broadcast", data.first["message"].toString());
      // showTankerNotification(data.first["message"].toString());
      await broadcastSeenPushNotificationFunction(data.first["id"].toString());
      // await Tanker_Seen_Push_Notification_Function();
    } else if (data.first["status"].toString() == "0") {
    } else {
    }
    data;
  } else {
    var data = jsonDecode(response.body.toString());
    data;
  }
}





//execution part    
      //  userLoginIdFunctionNotification();
       initialiseNotifications();
    //  sendNotification("www", "wwww", 95, "www", "wwww");
 await tankerPushNotificationFunction();
 await maintenancePushNotificationFunction();
 await generalPushNotificationFunction();
 await broadcastPushNotificationFunction();



    // return Future.value(true);
  }