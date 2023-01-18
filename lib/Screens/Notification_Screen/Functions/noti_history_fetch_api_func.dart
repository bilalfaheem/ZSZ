import 'dart:convert';

import 'package:zsz/Models/Notification_History_Model/notification_history_model/notification_history_model.dart';
import 'package:http/http.dart' as https;
import 'package:zsz/Constant.dart';

List<NotificationHistoryModel> Noti_History_List = [];

Future<List<NotificationHistoryModel>> Noti_History_Api_Function(
    String userId) async {
  final Response = await https.post(
      Uri.parse("${Api_Address}notification_history.php"),
      body: {"user_id": userId});
  print("hittttttttt");

  if (Response.statusCode == 200) {
    Noti_History_List.clear();
    var data = jsonDecode(Response.body.toString());
    // print(data);

    for (Map r in data) {
      // print(r);
      Noti_History_List.add(NotificationHistoryModel.fromJson(r));
      //  print(i);
    }
    print("listttttttttt");
    // print(Noti_History_List);
    // print(data);

    return Noti_History_List;
  } else {
    return Noti_History_List;
  }
}
