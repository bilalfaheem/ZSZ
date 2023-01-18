import 'dart:async';

import 'package:flutter/foundation.dart';

class Order_Screen_refresh_provider with ChangeNotifier {
  bool _order_screen_refresh_status = false;
  bool get order_screen_refresh_status => _order_screen_refresh_status;

  void Order_Screen_Refresh_Status_Func() {
    _order_screen_refresh_status = true;
    Timer(Duration(seconds: 3), () => notifyListeners());
  }

  // void order_screen_refresh(){
  //   if(_order_screen_refresh_status == true){
  //     _order_screen_refresh_status = false;
  //     notifyListeners();
  //   }
  //   else{

  //   }
  // }

}
