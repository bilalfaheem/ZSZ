import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:zsz/Screens/Billing_Screen/Functions/Billing_Function/billing_func.dart';

class Billing_Tile extends StatelessWidget {
  String Name, Address, Bill_Month, Due_Date, Due_Payment, Pay_Date;
  Billing_Tile(this.Name, this.Address, this.Bill_Month, this.Due_Date,
      this.Due_Payment, this.Pay_Date);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final _size = MediaQuery.of(context).size;
    // var a = _size.height * 0.31;
    // var b = _size.height * 0.133;
    // var c = _size.height * 0.16;
    // var d = a - (b + c);
    // print(d);
    // print("${_size.height * 0.31} first height");
    // print("${_size.height * 0.133} second height");
    // print("${_size.height * 0.16} third height");
    // print(d / (_size.height));
    // print(_size.height * 0.0169999);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
// first container
        Card(
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: _size.width * 0.05, horizontal: _size.width * 0.05),
            height: _size.height * 0.31,
            width: _size.width * 0.5,
            decoration: BoxDecoration(
                color: theme.primaryColor,
                //  Color.fromARGB(240, 20, 72, 111),
                //  theme.primaryColorDark,
                // color: Color(0xff4dbfa9),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(74, 111, 184, 240),
                    //  Color.fromARGB(73, 67, 180, 67),
                    blurRadius: 4,
                    offset: Offset(6, 8), // Shadow position
                  ),
                ],
                borderRadius: BorderRadius.circular(20)),
            child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        "assets/Icons/Info.png",
                        height: _size.height / 32,
                        fit: BoxFit.cover,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  // Expanded(
                  //     child: SizedBox(
                  //   height: 1,
                  // )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(Name.toUpperCase(),
                          maxLines: 2,
                          style: GoogleFonts.ubuntu(
                              // fontWeight: FontWeight.w400,
                              fontSize: constraints.maxHeight * 0.09,
                              color: Colors.white)),
                      SizedBox(
                        height: _size.height * 0.015,
                      ),
                      Text("Address",
                          style: GoogleFonts.ubuntu(
                              // fontWeight: FontWeight.w500,
                              fontSize: constraints.maxHeight * 0.06,
                              color: Color.fromARGB(201, 255, 255, 255))),
                      SizedBox(
                        height: _size.height * 0.0015,
                      ),
                      Text("$Address",
                          style: GoogleFonts.ubuntu(
                              // fontWeight: FontWeight.w500,
                              fontSize: constraints.maxHeight * 0.08,
                              color: Colors.white)),
                      SizedBox(
                        height: _size.height * 0.015,
                      ),
                      Text("Billing Month",
                          style: GoogleFonts.ubuntu(
                              fontSize: constraints.maxHeight * 0.06,
                              // fontWeight: FontWeight.w500,
                              color: Color.fromARGB(201, 255, 255, 255))),
                      SizedBox(
                        height: _size.height * 0.0015,
                      ),
                      Text("$Bill_Month",
                          style: GoogleFonts.ubuntu(
                              fontSize: constraints.maxHeight * 0.08,
                              // fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 255, 255, 255)))
                    ],
                  ),
                ],
              );
            }),
          ),
        ),

// second and third container
        Container(
          margin: EdgeInsets.only(left: _size.width * 0.02),
          child: Column(
            children: [
//second container

              billing_status == false
                  ?

// billing status false

                  Container(
                      margin: EdgeInsets.all(_size.width * 0.0),
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Container(
                          padding: EdgeInsets.all(_size.width * 0.04),
                          height: _size.height * 0.133,
                          width: _size.width * 0.3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromARGB(195, 222, 23, 56),
                            // Color(0xffF4806D),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(52, 235, 136, 121),
                                blurRadius: 4,
                                offset: Offset(6, 8), // Shadow position
                              ),
                            ],
                          ),
                          child: LayoutBuilder(builder: (BuildContext context,
                              BoxConstraints constraints) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Image.asset(
                                      "assets/Icons/DueDate2.png",
                                      height: constraints.maxHeight * 0.3,
                                      fit: BoxFit.cover,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                                Expanded(
                                    child: SizedBox(
                                  height: 1,
                                )),
                                Text("Due Date",
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.ubuntu(
                                        fontSize: constraints.maxHeight * 0.18,
                                        // MediaQuery.of(context).size.height *
                                        //     0.02,
                                        color: Color.fromARGB(
                                            201, 255, 255, 255))),

                                // Expanded(child: SizedBox(height: 1,)),
                                SizedBox(height: constraints.maxHeight * 0.05),
                                AutoSizeText(
                                    Due_Date == "....."
                                        ? "....."
                                        : DateFormat.yMMMd()
                                            .format(DateTime.parse(Due_Date)),
                                    // "$Due_Date",
                                    maxLines: 1,
                                    style: GoogleFonts.ubuntu(
                                        fontWeight: FontWeight.w400,
                                        fontSize: constraints.maxHeight * 0.21,
                                        color: Colors.white)),
                              ],
                            );
                          }),
                        ),
                      ),
                    )
