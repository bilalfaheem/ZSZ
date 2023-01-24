import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zsz/Functions/Internet/Internet.dart';
import 'package:zsz/Screens/Orders_Screen/Pages/Order/Order_Dialog_Box/order_dialog_Error_Msg.dart';
import 'package:zsz/Screens/Orders_Screen/Pages/Order/Order_Dialog_Box/order_dialog_header.dart';
import 'package:zsz/Screens/Orders_Screen/Pages/Order/Order_Dialog_Box/order_dialog_loading.dart';
import 'package:zsz/Screens/Orders_Screen/Pages/Order/functions/order_create_api_func.dart';
import 'package:zsz/Constant.dart';
import 'package:zsz/responsive.dart';

// cash single double all create order

void Order_dialog_box(
    BuildContext context, h_size, w_size, theme, Tanker_Type, to_User) {
  void order_FFFF() {
    Navigator.pop(context);
    Order_dialog_loading(context, h_size, w_size, theme);
    Create_Order_Api_Func(
        context,
        h_size,
        w_size,
        theme,
        User_Login_id_S.toString(),
        Tanker_Type.toString(),
        User_Login_Address_Id_S.toString());
  }

  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    // barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: Duration(milliseconds: 350),
    pageBuilder: (_, __, ___) {
      // SizeConfig().init(context);
      return Center(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: w_size * 0.07, vertical: h_size * 0.02),
          width: width(400),
          height: height(230),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Order_Dialog_Header(context),
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Material(
              //       color: Colors.transparent,
              //       shape: CircleBorder(),
              //       clipBehavior: Clip.hardEdge,
              //       //  color: theme.,
              //       child: IconButton(
              //           onPressed: () {
              //             Navigator.pop(context);
              //           },
              //           icon: Icon(Icons.close_rounded, size: w_size * 0.08)),
              //     ),

              //     //  SizedBox(height: 1,),
              //     SizedBox(
              //       width: w_size * 0.065,
              //     ),

              //     Image.asset(
              //       zszlogo,
              //       // color: Colors.blue,

              //       width: MediaQuery.of(context).size.width * 0.4,
              //       height: MediaQuery.of(context).size.height * 0.1,
              //     ),
              //   ],
              // ),
              // SizedBox(
              //   height: h_size * 0.02,
              // ),
              Material(
                color: Colors.white,
                child: AutoSizeText("Request a ${Tanker_Type}",
                    maxLines: 2,
                    style: GoogleFonts.ubuntu(
                        fontSize: height(21), color: Colors.black)),
              ),
              // SizedBox(
              //   height: h_size * 0.04,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: theme.primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      onPressed: () {
                        connectivity_func_pop(context);
                        // connectivity_func(context, order_FFFF);
                        order_FFFF();

                        // Navigator.pop(context);
                        // Order_dialog_loading(context, h_size, w_size, theme);
                        // Create_Order_Api_Func(
                        //     context,
                        //     h_size,
                        //     w_size,
                        //     theme,
                        //     User_Login_id_S.toString(),
                        //     Tanker_Type.toString(),
                        //     "");
                      },
                      child: Padding(
                        padding: EdgeInsets.all(h_size * 0.01),
                        child: Text("Confirm",
                            style: GoogleFonts.ubuntu(
                                fontSize: width(18), color: Colors.white)),
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
