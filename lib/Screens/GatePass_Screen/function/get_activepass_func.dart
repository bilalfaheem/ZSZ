import 'dart:convert';
import 'package:http/http.dart' as https;
import 'package:zsz/Constant.dart';
import 'package:zsz/Models/active_pass_model/active_pass_model.dart';
import 'package:zsz/Models/chat_history/chat_history.dart';
import 'package:zsz/Models/scan_pass_model/scan_pass_model.dart';

List<ActivePassModel> activePassList = [];

Future<List<ActivePassModel>> activePassFunc() async {
  final response = await https.post(
      Uri.parse("${Api_Address}passes/active_passes.php"),
      body: {"address_id": "1"});
  print("hittttttttt");

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body.toString());
    activePassList.clear();

    for (Map i in data) {
      activePassList.add(ActivePassModel.fromJson(i));
    }

    return activePassList;
  } else {
    return activePassList;
  }
}
List<ScanPassModel> scanPassList = [];

Future<List<ScanPassModel>> scanPassFunc() async {
  final response = await https.post(
      Uri.parse("${Api_Address}passes/scan_passes.php"),
      body: {"address_id": "1"});
  print("hittttttttt");

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body.toString());
    scanPassList.clear();

    for (Map i in data) {
      scanPassList.add(ScanPassModel.fromJson(i));
    }

    return scanPassList;
  } else {
    return scanPassList;
  }
}
