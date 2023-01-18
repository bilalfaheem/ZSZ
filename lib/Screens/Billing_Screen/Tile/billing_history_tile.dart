import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Billing_History_Tile extends StatelessWidget {
  String Month, Bill_Amount, Pay_date, Payment;
  Billing_History_Tile(
      this.Month, this.Bill_Amount, this.Pay_date, this.Payment);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final _size = MediaQuery.of(context).size;
    return Container(
        // color: Colors.amber,
        // margin: EdgeInsets.only(top: _size.height * 0.02),
        // height: size * 0.19,
        child: Card(
      shadowColor: Colors.black,
      elevation: 0.9,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_size.height * 0.028)),
      color: theme.cardColor,
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: _size.height * 0.015, horizontal: _size.width * 0.053),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
// First part
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("Month: ",
                        style: GoogleFonts.ubuntu(
                            fontSize: MediaQuery.of(context).size.width * 0.035,
                            color: theme.highlightColor)),
                    Text(Month.toString() == "..." ? "$Month" : "$Month",
                        // DateFormat.MMM()
                        //                   .format(DateTime.parse(Month)),
                        style: GoogleFonts.ubuntu(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            color: theme.focusColor)),
                  ],
                ),
                SizedBox(
                  height: _size.height * 0.009,
                ),
                Row(
                  children: [
                    Text("Bill Amount: ",
                        style: GoogleFonts.ubuntu(
                            fontSize: MediaQuery.of(context).size.width * 0.035,
                            color: theme.highlightColor)),
                    Text(" $Bill_Amount",
                        style: GoogleFonts.ubuntu(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            color: theme.focusColor)),
                  ],
                ),
              ],
            ),

// second part
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("Pay Date: ",
                        style: GoogleFonts.ubuntu(
                            fontSize: MediaQuery.of(context).size.width * 0.035,
                            color: theme.highlightColor)),
                    Text(
                        "$Pay_date" == "...."
                            ? "$Pay_date"
                            : DateFormat.yMMMd()
                                .format(DateTime.parse("$Pay_date 07:40:44")),
                        style: GoogleFonts.ubuntu(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            color: theme.focusColor)),
                  ],
                ),
                SizedBox(
                  height: _size.height * 0.009,
                ),
                Row(
                  children: [
                    Text("Payment: ",
                        style: GoogleFonts.ubuntu(
                            fontSize: MediaQuery.of(context).size.width * 0.035,
                            color: theme.highlightColor)),
                    Text(" $Payment",
                        style: GoogleFonts.ubuntu(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            color: theme.focusColor)),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
