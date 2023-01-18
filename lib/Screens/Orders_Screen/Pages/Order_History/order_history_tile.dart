import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget order_History_Tile(size, theme) {
  return Container(
    margin: EdgeInsets.only(top: size * 0.02),
    // height: size * 0.19,
    child: Card(
      shadowColor: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(size * 0.028)),
      color: theme.cardColor,
      child: Padding(
        padding: EdgeInsets.all(size * 0.025),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Order Id: 10",
                    style: GoogleFonts.ubuntu(
                        fontSize: size * 0.025,
                        color: theme.focusColor,
                        fontWeight: FontWeight.w500)),
                // Text("PKR 288",
                //     style: GoogleFonts.ubuntu(
                //         fontSize: size * 0.024, color: theme.primaryColor))
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: size * 0.014),
              child: Row(
                children: [
                  Text("Karachi",
                      style: GoogleFonts.ubuntu(
                          fontSize: size * 0.024, color: theme.highlightColor)),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  Image.asset(
                    "assets/Bottom_Bar/Clock.png",
                    // width: 40,
                    height: size / 32,
                    fit: BoxFit.cover,
                    color: theme.primaryColor,
                  ),
                  Text(" 12-12-2022, 14:03",
                      style: GoogleFonts.ubuntu(
                          fontSize: size * 0.024, color: theme.highlightColor)),
                ]),
                Container(
                  padding: EdgeInsets.all(size * 0.007),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(size * 0.02),
                      color: Color.fromARGB(202, 126, 38, 141)),
                  child: Text("Active",
                      style: GoogleFonts.ubuntu(
                          fontSize: size * 0.02, color: Colors.white)),
                )
              ],
            )
          ],
        ),
      ),
    ),
  );
}
