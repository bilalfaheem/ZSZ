import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:zsz/Constant.dart';

Widget myQrWidget(context) {
  final theme = Theme.of(context);
  return Container(
    color: Theme.of(context).scaffoldBackgroundColor,
    padding: EdgeInsets.symmetric(vertical: 40),
    child: Column(
      children: [
        Center(
          child: Text("My Gate Pass",
              maxLines: 1,
              textAlign: TextAlign.start,
              style: GoogleFonts.epilogue(
                  fontSize: MediaQuery.of(context).size.height * 0.03,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).primaryColor)),

          //  TextWidgetWeight(TextValue: "My Qr", TextSize: 0.03, TextColor: Colors.black , TextWeight: FontWeight.w500, MaxLines: 1),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 40),
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: theme.shadowColor,
          ),
          child: PrettyQr(
            data: "User_Token_Shared",
            elementColor: theme.primaryColor,
            //  image: AssetImage(zsz),
            roundEdges: true,

            size: 250,
          ),
        ),
        // Text("Scan to Pay",
        //     maxLines: 1,
        //     textAlign: TextAlign.start,
        //     style: GoogleFonts.ubuntu(
        //         fontSize: MediaQuery.of(context).size.height * 0.025,

        //         // fontWeight: TextWeight,

        //         color: Theme.of(context).primaryColor)),
      ],
    ),
  );
}
