import 'package:flutter/cupertino.dart';

class SignUpSocietyNameVisibilityProvider with ChangeNotifier {
  bool _signUpsocietyNameVisibilityStatus = false;
  bool get SignUpSocietyNameVisibilityStatus =>
      _signUpsocietyNameVisibilityStatus;

  bool _signUpAddressNameVisibilityStatus = false;
  bool get SignUpAddressNameVisibilityStatus =>
      _signUpAddressNameVisibilityStatus;

  void SignUp_SocietyNameVisibilityStatus_Func(bool status) {
    if (status == true) {
      _signUpsocietyNameVisibilityStatus = status;
      _signUpAddressNameVisibilityStatus = !status;
      notifyListeners();
    }
    _signUpsocietyNameVisibilityStatus = status;
    notifyListeners();
  }

  void SignUp_AddressNameVisibilityStatus_Func(bool status) {
    _signUpAddressNameVisibilityStatus = status;
    notifyListeners();
  }
}
