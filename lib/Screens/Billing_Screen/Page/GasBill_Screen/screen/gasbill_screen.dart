import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:zsz/Constant.dart';
import 'package:zsz/Screens/Billing_Screen/Functions/Billing_Function/gas_current_billing.dart';
import 'package:zsz/Screens/Billing_Screen/Tile/billing_history_tile.dart';
import 'package:zsz/Widgets/Heading_Bar/PopHeadingBar.dart';
import 'package:zsz/responsive.dart';

class GasBillScreen extends StatelessWidget {
  String Month, DueDate, Amount, Msg;
  int previousReading, currentReading;
  GasBillScreen({
    required this.Month,
    required this.DueDate,
    required this.Amount,
    required this.Msg,
    required this.previousReading,
    required this.currentReading,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final _size = MediaQuery.of(context).size;
    SizeConfig().init(context);
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            _size.width * padding_horizontal,
            _size.height * padding_top,
            _size.width * padding_horizontal,
            _size.height * padding_bottom
            // _size.height * padding_bottom
            ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //card
            Container(
                margin: EdgeInsets.only(bottom: _size.height * 0.033),
                child: PopHeadingBar(context, "My Gas Bills", 22, "Back")),
            Container(
                //  color: Colors.amber,
                margin: EdgeInsets.only(top: _size.height * 0.02),
                height: _size.height * 0.235,
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  return Card(
                    shadowColor: Colors.black,

                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                    color: Color.fromARGB(255, 251, 240, 225),
                    // theme.cardColor,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: constraints.maxHeight * 0.08,
                          horizontal: constraints.maxWidth * 0.1),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Image.asset(
                                gas,
                                height: constraints.maxHeight * 0.17,
                              ),
                              Text(" Gas Bill",
                                  style: GoogleFonts.ubuntu(
                                      fontSize: constraints.maxHeight * 0.11,
                                      color: theme.focusColor)),
                            ],
                          ),
                          SizedBox(
                            height: constraints.maxHeight * 0.1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Month:      ",
                                  style: GoogleFonts.ubuntu(
                                      fontSize: constraints.maxHeight * 0.085,
                                      color: theme.highlightColor)),
                              Text(Month,
                                  // Month.toString() == "..." ? "$Month" : "$Month",
                                  // DateFormat.MMM()
                                  //                   .format(DateTime.parse(Month)),
                                  style: GoogleFonts.ubuntu(
                                      fontSize: constraints.maxHeight * 0.085,
                                      color: theme.focusColor)),
                            ],
                          ),
                          SizedBox(height: constraints.maxHeight * 0.03),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Unit Consume:   ",
                                  style: GoogleFonts.ubuntu(
                                      fontSize: constraints.maxHeight * 0.085,
                                      color: theme.highlightColor)),
                              Text("${currentReading - previousReading} units",
                                  style: GoogleFonts.ubuntu(
                                      fontSize: constraints.maxHeight * 0.085,
                                      color: theme.focusColor)),
                            ],
                          ),
                          SizedBox(height: constraints.maxHeight * 0.03),
                          Msg == "Paid"
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Bill:   ",
                                        style: GoogleFonts.ubuntu(
                                            fontSize:
                                                constraints.maxHeight * 0.085,
                                            color: theme.highlightColor)),
                                    Text(Msg,
                                        style: GoogleFonts.ubuntu(
                                            fontSize:
                                                constraints.maxHeight * 0.085,
                                            color: theme.focusColor)),
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Due Date:   ",
                                        style: GoogleFonts.ubuntu(
                                            fontSize:
                                                constraints.maxHeight * 0.085,
                                            color: theme.highlightColor)),
                                    Text(
                                        DueDate == "...."
                                            ? "...."
                                            : DateFormat.yMMMd().format(
                                                DateTime.parse(DueDate)),
                                        style: GoogleFonts.ubuntu(
                                            fontSize:
                                                constraints.maxHeight * 0.085,
                                            color: theme.focusColor)),
                                  ],
                                ),
                          SizedBox(height: constraints.maxHeight * 0.03),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("Amount:   ",
                                  style: GoogleFonts.ubuntu(
                                      fontSize: constraints.maxHeight * 0.085,
                                      color: theme.highlightColor)),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('$Amount ',
                                      style: GoogleFonts.ubuntu(
                                          fontSize:
                                              constraints.maxHeight * 0.095,
                                          color: theme.focusColor)),
                                  Text('PKR',
                                      style: GoogleFonts.ubuntu(
                                          fontSize:
                                              constraints.maxHeight * 0.085,
                                          color: theme.focusColor))
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                })),
            // Previous Bill
            Container(
                margin: EdgeInsets.fromLTRB(_size.width * 0.018,
                    _size.height * 0.02, 0, _size.height * 0.02),
                child: Text("Previous Bills",
                    style: GoogleFonts.ubuntu(
                        fontSize: height(20), color: theme.focusColor))),
            Expanded(
              child: Container(
                child: SingleChildScrollView(
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: gasBillingList.length,
                      itemBuilder: (context, index) {
                        final Index_m = gasBillingList[index];
                        return Billing_History_Tile(
                            Index_m.month.toString(),
                            Index_m.payment.toString(),
                            Index_m.payDate.toString(),
                            Index_m.payment.toString());
                      }),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
