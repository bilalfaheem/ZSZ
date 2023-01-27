// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:zsz/Screens/Billing_Screen/Screen/billing_screen.dart';
import 'package:zsz/Screens/Chat_Screen/Pages/ComplainScreen/complain_screen.dart';
import 'package:zsz/Screens/Detail_Screen/detail_screen.dart';
import 'package:zsz/Screens/Login_Screen/login_screen.dart';
import 'package:zsz/Screens/Orders_Screen/Screen/orders_screen.dart';
import 'package:zsz/Screens/Profile_Screen/screen/profile_screen.dart';
import 'package:zsz/Screens/Sign_Up_Screen/sign_up_screen.dart';
import 'package:zsz/Theme/theme.dart';

//         currentTheme.changeTheme();

class Home_Screen extends StatefulWidget {
  Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  int currentIndex = 1;
  final screens = [
    Billing_Screen(),
    // Sign_Up_Screen(),
    Orders_Screen(),
     ComplainScreen(),
    Profile_Screen()
  ];

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final _size = MediaQuery.of(context).size;
    return Scaffold(
        body: screens[currentIndex],

        //bottom bar

        bottomNavigationBar: Container(
            // height: 90,
            // _size.height * 0.08,
            decoration: BoxDecoration(
              // color: Colors.blue,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(0), topLeft: Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black38, spreadRadius: 0, blurRadius: 10),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: BottomNavigationBar(
                // backgroundColor: Colors.amber,
                type: BottomNavigationBarType.fixed,
                currentIndex: currentIndex,
                onTap:
                    //  (index) {
                    //   if (index == 0) {
                    //     return;
                    //   } else {
                    //     setState(() {
                    //       currentIndex = index;
                    //     });
                    //   }
                    // },
                    (index) => setState(() => currentIndex = index),
                showSelectedLabels: false,
                showUnselectedLabels: false,
                selectedItemColor: theme.primaryColor,
                //unselectedItemColor: Colors.grey,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    // backgroundColor: Colors.blueGrey,
                    icon: ImageIcon(AssetImage("assets/Icons/credit_card3.png"),
                        // "assets/Bottom_Bar/Wallet.png"),
                        //color: Colors.black,
                        size: _size.height * 0.03),

                    label: '',
                  ),
                  // BottomNavigationBarItem(
                  //   icon: ImageIcon(AssetImage("assets/Bottom_Bar/Wallet.png"),
                  //       size: _size.height * 0.03),
                  //   label: '',
                  // ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/Icons/Tanker.png"),

                        // assets/Bottom_Bar/Clock.png"),
                        size: _size.height * 0.04),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/Icons/chat.png"),

                        // assets/Bottom_Bar/Clock.png"),
                        size: _size.height * 0.03),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/Bottom_Bar/Profile.png"),
                        size: _size.height * 0.025),
                    label: '',
                  ),
                ],
              ),
            )));
  }
}
