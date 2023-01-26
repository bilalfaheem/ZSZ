import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:zsz/Constant.dart';
import 'package:zsz/responsive.dart';
import 'package:zsz/Functions/Internet/Internet.dart';
import 'package:zsz/Screens/Login_Screen/Provider/society_name_visibility_provider.dart';
import 'package:zsz/Screens/Login_Screen/functions/login_post_api_func.dart';
import 'package:zsz/Screens/Login_Screen/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zsz/responsive.dart';

class Splash_Screen extends StatelessWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    SizeConfig().init(context);
    final Society_Name_Visibility_provider =
        Provider.of<SocietyNameVisibilityProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: height(100)),
              child: Center(
                child: Image.asset(
                  zszlogo,
                  width: width(250),

                  // height: height(75)
                  // width: MediaQuery.of(context).size.width * 0.7,
                  // height: MediaQuery.of(context).size.height * 0.16,
                ),
              ),
            ),
            Container(
                height: height(53),
                // MediaQuery.of(context).size.height * 0.07,
                width: width(260),
                // MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.amber),
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: theme.primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      onPressed: () {
                        //                   await Permission.notification.isDenied.then((value) {
                        //   if (value) {
                        //     Permission.notification.request();
                        //   }
                        // });
                        Society_Name_Visibility_provider
                            .SocietyNameVisibilityStatus_Func(false);
                        // Login_validation_false();
                        connectivity_status_func(context);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Login_Screen()),
                        );
                      },
                      child: Text("Lets Start",
                          style: GoogleFonts.ubuntu(
                              fontSize: constraints.maxHeight * 0.4,
                              // MediaQuery.of(context).size.height * 0.04,
                              color: theme.cardColor)));
                })),
          ],
        ),
      ),
    );
  }
}
