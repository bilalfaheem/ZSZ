import 'dart:async';

import 'package:zsz/Functions/Push_Notification/notification_api.dart';

void notificationFunc() {
  Timer.periodic(Duration(seconds: 5), (timer) {
    notificationCountApi();
    print(
        "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<notificationFunc>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
  });

  // Timer(Duration(seconds: 5 ), () {
  //   print("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<notificationFunc>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
  //  }) ;
}
