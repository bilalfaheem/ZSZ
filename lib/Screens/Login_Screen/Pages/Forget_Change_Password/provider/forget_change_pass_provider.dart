import 'package:flutter/foundation.dart';

class ForgetChangePasswordProvider with ChangeNotifier {
  bool _show_new_pass = true;
  bool get show_new_pass => _show_new_pass;

  bool _show_confirm_pass = true;
  bool get show_confirm_pass => _show_confirm_pass;

  bool _loading = false;
  bool get loading => _loading;

  void Show_New_Pass_Func(bool _Status) {
    _show_new_pass = _Status;
    notifyListeners();
  }

  void Show_Confirm_Pass_Func(bool _Status) {
    _show_confirm_pass = _Status;
    notifyListeners();
  }

  void Loading_Func(bool status) {
    _loading = status;
    notifyListeners();
  }
}
