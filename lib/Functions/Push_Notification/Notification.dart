

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

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