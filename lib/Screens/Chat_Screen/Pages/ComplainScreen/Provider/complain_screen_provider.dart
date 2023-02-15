import 'dart:async';

import 'package:flutter/foundation.dart';

class ComplainScreenProvider with ChangeNotifier {
  bool _complainRefresh = false;
  bool get complainRefresh => _complainRefresh;

  void complainRefreshFunc() {
    _complainRefresh = !_complainRefresh;
    Timer(Duration(seconds: 3), () => notifyListeners());
    // notifyListeners();
  }
}
