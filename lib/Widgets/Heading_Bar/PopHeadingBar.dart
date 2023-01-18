import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zsz/responsive.dart';

Widget PopHeadingBar(context, Heading, double Heading_Size, Icon_Name) {
  SizeConfig().init(context);
  final ThemeData theme = Theme.of(context);
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      IconButton(
          onPressed: Icon_Name == "Close" || Icon_Name == "Back"
              ? () {
                  Navigator.pop(context);
                }
              : null,
          icon: Icon_Name == "Close"
              ? Image.asset(
                  "assets/Icons/close.png",
                  height: height(14),
                  color: theme.primaryColor,
                )
              : Icon_Name == "Back"
                  ? Icon(
                      Icons.arrow_back_ios,
                      size: height(20),
                    )
                  : Icon(
                      Icons.arrow_back_ios,
                      size: height(20),
                      color: Colors.transparent,
                    ),
          color: theme.primaryColor),
      // SizedBox(width: _size.width * 0.205),
      Center(
        child: Text(
          Heading,
          style: GoogleFonts.ubuntu(
              fontSize: height(Heading_Size), color: theme.focusColor),
        ),
      ),
      IconButton(
          onPressed: null,
          icon: Icon_Name == "Close"
              ? Image.asset(
                  "assets/Icons/close.png",
                  height: height(14),
                  color: Colors.transparent,
                )
              : Icon_Name == "Back"
                  ? Icon(
                      Icons.arrow_back_ios,
                      color: Colors.transparent,
                      size: height(20),
                    )
                  : Icon(
                      Icons.arrow_back_ios,
                      color: Colors.transparent,
                      size: height(20),
                    ),
          color: Colors.transparent),
    ],
  );
}
