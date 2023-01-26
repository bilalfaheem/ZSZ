import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zsz/Functions/Internet/Internet.dart';
import 'package:zsz/Screens/Chat_Screen/Pages/ComplainScreen/AlertBox/confirm_complain.dart';
import 'package:zsz/Screens/Chat_Screen/Pages/ComplainScreen/Function/complain_suggestion_func.dart';
import 'package:zsz/Screens/Orders_Screen/Pages/Order/Order_Dialog_Box/order_dialog_header.dart';
import 'package:zsz/Screens/Orders_Screen/Pages/Order/Order_Dialog_Box/order_dialog_loading.dart';
import 'package:zsz/Screens/Orders_Screen/Pages/Order/Pages/Order_Details/function/order_delivered_func.dart';
import 'package:zsz/responsive.dart';

void generateComplain(
    BuildContext context, h_size, w_size, theme, Tanker_Type, Order_Id) {
  // Address Controller
  TextEditingController complainController = TextEditingController();

// form key
  final GlobalKey<FormState> complainFormKey = GlobalKey<FormState>();

  //Address

  var complainTypeId = "null";
  var complainType = "null";
  var complainSelected = false;
  bool complainValidation = false;

  void complainCheck() {
    complainValidation = false;

    if (complainController.text.isEmpty) {
      complainValidation = false;
      print("Driver Controller in Empty");
      return;
// Loop
    } else {
      bool for_Else = false;
      for (var i = 0; i < complainAllList.length; i++) {
        print("for looppp$i");
        if (complainAllList[i].reason.toString().toLowerCase() ==
                complainController.text.toString().toLowerCase() &&
            complainAllList[i].id == complainTypeId) {
          print(i);
          for_Else = true;
          complainValidation = true;
          break;
        }
        // else{
        //   complainValidation = false;
        // }
      }
      if (for_Else == false) {
        complainValidation = false;
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
                      child: AutoSizeText("Generate Complain:",
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
                            key: complainFormKey,
                            child: Material(
                              color: Colors.transparent,
                              child: TypeAheadFormField<Complains?>(
                                //  enabled: false,
                                hideSuggestionsOnKeyboardHide: false,

                                debounceDuration: Duration(milliseconds: 500),

                                textFieldConfiguration: TextFieldConfiguration(
                                    cursorColor: theme.primaryColor,
                                    controller: complainController,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.transparent,
                                      // fillColor: theme.dividerColor,
                                      border: InputBorder.none,
                                      hintText: "Reason",
                                      // focusColor: Colors.transparent,
                                      focusColor: theme.primaryColor,
                                    )),

                                // // api function

                                suggestionsCallback:
                                    ComplainApi.getComplainSuggestions,
                                itemBuilder: (context, Complains? suggestion) {
                                  // ScrollBehavior:
                                  final complainSuggestion = suggestion!;
                                  return ListTile(
                                    title: Text(complainSuggestion.reason),
                                  );
                                },
                                //on loading
                                loadingBuilder: (context) => Container(
                                  height: h_size * 0.1,
                                  child: const Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                // on selection
                                onSuggestionSelected: (Complains? suggestion) {
                                  final complainSuggestion = suggestion!;
                                  complainController.text =
                                      complainSuggestion.reason.toString();
                                  complainTypeId = complainSuggestion.id;
                                  complainType = complainSuggestion.reason;
                                  complainSelected = true;

                                  // print("${complainTypeId} swap to id in swap variable");
                                  // print(
                                  //     "${complainType.toLowerCase()} swap to address in swap variable");

                                  // print(complainSuggestion.address);
                                  // print(complainSuggestion.id);
                                },
                                //No item Found
                                noItemsFoundBuilder: (context) => Container(
                                  height: h_size * 0.1,
                                  child: const Center(
                                    child: Text("No Complain Found"),
                                  ),
                                ),

                                //error

                                hideOnError: true,

                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Enter Complain Type";
                                  } else if (complainSelected == true) {
                                    print("Select tile true");
                                    if (complainValidation == true) {
                                      print("complain Correct");
                                      return null;
                                    } else if (complainValidation == false) {
                                      print("complain Wrong");
                                      return "Enter Complain Correctly";
                                    }
                                  } else if (complainSelected == false) {
                                    return "Select Complain from the List";
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

                                      complainCheck();

                                      if (!complainFormKey.currentState!
                                          .validate()) {
                                        return;
                                      }
                                      Navigator.pop(context);
                                      confirmComplain(context, h_size, w_size,
                                          theme, complainType, complainTypeId);

                                      // Order_dialog_loading(
                                      //     context, h_size, w_size, theme);
                                    },
                                    child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: h_size * 0.0),
                                        child: Text("Next",
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
