import 'dart:convert';
import 'package:http/http.dart' as https;
import 'package:zsz/Constant.dart';


Future sendMsg(String threadId,String message) async {
  final response = await https.post(
      Uri.parse("${Api_Address}chat/create_thread_message.php"),
      body: {
        "thread_id": threadId,
        "type":"user",
        "message":message,
        // "file":""
      });


  if (response.statusCode == 200) {
    var data = jsonDecode(response.body.toString());
    var dataStatus = data["status"].toString();

    if (dataStatus == "200") {
      print("<<<<<<<<<<<<<<<<<<<<<<<<<<<msg send successfully >>>>>>>>>>>>>>>>>>>>>>>>>>>");
      }
    } else {
     print("<<<<<<<<<<<<<<<<<<<<<<<<<<<msg send failed >>>>>>>>>>>>>>>>>>>>>>>>>>>");
  }
}
