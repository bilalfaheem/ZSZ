import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zsz/Screens/Login_Screen/Pages/Forget_Password/provider/Contact_no_visibility_provider.dart';
import 'package:zsz/Screens/Login_Screen/Pages/Otp_Screen/Provider/Otp_Validation_Status_Provider.dart';
import 'package:zsz/Screens/Login_Screen/Pages/Otp_Screen/otp_screen.dart';

Future OtpSendFunc(context, phone, User_Id_Forget_Pass) async {
  final Contact_No_visibility_provider =
      Provider.of<Contact_No_Visibility_Provider>(context, listen: false);
  final OTP_Validation_provider =
      Provider.of<Otp_Validation_Status_Provider>(context, listen: false);
  late String _verificationCode;

  Contact_No_visibility_provider.Forget_Change_Password_Screen_Navigation_Func(
      "2");
  // FirebaseAuth.instance.setSettings(appVerificationDisabledForTesting: true);
  await FirebaseAuth.instance.verifyPhoneNumber(
    phoneNumber: ("+92$phone"),
    verificationCompleted: (PhoneAuthCredential credential) async {
      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) async {
        if (value.user != null) {
//remove
          // Navigator.pushReplacement(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => ForgetChangePasswordScreen(
          //             User_Id_Forget_Pass: User_Id_Forget_Pass)));
        }
      });
    },
    verificationFailed: (FirebaseAuthException e) {
      Contact_No_visibility_provider
          .Forget_Change_Password_Screen_Navigation_Func("3");
      Contact_No_visibility_provider.Otp_Send_Status_Func("failed");
      print(e.message);
      // ScaffoldMessenger.of(context)
      //     .showSnackBar(SnackBar(content: Text("verification Failed.")));
    },
    codeSent: (String verficationID, int? resendToken) {
      // setState(() {
      _verificationCode = verficationID;
      Contact_No_visibility_provider
          .Forget_Change_Password_Screen_Navigation_Func("3");
      //FOr OTP Status
      Contact_No_visibility_provider.Otp_Send_Status_Func("send");
      // otp validation initial
      OTP_Validation_provider.OTP_Validation_Func("initial");
      // Timer(Duration(seconds: 5), (){
      //   print("Duration hit 5 sec");
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => OtpScreen2(
                    phone: phone,
                    User_Id_Forget_Pass: User_Id_Forget_Pass,
                    Otp_verification_code: verficationID,
                  )));

      // ScaffoldMessenger.of(context)
      //     .showSnackBar(SnackBar(content: Text('code sent section.')));
      // });
    },
    codeAutoRetrievalTimeout: (String verificationID) {
      // setState(() {
      _verificationCode = verificationID;
      // });
    },
    timeout: Duration(seconds: 100),
    // forceResendingToken: _resendToken
  );
}
