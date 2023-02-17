import 'package:flutter/cupertino.dart';

class GatePassProvider with ChangeNotifier {
  String _pageType = "None";
  String get pageType => _pageType;

  int _propPage = 0;
  int get propPage => _propPage;

  void changePage(String pageType) {
    _pageType = pageType;
    notifyListeners();
  }

  void changePropPage(int pageType) {
    _propPage = pageType;
    notifyListeners();
  }
}
