import 'dart:convert';
import 'package:zsz/Constant.dart';
import 'package:zsz/Models/maintenance_and_billing_model/maintenance_and_billing_model.dart';
import 'package:http/http.dart' as http;

// List<BillingHistoryModel> Billing_History_List = [];

// Future<List<BillingHistoryModel>> Billing_History_Func(String userId) async {
//   final Response = await http.post(
//       Uri.parse("${Api_Address}maintenance_history.php"),
//       body: {"user_id": userId});

//   if (Response.statusCode == 200) {
//     Billing_History_List.clear();
//     var data = jsonDecode(Response.body.toString());

//     for (Map i in data) {
//       Billing_History_List.add(BillingHistoryModel.fromJson(i));
//     }
//     print(Billing_History_List);

//     //split date and update date in list

//     for (int i = 0; i < Billing_History_List.length; i++) {
//       var j = Billing_History_List[i].date.toString().split(' ');
//       var split_B_H_Date = j[0].trim();
//       print(split_B_H_Date);
//       Billing_History_List[i].date = split_B_H_Date.toString();
//     }
//     print("update date in list");
//     print(Billing_History_List);

//     return Billing_History_List;
//   } else {
//     return Billing_History_List;
//   }
// }

List<MaintenanceAndBillingModel> MaintenanceHistoryList = [];
Future<List<MaintenanceAndBillingModel>> MaintenanceHistoryApiFunc(
    String userId) async {
  final Response = await http.post(
      Uri.parse("${Api_Address}maintenance_history.php"),
      body: {"user_id": userId});

  if (Response.statusCode == 200) {
    var MaintenanceHistoryData = jsonDecode(Response.body.toString());
    // print(MaintenanceHistoryData["status"]);
    //print(MaintenanceHistoryData["balance"]);

    if (MaintenanceHistoryData["status"].toString() == "200") {
      MaintenanceHistoryList.clear();
      var MaintenanceHistoryDataResponse = MaintenanceHistoryData["response"];
      // print(MaintenanceHistoryDataResponse);

      for (Map i in MaintenanceHistoryDataResponse) {
        MaintenanceHistoryList.add(MaintenanceAndBillingModel.fromJson(i));
      }
      return MaintenanceHistoryList;
    } else {
      //print(MaintenanceHistoryData["status"]);
      return MaintenanceHistoryList;
    }
  } else {
    return MaintenanceHistoryList;
  }
}
