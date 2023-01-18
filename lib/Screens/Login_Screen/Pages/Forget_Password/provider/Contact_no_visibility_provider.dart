import 'package:flutter/foundation.dart';

class Contact_No_Visibility_Provider with ChangeNotifier {
// contact text field show or not
  bool _contact_no_visibility_status = false;
  bool get Contact_no_visibility_status => _contact_no_visibility_status;

//get contact no of selected addrresss
  String _contact_No = "";
  String get Contact_no => _contact_No;

// get user id from selected address
  String _user_id = "";
  String get User_Id => _user_id;

  String _forget_change_Password_Screen_Navigation_1 = "1";
  String get Forget_Change_Password_Screen_Navigation_1 =>
      _forget_change_Password_Screen_Navigation_1;

// otp send status show failed or successfully send
  String _otp_Send_Status = "initial";
  String get Otp_Send_Status => _otp_Send_Status;

  void Change_Contact_No_Func(bool visibility_Status, String Address_contact_no,
      String Address_user_idd) {
    if (visibility_Status == true) {
      _contact_No = Address_contact_no;
      _user_id = Address_user_idd;
      _contact_no_visibility_status = visibility_Status;
      notifyListeners();
    }
  }

  void Initialized_Visibility_Status(bool status) {
    _contact_no_visibility_status = status;
    notifyListeners();
  }

  void Forget_Change_Password_Screen_Navigation_Func(String status_code) {
    _forget_change_Password_Screen_Navigation_1 = status_code;
    notifyListeners();
  }

  void Otp_Send_Status_Func(String Status) {
    _otp_Send_Status = Status;
    notifyListeners();
  }
}
