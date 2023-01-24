import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:zsz/Constant.dart';
import 'package:zsz/Functions/Internet/Internet.dart';
import 'package:zsz/Screens/Login_Screen/functions/get_society_func.dart';
import 'package:zsz/Screens/Sign_Up_Screen/Provider/signup_society_visibility_provider.dart';
import 'package:zsz/Screens/Sign_Up_Screen/functions/Address_S.dart';
import 'package:zsz/Screens/Sign_Up_Screen/functions/SocietyAddress/society_address_search_func.dart';
import 'package:zsz/Screens/Sign_Up_Screen/functions/sign_up_post_api_func.dart';
import 'package:zsz/responsive.dart';
// import 'package:flutter_typeahead/flutter_typeahead.dart';

//  GlobalKey<FormState> _Sign_up_formKey = GlobalKey<FormState>();

List Society_List = ["Saima Luxury Homes"];

class Sign_Up_Screen extends StatefulWidget {
  const Sign_Up_Screen({Key? key}) : super(key: key);

  @override
  State<Sign_Up_Screen> createState() => _Sign_Up_ScreenState();
}

class _Sign_Up_ScreenState extends State<Sign_Up_Screen> {
  int _groupValue = 0;
  bool _tenantValue = false;
  String user_type = "owner";
  bool _passwordVisible = true;

  //society name selected or not
  bool SignUp_Society_Selected_F = false;
  //society selected id
  String SignUp_Society_Select_Id_F = "Null";

  // address selected
  // var Address_Select_Address = "Null";
  var Address_Select_Id = "Null";
  // tile click
  bool Address_Selected_S = false;

  // address match or not
  bool address_Sign_Up_Correct_variable = false;

  final GlobalKey<FormState> _Sign_up_F = GlobalKey<FormState>();

// text controller
  TextEditingController name_cont = TextEditingController();
  TextEditingController SignUp_Society_Name_Controller =
      TextEditingController();
  TextEditingController SignUp_Society_Name_Controller_Dropdown =
      TextEditingController();
  TextEditingController owner_cnic_cont = TextEditingController();
  TextEditingController tenant_cnic_cont = TextEditingController();

  TextEditingController unit_no_cont = TextEditingController();
  TextEditingController house_cat_cont = TextEditingController();
  TextEditingController contact_no_cont = TextEditingController();
  TextEditingController password_cont = TextEditingController();

// Address Controller

  TextEditingController address_cont = TextEditingController();
  TextEditingController SignUp_Address_Name_Controller =
      TextEditingController();

  void Radio_function(e) {
    setState(() {
      if (e == 0) {
        _groupValue = 0;
        _tenantValue = false;
        user_type = "owner";
        tenant_cnic_cont.clear();
        print(user_type);
      } else if (e == 1) {
        _groupValue = 1;
        _tenantValue = true;
        user_type = "tenant";
        print(user_type);
      } else {
        _groupValue = -1;
      }
    });
  }

// address id validation

  void Address_Check_Sign_Up() {
    address_Sign_Up_Correct_variable = false;
    for (var i = 0; i < Address_All_List.length; i++) {
      print("for looppp$i");

      if (Address_All_List[i].address.toString().toLowerCase() ==
              address_cont.text.toString().toLowerCase() &&
          Address_All_List[i].id == Address_Select_Id) {
        print(i);
        address_Sign_Up_Correct_variable = true;
        break;
      } else {
        print("Poka");
        address_Sign_Up_Correct_variable = false;
      }
    }
  }

