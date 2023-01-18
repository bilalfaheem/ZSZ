import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:zsz/Constant.dart';

class Societies {
  final String id;
  final String societytitle;

  const Societies({required this.id, required this.societytitle});

  static Societies fromJson(Map<String, dynamic> json) =>
      Societies(id: json['id'], societytitle: json['project_title']);
}

class Societies_Api {
  static Future<List<Societies>> Get_Society_Suggestions(String query) async {
    final url = Uri.parse("${Api_Address}project_list.php");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List Societies_List = json.decode(response.body);
      // Societies_List_Id.clear();
      // Societies_List_Address.clear();

      //  Societies_List_Id = Societies_List;
      //  print(Societies_List_Id);

      return Societies_List.map((json) => Societies.fromJson(json))
          .where((_society) {
        // Societies_List_Id.add(_society.id);
        // Societies_List_Address.add(_society.address);

        final Society_Lower = _society.societytitle.toLowerCase();
        final queryLower = query.toLowerCase();

        return Society_Lower.contains(queryLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}
