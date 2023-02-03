import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zsz/Constant.dart';

Widget chatBubble(theme, String msgType, String text) {
  return Row(
    mainAxisAlignment:
        msgType == "user" ? MainAxisAlignment.end : MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
          margin: EdgeInsets.symmetric(horizontal: 7),
          // margin: EdgeInsets.fromLTRB(size.width * 0.03,
          //     size.width * 0.027, size.width * 0.1, size.width * 0.027),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: msgType == "admin" ? theme.shadowColor : Colors.transparent,
              shape: BoxShape.circle),
          child: Image.asset(zsz,
              height: 15,
              color: msgType == "admin" ? null : Colors.transparent,
              fit: BoxFit.contain)),
      Flexible(
        fit: FlexFit.loose,
        child: Container(
          margin: EdgeInsets.only(
              bottom: 10,
              right: msgType == "admin" ? 30 : 8,
              left: msgType == "user" ? 30 : 0),
          // left: msgType == "user"?30:0),
          padding: EdgeInsets.all(13),
          decoration: BoxDecoration(
              color: msgType == "admin"
                  ? theme.primaryColor
                  :theme.shadowColor,
                  //  Color.fromARGB(255, 208, 205, 205),
              borderRadius: BorderRadius.only(
                  topRight: msgType == "admin"
                      ? Radius.circular(20)
                      : Radius.circular(0),
                  topLeft: msgType == "user"
                      ? Radius.circular(20)
                      : Radius.circular(0),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          child: Text(
            "$text",
            style: GoogleFonts.ubuntu(
                              // fontWeight: FontWeight.w500,
                              // fontSize: constraints.maxHeight * 0.06,
                              fontSize: 17,
                             color:msgType == "admin" ? theme.shadowColor : Colors.black.withOpacity(0.7))
            //  TextStyle(fontSize: 17, color:msgType == "admin" ? theme.shadowColor : Colors.black.withOpacity(0.7) ),
          ),
        ),
      ),
    ],
  );
}