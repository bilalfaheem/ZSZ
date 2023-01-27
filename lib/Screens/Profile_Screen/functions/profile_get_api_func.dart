import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:zsz/Functions/LogoutCheck/LogoutCheckFunc.dart';
import 'package:zsz/Models/Single_User_Modell/single_user_modell/single_user_modell.dart';
import 'package:zsz/Constant.dart';

// List<SingleUserModel> Single_User_List = [];

//  Future<List<SingleUserModel>> Single_User_Func( user_id) async {
//   final response = await http.post(
//       Uri.parse(
//           "http://192.168.100.4//saima_group_api/single_user.php"),
//       body: {"id": user_id});

//   if (response.statusCode == 200) {
//     var data = jsonDecode(response.body.toString());
//     Single_User_List.clear();

//     for (Map i in data) {
//       Single_User_List.add(SingleUserModel.fromJson(i));
//     }
//     print(Single_User_List[0].fullName);
//      print(Single_User_List.length);
//     print(Single_User_List);

//     return Single_User_List;
//   } else {
//    return Single_User_List;
//   }
// }

List<SingleUserModell> Active_User_List = [];
String userLogintypee = "null";
String userLoginCnic = "null";

Future<List<SingleUserModell>> Active_User_Func(String userId, context) async {
  LogoutCheckFunc(userId, context);
  final Response = await http
      .post(Uri.parse("${Api_Address}single_user.php"), body: {"id": userId});

  if (Response.statusCode == 200) {
    Active_User_List.clear();
    var data = jsonDecode(Response.body.toString());

    for (Map i in data) {
      Active_User_List.add(SingleUserModell.fromJson(i));
    }

//For User Cnic
    userLogintypee = Active_User_List[0].userType!;
    print(userLogintypee);
    if (userLogintypee == "owner") {
      userLoginCnic = Active_User_List[0].ownerCnic!;
    } else if (userLogintypee == "tenant") {
      userLoginCnic = Active_User_List[0].tenantCnic!;
    } else {
      userLoginCnic = "null";
    }
    print(Active_User_List.length);
    print("tttttttttttttttttttttttttttttt");

    return Active_User_List;
  } else {
    return Active_User_List;
  }
}
