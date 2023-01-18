import 'package:flutter/foundation.dart';

class Left_Tanker_Count_Provider with ChangeNotifier {
  String _left_tanker_count = "0";
  String get left_tanker_count => _left_tanker_count;

  void Left_Tanker_CountFunc(String count) {
    // if (_current_notification == 1) {
    //   _current_notification = 0;
    // } else {
    //   _current_notification = 1;
    // }
    _left_tanker_count = count;
    notifyListeners();
  }
}
