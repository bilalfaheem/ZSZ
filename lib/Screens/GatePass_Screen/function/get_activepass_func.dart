import 'dart:convert';
import 'package:http/http.dart' as https;
import 'package:zsz/Constant.dart';
import 'package:zsz/Models/active_pass_model/active_pass_model.dart';
import 'package:zsz/Models/chat_history/chat_history.dart';

List<ActivePassModel> activePassList = [];

Future<List<ActivePassModel>> activePassFunc() async {
  final response = await https.post(
      Uri.parse("${Api_Address}passes/active_passes.php"),
      body: {"address_id": userLoginAddress_Id_S});
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
