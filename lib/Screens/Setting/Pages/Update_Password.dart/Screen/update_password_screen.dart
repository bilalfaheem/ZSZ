import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zsz/Functions/Internet/Internet.dart';
import 'package:zsz/Screens/Setting/Pages/Update_Password.dart/function/update_password_func.dart';
import 'package:zsz/Theme/theme.dart';
import 'package:zsz/Widgets/Heading_Bar/PopHeadingBar.dart';
import 'package:zsz/main.dart';
import 'package:zsz/Constant.dart';

class Update_password_screen extends StatefulWidget {
  const Update_password_screen({Key? key}) : super(key: key);

  @override
  State<Update_password_screen> createState() => _Update_password_screenState();
}

class _Update_password_screenState extends State<Update_password_screen> {
  // Text Controller
  TextEditingController Current_Pass = TextEditingController();
  TextEditingController New_Pass = TextEditingController();
  TextEditingController Confirm_Pass = TextEditingController();

  // Password Visibility
  bool _passwordVisible_Current = true;
  bool _passwordVisible_new = true;
  bool _passwordVisible_Confirm = true;

  final GlobalKey<FormState> _change_password_formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _current_password_formKey = GlobalKey<FormState>();

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
                Container(
                  margin: EdgeInsets.only(top: _size.height * 0.05),
                  // height: _size.height*0.3,
                  width: _size.width,
                  padding: EdgeInsets.all(_size.width * 0.07),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(_size.height * 0.02),
                      color: theme.dividerColor),

                  child: Column(
                    children: [
                      Text(
                        "Change Password",
                        style: GoogleFonts.ubuntu(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.025,
                            color: theme.focusColor),
                      ),
                      SizedBox(
                        height: _size.height * 0.02,
                      ),
                      // Current Password
                      Form(
                        key: _current_password_formKey,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: TextFormField(
                            cursorColor: theme.primaryColor,
                            controller: Current_Pass,
                            obscureText: _passwordVisible_Current,
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: theme.primaryColor)),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: theme.primaryColor)),
                                focusColor: theme.primaryColor,
                                border: UnderlineInputBorder(),
                                labelText: 'Enter Current Password ',
                                labelStyle:
                                    TextStyle(color: theme.highlightColor),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _passwordVisible_Current =
                                            !_passwordVisible_Current;
                                      });
                                    },
                                    // focusColor: theme.primaryColor,
                                    // highlightColor: theme.highlightColor,
                                    icon: _passwordVisible_Current
                                        ? Icon(Icons.remove_red_eye,
                                            color: theme.highlightColor)
                                        : Icon(Icons.visibility_off,
                                            color: theme.highlightColor))),
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return "Please Enter Password";
                              } else if (val.toString() !=
                                  userLoginPassword_S.toString()) {
                                return "Wrong Password";
                              } else if (val.toString() ==
                                  userLoginPassword_S.toString()) {
                                return null;
                              } else if (Change_Pass_Status == "0") {
                                return "Failed";
                              }
                              //  else if (Change_Pass_Status == "1") {
                              //   return null;
                              // }
                              else if (Change_Pass_Status == "2") {
                                return "Wrong Password";
                              }
                              //  else {
                              //   return null;
                              // }
                            },
                          ),
                        ),
                      ),

                      // New Password
                      Form(
                        key: _change_password_formKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: TextFormField(
                                cursorColor: theme.primaryColor,

                                // enabled: _tenantValue,
                                controller: New_Pass,
                                obscureText: _passwordVisible_new,
                                // maxLength: 13,

                                decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: theme.primaryColor)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: theme.primaryColor)),
                                    focusColor: theme.primaryColor,
                                    border: UnderlineInputBorder(),
                                    labelText: 'Enter New Password ',
                                    labelStyle:
                                        TextStyle(color: theme.highlightColor),
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _passwordVisible_new =
                                                !_passwordVisible_new;
                                          });
                                        },
                                        icon: _passwordVisible_new
                                            ? Icon(Icons.remove_red_eye,
                                                color: theme.highlightColor)
                                            : Icon(Icons.visibility_off,
                                                color: theme.highlightColor))),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please Enter Password";
                                  } else if (value.length < 8) {
                                    return "Password too short";
                                  }
                                  //  else if (New_Pass.text != Confirm_Pass.text) {
                                  //   return "Wrong Password";
                                  // }
                                  else if (Current_Pass.text == New_Pass.text) {
                                    return "Can not change to previous password";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),

                            // Confirm Password

                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: TextFormField(
                                cursorColor: theme.primaryColor,
                                // enabled: _tenantValue,
                                controller: Confirm_Pass,
                                obscureText: _passwordVisible_Confirm,

                                decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: theme.primaryColor)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: theme.primaryColor)),
                                    focusColor: theme.primaryColor,
                                    border: UnderlineInputBorder(),
                                    labelText: 'Confirm New Password ',
                                    labelStyle:
                                        TextStyle(color: theme.highlightColor),
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _passwordVisible_Confirm =
                                                !_passwordVisible_Confirm;
                                          });
                                        },
                                        icon: _passwordVisible_Confirm
                                            ? Icon(Icons.remove_red_eye,
                                                color: theme.highlightColor)
                                            : Icon(Icons.visibility_off,
                                                color: theme.highlightColor))),
                                validator: (valu) {
                                  if (valu == null || valu.isEmpty) {
                                    return "Please Enter Password";
                                  } else if (valu.length < 8) {
                                    return "Password too short";
                                  } else if (Confirm_Pass.text !=
                                      New_Pass.text) {
                                    return "Password Does not match";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Change Password Button
                      SizedBox(
                        height: _size.height * 0.04,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: theme.primaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30))),
                              onPressed: () {
                                Change_Pass_Status = "56";
                                connectivity_status_func(context);
                                if (!_current_password_formKey.currentState!
                                    .validate()) {
                                  print(
                                      "current password validation does not pass");
                                  print(
                                      "${_current_password_formKey.currentState.toString()}");
                                  return;
                                }

                                if (!_change_password_formKey.currentState!
                                    .validate()) {
                                  print(
                                      "change password validation does not pass");
                                  print(
                                      "${_change_password_formKey.currentState.toString()}");
                                  return;
                                }

                                Update_Password_Func(
                                    context,
                                    _size.height,
                                    _size.width,
                                    theme,
                                    _current_password_formKey,
                                    userLoginIdShared.toString(),
                                    Current_Pass.text.toString(),
                                    New_Pass.text.toString(),
                                    Confirm_Pass.text.toString(),
                                    _change_password_formKey);
                              },
                              child: Padding(
                                padding: EdgeInsets.all(_size.height * 0.01),
                                child: Text("Confirm",
                                    style: GoogleFonts.ubuntu(
                                        fontSize: _size.height * 0.024,
                                        color: Colors.white)),
                              ))
                          // Container(
                          //     padding: EdgeInsets.all(h_size * 0.001),
                          //     decoration: BoxDecoration(
                          //         borderRadius: BorderRadius.circular(h_size * 0.02),
                          //         color: theme.primaryColor),
                          //     child: TextButton(
                          //       style: ,
                          //         onPressed: () {},
                          //         child: Text("Confirm",
                          //             style: GoogleFonts.ubuntu(
                          //                 fontSize: h_size * 0.0,
                          //                 color: Colors.black)))),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
