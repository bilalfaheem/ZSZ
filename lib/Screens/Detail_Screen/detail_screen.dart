import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zsz/Constant.dart';

class Detail_Screen extends StatefulWidget {
  const Detail_Screen({Key? key}) : super(key: key);

  @override
  State<Detail_Screen> createState() => _Detail_ScreenState();
}

class _Detail_ScreenState extends State<Detail_Screen> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.fromLTRB(
              _size.width * padding_horizontal,
              _size.height * padding_top,
              _size.width * padding_horizontal,
              _size.height * padding_bottom),
          child: Column(
            children: [
              //heading
              Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, _size.height * 0.038),
                  child: Center(
                      child: Text("Amount",
                          style: GoogleFonts.ubuntu(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.029,
                              color: theme.focusColor)))),
              Card(
                shadowColor: Colors.white,
                // elevation: 1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(_size.height * 0.028)),
                child: Container(
                  height: _size.height * 0.13,
                  width: _size.width,
                  padding: EdgeInsets.all(_size.height * 0.013),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(_size.height * 0.02),
                      color: Colors.white),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //Monthly

                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Monthly ",
                                style: GoogleFonts.ubuntu(
                                    fontSize: _size.width * 0.045,
                                    color: theme.highlightColor),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: _size.height * 0.013),
                                child: Text(
                                  "4000 ",
                                  style: GoogleFonts.ubuntu(
                                      fontSize: _size.width * 0.06,
                                      fontWeight: FontWeight.w500,
                                      color: theme.primaryColor),
                                ),
                              )
                            ]),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Paid",
                              style: GoogleFonts.ubuntu(
                                  fontSize: _size.width * 0.045,
                                  color: theme.highlightColor),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(top: _size.height * 0.013),
                              child: Text(
                                "3500 ",
                                style: GoogleFonts.ubuntu(
                                    fontSize: _size.width * 0.06,
                                    fontWeight: FontWeight.w500,
                                    color: theme.primaryColor),
                              ),
                            )
                          ],
                        ),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Due",
                                style: GoogleFonts.ubuntu(
                                    fontSize: _size.width * 0.045,
                                    color: theme.highlightColor),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: _size.height * 0.013),
                                child: Text(
                                  "0 ",
                                  style: GoogleFonts.ubuntu(
                                      fontSize: _size.width * 0.06,
                                      fontWeight: FontWeight.w500,
                                      color: theme.primaryColor),
                                ),
                              )
                            ])
                      ]),
                  //Price
                ),
              )
            ],
          )),
    );
  }
}
