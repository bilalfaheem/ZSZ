import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zsz/Constant.dart';

class Sign_up_Success extends StatelessWidget {
  Sign_up_Success({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              _size.width * padding_horizontal,
              _size.height * padding_top,
              _size.width * padding_horizontal,
              _size.height * padding_bottom),
          child: Column(
            children: [
              //back button
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, _size.height * 0.038),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: theme.primaryColor,
                        )),
                    // SizedBox(
                    //   width: _size.width * 0.205
                    // ),
                    // Center(
                    //   child: Text(
                    //     "Setting",
                    //     style: GoogleFonts.ubuntu(
                    //         fontSize: MediaQuery.of(context).size.height * 0.029,
                    //         color: theme.focusColor),
                    //   ),
                    // ),
                  ],
                ),
              ),
              SizedBox(
                height: _size.height * 0.15,
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // height: _size.height*0.3,
                      width: _size.width,
                      padding: EdgeInsets.all(_size.width * 0.07),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(_size.height * 0.02),
                          color: theme.dividerColor),

                      child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Image.asset(
                                zszlogo,
                                width: MediaQuery.of(context).size.width * 0.4,
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                              ),
                            ),
                            SizedBox(
                              height: _size.height * 0.014,
                            ),
                            Text(
                                "Your Request has been Submitted. \nPlease Wait 24 hours.",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.ubuntu(
                                    fontSize: _size.height * 0.027,
                                    color: Colors.black)),
                            SizedBox(
                              height: _size.height * 0.018,
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
