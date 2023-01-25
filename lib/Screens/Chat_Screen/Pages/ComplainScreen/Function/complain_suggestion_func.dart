import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:zsz/Constant.dart';

class Complains {
  final String id;
  final String reason;

  const Complains({required this.id, required this.reason});

  static Complains fromJson(Map<dynamic, dynamic> json) =>
      Complains(id: json['id'], reason: json['reason']);
}

class ComplainApi {
  static Future<List<Complains>> getComplainSuggestions(String query) async {
    final url = Uri.parse("${Api_Address}chat/thread_reason.php");
    final response =
        await http.post(url, body: {"project_id": User_Login_Society_id_S});

    if (response.statusCode == 200) {
      final List complainList = json.decode(response.body);
      // complainList_Id.clear();
      // complainList_Address.clear();

      //  complainList_Id = complainList;
      //  print(complainList_Id);

      return complainList.map((json) => Complains.fromJson(json))
          .where((_complain) {
        // complainList_Id.add(_complain.id);
        // complainList_Address.add(_complain.address);

        final reasonLower = _complain.reason.toLowerCase();
        final queryLower = query.toLowerCase();

        return reasonLower.contains(queryLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}

// To all complain reason
// 

List<Complains> complainAllList = [];

Future<List<Complains>> complainAllFunction() async {
  print("Complain All Fucntionnnnnnnnnnnnnnnnnnnnnnn");
  final response = await http.post(Uri.parse("${Api_Address}chat/thread_reason.php"),
      body: {"project_id": User_Login_Society_id_S});
  var data = jsonDecode(response.body.toString());
  print("Complain all func");
  if (response.statusCode == 200) {
    complainAllList.clear();

    for (Map i in data) {
      complainAllList.add(Complains.fromJson(i));
    }
    // print(complainAllList.first.Complain_name);

    //  print(complainAllList);

    return complainAllList;
  } else {
    return complainAllList;
  }
}