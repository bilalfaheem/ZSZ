import 'package:flutter/foundation.dart';

class Otp_Validation_Status_Provider with ChangeNotifier {
  String _otp_validation_status = "initial";
  String get Otp_validation_status => _otp_validation_status;

  // int _status_Color = 0xff00FF00;
  // int get Status_Color => _status_Color;

  void OTP_Validation_Func(String Statement) {
    _otp_validation_status = Statement;
    notifyListeners();
  }
}
