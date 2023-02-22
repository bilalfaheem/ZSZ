import 'package:flutter/cupertino.dart';

class GatePassProvider with ChangeNotifier {
  String _pageType = "None";
  String get pageType => _pageType;

  int _propPage = 0;
  int get propPage => _propPage;

  bool _reload = true;
  bool get reload => _reload;

  void changePage(String pageType) {
    _pageType = pageType;
    notifyListeners();
  }

  void reloadFunc (){
    print('<<<<<<<<<<<reload>>>>>>>>>>>');
    _reload = !_reload;
    notifyListeners();
  }

  void changePropPage(int pageType) {
    _propPage = pageType;
    notifyListeners();
  }
}
