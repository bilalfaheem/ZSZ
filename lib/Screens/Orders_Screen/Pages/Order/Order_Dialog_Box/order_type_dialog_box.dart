import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zsz/Screens/Orders_Screen/Pages/Order/Order_Dialog_Box/order_cash_type_dialog.dart';
import 'package:zsz/Screens/Orders_Screen/Pages/Order/Order_Dialog_Box/order_dialog_box.dart';
import 'package:zsz/Screens/Orders_Screen/Pages/Order/Order_Dialog_Box/order_dialog_header.dart';
import 'package:zsz/Screens/Orders_Screen/Pages/Order/Order_Dialog_Box/order_swap_dialog_box.dart';
import 'package:zsz/Screens/Orders_Screen/Pages/Order/functions/Address_Swap.dart';
import 'package:zsz/responsive.dart';

void Order_Type_dialog_box(BuildContext context, h_size, w_size, theme) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    // barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: Duration(milliseconds: 350),
    pageBuilder: (_, __, ___) {
      //  SizeConfig().init(context);
      return Center(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: width(20),
            vertical: height(20),
          ),
          //  w_size * 0.07, vertical: h_size * 0.02),
          width: width(400),
          height: height(350),
          margin: EdgeInsets.symmetric(horizontal: w_size * 0.05),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(40)),
          child:
              // LayoutBuilder(
              //   builder: (BuildContext context, BoxConstraints constraints) {
              //     return
              Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Order_Dialog_Header(context),

              Material(
                color: Colors.white,
                child: AutoSizeText("Select Tanker Type",
                    maxLines: 2,
                    style: GoogleFonts.ubuntu(
                        fontSize: height(21), color: Colors.black)),
              ),
              // SizedBox(
              //   height: h_size * 0.04,
              // ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: w_size * 0.44,
                        height: h_size * 0.05,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: theme.primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(w_size * 0.1))),
                            onPressed: () {
                              Navigator.pop(context);
                              Order_dialog_box(context, h_size, w_size, theme,
                                  "Single Tanker", "");

                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => const ()),
                              // );
                            },
                            child: Padding(
                              padding: EdgeInsets.all(0),
                              child: Center(
                                child: Text("Single Tanker",
                                    style: GoogleFonts.ubuntu(
                                        fontSize: w_size * 0.042,
                                        color: Colors.white)),
                              ),
                            )),
                      )
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
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: w_size * 0.44,
                        height: h_size * 0.05,
                        margin: EdgeInsets.symmetric(vertical: h_size * 0.01),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: theme.primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(w_size * 0.1))),
                            onPressed: () {
                              Navigator.pop(context);
                              Order_dialog_box(context, h_size, w_size, theme,
                                  "Double Tanker", " ");
                            },
                            child: Padding(
                              padding: EdgeInsets.all(0),
                              child: Center(
                                child: Text("Double Tanker",
                                    style: GoogleFonts.ubuntu(
                                        fontSize: w_size * 0.042,
                                        color: Colors.white)),
                              ),
                            )),
                      )
                    ],
                  ),

//cash
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: w_size * 0.44,
                        height: h_size * 0.05,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: theme.primaryColor,
                                // minimumSize: Size(w_size*0.44, 30),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(w_size * 0.1))),
                            onPressed: () {
                              Navigator.pop(context);
                              Order_cash_type_dialog_box(
                                  context, h_size, w_size, theme);

                              // Order_dialog_box(context, h_size, w_size, theme,
                              //     "Cash Tanker", "");
                            },
                            child: Padding(
                              padding: EdgeInsets.all(0),
                              // padding: EdgeInsets.all(h_size * 0.01),
                              child: Center(
                                child: Text("Cash",
                                    style: GoogleFonts.ubuntu(
                                        fontSize: w_size * 0.042,
                                        color: Colors.white)),
                              ),
                            )),
                      )
                    ],
                  ),

//SWAP
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: w_size * 0.44,
                        height: h_size * 0.05,
                        margin: EdgeInsets.only(top: h_size * 0.01),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: theme.primaryColor,
                                //  minimumSize: Size(w_size*0.44, 30),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(w_size * 0.1))),
                            onPressed: () {
                              //collect all active user address and ids
                              Address_Swap_All_Func();

                              Navigator.pop(context);
                              Order_swap_dialog_box(
                                  context, h_size, w_size, theme, "Swap");
                            },
                            child: Padding(
                              padding: EdgeInsets.all(0),
                              child: Center(
                                child: Text("Swap",
                                    style: GoogleFonts.ubuntu(
                                        fontSize: w_size * 0.042,
                                        color: Colors.white)),
                              ),
                            )),
                      )
                    ],
                  )
                ],
              ),
            ],
            //   );
            // }
          ),
          //  SizedBox.expand(child: FlutterLogo()),
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
