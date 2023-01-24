import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zsz/Functions/LogoutCheck/LogoutCheckFunc.dart';
import 'package:zsz/Screens/Profile_Screen/Tile/Profile_Tile.dart';
import 'package:zsz/Screens/Profile_Screen/functions/profile_get_api_func.dart';
import 'package:zsz/Screens/Setting/Screen/setting_screen.dart';
import 'package:zsz/Widgets/Heading_Bar/PopHeadingBar.dart';
import 'package:zsz/responsive.dart';
import 'package:zsz/Constant.dart';

class Profile_Screen extends StatelessWidget {
  const Profile_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final _size = MediaQuery.of(context).size;
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                    margin: EdgeInsets.fromLTRB(0, 0, 0, _size.height * 0.038),
                    child: PopHeadingBar(context, "Profile", 22, "null")),
                // IconButton(onPressed: (){

                // }, icon: Icon(Icons.menu)),

                //profile image

                Center(
                    child: CircleAvatar(
                  backgroundColor: theme.primaryColorDark,
                  radius: _size.height * 0.07,
                  // backgroundImage: AssetImage("assets/Bottom_Bar/Profile.png"),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 8),
                    child: Image.asset(
                      logo2, height: _size.height * 0.1,
                      color: Colors.white,
                      // width: _size.width * 0.5,
                    ),
                  ),
                )),
                StreamBuilder(
                    stream:
                        Active_User_Func(User_Login_id_S.toString(), context)
                            .asStream(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Profile_Tile(
                            _size,
                            theme,
                            User_Login_name_S.toString().toUpperCase(),
                            "....",
                            ".....",
                            "$User_Login_Address_S",
                            "$User_Login_Society_S");
                      } else if (snapshot.hasData) {
                        return Profile_Tile(
                            _size,
                            theme,
                            Active_User_List[0]
                                .fullName
                                .toString()
                                .toUpperCase(),
                            User_login_Cnic,
                            // Active_User_List[0].ownerCnic.toString(),
                            Active_User_List[0].contact.toString(),
                            Active_User_List[0].address.toString(),
                            "$User_Login_Society_S");
                      } else {
                        return Profile_Tile(_size, theme, ".....", ".....",
                            ".....", ".....", "......");
                      }
                    }),

                // //Log Out
                // Container(
                //     height: MediaQuery.of(context).size.height * 0.07,
                //     width: MediaQuery.of(context).size.width * 0.7,
                //     margin: EdgeInsets.fromLTRB(
                //         0, _size.height * 0.05, 0, _size.height * 0.08),
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(100),
                //         color: Colors.amber),
                //     child: ElevatedButton(
                //         style: ElevatedButton.styleFrom(
                //             primary: theme.primaryColor,
                //             shape: RoundedRectangleBorder(
                //                 borderRadius: BorderRadius.circular(30))),
                //         onPressed: () {
                //           Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //                 builder: (context) => Setting_screen()),
                //           );
                //         },
                //         child: Text("Settings",
                //             style: GoogleFonts.ubuntu(
                //                 fontSize:
                //                     MediaQuery.of(context).size.height * 0.04,
                //                 color: Colors.white)))),
                Container(
                    margin:
                        EdgeInsets.only(top: height(50), bottom: height(20)),
                    height: height(53),
                    width: width(260),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.amber),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: theme.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Setting_screen()),
                          );
                          LogoutCheckFunc(User_Login_id_S, context);
                        },
                        child: LayoutBuilder(builder:
                            (BuildContext context, BoxConstraints constraints) {
                          return Text(
                              // constraints.maxWidth.toStringAsFixed(2),
                              "Settings",
                              style: GoogleFonts.ubuntu(
                                  fontSize: constraints.maxHeight * 0.4,
                                  // width(30),
                                  // MediaQuery.of(context).size.height * 0.04,
                                  color: theme.cardColor));
                        }))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
