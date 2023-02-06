import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:pinput/pinput.dart';
// import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:zsz/Screens/Login_Screen/Pages/Forget_Change_Password/forget_change_password_screen.dart';
import 'package:zsz/Screens/Login_Screen/Pages/Otp_Screen/Provider/Otp_Validation_Status_Provider.dart';
import 'package:zsz/Widgets/Heading_Bar/PopHeadingBar.dart';
import 'package:zsz/Constant.dart';
import 'package:zsz/responsive.dart';

class OtpScreen2 extends StatefulWidget {
  final String phone, User_Id_Forget_Pass, Otp_verification_code;
  OtpScreen2(
      {required this.phone,
      required this.User_Id_Forget_Pass,
      required this.Otp_verification_code});

  @override
  State<OtpScreen2> createState() => _OtpScreen2State();
}

class _OtpScreen2State extends State<OtpScreen2> {
  //  late String _verificationCode;
  @override
  void initState() {
    super.initState();
    // remove 3
    //  _verifyPhone(widget.phone);
  }

  // _verifyPhone(phone) async {
  //   // FirebaseAuth.instance.setSettings(appVerificationDisabledForTesting: true);
  //   await FirebaseAuth.instance.verifyPhoneNumber(
  //     phoneNumber: ("+92$phone"),
  //     verificationCompleted: (PhoneAuthCredential credential) async {
  //       await FirebaseAuth.instance
  //           .signInWithCredential(credential)
  //           .then((value) async {
  //         if (value.user != null) {
  //           //remove comment
  //           // final String _currentTimeZone =
  //           //     await FlutterNativeTimezone.getLocalTimezone();
  //           // _firebaseMessaging.getToken().then((token) {
  //           //   ScaffoldMessenger.of(context)
  //           //       .showSnackBar(SnackBar(content: Text("/$token")));
  //           // });
  //           // ScaffoldMessenger.of(context)
  //           //     .showSnackBar(SnackBar(content: Text("/$_currentTimeZone")));

  //           Navigator.pushReplacement(
  //               context,
  //               MaterialPageRoute(
  //                   builder: (context) => ForgetChangePasswordScreen(
  //                       User_Id_Forget_Pass: widget.User_Id_Forget_Pass)));
  //         }
  //       });
  //     },
  //     verificationFailed: (FirebaseAuthException e) {
  //       print(e.message);
  //       ScaffoldMessenger.of(context)
  //           .showSnackBar(SnackBar(content: Text("verification Failed.")));
  //     },
  //     codeSent: (String verficationID, int? resendToken) {
  //       setState(() {
  //         _verificationCode = verficationID;
  //         ScaffoldMessenger.of(context)
  //             .showSnackBar(SnackBar(content: Text('code sent section.')));
  //       });
  //     },
  //     codeAutoRetrievalTimeout: (String verificationID) {
  //       setState(() {
  //         _verificationCode = verificationID;
  //       });
  //     },
  //     timeout: Duration(seconds: 25),
  //     // forceResendingToken: _resendToken
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final TextEditingController _pinPutController = TextEditingController();
    final size = MediaQuery.of(context).size;
    final ThemeData theme = Theme.of(context);
    final OTP_Validation_provider =
        Provider.of<Otp_Validation_Status_Provider>(context, listen: false);
    SizeConfig().init(context);

    // final defaultPinTheme = PinTheme(
    //   width: 40,
    //   height: 40,
    //   textStyle: TextStyle(
    //       // fontFamily: GoogleFonts.ubuntu(),

