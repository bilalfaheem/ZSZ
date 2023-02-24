import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:zsz/Constant.dart';

Widget passDetailWidget(context, qrCode, name, passType, event, validTill) {
  final theme = Theme.of(context);
  return Container(
    margin: EdgeInsets.symmetric(vertical: 20),
    color: Theme.of(context).scaffoldBackgroundColor,
    // padding: EdgeInsets.symmetric(vertical: 40),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // margin: EdgeInsets.symmetric(vertical: 40),
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: theme.shadowColor,
              ),
              child: PrettyQr(
                data: qrCode.toString(),
                elementColor: theme.primaryColor,
                //  image: AssetImage(zsz),
                roundEdges: true,

                size: 200,
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Card(
            // color: Colors.amber,

            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
                //
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: theme.shadowColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Text("Name",
                                  maxLines: 1,
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.ubuntu(
                                      fontSize: 17,
                                      color: theme.highlightColor)),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Text("Pass Type",
                                  maxLines: 1,
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.ubuntu(
                                      fontSize: 17,
                                      color: theme.highlightColor)),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Text("Event",
                                  maxLines: 1,
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.ubuntu(
                                      fontSize: 17,
                                      color: theme.highlightColor)),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Text("Address",
                                  maxLines: 1,
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.ubuntu(
                                      fontSize: 17,
                                      color: theme.highlightColor)),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Text("Valid till",
                                  maxLines: 1,
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.ubuntu(
                                      fontSize: 17,
                                      color: theme.highlightColor)),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 20, left: 10),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: Text(":",
                                    maxLines: 1,
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 17,
                                    )),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: Text(":",
                                    maxLines: 1,
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 17,
                                    )),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: Text(":",
                                    maxLines: 1,
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 17,
                                    )),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: Text(":",
                                    maxLines: 1,
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 17,
                                    )),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: Text(":",
                                    maxLines: 1,
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 17,
                                    )),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Text("$name",
                                  maxLines: 1,
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.ubuntu(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600)),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Text(passType.toString(),
                                  maxLines: 1,
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.ubuntu(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600)),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Text(event.toString(),
                                  maxLines: 1,
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.ubuntu(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600)),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Text(userLoginAddress_S,
                                  maxLines: 1,
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.ubuntu(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600)),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                          DateFormat.jm().format(
                                              DateTime.parse(validTill)),
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.ubuntu(
                                              fontSize: 17,
                                              color: theme.focusColor,
                                              fontWeight: FontWeight.w600),
                                        ),
                                  Text(
                                      DateFormat.MMMEd()
                                          .format(DateTime.parse(validTill)),
                                      maxLines: 1,
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.ubuntu(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600)),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                    //   Row(
                    //     children: [

                    //       Text("Bilal Faheem",
                    // maxLines: 1,
                    // textAlign: TextAlign.start,
                    // style: GoogleFonts.ubuntu(
                    //         fontSize: 18,)),
                    //     ],
                    //   ),
                  ],
                )),
          ),
        ),
      ],
    ),
  );
}
