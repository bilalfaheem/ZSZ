import 'dart:convert';
import 'package:http/http.dart' as https;
import 'package:zsz/Constant.dart';
import 'package:zsz/Models/chat_history/chat_history.dart';

List<ChatHistory> chatHistoryList = [];

Future<List<ChatHistory>> fetchChat(String threadId) async {
  final response = await https.post(
      Uri.parse("${Api_Address}chat/previous_message.php"),
      body: {"thread_id": threadId});
  print("hittttttttt");

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body.toString());
    var dataStatus = data["status"].toString();

    if (dataStatus == "1") {
      chatHistoryList.clear();
      var dataResponse = data["response"];
      for (Map r in dataResponse) {
        chatHistoryList.add(ChatHistory.fromJson(r));
      }
    }

    return chatHistoryList;
  } else {
    return chatHistoryList;
  }
}
