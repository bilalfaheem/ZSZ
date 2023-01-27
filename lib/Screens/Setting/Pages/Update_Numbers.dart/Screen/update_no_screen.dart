import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zsz/Functions/Internet/Internet.dart';
import 'package:zsz/Screens/Profile_Screen/functions/profile_get_api_func.dart';
import 'package:zsz/Screens/Setting/Pages/Update_Numbers.dart/function/update_number_func.dart';
import 'package:zsz/Theme/theme.dart';
import 'package:zsz/Widgets/Heading_Bar/PopHeadingBar.dart';
import 'package:zsz/main.dart';
import 'package:zsz/Constant.dart';

class Update_no_screen extends StatelessWidget {
  Update_no_screen({Key? key}) : super(key: key);

  // Text Controller
  TextEditingController new_contact = TextEditingController();

  //Validation
  final GlobalKey<FormState> _change_Contact_formKey = GlobalKey<FormState>();

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
                        "Update Contact",
                        style: GoogleFonts.ubuntu(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.025,
                            color: theme.focusColor),
                      ),
                      SizedBox(
                        height: _size.height * 0.02,
                      ),

                      Form(
                        key: _change_Contact_formKey,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: TextFormField(
                            cursorColor: theme.primaryColor,
                            // enabled: _tenantValue,
                            controller: new_contact,
                            keyboardType: TextInputType.number,

                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp("[0-9]")),
                            ],
                            maxLength: 11,

                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: theme.primaryColor)),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: theme.primaryColor)),
                                focusColor: theme.primaryColor,
                                border: UnderlineInputBorder(),
                                labelText: 'Enter New Number ',
                                labelStyle:
                                    TextStyle(color: theme.highlightColor)),
                            validator: (v) {
                              // first change contact validation
                              if (Change_Contact_Validation == "false") {
                                if (v == null || v.isEmpty) {
                                  return "Enter Contact Number";
                                } else if (v.length < 11) {
                                  return "Wrong Contact Number";
                                } else if (Active_User_List[0]
                                        .contact
                                        .toString() ==
                                    v.toString()) {
                                  return "Cannot Change To Same Number";
                                } else if (v.length == 11) {
                                  return null;
                                }
                              }
                              //second round validation
                              // update contact
                              else if (Change_Contact_Validation == "true") {
                                // for loop
                                Change_Contact_Validation = "false";

                                if (Change_Contact_Status == "2") {
                                  return "Number Already Registered";
                                } else if (Change_Contact_Status == "1") {
                                  return null;
                                }
                              } else {
                                return "dfdfd";
                              }
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: _size.height * 0.04,
                      ),

                      // Confirm Button

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: theme.primaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30))),
                              onPressed: () {
                                if (!_change_Contact_formKey.currentState!
                                    .validate()) {
                                  print("ifff");
                                  return;
                                }

                                connectivity_status_func(context);

                                Update_Contact_Func(
                                    context,
                                    _size.height,
                                    _size.width,
                                    theme,
                                    userLoginIdShared.toString(),
                                    new_contact.text.toString(),
                                    _change_Contact_formKey);
                                // Update_Contact_Func("70",
                                // new_contact.text.toString()
                                //  );
                                print("pass");
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
