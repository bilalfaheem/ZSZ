import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:zsz/Constant.dart';

Widget gatePassWidget(
    context, month, amount, date, msg, currentReading, previousReading) {
  final _size = MediaQuery.of(context).size;
  final ThemeData theme = Theme.of(context);
  // print(currentReading-previousReading);
  // print(currentReading);
  // print(previousReading);
  // print(userLoginAddress_Id_S);
  return GestureDetector(
    onTap: () {
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => GasBillScreen(
      //               Month: month,
      //               DueDate: date,
      //               Amount: amount,
      //               Msg: msg,
      //               currentReading: currentReading,
      //               previousReading: previousReading,
      //             )));
    },
    child: Container(
        //  color: Colors.amber,
        margin: EdgeInsets.only(top: _size.height * 0.02),
        height: _size.height * 0.125,
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return Card(
            shadowColor: Colors.black,

            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            color: Color.fromARGB(255, 251, 240, 225),
            // theme.cardColor,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: constraints.maxHeight * 0.13,
                  horizontal: _size.width * 0.053),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        ticket,
                        height: constraints.maxHeight * 0.34,
                      ),
                      Text("Gate Pass",
                          style: GoogleFonts.ubuntu(
                              fontSize: constraints.maxHeight * 0.15,
                              color: theme.focusColor)),
                    ],
                  ),
                  // First part
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("Month:      ",
                              style: GoogleFonts.ubuntu(
                                  fontSize: constraints.maxHeight * 0.14,
                                  color: theme.highlightColor)),
                          Text(month,
                              // Month.toString() == "..." ? "$Month" : "$Month",
                              // DateFormat.MMM()
                              //                   .format(DateTime.parse(Month)),
                              style: GoogleFonts.ubuntu(
                                  fontSize: constraints.maxHeight * 0.155,
                                  color: theme.focusColor)),
                        ],
                      ),
                      SizedBox(height: constraints.maxHeight * 0.05),
                      Row(
                        children: [
                          Text("Amount:   ",
                              style: GoogleFonts.ubuntu(
                                  fontSize: constraints.maxHeight * 0.14,
                                  color: theme.highlightColor)),
                          Text('$amount ',
                              style: GoogleFonts.ubuntu(
                                  fontSize: constraints.maxHeight * 0.155,
                                  color: theme.focusColor)),
                          Text('PKR',
                              style: GoogleFonts.ubuntu(
                                  fontSize: constraints.maxHeight * 0.13,
                                  color: theme.focusColor))
                        ],
                      ),
                      SizedBox(height: constraints.maxHeight * 0.05),
                      msg == "Paid"
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("Bill:               ",
                                    style: GoogleFonts.ubuntu(
                                        fontSize: constraints.maxHeight * 0.14,
                                        color: theme.highlightColor)),
                                Text(msg,
                                    style: GoogleFonts.ubuntu(
                                        fontSize: constraints.maxHeight * 0.155,
                                        color: theme.focusColor)),
                              ],
                            )
                          : Row(
                              children: [
                                Text("Due Date:   ",
                                    style: GoogleFonts.ubuntu(
                                        fontSize: constraints.maxHeight * 0.14,
                                        color: theme.highlightColor)),
                                Text(
                                    date == "...."
                                        ? "...."
                                        : DateFormat.yMMMd()
                                            .format(DateTime.parse(date)),
                                    style: GoogleFonts.ubuntu(
                                        fontSize: constraints.maxHeight * 0.155,
                                        color: theme.focusColor)),
                              ],
                            ),
                    ],
                  ),
                ],
              ),
            ),
          );
        })),
  );
}
