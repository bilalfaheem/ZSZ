import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:zsz/Functions/Internet/Internet.dart';
import 'package:zsz/Screens/Login_Screen/Pages/Forget_Password/func/get_phone_api_func.dart';
import 'package:zsz/Screens/Login_Screen/Pages/Forget_Password/provider/Contact_no_visibility_provider.dart';
import 'package:zsz/Screens/Login_Screen/Pages/Otp_Screen/Func/Otp_send_func.dart';
import 'package:zsz/Screens/Orders_Screen/Pages/Order/functions/Address_Swap.dart';
import 'package:zsz/responsive.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);
  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  // Address Controller

  TextEditingController Forget_Password_address_cont = TextEditingController();
  // TextEditingController Address_cont = TextEditingController();
  // Address_cont.text = "gg";

  TextEditingController Contact_No_Controller = TextEditingController();

  //selected address
  String Initial_Value_Address = "g";

  String Address_Contact_No = "g";
  String Address_User_Id = "i";

  // form key
  final GlobalKey<FormState> _Forget_Password_formKey = GlobalKey<FormState>();

  final GlobalKey<FormState> _Forget_Password_Contact_formKey =
      GlobalKey<FormState>();

  // address selected
  var Address_Select_Address_F = "Null";
  var Address_Select_Id_F = "Null";
  // tile click
  bool Address_Selected_F = false;

  bool address_Correct_variable_Forget_Password = false;

  void Address_Check_Forget_Func() {
    address_Correct_variable_Forget_Password = false;

    if (Forget_Password_address_cont.text.isEmpty) {
      address_Correct_variable_Forget_Password = false;
      print("Address Controller in Empty");
      return;
    } else {
      bool for_Else_Forget = false;
      for (var i = 0; i < Address_Swap_All_List.length; i++) {
        // print("for looppp$i");
        if (Address_Swap_All_List[i].address.toString().toLowerCase() ==
                Forget_Password_address_cont.text.toString().toLowerCase() &&
            Address_Swap_All_List[i].id == Address_Select_Id_F) {
          // print(i);
          for_Else_Forget = true;
          address_Correct_variable_Forget_Password = true;
          Initial_Value_Address = Address_Swap_All_List[i].address.toString();
          //provider
          Get_Phone_Api_Func(context, Address_Select_Id_F);
          break;
        }
        // else{
        //   address_Correct_variable = false;
        // }
      }
      if (for_Else_Forget == false) {
        address_Correct_variable_Forget_Password = false;
      }
    }
  }

//   void Address_Check_Forget_Pass() {
//     print('Adress check forget passeord indfjasfasfaslkdf');
//     address_Correct_variable_Forget_Password = false;
//     for (var i = 0; i < Address_Swap_All_List.length; i++) {
//       print("for looppp$i");

// // if Controller is Empty
//       if (Forget_Password_address_cont.text.isEmpty) {
//         address_Correct_variable_Forget_Password = false;
//         print("Address Controller in Empty");
//         break;
// // // Swap on own Address in Adddress Check func
// //       }
// //       else if(Forget_Password_address_cont.text.toString().toLowerCase() ==  User_Login_Address_S.toString().toLowerCase()){
// //          address_Correct_variable_Forget_Password = false;
// //         print("Swap on own Address in Adddress Check func");
// //         break;
// // loop
//       } else if (Address_Swap_All_List[i].address.toString().toLowerCase() ==
//               Forget_Password_address_cont.text.toString().toLowerCase() &&
//           Address_Swap_All_List[i].id == Address_Select_Id_F) {
//         print(i);
//         address_Correct_variable_Forget_Password = true;
//         Initial_Value_Address = Address_Swap_All_List[i].address.toString();
//         print("${Initial_Value_Address}gsgsdgds");
//         // provider
//         Get_Phone_Api_Func(context, Address_Select_Id_F);

