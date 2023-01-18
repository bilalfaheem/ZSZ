import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:zsz/Constant.dart';

class Drivers {
  final String id;
  final String driver_name;

  const Drivers({required this.id, required this.driver_name});

  static Drivers fromJson(Map<dynamic, dynamic> json) =>
      Drivers(id: json['id'], driver_name: json['name']);
}

class Drivers_Api {
  static Future<List<Drivers>> Get_Driver_Suggestions(String query) async {
    final url = Uri.parse("${Api_Address}driver_list.php");
    final response =
        await http.post(url, body: {"project_id": User_Login_Society_id_S});

    if (response.statusCode == 200) {
      final List Drivers_List = json.decode(response.body);
      // Drivers_List_Id.clear();
      // Drivers_List_Address.clear();

      //  Drivers_List_Id = Drivers_List;
      //  print(Drivers_List_Id);

      return Drivers_List.map((json) => Drivers.fromJson(json))
          .where((_driver) {
        // Drivers_List_Id.add(_driver.id);
        // Drivers_List_Address.add(_driver.address);

        final Driver_Lower = _driver.driver_name.toLowerCase();
        final queryLower = query.toLowerCase();

        return Driver_Lower.contains(queryLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}

// To User all address
// signup

List<Drivers> Drivers_All_List = [];

Future<List<Drivers>> Driver_All_Func() async {
  print("Driver All Fucntionnnnnnnnnnnnnnnnnnnnnnn");
  final response = await http.post(Uri.parse("${Api_Address}driver_list.php"),
      body: {"project_id": User_Login_Society_id_S});
  var data = jsonDecode(response.body.toString());
  print("Driver all func");
  if (response.statusCode == 200) {
    Drivers_All_List.clear();

    for (Map i in data) {
      Drivers_All_List.add(Drivers.fromJson(i));
    }
    // print(Drivers_All_List.first.driver_name);

    //  print(Drivers_All_List);

    return Drivers_All_List;
  } else {
    return Drivers_All_List;
  }
}
