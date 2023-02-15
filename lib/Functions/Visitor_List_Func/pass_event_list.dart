import 'dart:convert';
import 'package:http/http.dart' as https;
import 'package:zsz/Constant.dart';
import 'package:zsz/Models/VisitorModel/visitor_contact_list/visitor_contact_list/visitor_contact_list.dart';
import 'package:zsz/Models/VisitorModel/visitor_pass_type/visitor_pass_type.dart';
import 'package:zsz/Models/VisitorModel/visitor_pass_validity/visitor_pass_validity.dart';
import 'package:zsz/Models/VisitorModel/visitor_type_list/visitor_type_list.dart';
import 'package:zsz/Models/VisitorModel/visitorevent/visitorevent.dart';

List<VisitorContactList> passVisitorContactList = [];

Future<List> passVisitorContactFunc() async {
  final response =
      await https.post(Uri.parse("${Api_Address}passes/get_user_contact.php"),
      body: {
        "user_id":"1"
      });

  if (response.statusCode == 200) {

    var data = jsonDecode(response.body.toString());
    // print(data);
    passVisitorContactList.clear();
    for (Map r in data) {
      passVisitorContactList.add(VisitorContactList.fromJson(r));
    }
    print("listttttttttt");
    print(passVisitorContactList);
    return passVisitorContactList;
  } else {
    return passVisitorContactList;
  }
}

List<Visitorevent> passEventList = [];

Future<List> passEventFunc() async {
  final response =
      await https.get(Uri.parse("${Api_Address}passes/pass_event_list.php"));

  if (response.statusCode == 200) {
    passEventList.clear();
    var data = jsonDecode(response.body.toString());
    // print(data);

    for (Map r in data) {
      passEventList.add(Visitorevent.fromJson(r));
    }
    print("listttttttttt");
    print(passEventList);
    return passEventList;
  } else {
    return passEventList;
  }
}

List<VisitorPassValidity> passDurationList = [];

Future<List> passDurationFunc() async {
  final response =
      await https.get(Uri.parse("${Api_Address}passes/pass_validity_list.php"));

  if (response.statusCode == 200) {
    passDurationList.clear();
    var data = jsonDecode(response.body.toString());
    // print(data);

    for (Map r in data) {
      passDurationList.add(VisitorPassValidity.fromJson(r));
    }
    print("listttttttttt");
    print(passEventList);
    return passDurationList;
  } else {
    return passDurationList;
  }
}

List<VisitorTypeList> passVisitorTypeList = [];

Future<List> passVisitorTypeFunc() async {
  final response =
      await https.get(Uri.parse("${Api_Address}passes/visitor_type_list.php"));

  if (response.statusCode == 200) {
    passVisitorTypeList.clear();
    var data = jsonDecode(response.body.toString());
    // print(data);

    for (Map r in data) {
      passVisitorTypeList.add(VisitorTypeList.fromJson(r));
    }
    print("listttttttttt");
    print(passVisitorTypeList);
    return passVisitorTypeList;
  } else {
    return passVisitorTypeList;
  }
}

List<VisitorPassType> passTypeList = [];

Future<List> passTypeFunc() async {
  final response =
      await https.get(Uri.parse("${Api_Address}passes/pass_type_list.php"));

  if (response.statusCode == 200) {
    passTypeList.clear();
    var data = jsonDecode(response.body.toString());
    // print(data);

    for (Map r in data) {
      passTypeList.add(VisitorPassType.fromJson(r));
    }
    print("listttttttttt");
    print(passTypeList);
    return passTypeList;
  } else {
    return passTypeList;
  }
}