//         break;
//       } else {
//         print("Poka");
//         address_Correct_variable_Forget_Password = false;
//       }
//     }
//   }

  @override
  void initState() {
    super.initState();
    // for all address
    Address_Swap_All_Func();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final _size = MediaQuery.of(context).size;
    SizeConfig().init(context);

    // // validationnnnn
    //     bool contact_No_Validation_Status = false;
    // provider
    final Contact_No_visibility_provider =
        Provider.of<Contact_No_Visibility_Provider>(context, listen: false);

    print("${_size.height} fsadfasfasfasfas");

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width(50)),
            // padding: EdgeInsets.fromLTRB( _size.width * 0.13, 0,_size.width*0.13,_size.width*0.1),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: height(50), bottom: height(15)),
                  child: Center(
                    child: Image.asset("assets/Logo.png",
                        width: width(220),
                        //  MediaQuery.of(context).size.width * 0.7,
                        height: height(70)
                        // MediaQuery.of(context).size.height * 0.16,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height(15)),
                  // EdgeInsets.all(_size.height * 0.06),
                  child: Text(
                    "Forget Password",
                    style: GoogleFonts.ubuntu(
                        fontSize: height(20),
                        // MediaQuery.of(context).size.height * 0.04,
                        color: theme.focusColor),
                  ),
                ),

                //address
                //typeahead
                Form(
                  key: _Forget_Password_formKey,
                  child: Consumer<Contact_No_Visibility_Provider>(
                      builder: (context, value, child) {
                    return Container(
                        padding: EdgeInsets.only(
                            bottom: height(23), top: height(23)),
                        // EdgeInsets.only(bottom: _size.height * 0.017, top: _size.height * 0.03),
                        // Visibility Condition
                        child: value.Contact_no_visibility_status
                            ?
                            // Text Field
                            TextFormField(
                                readOnly: true,
                                //  enabled: false,
                                cursorColor: theme.primaryColor,
                                initialValue: Initial_Value_Address,

                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: theme.primaryColor)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: theme.primaryColor)),
                                  focusColor: theme.primaryColor,
                                  border: UnderlineInputBorder(),
                                  labelText: 'Address ',
                                  labelStyle:
                                      TextStyle(color: theme.highlightColor),
                                ),
                              )
                            :
                            // Type Ahead TextField
                            TypeAheadFormField<Address_Swap?>(
                                // autovalidate: true,
                                // enabled: false,
                                hideSuggestionsOnKeyboardHide: false,
                                debounceDuration: Duration(milliseconds: 500),
                                textFieldConfiguration: TextFieldConfiguration(
                                    cursorColor: theme.primaryColor,
                                    controller: Forget_Password_address_cont,
                                    decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: theme.primaryColor)),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: theme.primaryColor)),
                                      focusColor: theme.primaryColor,
                                      // hintText: "Enter Address",
                                      labelText: "Enter Address",
                                      labelStyle: TextStyle(
                                          color: theme.highlightColor),
                                    )),
                                suggestionsCallback:
                                    Address_Swap_Api.get_Address_suggestion,
                                itemBuilder:
                                    (context, Address_Swap? suggestion) {
                                  final addr_f = suggestion!;
                                  return ListTile(
                                    title: Text(addr_f.address),
                                  );
                                },

                                // on select
                                onSuggestionSelected:
                                    (Address_Swap? suggestion) {
                                  final addr_f = suggestion!;
                                  // text field
                                  Forget_Password_address_cont.text =
                                      addr_f.address.toString();

                                  Address_Select_Address_F =
                                      addr_f.address.toString();
                                  Address_Select_Id_F = addr_f.id;
                                  Address_Selected_F = true;

                                  // print(
                                  //     "$Address_Select_Address_F address selected");
                                  // print(
                                  //     "$Address_Select_Id_F selected address id");
                                  // print(addr_f.address);
                                  // print(addr_f.id);
                                  Address_Check_Forget_Func();
                                  // providerrrrrrr
                                  //  Get_Phone_Api_Func(context,Address_Select_Id_F);
                                },

                                // no item found
                                noItemsFoundBuilder: (context) => Container(
                                  height: _size.height * 0.1,
                                  child: Center(
                                    child: Text("Address Not Found."),
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
                                    return "Please Enter Address";
                                  } else if (Address_Selected_F == true) {
                                    print("Select tile true");
                                    if (address_Correct_variable_Forget_Password ==
                                        true) {
                                      print("address Correct");
                                      return null;
                                    } else if (address_Correct_variable_Forget_Password ==
                                        false) {
                                      print("address Wrong");
                                      return "Enter Address Correctly";
                                    }
                                  } else if (Address_Selected_F == false) {
                                    return "Select an Address from List";
                                  } else {
                                    return "wrong";
                                  }
                                },
                              )
                        // :Text(value.Contact_no_visibility_status.toString()),
                        );
                  }),
                ),
                //Contact no

                Form(
                  key: _Forget_Password_Contact_formKey,
                  // autovalidateMode: AutovalidateMode.always,
                  child: Consumer<Contact_No_Visibility_Provider>(
                    builder: (context, value, child) {
                      // Initialize Contact NUmber
                      value.Contact_no_visibility_status == true
                          ? {
                              Address_Contact_No =
                                  value.Contact_no.substring(1),
                              Address_User_Id = value.User_Id.toString()
                            }
                          : Address_Contact_No = 'f';
                      return Visibility(
                        visible: value.Contact_no_visibility_status,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: height(23)),
                              // EdgeInsets.only(top: _size.height * 0.017,),
                              child: TextFormField(
                                  cursorColor: theme.primaryColor,
                                  maxLength: 11,
                                  controller: Contact_No_Controller,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp("[0-9]")),
                                  ],
                                  // initialValue: "+92",
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: theme.primaryColor)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: theme.primaryColor)),
                                    focusColor: theme.primaryColor,
                                    border: UnderlineInputBorder(),
                                    labelText: value.Contact_no.length == 11
                                        ? 'Contact No. ${value.Contact_no.substring(0, 2)}*****${value.Contact_no.substring(8)}'
                                        : "false",
                                    labelStyle:
                                        TextStyle(color: theme.highlightColor),
                                  ),
                                  validator: (valid) {
                                    // // local validation

                                    if (valid == null || valid.isEmpty) {
                                      return "Enter Contact No.";
                                    } else if (valid.length < 11) {
                                      return "Enter Complete Contact no";
                                    } else if (Contact_No_Controller.text !=
                                        value.Contact_no.toString()) {
                                      return "Enter Correct Contact No.";
                                    } else if (Contact_No_Controller.text ==
                                        value.Contact_no.toString()) {
                                      return null;
                                    }
                                  }),
                            ),
                            // Text(
                            //   "ending with ${value.Contact_no.substring(7)}",
                            //   style: GoogleFonts.ubuntu(
                            //       fontSize: MediaQuery.of(context).size.height * 0.02,
                            //       color: theme.focusColor),
                            // ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                //   ],
                // ),

                // SizedBox(height: _size.width*0.1,),

                // Forget Password Button

                Container(
                    margin:
                        EdgeInsets.only(top: height(50), bottom: height(30)),
                    // 0, _size.height * 0.04, 0, _size.height * 0.02),
                    // margin: EdgeInsets.symmetric(vertical: _size.height * 0.1),
                    height: height(53),
                    width: width(260),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: theme.primaryColor),
                    child: Consumer<Contact_No_Visibility_Provider>(
                        builder: (context, value, child) {
                      return value.Forget_Change_Password_Screen_Navigation_1 ==
                              "2"
                          ? Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: theme.primaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30))),
                              onPressed: () async {
                                await connectivity_status_func(context);

                                // Address_Check_Forget_Pass();
                                //  print("${_Forget_Password_formKey.currentState!.validate()} validator");

                                if (!_Forget_Password_formKey.currentState!
                                    .validate()) {
                                  // false
                                  print(
                                      "${_Forget_Password_formKey.currentState!.validate()} validatorrrrrrrr Adress");
                                  return;
                                }

                                if (!_Forget_Password_Contact_formKey
                                    .currentState!
                                    .validate()) {
                                  // false
                                  print(
                                      "${_Forget_Password_Contact_formKey.currentState!.validate()} validatorrrrrrrr COntact");
                                  return;
                                }

                                if (Contact_No_visibility_provider
                                        .Contact_no_visibility_status ==
                                    true) {
                                  // print(Address_Contact_No);
                                  // print(Address_User_Id);
                                  //Remove
                                  OtpSendFunc(
                                      context,
                                      Address_Contact_No.toString(),
                                      Address_User_Id.toString());

                                  //   Navigator.pushReplacement(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) =>
                                  //        OtpScreen2(phone: Address_Contact_No.toString(), User_Id_Forget_Pass: Address_Select_Id_F.toString(),Otp_verification_code: "999999",)
                                  //           //  ForgetChangePasswordScreen(User_Id_Forget_Pass:  Address_Select_Id_F.toString())
                                  //           ),
                                  // );
                                }

                                // ForgetChangePasswordScreen(User_Id_Forget_Pass: Address_Select_Id_F.toString());
                              },
                              child: LayoutBuilder(builder:
                                  (BuildContext context,
                                      BoxConstraints constraints) {
                                return Text(
                                    value.Forget_Change_Password_Screen_Navigation_1 ==
                                            "3"
                                        ? "Send OTP"
                                        : "Forget Password",
                                    style: GoogleFonts.ubuntu(
                                        fontSize: constraints.maxHeight * 0.33,
                                        // MediaQuery.of(context).size.height * 0.03,
                                        color: theme.cardColor));
                              }));
                    })),
                Consumer<Contact_No_Visibility_Provider>(
                    builder: (context, value, child) {
                  return value.Otp_Send_Status == "initial"
                      ? Container()
                      : value.Otp_Send_Status == "failed"
                          ? Text("Otp Sending Failed",
                              style: GoogleFonts.ubuntu(
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.02,
                                  color: Colors.red))
                          : value.Otp_Send_Status == "send"
                              ? Text("Otp Send Successfully",
                                  style: GoogleFonts.ubuntu(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                      color: Colors.green))
                              : Container();
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
