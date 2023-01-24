import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:zsz/Constant.dart';
import 'package:zsz/Screens/Orders_Screen/Pages/Order/Pages/Order_Details/Dialog_Box/order_delivered_dialog_box.dart';
import 'package:zsz/Widgets/Heading_Bar/PopHeadingBar.dart';
import 'package:zsz/responsive.dart';

class Order_Details extends StatelessWidget {
  String Name,
      house_no,
      order_Id,
      Order_status,
      Tanker_Type,
      Time,
      Date,
      Delivery_Time,
      Expected;
  num margin_delivery_date;
  Order_Details(
      this.Name,
      this.house_no,
      this.order_Id,
      this.Order_status,
      this.Tanker_Type,
      this.Time,
      this.Date,
      this.Delivery_Time,
      this.Expected,
      this.margin_delivery_date);

  var text_size_details = 0.027;
  var text_size = 0.06;
  var padding_size = 0.45;
  var text_color = Colors.black;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final _size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                _size.width * padding_horizontal,
                _size.height * padding_top,
                _size.width * padding_horizontal,
                _size.height * padding_bottom),
            child: Column(
              children: [
                //heading
                Container(
                    margin: EdgeInsets.only(bottom: _size.height * 0.038),
                    child: PopHeadingBar(context, "Order Details", 22, "Back")),
                // detail box
                Container(
                    margin: EdgeInsets.only(bottom: _size.height * 0.03),
                    width: _size.width,
                    padding: EdgeInsets.fromLTRB(
                        _size.width * 0.07,
                        _size.width * 0.07,
                        _size.width * 0.07,
                        _size.width * 0.1),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(_size.height * 0.02),
                        color: theme.dividerColor),
                    child: LayoutBuilder(builder:
                        (BuildContext context, BoxConstraints constraints) {
                      print(constraints.maxWidth.toStringAsFixed(2));
                      return Column(
                        children: [
                          Center(
                            child: Image.asset(
                              zszlogo,
                              width: MediaQuery.of(context).size.width * 0.4,
                              height:
                                  MediaQuery.of(context).size.height * 0.055,
                            ),
                          ),
                          SizedBox(
                            height: _size.height * 0.03,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: constraints.maxWidth * padding_size,
                                margin: EdgeInsets.symmetric(
                                    vertical: _size.height * 0.01),
                                // color: Colors.amber,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Name",
                                      textAlign: TextAlign.end,
                                      style: GoogleFonts.ubuntu(
                                          fontSize:
                                              constraints.maxWidth * text_size,
                                          color: text_color),
                                    ),
                                    Text(
                                      ":",
                                      textAlign: TextAlign.end,
                                      style: GoogleFonts.ubuntu(
                                          fontSize:
                                              constraints.maxWidth * text_size,
                                          // MediaQuery.of(context).size.height *
                                          //     text_size_details,
                                          color: text_color),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                // color: Colors.blue,
                                width: constraints.maxWidth * padding_size,
                                child: Text(
                                  Name.toUpperCase(),
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.ubuntu(
                                      fontSize:
                                          constraints.maxWidth * text_size,
                                      color: theme.focusColor),
                                ),
                              )
                            ],
                          ),
                          Divider(
                              thickness: 1, color: Color.fromARGB(75, 0, 0, 0)
                              // Colors.black,
                              ),

                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: _size.height * 0.01),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  // color: Colors.amber,
                                  width: constraints.maxWidth * padding_size,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Unit No",
                                        textAlign: TextAlign.end,
                                        style: GoogleFonts.ubuntu(
                                            fontSize: constraints.maxWidth *
                                                text_size,
                                            color: text_color),
                                      ),
                                      Text(
                                        ":",
                                        textAlign: TextAlign.end,
                                        style: GoogleFonts.ubuntu(
                                            fontSize: constraints.maxWidth *
                                                text_size,
                                            color: text_color),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  // color: Colors.blue,
                                  width: constraints.maxWidth * padding_size,
                                  child: Text(
                                    house_no,
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.ubuntu(
                                        fontSize:
                                            constraints.maxWidth * text_size,
                                        color: theme.focusColor),
                                  ),
                                )
                              ],
                            ),
                          ),
                          // Container(

                          Divider(
                              thickness: 1, color: Color.fromARGB(75, 0, 0, 0)),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: _size.height * 0.01),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: constraints.maxWidth * padding_size,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Order Id",
                                        textAlign: TextAlign.end,
                                        style: GoogleFonts.ubuntu(
                                            fontSize: constraints.maxWidth *
                                                text_size,
                                            color: text_color),
                                      ),
                                      Text(
                                        ":",
                                        textAlign: TextAlign.end,
                                        style: GoogleFonts.ubuntu(
                                            fontSize: constraints.maxWidth *
                                                text_size,
                                            color: text_color),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: constraints.maxWidth * padding_size,
                                  child: Text(
                                    order_Id,
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.ubuntu(
                                        fontSize:
                                            constraints.maxWidth * text_size,
                                        color: theme.focusColor),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            color: Color.fromARGB(75, 0, 0, 0),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: _size.height * 0.01),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: constraints.maxWidth * padding_size,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Order Status",
                                        textAlign: TextAlign.end,
                                        style: GoogleFonts.ubuntu(
                                            fontSize: constraints.maxWidth *
                                                text_size,
                                            color: text_color),
                                      ),
                                      Text(
                                        ":",
                                        textAlign: TextAlign.end,
                                        style: GoogleFonts.ubuntu(
                                            fontSize: constraints.maxWidth *
                                                text_size,
                                            color: text_color),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: constraints.maxWidth * padding_size,
                                  child: Text(
                                    Order_status,
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.ubuntu(
                                        fontSize:
                                            constraints.maxWidth * text_size,
                                        color: theme.focusColor),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Divider(
                              thickness: 1, color: Color.fromARGB(75, 0, 0, 0)),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: _size.height * 0.01),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: constraints.maxWidth * padding_size,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Type",
                                        textAlign: TextAlign.end,
                                        style: GoogleFonts.ubuntu(
                                            fontSize: constraints.maxWidth *
                                                text_size,
                                            color: text_color),
                                      ),
                                      Text(
                                        ":",
                                        textAlign: TextAlign.end,
                                        style: GoogleFonts.ubuntu(
                                            fontSize: constraints.maxWidth *
                                                text_size,
                                            color: text_color),
                                      ),
                                    ],
                                  ),
                                ),
                                // Expanded(
                                //   child: Container(
                                //     child: Center(
                                //       child:
                                Container(
                                  width: constraints.maxWidth * padding_size,
                                  child: Text(
                                    Tanker_Type,
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.ubuntu(
                                        fontSize:
                                            constraints.maxWidth * text_size,
                                        color: theme.focusColor),
                                  ),
                                ),
                                //     ),
                                //   ),
                                // )
                              ],
                            ),
                          ),
                          Divider(
                              thickness: 1, color: Color.fromARGB(75, 0, 0, 0)),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: _size.height * 0.01),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: constraints.maxWidth * padding_size,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Created Time",
                                        textAlign: TextAlign.end,
                                        style: GoogleFonts.ubuntu(
                                            fontSize: constraints.maxWidth *
                                                text_size,
                                            color: text_color),
                                      ),
                                      Text(
                                        ":",
                                        textAlign: TextAlign.end,
                                        style: GoogleFonts.ubuntu(
                                            fontSize: constraints.maxWidth *
                                                text_size,
                                            color: text_color),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: constraints.maxWidth * padding_size,
                                  child: Text(
                                    Time,
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.ubuntu(
                                        fontSize:
                                            constraints.maxWidth * text_size,
                                        color: theme.focusColor),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Divider(
                              thickness: 1, color: Color.fromARGB(75, 0, 0, 0)),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: _size.height * 0.01),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: constraints.maxWidth * padding_size,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Created Date",
                                        textAlign: TextAlign.end,
                                        style: GoogleFonts.ubuntu(
                                            fontSize: constraints.maxWidth *
                                                text_size,
                                            color: text_color),
                                      ),
                                      Text(
                                        ":",
                                        textAlign: TextAlign.end,
                                        style: GoogleFonts.ubuntu(
                                            fontSize: constraints.maxWidth *
                                                text_size,
                                            color: text_color),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: constraints.maxWidth * padding_size,
                                  child: Text(
                                    Date,
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.ubuntu(
                                        fontSize:
                                            constraints.maxWidth * text_size,
                                        color: theme.focusColor),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Divider(
                              thickness: 1, color: Color.fromARGB(75, 0, 0, 0)),
                          Container(
                            margin: EdgeInsets.only(
                                top: _size.height * margin_delivery_date),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  // color: Colors.amber,
                                  width: constraints.maxWidth * padding_size,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "$Expected Date",
                                        textAlign: TextAlign.start,
                                        style: GoogleFonts.ubuntu(
                                            fontSize: constraints.maxWidth *
                                                text_size,
                                            color: text_color),
                                      ),
                                      Text(
                                        ":",
                                        textAlign: TextAlign.end,
                                        style: GoogleFonts.ubuntu(
                                            fontSize: constraints.maxWidth *
                                                text_size,
                                            color: text_color),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: constraints.maxWidth * padding_size,
                                  child: Text(
                                    Delivery_Time.toString() == "null" ||
                                            Delivery_Time == null ||
                                            Delivery_Time == " "
                                        ? " "
                                        : DateFormat.MMMEd().format(
                                            DateTime.parse(Delivery_Time)),
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.ubuntu(
                                        fontSize:
                                            constraints.maxWidth * text_size,
                                        color: theme.focusColor),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      );
                    })),
                Order_status == "Active" || Order_status == "active"
                    ?
                    // Deliver Button
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(

                              // margin:EdgeInsets.only(right: width(10)),
                              // EdgeInsets.only(top: height(50), bottom: height(20)),
                              height: height(38),
                              width: width(160),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15)),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: theme.primaryColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30))),
                                  onPressed: () {
                                    print("Delivered");
                                    order_delivered_dialog_box(
                                        context,
                                        _size.height,
                                        _size.width,
                                        theme,
                                        Tanker_Type,
                                        order_Id);
                                  },
                                  child: LayoutBuilder(builder:
                                      (BuildContext context,
                                          BoxConstraints constraints) {
                                    return Text(
                                        // constraints.maxWidth.toStringAsFixed(2),
                                        "Delivered",
                                        style: GoogleFonts.ubuntu(
                                            fontSize:
                                                constraints.maxHeight * 0.45,
                                            // width(30),
                                            // MediaQuery.of(context).size.height * 0.04,
                                            color: theme.cardColor));
                                  }))),
                        ],
                      )
                    : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
