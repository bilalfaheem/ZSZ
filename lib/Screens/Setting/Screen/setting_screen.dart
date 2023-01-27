import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zsz/Functions/LogOut_Func/logout_func.dart';
import 'package:zsz/Functions/LogoutCheck/LogoutCheckFunc.dart';
import 'package:zsz/Screens/Setting/Pages/Contact_Us/Contact_Us.dart';
import 'package:zsz/Screens/Setting/Pages/Update_Numbers.dart/Screen/update_no_screen.dart';
import 'package:zsz/Screens/Setting/Pages/Update_Password.dart/Screen/update_password_screen.dart';
import 'package:zsz/Widgets/Heading_Bar/PopHeadingBar.dart';
import 'package:zsz/Widgets/Loading/loading.dart';
import 'package:zsz/Constant.dart';

class Setting_screen extends StatelessWidget {
  const Setting_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final _size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              _size.width * padding_horizontal,
              _size.height * padding_top,
              _size.width * padding_horizontal,
              _size.height * padding_bottom),
          child: Column(
            children: [
              //heading
              Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, _size.height * 0.038),
                  child: PopHeadingBar(context, "Settings", 22, "Back")),
              // Container(
              //   margin: EdgeInsets.fromLTRB(0, 0, 0, _size.height * 0.038),
              //   child: Center(
              //     child: Text(
              //       "Setting",
              //       style: GoogleFonts.ubuntu(
              //           fontSize: MediaQuery.of(context).size.height * 0.029,
              //           color: theme.focusColor),
              //     ),
              //   ),
              // ),
              Center(
                  child: CircleAvatar(
                backgroundColor: theme.primaryColorDark,
                radius: _size.height * 0.07,
                // backgroundImage: AssetImage("assets/Bottom_Bar/Profile.png"),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Image.asset(
                    logo2,
                    height: _size.height * 0.1,
                    color: Colors.white,
                    // width: _size.width * 0.5,
                  ),
                ),
              )),
              // update no
              Container(
                  height: _size.height * 0.055,
                  width: _size.width * 0.8,
                  margin: EdgeInsets.fromLTRB(0, _size.height * 0.2, 0, 0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.amber),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: theme.primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      onPressed: () {
                        LogoutCheckFunc(userLoginIdShared, context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Update_no_screen()),
                        );
                      },
                      child: Text("Edit Contact Number",
                          style: GoogleFonts.ubuntu(
                              fontSize: _size.width * 0.056,
                              color: Colors.white)))),

              // Change Password

              Container(
                  height: _size.height * 0.055,
                  width: _size.width * 0.8,
                  margin: EdgeInsets.fromLTRB(0, _size.height * 0.05, 0, 0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.amber),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: theme.primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      onPressed: () {
                        LogoutCheckFunc(userLoginIdShared, context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Update_password_screen()),
                        );
                      },
                      child: Text("Change Password",
                          style: GoogleFonts.ubuntu(
                              fontSize: _size.width * 0.056,
                              color: Colors.white)))),

              //about
              Container(
                  height: _size.height * 0.055,
                  width: _size.width * 0.8,
                  margin: EdgeInsets.fromLTRB(0, _size.height * 0.05, 0, 0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.amber),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: theme.primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      onPressed: () {
                        // Broadcast_Push_Notification_Function();

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Contact_Us()),
                        );
                      },
                      child: Text("Contact Us",
                          style: GoogleFonts.ubuntu(
                              fontSize: _size.width * 0.056,
                              color: Colors.white)))),

              // log out

              Container(
                  height: _size.height * 0.055,
                  width: _size.width * 0.8,
                  margin: EdgeInsets.fromLTRB(0, _size.height * 0.05, 0, 0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.amber),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: theme.primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      onPressed: () async {
                        Loading_Indicator(context);

                        LogOut_Func(context, true);
                        // 1.0.2
                        // SharedPreferences pref =
                        //     await SharedPreferences.getInstance();
                        // pref.remove("userLoginId");
                        // pref.clear();
                        // Timer(
                        //     const Duration(seconds: 3),
                        //     () => Navigator.pushAndRemoveUntil(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (context) => Login_Screen()),
                        //         (route) => false),
                        //         );
                        // 1.0.2
                      },
                      child: Text("Log out",
                          style: GoogleFonts.ubuntu(
                              fontSize: _size.width * 0.056,
                              color: Colors.white)))),
            ],
          ),
        ),
      ),
    ));
  }
}

// 1.0.3

// split_date() {
//   String dat = "2022-05-20 19:08:05";
//   int pos = dat.indexOf(" ");
//   print(pos);

//   var ss = dat.split(" ");
//   var prefix = ss[0].trim();
//   print(prefix);
//   var postfix = ss[1].trim();
//   print(postfix);
// // ss.forEach((element) => print(element.));
// // ss.first((l) => print(l));
// }
