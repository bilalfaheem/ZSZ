import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:zsz/Functions/Internet/Internet.dart';
import 'package:zsz/Screens/Login_Screen/Pages/Forget_Password/forget_password_screen.dart';
import 'package:zsz/Screens/Login_Screen/Pages/Forget_Password/provider/Contact_no_visibility_provider.dart';
import 'package:zsz/Screens/Login_Screen/Provider/society_name_visibility_provider.dart';
import 'package:zsz/Screens/Login_Screen/functions/get_society_func.dart';
import 'package:zsz/Screens/Login_Screen/functions/login_post_api_func.dart';
import 'package:zsz/Screens/Sign_Up_Screen/Provider/signup_society_visibility_provider.dart';
import 'package:zsz/Screens/Sign_Up_Screen/sign_up_screen.dart';
import 'package:zsz/responsive.dart';
import 'package:zsz/Constant.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({Key? key}) : super(key: key);

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  bool _passwordVisible = true;

  final GlobalKey<FormState> _Login_formKey = GlobalKey<FormState>();
  TextEditingController cnic_cont = TextEditingController();
  TextEditingController password_cont = TextEditingController();
  TextEditingController Society_Name_Controller = TextEditingController();
  TextEditingController Society_Name_Controller_Dropdown =
      TextEditingController();
  // address selected
  var Society_Select_F = "Null";
  String Society_Select_Id_F = "Null";

  // tile click
  bool Society_Selected_F = false;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final _size = MediaQuery.of(context).size;
    SizeConfig().init(context);

    // bool address_Correct_variable_Forget_Password = false;

    //Society name Provider
    final Society_Name_Visibility_provider =
        Provider.of<SocietyNameVisibilityProvider>(context, listen: false);
    //SignUpSociety name Provider
    final SignUp_Society_Name_Visibility_provider =
        Provider.of<SignUpSocietyNameVisibilityProvider>(context,
            listen: false);
    //Forget Password
    final Contact_No_visibility_provider =
        Provider.of<Contact_No_Visibility_Provider>(context, listen: false);

    return Scaffold(
      // color: theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width(50)
                //  _size.width * 0.13
                ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(
                //   height: _size.height * 0.1,
                // ),
                Container(
                  margin: EdgeInsets.only(top: height(50), bottom: height(15)),
                  child: Center(
                    child: Image.asset(zszlogo,
                        width: width(220),
                        //  MediaQuery.of(context).size.width * 0.7,
                        height: height(70)
                        // MediaQuery.of(context).size.height * 0.16,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height(50), bottom: height(15)),
                  //  EdgeInsets.fromLTRB(_size.width*0.05,_size.width*0.05,_size.width*0.05,_size.width*0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Welcome Back to ",
                        style: GoogleFonts.ubuntu(
                            fontSize: height(20),
                            // MediaQuery.of(context).size.height * 0.04,
                            color: theme.focusColor),
                      ),
                      Text(
                        "ZSZ",
                        style: GoogleFonts.ubuntu(
                            fontSize: height(20),
                            // MediaQuery.of(context).size.height * 0.04,
                            color: theme.primaryColor),
                      )
                    ],
                  ),
                ),

                //CNIC
                Form(
                  key: _Login_formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: height(26), top: height(19)),
                        // _size.height * 0.03),
                        child: TextFormField(
                          cursorColor: theme.primaryColor,
                          controller: cnic_cont,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                          ],
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: theme.primaryColor)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: theme.primaryColor)),
                            focusColor: theme.primaryColor,
                            border: UnderlineInputBorder(),
                            labelText: 'CNIC/ Phone Number ',
                            labelStyle: TextStyle(color: theme.highlightColor),
                          ),
                          validator: (a) {
                            // first round validation
                            if (Login_Cnic_Validation == false) {
                              if (a == null || a.isEmpty || a.length < 11) {
                                return "Enter CNIC/Phone Correctly";
                              } else {
                                return null;
                              }
                            }
                            // second round validation
                            else if (Login_Cnic_Validation == true) {
                              //for loop validation
                              Login_Cnic_Validation = false;
                              if (L_status == 0) {
                                return "Register your Account First";
                              } else if (L_status == 1) {
                                return null;
                                // return "Correct";
                              } else if (L_status == 2) {
                                return "Your Account is in Pending for Approval";
                              } else if (L_status == 3) {
                                return null;
                              }
                            } else {
                              return "wrong";
                            }
                          },
                        ),
                      ),
                      //Society names

                      Padding(
                        padding: EdgeInsets.only(bottom: height(26)),
                        child: Consumer<SocietyNameVisibilityProvider>(
                            builder: (context, value, child) {
                          return value.SocietyNameVisibilityStatus
                              ? TextField(
                                  cursorColor: theme.primaryColor,
                                  controller: Society_Name_Controller,
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: theme.primaryColor)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: theme.primaryColor)),
                                    focusColor: theme.primaryColor,
                                    border: UnderlineInputBorder(),
                                    labelText: 'Society',
                                    labelStyle:
                                        TextStyle(color: theme.highlightColor),
                                  ),
                                )
                              : TypeAheadFormField<Societies?>(
                                  // autovalidate: true,
                                  // enabled: false,
                                  hideSuggestionsOnKeyboardHide: false,
                                  debounceDuration: Duration(milliseconds: 500),

                                  textFieldConfiguration:
                                      TextFieldConfiguration(
                                          cursorColor: theme.primaryColor,
                                          controller:
                                              Society_Name_Controller_Dropdown,
                                          decoration: InputDecoration(
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: theme.primaryColor)),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: theme.primaryColor)),
                                            focusColor: theme.primaryColor,
                                            // hintText: "Enter Address",
                                            labelText: "Society",
                                            labelStyle: TextStyle(
                                                color: theme.highlightColor),
                                          )),

                                  suggestionsCallback:
                                      Societies_Api.Get_Society_Suggestions,
                                  itemBuilder:
                                      (context, Societies? suggestion) {
                                    final society_iterations = suggestion!;
                                    return ListTile(
                                      title:
                                          Text(society_iterations.societytitle),
                                    );
                                  },

                                  // on select
                                  onSuggestionSelected:
                                      (Societies? suggestion) {
                                    final society_iterations = suggestion!;
                                    // text field
                                    Society_Name_Controller_Dropdown.text =
                                        society_iterations.societytitle
                                            .toString();

                                    Society_Select_F = society_iterations
                                        .societytitle
                                        .toString();
                                    Society_Select_Id_F =
                                        society_iterations.id.toString();
                                    Society_Selected_F = true;

                                    Society_Name_Controller.text =
                                        society_iterations.societytitle
                                            .toString();
                                    Society_Name_Visibility_provider
                                        .SocietyNameVisibilityStatus_Func(true);

                                    print("$Society_Select_F address selected");
                                    print(
                                        "$Society_Select_Id_F selected address id");
                                    // print(society_iterations.societytitle);
                                    // print(society_iterations.id);
                                    //remove
                                    // Address_Check_Forget_Func();
                                    // providerrrrrrr
                                    //  Get_Phone_Api_Func(context,Address_Select_Id_F);
                                  },

                                  // no item found
                                  noItemsFoundBuilder: (context) => Container(
                                    height: _size.height * 0.1,
                                    child: Center(
                                      child: Text("Society Not Found."),
                                    ),
                                  ),

                                  // on loading
                                  loadingBuilder: (context) => Container(
                                    height: _size.height * 0.1,
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),

                                  //error

                                  hideOnError: true,

                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Enter Society";
                                    }
                                    //  else if (Society_Selected_F == true) {
                                    //   print("Select tile true");
                                    //   if (address_Correct_variable_Forget_Password ==
                                    //       true) {
                                    //     print("address Correct");
                                    //     return null;
                                    //   } else if (address_Correct_variable_Forget_Password ==
                                    //       false) {
                                    //     print("address Wrong");
                                    //     return "Enter Address Correctly";
                                    //   }
                                    // }
                                    else if (Society_Selected_F == false) {
                                      return "Select a Society from List";
                                    } else {
                                      return "wrong";
                                    }
                                  },
                                );
                        }),
                      ),

                      // Password
                      Padding(
                        padding: EdgeInsets.only(bottom: height(23)),
                        child: TextFormField(
                          cursorColor: theme.primaryColor,
                          controller: password_cont,
                          obscureText: _passwordVisible,
                          // keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: theme.primaryColor)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: theme.primaryColor)),
                              focusColor: theme.primaryColor,
                              border: UnderlineInputBorder(),
                              labelText: 'Password ',
                              labelStyle:
                                  TextStyle(color: theme.highlightColor),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                  icon: _passwordVisible
                                      ? Icon(
                                          Icons.remove_red_eye,
                                          color: theme.highlightColor,
                                        )
                                      : Icon(
                                          Icons.visibility_off,
                                          color: theme.highlightColor,
                                        ))),
                          validator: (value) {
                            if (Login_Password_validation == false) {
                              if (value == null ||
                                  value.isEmpty ||
                                  value.length < 8) {
                                return "Enter Password";
                              }
                            }
                            // Second round Validation
                            else if (Login_Password_validation == true) {
                              // for loop validation
                              Login_Password_validation = false;
                              if (L_status == 0) {
                                return null;
                              } else if (L_status == 1) {
                                return null;
                                // return "Correct";
                              } else if (L_status == 2) {
                                return null;
                              } else if (L_status == 3) {
                                return "Wrong Password";
                              }
                            }
                            //  else if(L_status == 99){
                            //   return ""
                            // }

                            else {
                              return "wrong";
                            }
                          },
                        ),
                      ),
                      // L_Pass(),
                    ],
                  ),
                ),
                // Forget Password Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Contact_No_visibility_provider
                            .Initialized_Visibility_Status(false);
                        Contact_No_visibility_provider
                            .Forget_Change_Password_Screen_Navigation_Func("1");
                        Contact_No_visibility_provider.Otp_Send_Status_Func(
                            "initial");
                        // Login_validation_false();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  // ForgetChangePasswordScreen(User_Id_Forget_Pass: "User_Id_Forget_Pass")
                                  //  OtpScreen2(phone: "phone", User_Id_Forget_Pass: "User_Id_Forget_Pass")
                                  const ForgetPasswordScreen()),
                        );
                      },
                      child: Text("Forget Password",
                          style: GoogleFonts.ubuntu(
                              fontSize: height(14.5),
                              // MediaQuery.of(context).size.height * 0.02,
                              color: theme.primaryColorDark)),
                    ),
                  ],
                ),
                // Login Button
                Container(
                    margin:
                        EdgeInsets.only(top: height(50), bottom: height(20)),
                    // 0, _size.height * 0.07, 0, _size.height * 0.02),
                    // margin: EdgeInsets.symmetric(vertical: _size.height * 0.1),
                    height: height(53),
                    // MediaQuery.of(context).size.height * 0.07,
                    width: width(260),
                    //  MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.amber),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: theme.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        onPressed: () async {
                          print(Society_Selected_F);
                          if (!_Login_formKey.currentState!.validate()) {
                            return;
                          }
                          //   remove
                          await connectivity_status_func(context);

                          await Login_Post_Api(
                              context,
                              _Login_formKey,
                              "${cnic_cont.text}",
                              // "${L_pass_cont.text}"
                              "${password_cont.text}",
                              Society_Select_Id_F);

                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) =>  Home_Screen()),
                          // );
                        },
                        child: LayoutBuilder(builder:
                            (BuildContext context, BoxConstraints constraints) {
                          return Text(
                              // constraints.maxWidth.toStringAsFixed(2),
                              "Login",
                              style: GoogleFonts.ubuntu(
                                  fontSize: constraints.maxHeight * 0.4,
                                  // width(30),
                                  // MediaQuery.of(context).size.height * 0.04,
                                  color: theme.cardColor));
                        }))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Create an Account   ",
                        style: GoogleFonts.ubuntu(
                            fontSize: height(14),
                            // MediaQuery.of(context).size.height * 0.02,
                            color: theme.focusColor)),
                    InkWell(
                        onTap: () {
                          // Login_validation_false();
                          SignUp_Society_Name_Visibility_provider
                              .SignUp_SocietyNameVisibilityStatus_Func(false);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Sign_Up_Screen()),
                          );
                        },
                        child: Text("Sign Up",
                            style: GoogleFonts.ubuntu(
                                fontSize: height(18),
                                // MediaQuery.of(context).size.height * 0.028,
                                color: theme.primaryColorDark))),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
