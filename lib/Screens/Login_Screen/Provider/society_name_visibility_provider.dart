import 'package:flutter/cupertino.dart';

class SocietyNameVisibilityProvider with ChangeNotifier {
  bool _societyNameVisibilityStatus = false;
  bool get SocietyNameVisibilityStatus => _societyNameVisibilityStatus;

  void SocietyNameVisibilityStatus_Func(bool status) {
    _societyNameVisibilityStatus = status;
    notifyListeners();
  }
}
