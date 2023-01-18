import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zsz/Screens/Orders_Screen/Pages/Order/Order_Dialog_Box/order_dialog_box.dart';
import 'package:zsz/Screens/Orders_Screen/Pages/Order/Order_Dialog_Box/order_dialog_header.dart';
import 'package:zsz/Screens/Orders_Screen/Pages/Order/Order_Dialog_Box/order_swap_detail_dialog_box.dart';
import 'package:zsz/responsive.dart';

void Order_swap_dialog_box(
    BuildContext context, h_size, w_size, theme, Tanker_Type) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    // barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: Duration(milliseconds: 350),
    pageBuilder: (_, __, ___) {
      return Center(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: w_size * 0.07, vertical: h_size * 0.02),
          width: width(400),
          height: height(250),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Order_Dialog_Header(context),
              // SizedBox(
              //   height: h_size * 0.02,
              // ),
              Material(
                color: Colors.white,
                child: Text("Request a Swap Tanker",
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
                      Container(
                        width: w_size * 0.44,
                        height: h_size * 0.05,
                        margin: EdgeInsets.symmetric(vertical: h_size * 0.01),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: theme.primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                            onPressed: () {
                              Navigator.pop(context);
                              Order_Swap_Detail_dialog_box(context, h_size,
                                  w_size, theme, "Single Tanker");
                            },
                            child: Padding(
                              padding: EdgeInsets.all(0),
                              child: Text("Single Tanker",
                                  style: GoogleFonts.ubuntu(
                                      fontSize: w_size * 0.042,
                                      color: Colors.white)),
                            )),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: w_size * 0.44,
                        height: h_size * 0.05,
                        margin: EdgeInsets.symmetric(vertical: h_size * 0.0),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: theme.primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                            onPressed: () {
                              Navigator.pop(context);

                              Order_Swap_Detail_dialog_box(context, h_size,
                                  w_size, theme, "Double Tanker");
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
                  )
                ],
              ),
            ],
          ),
          //  SizedBox.expand(child: FlutterLogo()),
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(w_size * 0.1)),
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
