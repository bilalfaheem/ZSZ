import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:zsz/Functions/Internet/Internet.dart';
import 'package:zsz/Screens/Orders_Screen/Pages/Order/Order_Dialog_Box/order_dialog_header.dart';
import 'package:zsz/Screens/Orders_Screen/Pages/Order/Order_Dialog_Box/order_dialog_loading.dart';
import 'package:zsz/Screens/Orders_Screen/Pages/Order/Provider/SwapTankerLoadingProvider.dart';
import 'package:zsz/Screens/Orders_Screen/Pages/Order/functions/Address_Swap.dart';
import 'package:zsz/Screens/Orders_Screen/Pages/Order/functions/order_create_api_func.dart';
import 'package:zsz/Screens/Profile_Screen/functions/profile_get_api_func.dart';
import 'package:zsz/Constant.dart';
import 'package:zsz/responsive.dart';

void Order_Swap_Detail_dialog_box(
    BuildContext context, h_size, w_size, theme, Tanker_Type) {
  // Address Controller
  TextEditingController address_s_cont = TextEditingController();

// form key
  final GlobalKey<FormState> _Swap_formKey = GlobalKey<FormState>();

  //Address

  var swap_to_Id = "null";
  var swap_to_Address = "null";
  var address_Selected = false;
  bool address_Correct_variable = false;

  void Address_Check_2() {
    address_Correct_variable = false;

    if (address_s_cont.text.isEmpty) {
      address_Correct_variable = false;
      print("Address Controller in Empty");
      return;
// Swap on own Address in Adddress Check func
    } else if (address_s_cont.text.toString().toLowerCase() ==
        User_Login_Address_S.toString().toLowerCase()) {
      address_Correct_variable = false;
      print("Swap on own Address in Adddress Check func");
      return;
// loop
    } else {
      bool for_Else = false;
      for (var i = 0; i < Address_Swap_All_List.length; i++) {
        print("for looppp$i");
        if (Address_Swap_All_List[i].address.toString().toLowerCase() ==
                address_s_cont.text.toString().toLowerCase() &&
            Address_Swap_All_List[i].id == swap_to_Id) {
          print(i);
          for_Else = true;
          address_Correct_variable = true;
          break;
        }
        // else{
        //   address_Correct_variable = false;
        // }
      }
      if (for_Else == false) {
        address_Correct_variable = false;
      }
    }
  }

//   void Address_Check() {
//     address_Correct_variable = false;
//     for (var i = 0; i < Address_Swap_All_List.length; i++) {
//       print("for looppp$i");

// // if Controller is Empty
//       if (address_s_cont.text.isEmpty) {
//         address_Correct_variable = false;
//         print("Address Controller in Empty");
//         break;
// // Swap on own Address in Adddress Check func
//       } else if (address_s_cont.text.toString().toLowerCase() ==
//           User_Login_Address_S.toString().toLowerCase()) {
//         address_Correct_variable = false;
//         print("Swap on own Address in Adddress Check func");
//         break;
// // loop
//       } else if (Address_Swap_All_List[i].address.toString().toLowerCase() ==
//               address_s_cont.text.toString().toLowerCase() &&
//           Address_Swap_All_List[i].id == swap_to_Id) {
//         print(i);
//         address_Correct_variable = true;
//         break;
//       } else {
//         print("Poka");
//         address_Correct_variable = false;
//       }

//       // if(Address_List_Swap_Address[i]== swap_to_Address || swap_to_Address == address_s_cont.text ){
//       //   print("match$i");
//       //   return null;
//       // }
//       // else {
//       //   print("fail$i");
//       //   // return "Select an Address From List";
//       // }
//       // Categories_Api_dropdown_List.add(
//       //     Categories_Api_List[i].categoryName.toString());
//     }
//   }

  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    // barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: Duration(milliseconds: 350),
    pageBuilder: (_, __, ___) {
      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: (h_size * 1 - height(280)) / 2,
            ),
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: w_size * 0.07, vertical: h_size * 0.02),
                width: w_size * 0.9,
                height: height(280),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Order_Dialog_Header(context),

                    Material(
                      color: Colors.transparent,
                      child: AutoSizeText("Swap a ${Tanker_Type} To:",
                          maxLines: 2,
                          style: GoogleFonts.ubuntu(
                              fontSize: height(21), color: Colors.black)),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: h_size * 0.02),
                      padding: EdgeInsets.symmetric(
                          horizontal: w_size * 0.04, vertical: w_size * 0.01),
                      // all(w_size * 0.01),
                      height: h_size * 0.08,
                      width: w_size / 1.2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(w_size * 0.1),
                          color: theme.dividerColor),
                      child: Visibility(
                        visible: true,
                        child: Center(
                          child: Form(
                            key: _Swap_formKey,
                            child: Material(
                              color: Colors.transparent,
                              child: TypeAheadFormField<Address_Swap?>(
                                hideSuggestionsOnKeyboardHide: false,

                                debounceDuration: Duration(milliseconds: 500),

                                textFieldConfiguration: TextFieldConfiguration(
                                    cursorColor: theme.primaryColor,
                                    controller: address_s_cont,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.transparent,
                                      // fillColor: theme.dividerColor,
                                      border: InputBorder.none,
                                      hintText: "Address",
                                      // focusColor: Colors.transparent,
                                      focusColor: theme.primaryColor,
                                    )),

                                // // api function

                                suggestionsCallback:
                                    Address_Swap_Api.get_Address_suggestion,
                                itemBuilder:
                                    (context, Address_Swap? suggestion) {
                                  // ScrollBehavior:
                                  final addr_s = suggestion!;
                                  return ListTile(
                                    title: Text(addr_s.address),
                                  );
                                },
                                //on loading
                                loadingBuilder: (context) => Container(
                                  height: h_size * 0.1,
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                // on selection
                                onSuggestionSelected:
                                    (Address_Swap? suggestion) {
                                  final addr_s = suggestion!;
                                  address_s_cont.text =
                                      addr_s.address.toString();
                                  swap_to_Id = addr_s.id;
                                  swap_to_Address = addr_s.address;
                                  address_Selected = true;

                                  // print("${swap_to_Id} swap to id in swap variable");
                                  // print(
                                  //     "${swap_to_Address.toLowerCase()} swap to address in swap variable");

                                  // print(addr_s.address);
                                  // print(addr_s.id);
                                },
                                //No item Found
                                noItemsFoundBuilder: (context) => Container(
                                  height: h_size * 0.1,
                                  child: Center(
                                    child: Text("No Address Found"),
                                  ),
                                ),

                                //error

                                hideOnError: true,

                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please Enter Address";
                                  } else if (value.toString().toLowerCase() ==

                                      // 1.0.3
                                      User_Login_Address_S.toString()
                                          .toLowerCase()) {
                                    // print(
                                    //     "${value.toString().toLowerCase()} Text Field valueeeeeeeeeeeee");
                                    // print(
                                    //     "${User_Login_Address_S.toString().toLowerCase()}  user login Address addressss");
                                    // 1.0.3

                                    // 1.0.2
                                    // Active_User_List[0]
                                    //     .address
                                    //     .toString()
                                    //     .toLowerCase()) {
                                    //       print("${value.toString().toLowerCase()} Text Field valueeeeeeeeeeeee");
                                    //       print("${Active_User_List[0].address.toString().toLowerCase()} active user addressss");

                                    // 1.0.2
                                    return "Cannot Swap to Own House";
                                  } else if (address_Selected == true) {
                                    print("Select tile true");
                                    if (address_Correct_variable == true) {
                                      print("address Correct");
                                      return null;
                                    } else if (address_Correct_variable ==
                                        false) {
                                      print("address Wrong");
                                      return "Enter Address Correctly";
                                    }
                                  } else if (address_Selected == false) {
                                    return "Select an Address from List";
                                  } else {
                                    return "wrong";
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    //search bar
                    // Material(child: TextField()),
                    // Container(
                    //   margin: EdgeInsets.only(top: h_size * 0.02),
                    //   padding: EdgeInsets.symmetric(
                    //       horizontal: w_size * 0.04, vertical: w_size * 0.01),
                    //   // all(w_size * 0.01),
                    //   height: h_size * 0.05,
                    //   width: w_size / 1.2,
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(h_size * 0.9),
                    //       color: theme.dividerColor),
                    //   child: Center(
                    //     child: Material(
                    //       child: TextField(
                    //         cursorColor: Colors.black,
                    //         style: GoogleFonts.ubuntu(
                    //             fontSize: h_size * 0.024, color: Colors.black),
                    //         decoration: InputDecoration(
                    //           filled: true,
                    //           hintText: "Address",
                    //           fillColor: theme.dividerColor,
                    //           border: InputBorder.none,
                    //           suffixIcon: Image.asset("assets/Icons/Search.png",
                    //               width: 20,
                    //               // _size.width * 0.01,
                    //               height: 20
                    //               // _size.height * 0.01,
                    //               ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.3,
                            // height: width(22),
                            // padding: EdgeInsets.symmetric(vertical: h_size*0.01),
                            decoration: BoxDecoration(
                                color: theme.primaryColor,
                                borderRadius: BorderRadius.circular(30)),
                            // color: theme.primaryColor,
                            // margin: EdgeInsets.only(bottom: h_size * 0.02),
                            child:

                                //  Consumer<SwapTankerLoadingProvider>(
                                //    builder: (context,value,child) {
                                //      return
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: theme.primaryColor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30))),
                                    onPressed:
                                        //  value.loading ? null:
                                        () {
                                      connectivity_func_pop(context);

                                      Address_Check_2();

                                      if (!_Swap_formKey.currentState!
                                          .validate()) {
                                        return;
                                      }
                                      print(User_Login_id_S.toString() +
                                          "dfdfd" +
                                          swap_to_Id +
                                          "dfdfdfdfdfdfffffffffffffffffffffffff");
                                      // connectivity_func_pop(context);

                                      Navigator.pop(context);
                                      Order_dialog_loading(
                                          context, h_size, w_size, theme);
                                      Create_Order_Api_Func(
                                          context,
                                          h_size,
                                          w_size,
                                          theme,
                                          User_Login_id_S.toString(),
                                          "Swap $Tanker_Type",
                                          swap_to_Id.toString());
                                    },
                                    child: Padding(
                                        padding: EdgeInsets.all(h_size * 0.008),
                                        child:
                                            //  value.loading ?
                                            //  const Center(
                                            //                   child: CircularProgressIndicator(
                                            //                     strokeWidth: 2.3,
                                            //                     color: Colors.white,
                                            //                   ),
                                            //                 ):
                                            Text("Confirm",
                                                style: GoogleFonts.ubuntu(
                                                    fontSize: width(18),
                                                    color: Colors.white))))
                            //    }
                            //  ),
                            )
                      ],
                    )
                  ],
                ),
                //  SizedBox.expand(child: FlutterLogo()),
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(w_size * 0.1)),
              ),
            ),
          ],
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween;
      if (anim.status == AnimationStatus.reverse) {
        tween = Tween(begin: Offset(-1, 0), end: Offset.zero);
      } else {
        tween = Tween(begin: Offset(1, 0), end: Offset.zero);
      }

      return SlideTransition(
        position: tween.animate(anim),
        child: FadeTransition(
          opacity: anim,
          child: child,
        ),
      );
    },
  );
}
