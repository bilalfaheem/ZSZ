import 'package:flutter/foundation.dart';

class Notification_Icon_Provider with ChangeNotifier {
  String _current_notification = "0";
  String get current_notification => _current_notification;

  void Current_Notification_Func(String count) {
    // if (_current_notification == 1) {
    //   _current_notification = 0;
    // } else {
    //   _current_notification = 1;
    // }
    _current_notification = count;
    notifyListeners();
  }
}
