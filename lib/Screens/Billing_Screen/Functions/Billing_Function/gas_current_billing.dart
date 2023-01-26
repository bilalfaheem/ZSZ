import 'dart:convert';

import 'package:zsz/Constant.dart';
import 'package:zsz/Functions/LogoutCheck/LogoutCheckFunc.dart';
import 'package:zsz/Models/gas_billing_current_response/gas_billing_current_response.dart';
import 'package:http/http.dart' as http;

List<GasBillingCurrentResponse> GasCurrentBillingList = [];
List<GasBillingCurrentResponse> gasBillingList = [];
Future<List<GasBillingCurrentResponse>> GasCurrentBillingFunc(
    context, String Address_Iddd) async {
  LogoutCheckFunc(User_Login_id_S, context);

  final Response = await http.post(Uri.parse("${Api_Address}gas_billing.php"),
      body: {"address_id": Address_Iddd});

  if (Response.statusCode == 200) {
    var GasCurrentBillingResponse = jsonDecode(Response.body.toString());
    // var gasCurrentBillingResponsecurrent = GasCurrentBillingResponse["current_month"];
    //print(GasCurrentBillingResponse["status"]);
    //print(GasCurrentBillingResponse["balance"]);

    if (GasCurrentBillingResponse["status"].toString() == "200" ||
        GasCurrentBillingResponse["status"].toString() == "404") {
      GasCurrentBillingList.clear();
      gasBillingList.clear();
      var GasCurrentBillingResponseResponse =
          GasCurrentBillingResponse["current_month"];
      var gasBillingResponseResponse = GasCurrentBillingResponse["response"];
      //print(GasCurrentBillingResponseResponse);

      for (Map i in GasCurrentBillingResponseResponse) {
        GasCurrentBillingList.add(GasBillingCurrentResponse.fromJson(i));
      }
      for (Map r in gasBillingResponseResponse) {
        gasBillingList.add(GasBillingCurrentResponse.fromJson(r));
      }
      // if (GasCurrentBillingList.first.status.toString() == "1") {
      //   // Maintenance Paid
      //   billing_status = true;
      // } else if (GasCurrentBillingList.first.status.toString() == "0") {
      //   //Maintenance Due
      //   billing_status = false;
      // }
      return GasCurrentBillingList;
    } else {
      //print(GasCurrentBillingResponse["status"]);
      return GasCurrentBillingList;
    }
  } else {
    return GasCurrentBillingList;
  }
}
