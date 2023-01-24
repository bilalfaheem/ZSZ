import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:zsz/Functions/Internet/Internet.dart';
import 'package:zsz/Screens/Login_Screen/Pages/Forget_Change_Password/Func/forget_change_pass_api_func.dart';
import 'package:zsz/Screens/Login_Screen/Pages/Forget_Change_Password/provider/forget_change_pass_provider.dart';
import 'package:zsz/Screens/Setting/Pages/Update_Password.dart/function/update_password_func.dart';
import 'package:zsz/Widgets/Heading_Bar/PopHeadingBar.dart';
import 'package:zsz/Constant.dart';
import 'package:zsz/responsive.dart';

class ForgetChangePasswordScreen extends StatelessWidget {
  String User_Id_Forget_Pass;
  ForgetChangePasswordScreen({required this.User_Id_Forget_Pass});

  // Text Controller
  // TextEditingController Current_Pass_Forget = TextEditingController();
  TextEditingController New_Pass_Forget = TextEditingController();
  TextEditingController Confirm_Pass_Forget = TextEditingController();

  final GlobalKey<FormState> _change_password_forget_formKey =
      GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print("build forget change password");
    final ThemeData theme = Theme.of(context);
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                _size.width * padding_horizontal,
                _size.height * padding_top,
                _size.width * padding_horizontal,
                _size.height * padding_bottom),
            child: Column(
              children: [
                PopHeadingBar(context, "Forget Password", 20, "Close"),
                Container(
                  margin: EdgeInsets.only(top: height(30), bottom: height(55)),
                  child: Center(
                      child: CircleAvatar(
                    backgroundColor: theme.primaryColorDark,
                    radius: _size.height * 0.07,
                    // backgroundImage: AssetImage("assets/Bottom_Bar/Profile.png"),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 8),
                      child: Image.asset(
                        logo2,
                        height: _size.height * 0.1,
                        color: Colors.white,
                        // width: _size.width * 0.5,
                      ),
                    ),
                  )),
                ),
                Container(
                  // margin: EdgeInsets.only(top: height(20)),

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

                      // New Password
                      Form(
                        key: _change_password_forget_formKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Consumer<ForgetChangePasswordProvider>(
                                  builder: (context, value, child) {
                                print(
                                    "building text fieldddddddddddddddddddddddd");
                                return TextFormField(
                                  cursorColor: theme.primaryColor,

                                  // enabled: _tenantValue,
                                  controller: New_Pass_Forget,
                                  obscureText: value.show_new_pass,

                                  // remove 3
                                  //  _passwordVisible_new,
                                  maxLength: 13,

                                  decoration: InputDecoration(
                                      counterText: "",
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: theme.primaryColor)),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: theme.primaryColor)),
                                      focusColor: theme.primaryColor,
                                      border: UnderlineInputBorder(),
                                      labelText: 'Enter New Password ',
                                      labelStyle: TextStyle(
                                          color: theme.highlightColor),
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            value.Show_New_Pass_Func(
                                                !value.show_new_pass);
                                            // setState(() {
                                            //   _passwordVisible_new =
                                            //       !_passwordVisible_new;
                                            // });
                                          },
                                          icon: !value.show_new_pass
                                              // remove 3
                                              // _passwordVisible_new
                                              ? Icon(Icons.visibility_off,
                                                  color: theme.highlightColor)
                                              : Icon(Icons.remove_red_eye,
                                                  color:
                                                      theme.highlightColor))),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please Enter Password";
                                    } else if (value.length < 8) {
                                      return "Password too short";
                                    }
                                    //remove 3
                                    // else if (Current_Pass_Forget.text == New_Pass_Forget.text) {
                                    //   return "Can not change to previous password";
                                    // }
                                    else {
                                      return null;
                                    }
                                  },
                                );
                              }),
                            ),

                            // Confirm Password

                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Consumer<ForgetChangePasswordProvider>(
                                  builder: (context, value, child) {
                                return TextFormField(
                                  cursorColor: theme.primaryColor,
                                  // enabled: _tenantValue,
                                  controller: Confirm_Pass_Forget,
                                  obscureText: value.show_confirm_pass,
                                  // remove 3
                                  // _passwordVisible_Confirm,

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
                                      labelStyle: TextStyle(
                                          color: theme.highlightColor),
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            value.Show_Confirm_Pass_Func(
                                                !value.show_confirm_pass);
                                            // setState(() {
                                            //   _passwordVisible_Confirm =
                                            //       !_passwordVisible_Confirm;
                                            // });
                                          },
                                          icon: !value.show_confirm_pass
                                              // remove 3
                                              //  _passwordVisible_Confirm
                                              ? Icon(Icons.visibility_off,
                                                  color: theme.highlightColor)
                                              : Icon(Icons.remove_red_eye,
                                                  color:
                                                      theme.highlightColor))),
                                  validator: (valu) {
                                    if (valu == null || valu.isEmpty) {
                                      return "Please Enter Password";
                                    } else if (valu.length < 8) {
                                      return "Password too short";
                                    } else if (Confirm_Pass_Forget.text !=
                                        New_Pass_Forget.text) {
                                      return "Password Does not match";
                                    } else {
                                      return null;
                                    }
                                  },
                                );
                              }),
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
                          Container(
                              // margin: EdgeInsets.fromLTRB(
                              //     0, _size.height * 0.04, 0, _size.height * 0.02),
                              // margin: EdgeInsets.symmetric(vertical: _size.height * 0.1),
                              height: MediaQuery.of(context).size.height * 0.05,
                              width: MediaQuery.of(context).size.width * 0.3,
                              padding:
                                  EdgeInsets.symmetric(vertical: height(2)),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: theme.primaryColor),
                              child: LayoutBuilder(builder:
                                  (BuildContext context,
                                      BoxConstraints constraints) {
                                return Consumer<ForgetChangePasswordProvider>(
                                    builder: (context, value, child) {
                                  return value.loading == true
                                      ? Container(
                                          height: 5,
                                          width: 5,
                                          // padding: EdgeInsets.symmetric(vertical: constraints.maxHeight*0.15,horizontal: constraints.maxHeight*0.3) ,

                                          child: const Center(
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2.3,
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                      : ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              primary: theme.primaryColor,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30))),
                                          onPressed: () {
                                            Change_Pass_Status = "56";
                                            connectivity_status_func(context);

                                            if (!_change_password_forget_formKey
                                                .currentState!
                                                .validate()) {
                                              print(
                                                  "change password validation does not pass");
                                              print(
                                                  "${_change_password_forget_formKey.currentState.toString()}dfdfdfdd");
                                              return;
                                            }
                                            Forget_Change_Password_Func(
                                                context,
                                                User_Id_Forget_Pass,
                                                Confirm_Pass_Forget.text
                                                    .toString());
                                            // remove 3
                                          },
                                          child: Text("Confirm",
                                              style: GoogleFonts.ubuntu(
                                                  fontSize:
                                                      constraints.maxHeight *
                                                          0.4,
                                                  color: Colors.white)));
                                });
                              }))
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
