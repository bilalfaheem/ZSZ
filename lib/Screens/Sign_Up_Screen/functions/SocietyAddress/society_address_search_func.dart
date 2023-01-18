import 'dart:convert';

import 'package:zsz/Constant.dart';
import 'package:http/http.dart' as http;

String Society_Project_Id = "Null";

class SocietyAddress {
  final String id;
  final String address;

  const SocietyAddress({required this.id, required this.address});

  static SocietyAddress fromJson(Map<String, dynamic> json) =>
      SocietyAddress(id: json['id'], address: json['address']);
}

class SocietyAddress_Api {
  static Future<List<SocietyAddress>> get_Society_Address_suggestion(
      String query) async {
    final url = Uri.parse("https://cybernsoft.com/saima_test_api/address.php");
    print("$Society_Project_Id Society Selected Id constant");
    final response =
        await http.post(url, body: {"project_id": Society_Project_Id});

    if (response.statusCode == 200) {
      final List Society_Address_List_S = json.decode(response.body);

      return Society_Address_List_S.map((json) => SocietyAddress.fromJson(json))
          .where((addr) {
        final Address_Lower = addr.address.toLowerCase();
        final queryLower = query.toLowerCase();

        return Address_Lower.contains(queryLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}
