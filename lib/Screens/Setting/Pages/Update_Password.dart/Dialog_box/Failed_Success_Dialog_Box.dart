import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zsz/Constant.dart';

void Pass_Failed_dialog_box(
    BuildContext context, h_size, w_size, theme, ttext) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: Duration(milliseconds: 350),
    pageBuilder: (_, __, ___) {
      return Center(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: w_size * 0.07, vertical: h_size * 0.02),
          width: w_size * 0.9,
          height: h_size * 0.45,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  zszlogo,
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
              ),

              // SizedBox(
              //   height: h_size * 0.04,
              // ),
              Center(
                child: Image.asset(
                  "assets/Gif/cancel.gif",
                  // color: Colors.amber,
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
              ),
              SizedBox(
                height: h_size * 0.02,
              ),
              Center(
                child: Material(
                  color: Colors.white,
                  child: Text("$ttext",
                      style: GoogleFonts.ubuntu(
                          fontSize: h_size * 0.02, color: Colors.black)),
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     ElevatedButton(
              //         style: ElevatedButton.styleFrom(
              //             primary: theme.primaryColor,
              //             shape: RoundedRectangleBorder(
              //                 borderRadius: BorderRadius.circular(30))),
              //         onPressed: () {
              //           Navigator.pop(context);
              //           Create_Order_Api_Func(context, h_size, w_size, theme,
              //               "70", Tanker_Type.toString());
              //         },
              //         child: Padding(
              //           padding: EdgeInsets.all(h_size * 0.01),
              //           child: Text("Confirm",
              //               style: GoogleFonts.ubuntu(
              //                   fontSize: h_size * 0.024, color: Colors.white)),
              //         ))
              //     // Container(
              //     //     padding: EdgeInsets.all(h_size * 0.001),
              //     //     decoration: BoxDecoration(
              //     //         borderRadius: BorderRadius.circular(h_size * 0.02),
              //     //         color: theme.primaryColor),
              //     //     child: TextButton(
              //     //       style: ,
              //     //         onPressed: () {},
              //     //         child: Text("Confirm",
              //     //             style: GoogleFonts.ubuntu(
              //     //                 fontSize: h_size * 0.0,
              //     //                 color: Colors.black)))),
              //   ],
              // )
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
