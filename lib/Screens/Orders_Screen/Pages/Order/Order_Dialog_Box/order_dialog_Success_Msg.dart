import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zsz/responsive.dart';
import 'package:zsz/Constant.dart';

void Order_dialog_Success_Msg(
    BuildContext context, h_size, w_size, theme, Success_msg, bool Two_Pop) {
  // final order_screen_r =
  //     Provider.of<Order_Screen_refresh_provider>(context, listen: false);

  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    // barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: Duration(milliseconds: 350),
    pageBuilder: (_, __, ___) {
      print("Order Success Msg Buildddddd");
      return Center(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: w_size * 0.07, vertical: h_size * 0.02),
          width: w_size * 0.9,
          height: height(230),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Image.asset(zszlogo, width: width(180), height: height(43)),
              ]),
              Material(
                color: Colors.white,
                child: AutoSizeText("${Success_msg}",
                    maxLines: 2,
                    style: GoogleFonts.ubuntu(
                        fontSize: height(21), color: Colors.black)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: theme.primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(w_size * 0.1))),
                      onPressed: () async {
                        //order screen refresh func
                        // order_screen_r.Order_Screen_Refresh_Status_Func();
                        //pop two times
                        Two_Pop
                            ? {Navigator.pop(context), Navigator.pop(context)}
                            : Timer(Duration(milliseconds: 500), () {
                                Navigator.pop(context);
                              });
                      },
                      child: Padding(
                        padding: EdgeInsets.all(h_size * 0.01),
                        child: Text("Close",
                            style: GoogleFonts.ubuntu(
                                fontSize: h_size * 0.024, color: Colors.white)),
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
          //  SizedBox.expand(child: FlutterLogo()),
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(40)),
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
