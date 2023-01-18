import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zsz/Functions/Internet/Internet.dart';
import 'package:zsz/Screens/Orders_Screen/Pages/Order/Order_Dialog_Box/order_dialog_header.dart';
import 'package:zsz/Screens/Orders_Screen/Pages/Order/Order_Dialog_Box/order_dialog_loading.dart';
import 'package:zsz/Screens/Orders_Screen/Pages/Order/Pages/Order_Details/function/driver_suggestion_func.dart';
import 'package:zsz/Screens/Orders_Screen/Pages/Order/Pages/Order_Details/function/order_delivered_func.dart';
import 'package:zsz/Screens/Orders_Screen/Pages/Order/functions/Address_Swap.dart';
import 'package:zsz/Screens/Orders_Screen/Pages/Order/functions/order_create_api_func.dart';
import 'package:zsz/Constant.dart';
import 'package:zsz/responsive.dart';

void order_delivered_dialog_box(
    BuildContext context, h_size, w_size, theme, Tanker_Type, Order_Id) {
  // Address Controller
  TextEditingController driver_controller = TextEditingController();

// form key
  final GlobalKey<FormState> _delivered_formKey = GlobalKey<FormState>();

  //Address

  var driver_Id = "null";
  var driver_name = "null";
  var driver_selected = false;
  bool driver_correct_variable = false;

  void Driver_Check() {
    driver_correct_variable = false;

    if (driver_controller.text.isEmpty) {
      driver_correct_variable = false;
      print("Driver Controller in Empty");
      return;
// Loop
    } else {
      bool for_Else = false;
      for (var i = 0; i < Drivers_All_List.length; i++) {
        print("for looppp$i");
        if (Drivers_All_List[i].driver_name.toString().toLowerCase() ==
                driver_controller.text.toString().toLowerCase() &&
            Drivers_All_List[i].id == driver_Id) {
          print(i);
          for_Else = true;
          driver_correct_variable = true;
          break;
        }
        // else{
        //   driver_correct_variable = false;
        // }
      }
      if (for_Else == false) {
        driver_correct_variable = false;
      }
    }
  }

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
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(w_size * 0.1)),
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
                      child: AutoSizeText("${Tanker_Type} Delivered By:",
                          maxLines: 2,
                          style: GoogleFonts.ubuntu(
                              fontSize: height(19), color: Colors.black)),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: h_size * 0.02),
                      padding: EdgeInsets.symmetric(
                          horizontal: w_size * 0.04, vertical: w_size * 0.01),
                      // all(w_size * 0.01),
                      height: h_size * 0.08,
                      width: w_size / 1.2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: theme.dividerColor),
                      child: Visibility(
                        visible: true,
                        child: Center(
                          child: Form(
                            key: _delivered_formKey,
                            child: Material(
                              color: Colors.transparent,
                              child: TypeAheadFormField<Drivers?>(
                                //  enabled: false,
                                hideSuggestionsOnKeyboardHide: false,

                                debounceDuration: Duration(milliseconds: 500),

                                textFieldConfiguration: TextFieldConfiguration(
                                    cursorColor: theme.primaryColor,
                                    controller: driver_controller,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.transparent,
                                      // fillColor: theme.dividerColor,
                                      border: InputBorder.none,
                                      hintText: "Driver",
                                      // focusColor: Colors.transparent,
                                      focusColor: theme.primaryColor,
                                    )),

                                // // api function

                                suggestionsCallback:
                                    Drivers_Api.Get_Driver_Suggestions,
                                itemBuilder: (context, Drivers? suggestion) {
                                  // ScrollBehavior:
                                  final driver_s = suggestion!;
                                  return ListTile(
                                    title: Text(driver_s.driver_name),
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
                                onSuggestionSelected: (Drivers? suggestion) {
                                  final driver_s = suggestion!;
                                  driver_controller.text =
                                      driver_s.driver_name.toString();
                                  driver_Id = driver_s.id;
                                  driver_name = driver_s.driver_name;
                                  driver_selected = true;

                                  // print("${driver_Id} swap to id in swap variable");
                                  // print(
                                  //     "${driver_name.toLowerCase()} swap to address in swap variable");

                                  // print(driver_s.address);
                                  // print(driver_s.id);
                                },
                                //No item Found
                                noItemsFoundBuilder: (context) => Container(
                                  height: h_size * 0.1,
                                  child: Center(
                                    child: Text("No Driver Found"),
                                  ),
                                ),

                                //error

                                hideOnError: true,

                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please Enter Driver Name";
                                  } else if (driver_selected == true) {
                                    print("Select tile true");
                                    if (driver_correct_variable == true) {
                                      print("driver Correct");
                                      return null;
                                    } else if (driver_correct_variable ==
                                        false) {
                                      print("address Wrong");
                                      return "Enter Driver Name Correctly";
                                    }
                                  } else if (driver_selected == false) {
                                    return "Select Driver from the List";
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
                            height: MediaQuery.of(context).size.height * 0.045,
                            width: MediaQuery.of(context).size.width * 0.25,
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

                                      Driver_Check();

                                      if (!_delivered_formKey.currentState!
                                          .validate()) {
                                        return;
                                      }

                                      // connectivity_func_pop(context);
                                      // Navigator.pop(context);
                                      Navigator.pop(context);
                                      Order_dialog_loading(
                                          context, h_size, w_size, theme);
                                      Order_Deliver_Api_Func(context, h_size,
                                          w_size, theme, Order_Id, driver_Id);
                                    },
                                    child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: h_size * 0.0),
                                        child: Text("Confirm",
                                            style: GoogleFonts.ubuntu(
                                                fontSize: h_size * 0.02,
                                                color: Colors.white))))
                            //    }
                            //  ),
                            )
                      ],
                    )
                  ],
                ),
                //  SizedBox.expand(child: FlutterLogo()),
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
