import 'dart:convert';
import 'package:zsz/Constant.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:zsz/Functions/Push_Notification/Notification.dart';
import 'package:zsz/Provider/Left_Tanker_Count_Provider/left_tanker_count_provider.dart';
import 'package:zsz/Provider/Notification_Icon_Provider/notification_icon_provider.dart';
import 'package:zsz/main.dart';

String previousNotificationCount = "null";

Future<void> notificationCountFunction(context) async {
  // FlutterLocalNotificationsPlugin maintenance_flp =
  //     FlutterLocalNotificationsPlugin();

  final Noti_Count_Provider =
      Provider.of<Notification_Icon_Provider>(context, listen: false);
  final Left_Tanker_Provider =
      Provider.of<Left_Tanker_Count_Provider>(context, listen: false);

  var response = await http.post(
      Uri.parse("${Api_Address}notification_count.php"),
      body: {"user_id": userLoginIdShared.toString()});

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body.toString());
    print("Notification Count Status ${data.first["count"]}");
    print("notificationnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn");

    //Left Tanker Count Provider
    Left_Tanker_Provider.Left_Tanker_CountFunc(
        data.first["remaining_tanker"].toString());

    if (data.first["count"].toString() == "0") {
      Noti_Count_Provider.Current_Notification_Func(
          data.first["count"].toString());
      previousNotificationCount = data.first["count"].toString();
      print("Notification Count is 000000000000000000");
    } else if (data.first["count"].toString() != "0") {
      Noti_Count_Provider.Current_Notification_Func(
          data.first["count"].toString());
      await notificationFunctionInApp();
      // print("no new notifiaction");
      // // if(previousNotificationCount != data.first["count"].toString()){
      //   print(" new notifiaction");
      // callbackDispatcher();
      previousNotificationCount = data.first["count"].toString();
      // }

//       print("count is not not not not not 0");
//       //tanker push notification
//       await Tanker_Push_Notification_Function();

// //Maintenance push notification
//       await Maintenance_Push_Notification_Function();

// // General Push Notification
//       await General_Push_Notification_Function();

//       //Broadcast Push Notication
//       await Broadcast_Push_Notification_Function();
      //   WidgetsFlutterBinding.ensureInitialized();

      // await Workmanager().initialize(callbackDispatcher, isInDebugMode: false);
    }
    // else {
    //   print("no message");
    // }
    // data;
    else {
      var data = jsonDecode(response.body.toString());
      // data;
    }
  }
}

Future<void> Notification_Seen_Count_Function(context) async {
  final Noti_Count_Provider =
      Provider.of<Notification_Icon_Provider>(context, listen: false);

  var response = await http.post(
      Uri.parse("${Api_Address}notification_count.php"),
      body: {"user_id": userLoginIdShared.toString(), "is_seen": "1"});

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body.toString());

    Noti_Count_Provider.Current_Notification_Func(
        data.first["count"].toString());
  } else {
    var data = jsonDecode(response.body.toString());
  }
}