  @override
  void initState() {
    super.initState();
    // for all address
    Address_All_Func();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final _size = MediaQuery.of(context).size;

    //Society name Provider
    final SignUp_Society_Name_Visibility_provider =
        Provider.of<SignUpSocietyNameVisibilityProvider>(context,
            listen: false);
    SizeConfig().init(context);

    print("build signup screen");

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width(50)),
            // _size.width * 0.13),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                  padding: EdgeInsets.only(top: height(15)),
                  // EdgeInsets.all(_size.height * 0.06),
                  child: Text(
                    "Create an Account",
                    style: GoogleFonts.ubuntu(
                        fontSize: height(20),
                        // MediaQuery.of(context).size.height * 0.04,
                        color: theme.focusColor),
                  ),
                ),
                Form(
                  key: _Sign_up_F,
                  child: Column(children: [
                    //name
                    Padding(
                      padding:
                          //  EdgeInsets.only(bottom: height(23)),
                          EdgeInsets.symmetric(vertical: height(23)),
                      child: TextFormField(
                        cursorColor: theme.primaryColor,
                        controller: name_cont,
                        // inputFormatters: [WhitelistingTextInputFormatter(RegExp("[a-zA-Z]")),],
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp("[a-zA-Z ]")),
                        ],

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
                          labelText: 'Name ',
                          labelStyle: TextStyle(color: theme.highlightColor),
                        ),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 3) {
                            return "Enter Name Correctly";
                          } else if (
                              // value == null
                              value.length >= 3
                              //  && value.length < 3
                              ) {
                            return null;
                          } else {
                            return "wrong";
                          }
                        },
                      ),
                    ),

                    //Society names

                    Padding(
                      padding:
                          EdgeInsets.only(bottom: height(23), top: height(10)),
                      child: Consumer<SignUpSocietyNameVisibilityProvider>(
                          builder: (context, value, child) {
                        return value.SignUpSocietyNameVisibilityStatus
                            ? TextField(
                                cursorColor: theme.primaryColor,
                                controller: SignUp_Society_Name_Controller,
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

                                textFieldConfiguration: TextFieldConfiguration(
                                    cursorColor: theme.primaryColor,
                                    controller:
                                        SignUp_Society_Name_Controller_Dropdown,
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
                                itemBuilder: (context, Societies? suggestion) {
                                  final society_iterations = suggestion!;
                                  return ListTile(
                                    title:
                                        Text(society_iterations.societytitle),
                                  );
                                },

                                // on select
                                onSuggestionSelected: (Societies? suggestion) {
                                  final society_iterations = suggestion!;

                                  // Society_Select_F =
                                  //     society_iterations.societytitle.toString();

                                  SignUp_Society_Selected_F = true;
                                  SignUp_Society_Select_Id_F =
                                      society_iterations.id.toString();
                                  Society_Project_Id =
                                      society_iterations.id.toString();
                                  // text field
                                  SignUp_Society_Name_Controller_Dropdown.text =
                                      society_iterations.societytitle
                                          .toString();
                                  SignUp_Society_Name_Controller.text =
                                      society_iterations.societytitle
                                          .toString();
                                  //remove dropdown show non editable text field with society name
                                  SignUp_Society_Name_Visibility_provider
                                      .SignUp_SocietyNameVisibilityStatus_Func(
                                          true);

                                  print(
                                      "${SignUp_Society_Name_Controller.text}  address selected");
                                  print(
                                      "$SignUp_Society_Select_Id_F selected address id");
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
                                  // else if (Society_Selected_F == true) {
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
                                  else if (SignUp_Society_Selected_F == false) {
                                    return "Select a Society from List";
                                  } else {
                                    return "wrong";
                                  }
                                },
                              );
                      }),
                    ),

                    // // society name
                    // Container(
                    //   padding:
                    //       EdgeInsets.only(bottom: height(23), top: height(25)
                    //           // .symmetric(
                    //           // vertical:height(23)
                    //           ),
                    //   // horizontal: _size.height*0.003),
                    //   child: DropdownButton(
                    //     icon: Container(
                    //         margin: EdgeInsets.only(
                    //             bottom:
                    //                 MediaQuery.of(context).size.height * 0.02),
                    //         child: Icon(Icons.arrow_drop_down)),
                    //     iconEnabledColor: theme.primaryColor,
                    //     underline: Container(
                    //       // margin: EdgeInsets.only(top: _size.height*1),
                    //       height: _size.height * 0.001,
                    //       color: theme.primaryColor,
                    //     ),
                    //     isExpanded: true,
                    //     value: Society_List.first,
                    //     onChanged: (value) {},
                    //     // onChanged: (vale) {
                    //     //   dropdownvalue_initial = vale.toString();
                    //     //   setState(() {});
                    //     // },
                    //     items: Society_List.map((itemss) {
                    //       return DropdownMenuItem(
                    //           value: itemss,
                    //           child: Container(
                    //               margin: EdgeInsets.only(
                    //                   bottom: _size.height * 0.02),
                    //               child: Text(itemss)));
                    //     }).toList(),
                    //   ),
                    // ),

                    //address
                    //typeahead
                    Consumer<SignUpSocietyNameVisibilityProvider>(
                        builder: (context, value, child) {
                      return Visibility(
                        visible: SignUp_Society_Name_Visibility_provider
                            .SignUpSocietyNameVisibilityStatus,
                        child: Container(
                            padding: EdgeInsets.only(
                                bottom: height(23), top: height(10)),
                            // bottom: _size.height * 0.017, top: _size.height * 0.0),

                            // Searching
                            child: value.SignUpAddressNameVisibilityStatus
                                ? TextField(
                                    cursorColor: theme.primaryColor,
                                    controller: SignUp_Address_Name_Controller,
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
                                      labelText: 'Address',
                                      labelStyle: TextStyle(
                                          color: theme.highlightColor),
                                    ),
                                  )
                                : TypeAheadFormField<SocietyAddress?>(
                                    hideSuggestionsOnKeyboardHide: false,
                                    debounceDuration:
                                        Duration(milliseconds: 500),
                                    textFieldConfiguration:
                                        TextFieldConfiguration(
                                            cursorColor: theme.primaryColor,
                                            controller: address_cont,
                                            decoration: InputDecoration(
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: theme
                                                              .primaryColor)),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: theme
                                                              .primaryColor)),
                                              focusColor: theme.primaryColor,
                                              // hintText: "Enter Address",
                                              labelText: "Address",
                                              labelStyle: TextStyle(
                                                  color: theme.highlightColor),
                                            )),
                                    suggestionsCallback: SocietyAddress_Api
                                        .get_Society_Address_suggestion,
                                    itemBuilder:
                                        (context, SocietyAddress? suggestion) {
                                      final addr = suggestion!;
                                      return ListTile(
                                        title: Text(addr.address),
                                      );
                                    },

                                    // on select
                                    onSuggestionSelected:
                                        (SocietyAddress? suggestion) {
                                      final addr = suggestion!;
                                      // text field
                                      address_cont.text =
                                          addr.address.toString();
                                      SignUp_Address_Name_Controller.text =
                                          addr.address.toString();

                                      // Address_Select_Address = addr.address.toString();
                                      Address_Select_Id = addr.id;
                                      Address_Selected_S = true;
                                      value
                                          .SignUp_AddressNameVisibilityStatus_Func(
                                              true);

                                      print(
                                          "${SignUp_Address_Name_Controller.text} address selected");
                                      print(
                                          "$Address_Select_Id selected address id");
                                      print(addr.address);
                                      print(addr.id);
                                    },

                                    // no item found
                                    noItemsFoundBuilder: (context) => Container(
                                      height: _size.height * 0.1,
                                      child: Center(
                                        child: Text("Address Already Register"),
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
                                        return "Enter Address Correctly";
                                      } else if (Address_Selected_S == true) {
                                        print("Select tile true");
                                        if (address_Sign_Up_Correct_variable ==
                                            true) {
                                          print("address Correct");
                                          return null;
                                        } else if (address_Sign_Up_Correct_variable ==
                                            false) {
                                          print("address Wrong");
                                          return "Enter Address Correctly";
                                        }
                                      } else if (Address_Selected_S == false) {
                                        return "Select an Address from List";
                                      } else {
                                        return "wrong";
                                      }
                                    },
                                  )),
                      );
                    }),

                    //Radio Button

                    RadioListTile(
                        activeColor: theme.primaryColor,
                        title: Text("Owner"),
                        value: 0,
                        groupValue: _groupValue,
                        onChanged: (newValue) {
                          Radio_function(newValue);
                        }),
                    RadioListTile(
                        activeColor: theme.primaryColor,
                        title: Text("Tenant"),
                        value: 1,
                        groupValue: _groupValue,
                        onChanged: (newValue) => Radio_function(newValue)),

                    //CNIC

                    Padding(
                      padding: EdgeInsets.only(bottom: height(23)),
                      // vertical: _size.height * 0.017),
                      child: TextFormField(
                        cursorColor: theme.primaryColor,
                        controller: owner_cnic_cont,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                        ],
                        maxLength: 13,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: theme.primaryColor)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: theme.primaryColor)),
                            focusColor: theme.primaryColor,
                            border: UnderlineInputBorder(),
                            labelText: 'Owner CNIC ',
                            labelStyle: TextStyle(color: theme.highlightColor),
                            hintText: "42100xxxxx.."),
                        validator: (value) {
                          // first round validation
                          //local validation
                          if (Owner_C_validation == "false") {
                            print("First round validation in owner Cnic");
                            print(
                                "Owner Cnic Validation ${Owner_C_validation}");
                            if (value == null ||
                                value.isEmpty ||
                                value.length < 13) {
                              return "Enter CNIC Correctly";
                            } else if (value.length == 13) {
                              return null;
                            }
                          }
                          //seconnd round
                          //api validation
                          else if (Owner_C_validation == "true") {
                            print("$Owner_C_validation inside second round");
                            print("Second round validation in owner Cnic");
                            print(
                                "Owner Cnic Validation ${Owner_C_validation}");
                            // for loop
                            Owner_C_validation = "false";

                            if (Sign_Up_Status_validation == 2) {
                              if (user_type == "owner") {
                                return "Cnic Already Registered";
                              } else if (user_type == "tenant") {
                                return null;
                              } else {
                                return "kjkjkjk";
                              }
                            } else if (Sign_Up_Status_validation == 1) {
                              return null;
                            }
                          }
                          //second round end

                          else {
                            return "wrong";
                          }
                        },
                      ),
                    ),

                    // tenant cnic

                    Visibility(
                      visible: _tenantValue,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: height(23)),
                        // .symmetric(vertical: _size.height * 0.017),
                        child: TextFormField(
                          cursorColor: theme.primaryColor,
                          enabled: _tenantValue,
                          controller: tenant_cnic_cont,
                          maxLength: 13,
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
                              labelText: 'Tenant CNIC ',
                              labelStyle:
                                  TextStyle(color: theme.highlightColor),
                              hintText: "42100xxxxx.."),
                          validator: (value) {
                            if (_tenantValue == false) {
                              return null;
                            } else if (_tenantValue == true) {
                              // tenant validation first round
                              if (Tenant_C_validation == "false") {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.length < 13) {
                                  return "Enter CNIC Correctly";
                                } else if (owner_cnic_cont.text ==
                                    tenant_cnic_cont.text) {
                                  return "Owner and Tenant Cnic can not be same";
                                } else if (value.length == 13) {
                                  return null;
                                }
                              }
                              // tenant validation second round
                              else if (Tenant_C_validation == "true") {
                                // for loop
                                Tenant_C_validation = "false";
                                if (Sign_Up_Status_validation == 2) {
                                  if (user_type == "tenant") {
                                    return "Cnic Already Registered";
                                  } else if (user_type == "owner") {
                                    return null;
                                  } else {
                                    return "dfsdf";
                                  }
                                } else if (Sign_Up_Status_validation == 1) {
                                  return null;
                                }
                              }
                              // end second round

                            } else {
                              return "wrong";
                            }
                          },
                        ),
                      ),
                    ),

                    //Contact no

                    Padding(
                      padding: EdgeInsets.only(bottom: height(23)),
                      // .symmetric(vertical: _size.height * 0.017),
                      child: TextFormField(
                        cursorColor: theme.primaryColor,
                        maxLength: 11,
                        controller: contact_no_cont,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                        ],
                        // initialValue: "+92",
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: theme.primaryColor)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: theme.primaryColor)),
                          focusColor: theme.primaryColor,
                          border: UnderlineInputBorder(),
                          labelText: 'Contact Number ',
                          labelStyle: TextStyle(color: theme.highlightColor),
                        ),
                        validator: (value) {
                          // first round
                          // local validation
                          if (Phone_validation == "false") {
                            if (value == null ||
                                value.isEmpty ||
                                value.length < 11) {
                              return "Enter Phone Number Correctly";
                            } else if (value.length == 11) {
                              return null;
                            }
                          }

                          //second round phone
                          // api validation
                          else if (Phone_validation == "true") {
                            // for loop
                            Phone_validation = "false";

                            if (Sign_Up_Status_validation == 4) {
                              return "Phone Number Already Existed";
                            } else if (Sign_Up_Status_validation == 1) {
                              return null;
                            }
                          }
                          // second round end

                          else {
                            return "wrong";
                          }
                        },
                      ),
                    ),

                    //Password

                    Padding(
                      padding: EdgeInsets.only(bottom: height(23)),
                      // .symmetric(vertical: _size.height * 0.017),
                      child: TextFormField(
                        cursorColor: theme.primaryColor,
                        controller: password_cont,
                        obscureText: _passwordVisible,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: theme.primaryColor)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: theme.primaryColor)),
                            focusColor: theme.primaryColor,
                            border: UnderlineInputBorder(),
                            labelText: 'Create Password',
                            labelStyle: TextStyle(color: theme.highlightColor),
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
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 8) {
                            return "Enter Password Correctly";
                          } else if (
                              // value == null
                              value.length >= 8
                              //  && value.length < 3
                              ) {
                            return null;
                          } else {
                            return "wrong";
                          }
                        },
                      ),
                    ),

                    Container(
                        margin: EdgeInsets.only(
                            top: height(50), bottom: height(70)),
                        height: height(53),
                        //  MediaQuery.of(context).size.height * 0.07,
                        width: width(260),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: theme.primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                            onPressed: () {
                              print("$SignUp_Society_Select_Id_F society id");
                              print(
                                  "$SignUp_Society_Selected_F society selected");
                              print("$Address_Select_Id address selected id");
                              // connectivity_status_func(context);
                              // // Address_Check_Sign_Up();

                              if (!_Sign_up_F.currentState!.validate()) {
                                print("validation failed");
                                return;
                              }
                              print("first validation pass");
                              Sign_Up_Post_Api(
                                context,
                                _Sign_up_F,
                                "${name_cont.text}",
                                "${SignUp_Society_Select_Id_F}",
                                "${owner_cnic_cont.text}",
                                "${tenant_cnic_cont.text}",
                                user_type,
                                "${contact_no_cont.text}",
                                "${password_cont.text}",
                                "${Address_Select_Id}",
                              );

                              // print("pressed sign up");
                            },
                            child: LayoutBuilder(builder: (BuildContext context,
                                BoxConstraints constraints) {
                              return Text(
                                  // constraints.maxWidth.toStringAsFixed(2),
                                  "SignUp",
                                  style: GoogleFonts.ubuntu(
                                      fontSize: constraints.maxHeight * 0.36,
                                      // width(30),
                                      // MediaQuery.of(context).size.height * 0.04,
                                      color: theme.cardColor));
                            }))),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget eror() {
  return ListTile(
    title: Text("error"),
  );
}