    //       fontSize: 20,
    //       color: Color.fromRGBO(30, 60, 87, 1),
    //       fontWeight: FontWeight.w600),
    //   decoration: BoxDecoration(
    //     color: theme.scaffoldBackgroundColor,
    //     // Color.fromARGB(97, 0, 187, 212),
    //     border: Border.all(color: theme.primaryColor),
    //     //  Color.fromRGBO(234, 239, 243, 1)),
    //     borderRadius: BorderRadius.circular(10),
    //   ),
    // );

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                size.width * padding_horizontal,
                size.height * padding_top,
                size.width * padding_horizontal,
                size.height * padding_bottom),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                PopHeadingBar(context, "OTP Verification", 20, "Close"),
                Container(
                  margin: EdgeInsets.only(top: height(30), bottom: height(55)),
                  child: Center(
                      child: CircleAvatar(
                    backgroundColor: theme.primaryColorDark,
                    radius: size.height * 0.08,
                    // backgroundImage: AssetImage("assets/Bottom_Bar/Profile.png"),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Image.asset(
                        logo2,
                        height: size.height * 0.1,
                        color: Colors.white,
                      ),
                    ),
                  )),
                ),
                Container(
                  margin: EdgeInsets.only(top: size.height * 0),
                  // height: size.height*0.3,
                  width: size.width,
                  padding: EdgeInsets.all(size.width * 0.07),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: theme.dividerColor),

                  child: Column(
                    children: [
                      Text(
                        "Enter 6-Digits OTP",
                        style: GoogleFonts.ubuntu(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.025,
                            color: theme.focusColor),
                      ),
                      // SizedBox(
                      //   height: size.height * 0.02,
                      // ),

                      // Container(
                      //   margin: EdgeInsets.only(
                      //       top: size.height * 0.02,
                      //       bottom: size.height * 0.01),
                      //   child: Center(
                      //     child: Pinput(
                      //       length: 6,
                      //       // onSubmitted: (pin) => print("value$pin"),
                      //       defaultPinTheme: defaultPinTheme,
                      //       inputFormatters: [
                      //         FilteringTextInputFormatter.allow(
                      //             RegExp("[0-9]")),
                      //       ],
                      //       onCompleted: (pin) async {
                      //         // print(
                      //         //     "pinnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn$pin");
                      //         // function

                      //         try {
                      //           await FirebaseAuth.instance
                      //               .signInWithCredential(
                      //                   PhoneAuthProvider.credential(
                      //                       verificationId:
                      //                           widget.Otp_verification_code,
                      //                       smsCode: pin))
                      //               .then((value) async {
                      //             if (value.user != null) {
                      //               Navigator.pushReplacement(
                      //                   context,
                      //                   MaterialPageRoute(
                      //                       builder: (context) =>
                      //                           ForgetChangePasswordScreen(
                      //                               User_Id_Forget_Pass: widget
                      //                                   .User_Id_Forget_Pass)));
                      //             }
                      //           });
                      //         } catch (e) {
                      //           OTP_Validation_provider.OTP_Validation_Func(
                      //               "wrong");
                      //           // ScaffoldMessenger.of(context).showSnackBar(
                      //           //     SnackBar(content: Text('Invalid OTP.')));
                      //           // FocusScope.of(context).unfocus();
                      //           // _scaffoldkey.currentState
                      //           //     .showSnackBar(SnackBar(content: Text('invalid OTP')));
                      //         }
                      //       },
                      //     ),
                      //   ),
                      // ),
                      Consumer<Otp_Validation_Status_Provider>(
                          builder: (context, value, child) =>
                              value.Otp_validation_status == "wrong"
                                  ? Text("Invalid OTP",
                                      maxLines: 1,
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.ubuntu(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.04,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.red))
                                  : Container()
                          //      Text(value.Otp_validation_status,
                          // maxLines: 1,
                          // textAlign: TextAlign.start,
                          // style: GoogleFonts.ubuntu(
                          //     fontSize:
                          //         MediaQuery.of(context).size.width * 0.04,
                          //     fontWeight: FontWeight.w500,
                          //     color: Color(value.Status_Color))),
                          ),

                      Text(
                          "Send at 0${widget.phone.substring(0, 1)}*****${widget.phone.substring(7)}",
                          // "Send at 03******013",
                          maxLines: 1,
                          textAlign: TextAlign.start,
                          style: GoogleFonts.ubuntu(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                              fontWeight: FontWeight.w500,
                              color: theme.highlightColor)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
