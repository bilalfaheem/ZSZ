import 'dart:convert';
import 'package:zsz/Functions/LogoutCheck/LogoutCheckFunc.dart';
import 'package:zsz/Models/maintenance_model/maintenance_model.dart';
import 'package:http/http.dart' as http;
import 'package:zsz/Constant.dart';

// bool billing_status = false;

// List<BillingModell> Billing_List = [];

// Future<List<BillingModell>> Billing_Func(String userId) async {
//   final Response = await http
//       .post(Uri.parse("${Api_Address}billing.php"), body: {"user_id": userId});

//   billing_status = false;

//   if (Response.statusCode == 200) {
//     Billing_List.clear();
//     var data = jsonDecode(Response.body.toString());

//     for (Map i in data) {
//       Billing_List.add(BillingModell.fromJson(i));
//     }
//     print(Billing_List);

// // 3 previous month register but maintenance not paid
// // 9 three months due block account
// // 4 some dues as well
//     if (Billing_List.first.status.toString() == "3" ||
//         Billing_List.first.status.toString() == "9" ||
//         Billing_List.first.status.toString() == "4") {
//       billing_status = false;
//       print("billing status type $billing_status");
//     }

// // 7 all dues clear
// // 2 current month register

//     else if (Billing_List.first.status.toString() == "7" ||
//         Billing_List.first.status.toString() == "2") {
//       billing_status = true;
//       print("billing status type $billing_status");
//     } else {
//       billing_status = false;
//     }

//     //split due date and update date in list

//     for (int i = 0; i < Billing_List.length; i++) {
//       var dd = Billing_List[i].dueDate.toString().split(' ');
//       var split_due_Date = dd[0].trim();
//       print(split_due_Date);
//       Billing_List[i].dueDate = split_due_Date.toString();
//     }
//     print("update due date in list");
//     print(Billing_List.first.dueDate);

//     //split pay date and update date in list

//     for (int i = 0; i < Billing_List.length; i++) {
//       var pd = Billing_List[i].payDate.toString().split(' ');
//       var split_pay_Date = pd[0].trim();
//       print(split_pay_Date);
//       Billing_List[i].payDate = split_pay_Date.toString();
//     }
//     print("update pay date in list");
//     print(Billing_List.first.payDate);

//     return Billing_List;
//   } else {
//     return Billing_List;
//   }
// }

bool billing_status = false;

List<MaintenanceModel> MaintenanceList = [];
Future<List<MaintenanceModel>> MaintenanceApiFunc(
    context, String userId) async {
  LogoutCheckFunc(userLoginIdShared, context);

  final Response = await http
      .post(Uri.parse("${Api_Address}billing.php"), body: {"user_id": userId});

  if (Response.statusCode == 200) {
    var MaintenanceData = jsonDecode(Response.body.toString());
    //print(MaintenanceData["status"]);
    //print(MaintenanceData["balance"]);

    if (MaintenanceData["status"].toString() == "200" ||
        MaintenanceData["status"].toString() == "404") {
      MaintenanceList.clear();
      var MaintenanceDataResponse = MaintenanceData["response"];
      //print(MaintenanceDataResponse);

      for (Map i in MaintenanceDataResponse) {
        MaintenanceList.add(MaintenanceModel.fromJson(i));
      }
      if (MaintenanceList.first.status.toString() == "1") {
        // Maintenance Paid
        billing_status = true;
      } else if (MaintenanceList.first.status.toString() == "0") {
        //Maintenance Due
        billing_status = false;
      }
      return MaintenanceList;
    } else {
      //print(MaintenanceData["status"]);
      return MaintenanceList;
    }
  } else {
    return MaintenanceList;
  }
}
