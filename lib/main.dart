import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zsz/Constant.dart';
import 'package:zsz/Functions/Shared_Pref_Login_Id_func/shared_Pref_Login_Id_func.dart';
import 'package:zsz/Provider/Left_Tanker_Count_Provider/left_tanker_count_provider.dart';
import 'package:zsz/Provider/Notification_Icon_Provider/notification_icon_provider.dart';
import 'package:zsz/Provider/Order_screen_refresh_provider.dart/order_screen_refresh_provider.dart';
import 'package:zsz/Screens/Chat_Screen/Pages/ComplainScreen/Provider/complain_screen_provider.dart';
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
          //  userLoginIdShared.toString()}
          );
    }

    Future<void> generalSeenPushNotificationFunction() async {
      var response = await http.post(
          Uri.parse("https://cybernsoft.com/api/general_notification.php"),
          // push_notification.php"),
          body: {"user_id": userLoginIdNotification.toString(), "is_seen": "1"}
          //  userLoginIdShared.toString()}
          );
    }

    Future<void> maintenanceSeenPushNotificationFunction() async {
      var response = await http.post(
          Uri.parse("https://cybernsoft.com/api/maintenance_notification.php"),
          // push_notification.php"),
          body: {"user_id": userLoginIdNotification.toString(), "is_seen": "1"}
          //  userLoginIdShared.toString()}
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
        print("${data.first["status"].toString()} workmanager");
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
        print("${data.first["status"].toString()} workmanager");
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
        print("${data.first["status"].toString()} workmanager");
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
        print("${data.first["status"].toString()} workmanager");
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

    userLoginIdFunctionNotification() async {
      WidgetsFlutterBinding.ensureInitialized();
      SharedPreferences pref = await SharedPreferences.getInstance();
      userLoginIdNotification = pref.getString("userLoginId").toString();
      print(
          "${userLoginIdNotification} user login id for notification>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
      if (userLoginIdNotification != "null" &&
          userLoginIdNotification != null) {
        print("not Null>>>>>>>>>>>>>>>>");
        initialiseNotifications();
        await tankerPushNotificationFunction();
        await maintenancePushNotificationFunction();
        await generalPushNotificationFunction();
        await broadcastPushNotificationFunction();
      }
    }

//execution part
    await userLoginIdFunctionNotification();
    return Future.value(true);
  });
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(); //remove
  await Shared_Pref_Login_Id_Func();

  await Workmanager().initialize(callbackDispatcher, isInDebugMode: false);
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

// double Media_context_height = 0.2;

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
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
        ChangeNotifierProvider(create: (_) => SignUpSocietyNameVisibilityProvider()),
        ChangeNotifierProvider(create: (_) => ComplainScreenProvider(),)
      ],
      child: Builder(builder: (BuildContext context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: userLoginIdShared == "null" ? Splash_Screen() : Home_Screen(),

          //  Splash_Screen(),

          theme: CustomTheme.lightTheme,
          darkTheme: CustomTheme.darkTheme,
          themeMode: currentTheme.currentTheme,
        );
      }),
    );
  }
}