// second container
// billing status true
                  : Container(
                      margin: EdgeInsets.all(_size.width * 0.0),
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Container(
                          padding: EdgeInsets.all(_size.width * 0.04),
                          height: _size.height * 0.133,
                          width: _size.width * 0.3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromARGB(208, 23, 113, 109),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(55, 93, 208, 202),
                                //  Color.fromARGB(62, 235, 136, 121),
                                blurRadius: 4,
                                offset: Offset(6, 8), // Shadow position
                              ),
                            ],
                          ),
                          child: LayoutBuilder(builder: (BuildContext context,
                              BoxConstraints constraints) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Image.asset(
                                      "assets/Icons/DueDate2.png",
                                      height: constraints.maxHeight * 0.3,
                                      fit: BoxFit.cover,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                                Expanded(
                                    child: SizedBox(
                                  height: 1,
                                )),
                                Text("Pay Date",
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.ubuntu(
                                        fontSize: constraints.maxHeight * 0.18,
                                        color: Color.fromARGB(
                                            201, 255, 255, 255))),
                                SizedBox(
                                  height: _size.height * 0.01,
                                ),
                                AutoSizeText(
                                    Pay_Date == "....."
                                        ? "....."
                                        : DateFormat.yMMMd()
                                            .format(DateTime.parse(Pay_Date)),
                                    maxLines: 1,
                                    style: GoogleFonts.ubuntu(
                                        fontWeight: FontWeight.w400,
                                        fontSize: constraints.maxHeight * 0.2,
                                        color: Colors.white))
                              ],
                            );
                          }),
                        ),
                      ),
                    ),
// third container

// billing status false _size.width * 0.02
              Container(
                margin: EdgeInsets.only(top: _size.height * 0.01),
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    padding: EdgeInsets.all(_size.width * 0.04),
                    height: _size.height * 0.16,
                    width: _size.width * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color:

                          // Color.fromARGB(250, 214, 29, 231),
                          Color.fromARGB(215, 104, 129, 149),
                      // Color(0xff11446c),
                      //  Color(0xff45a0d9),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(47, 82, 174, 231),
                          // color: Color.fromARGB(250, 143, 140, 140),
                          blurRadius: 4,
                          offset: Offset(6, 8), // Shadow position
                        ),
                      ],
                    ),
                    child: LayoutBuilder(builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Image.asset(
                                "assets/Icons/Cash.png",
                                height: constraints.maxHeight * 0.22,
                                fit: BoxFit.cover,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          Expanded(
                              child: SizedBox(
                            height: 1,
                          )),
                          Text("Bill",
                              style: GoogleFonts.ubuntu(
                                  fontSize: constraints.maxHeight * 0.16,
                                  color: Color.fromARGB(201, 255, 255, 255))),
                          SizedBox(height: constraints.maxHeight * 0.01),
                          billing_status == true
                              ? Text("Paid",
                                  style: GoogleFonts.ubuntu(
                                      fontSize: constraints.maxHeight * 0.18,
                                      color: Colors.white))
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    AutoSizeText("$Due_Payment",
                                        maxLines: 1,
                                        style: GoogleFonts.ubuntu(
                                            fontSize:
                                                constraints.maxHeight * 0.18,
                                            color: Colors.white)),
                                    Text(" PKR",
                                        style: GoogleFonts.ubuntu(
                                            fontSize:
                                                constraints.maxHeight * 0.13,
                                            color: Colors.white)),
                                  ],
                                )
                        ],
                      );
                    }),
                  ),
                ),
              )

// bill status true
// third container
              // Container(
              //     margin: EdgeInsets.only(top: _size.height * 0.001),
              //     child: Card(
              //       elevation: 2,
              //       shape: RoundedRectangleBorder(
              //           borderRadius:
              //               BorderRadius.circular(20)),
              //       child: Container(
              //         padding: EdgeInsets.all(_size.width * 0.04),
              //         height: _size.height * 0.16,
              //         width: _size.width * 0.3,
              //         decoration: BoxDecoration(
              //           borderRadius:
              //               BorderRadius.circular(20),
              //           color: Color(0xff91a3b0),
              //           //  Color(0xff11446c),
              //           //  Color(0xff45a0d9),
              //           boxShadow: const [
              //             BoxShadow(
              //               color: Color.fromARGB(47, 82, 174, 231),
              //               //  color: Color.fromARGB(251, 221, 218, 218),
              //               blurRadius: 4,
              //               offset: Offset(6, 8), // Shadow position
              //             ),
              //           ],
              //         ),
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           mainAxisAlignment: MainAxisAlignment.end,
              //           children: [
              //             Row(
              //               mainAxisAlignment: MainAxisAlignment.end,
              //               children: [
              //                 Image.asset(
              //                   "assets/Icons/Cash.png",
              //                   height: _size.height / 32,
              //                   fit: BoxFit.cover,
              //                   color: Colors.white,
              //                 ),
              //               ],
              //             ),
              //             Expanded(
              //                 child: SizedBox(
              //               height: 1,
              //             )),
              //             Text("Bill",
              //                 style: GoogleFonts.ubuntu(
              //                     fontSize:
              //                         MediaQuery.of(context).size.height *
              //                             0.023,
              //                     color:
              //                         Color.fromARGB(201, 255, 255, 255))),
              //             SizedBox(
              //               height: _size.height * 0.01,
              //             ),
              //             Text("Paid",
              //                 // "$Due_Payment Rs",
              //                 style: GoogleFonts.ubuntu(
              //                     fontSize:
              //                         MediaQuery.of(context).size.height *
              //                             0.026,
              //                     color: Colors.white))
              //           ],
              //         ),
              //       ),
              //     ),
              //   )
            ],
          ),
        )
      ],
    );
  }
}
