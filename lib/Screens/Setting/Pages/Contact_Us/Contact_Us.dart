import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zsz/Screens/Setting/Pages/Contact_Us/functions/Email_sender/Email_sender.dart';
import 'package:zsz/Screens/Setting/Pages/Contact_Us/functions/term_text.dart/term_text.dart';
import 'package:zsz/Constant.dart';
import 'package:zsz/Widgets/Heading_Bar/PopHeadingBar.dart';

class Contact_Us extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final _size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.fromLTRB(
                  _size.width * padding_horizontal,
                  _size.height * padding_top,
                  _size.width * padding_horizontal,
                  _size.height * padding_bottom),
              child: Column(children: [
                //heading
                Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, _size.height * 0.038),
                    child: PopHeadingBar(context, "Contact Us", 22, "Back")),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(_size.width * 0.05),
                      color: theme.dividerColor,

                      //  RoundedRectangleBorder(
                      // borderRadius: BorderRadius.circular(size * 0.028)),
                    ),
                    // height: _size.height*0.7,
                    width: _size.width * 1,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          _size.width * 0.01,
                          _size.width * 0.03,
                          _size.width * 0.03,
                          _size.width * 0),
                      child: Column(
                        children: [
                          // Text("Daily Tanker Request Quota is 100 if the orders exceeded from quota you will not be able to place order you have to wait for next day Delivery Timing is from 8:00 am – 11:59 pm n\Water Tanker can be delayed caused by any force majeure/ electricity failure and maintenance. In case someone tries trespass, damage or harass workers/ private property Wenergy International has the right to take legal action against that person Order will be considered failed if no one at delivery point receives the water tanker in 7 minutes and you have to place a new request.\n Residents will be notified via notification when their delivery is scheduled.\nOnce order is placed is can take upto 3 days to deliver your order.\n Monthly Water Tanker Quota is limited to 4 tankers per month. If theres a need of 5th tanker you can place order via cash option"
                          // , style: GoogleFonts.ubuntu(
                          //    fontSize: MediaQuery.of(context).size.height * 0.02,
                          //  color: theme.focusColor),),

                          //  ListTile(
                          //   leading: Icon(Icons.circle_rounded),
                          //   title: Text("Daily Tanker Request Quota is 100 if the orders exceeded from quota you will not be able to place order you have to wait for next day") ,
                          //  ),
                          ListTile(
                            minLeadingWidth: _size.width * 0.04,
                            leading: Icon(Icons.circle_rounded,
                                size: _size.width * 0.03,
                                color: Colors.transparent),
                            title: Text("Terms and Conditions",
                                // "Daily Tanker Request Quota is 100 if the orders exceeded from quota you will not be able to place order you have to wait for next day",
                                style: GoogleFonts.ubuntu(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.02,
                                    color: Colors.black)),
                          ),
                          //   Row(
                          //     mainAxisAlignment: MainAxisAlignment.start,
                          //     children: [
                          //       Text(
                          //       "Terms and Conditions",
                          //       style: GoogleFonts.ubuntu(
                          //           fontSize:
                          //               MediaQuery.of(context).size.height * 0.02,
                          //           color: theme.focusColor),
                          // ),
                          //     ],
                          //   ),

                          Term_text(first_term),
                          Term_text(second_term),
                          Term_text(third_term),
                          Term_text(fourth_term),
                          Term_text(fifth_term),
                          Term_text(sixth_term),
                          // phone
                          Container(
                            margin: EdgeInsets.only(top: _size.height * 0.007),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                    // color: Colors.amber,
                                    child: Image.asset(
                                  "assets/Icons/cybernsoft_logoo.png",
                                  height: _size.height * 0.13,
                                )),

                                Expanded(
                                    child: SizedBox(
                                  width: 1,
                                )),

                                GestureDetector(
                                  onTap: () async {
                                    print("Call Press");
                                    await FlutterPhoneDirectCaller.callNumber(
                                        "03009363749");
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: theme.primaryColorLight,
                                    // Color.fromARGB(142, 112, 205, 115),
                                    child: Image.asset(
                                      "assets/Icons/Phone.png",
                                      color:Colors.white,
                                      //  theme.primaryColor,
                                      height: _size.width * 0.06,
                                    ),
                                  ),
                                ),

                                // email
                                GestureDetector(
                                  onTap: () async {
                                    // await FlutterEmailSender.send(email);
                                    launchEmail(
                                        "Wenergy@wenergy.com.pk", "WMS  ", "");
                                  },
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: _size.width * 0.02),
                                    child: CircleAvatar(
                                      backgroundColor: theme.primaryColorLight,
                                      child: Image.asset(
                                        "assets/Icons/Email.png",
                                        color: Colors.white,
                                        // theme.primaryColor,
                                        height: _size.width * 0.06,
                                      ),
                                    ),
                                  ),
                                ),

                                //  GestureDetector(
                                //   onTap: () {
                                //     whatsAppOpen_web();
                                //     // openwhatsappchat();
                                //     // openwhatsapp(context);
                                //   // whatsAppOpen(context);
                                //   },
                                //    child: CircleAvatar(
                                //     backgroundColor: Color.fromARGB(142, 112, 205, 115),
                                //     child: Image.asset("assets/Icons/Whatapp.png",color: theme.primaryColor,height: _size.width*0.065,),
                                //    ),
                                //  )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ))
              ]))),
    ));
  }
}
