import 'dart:convert';

import 'package:zsz/Models/complain_list_response/complain_list_response.dart';
import 'package:zsz/Constant.dart';
import 'package:http/http.dart' as https;

List<ComplainListResponse> complainList = [];

Future<List<ComplainListResponse>> complainListFunc(context,String userId) async {
  // LogoutCheckFunc(userId, context);

  final response = await https.post(Uri.parse("${Api_Address}chat/previous_thread.php"),
      body: {"user_id": userId});

  if (response.statusCode == 200) {
    complainList.clear();
    var data = jsonDecode(response.body.toString());
    var dataResponse = data["response"];

    for (Map i in dataResponse) {
      complainList.add(ComplainListResponse.fromJson(i));
    }

    return complainList;
  } else {
    return complainList;
  }
}
