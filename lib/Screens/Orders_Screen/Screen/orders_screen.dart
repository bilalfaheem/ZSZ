



import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:zsz/Functions/Push_Notification/Function/NotificationCount/NotiCountApiFunc.dart';
import 'package:zsz/Functions/Push_Notification/Notification.dart';
import 'package:zsz/Functions/Shared_Pref_Login_Id_func/shared_Pref_Login_Id_func.dart';
import 'package:zsz/Provider/Notification_Icon_Provider/notification_icon_provider.dart';
import 'package:zsz/Screens/Notification_Screen/Screen/notification_screen.dart';
import 'package:zsz/Screens/Orders_Screen/Pages/Order/Pages/Order_Details/function/driver_suggestion_func.dart';
import 'package:zsz/Screens/Orders_Screen/Pages/Order/Pages/order.dart';
import 'package:zsz/Screens/Orders_Screen/Pages/Order_History/order_history.dart';
import 'package:zsz/Constant.dart';
import 'package:zsz/Widgets/Tab_Button/tab_button.dart';
import 'package:zsz/main.dart';
import 'package:zsz/responsive.dart';

class Orders_Screen extends StatefulWidget {
  Orders_Screen({Key? key}) : super(key: key);

  @override
  State<Orders_Screen> createState() => _Orders_ScreenState();
}

class _Orders_ScreenState extends State<Orders_Screen> {
  NotificationsService2 notificationsService = NotificationsService2();
  var order_object = Order();
  final Order order_screen_var = new Order();

  int _selectPage = 0;
  PageController? _pageControle;

  void _changePage(int pageNumber) {
    setState(() {
      _selectPage = pageNumber;
      _pageControle?.animateToPage(
        pageNumber,
        duration: Duration(milliseconds: 1000),
        curve: Curves.fastLinearToSlowEaseIn,
      );
    });
  }

  @override
  void initState() {
    _pageControle = PageController();
    notificationsService.initialiseNotifications();

// Login Id Initialize
    Shared_Pref_Login_Id_Func();

    // notification count
    Notification_Count_Function(context);
    Driver_All_Func();

    super.initState();
  }

  @override
  void dispose() {
    _pageControle?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(
        "Order_Screen Builddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd");
    final Notification_Provider =
        Provider.of<Notification_Icon_Provider>(context);
    final ThemeData theme = Theme.of(context);
    final _size = MediaQuery.of(context).size;
    SizeConfig().init(context);
    print("${_size.height} height history");
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              _size.width * padding_horizontal,
              _size.height * padding_top,
              _size.width * padding_horizontal,
              _size.height * padding_bottom),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //heading

              // //heading
              // Container(
              //   margin: EdgeInsets.fromLTRB(0, 0, 0, _size.height * 0.038),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       // IconButton(
              //       //     onPressed: () {
              //       //       Navigator.pop(context);
              //       //     },
              //       //     icon: Icon(Icons.arrow_back_ios)),
              //       // SizedBox(width: _size.width * 0.205),
              //       Center(
              //         child: Text(
              //           "My Orders",
              //           style: GoogleFonts.ubuntu(
              //               fontSize: MediaQuery.of(context).size.height * 0.029,
              //               color: theme.focusColor),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              //remove
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, _size.height * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      //  color: Colors.amber,
                      child: Stack(clipBehavior: Clip.none, children: [
                        IconButton(
                            onPressed: null,
                            icon:
                                Image.asset("assets/Icons/notification_on.png",
                                    // height: _size.width*0.6,
                                    color: Colors.transparent)),
                      ]),
                    ),
                    Text(
                      "My Orders",
                      style: GoogleFonts.ubuntu(
                          fontSize: height(21), color: theme.focusColor),
                    ),

                    Container(
                      //  color: Colors.amber,
                      child: Stack(clipBehavior: Clip.none, children: [
                        IconButton(
                            onPressed: () {
                            //  await callbackDispatcher2();
                              
                             
                              //  notificationsService.sendNotification("noto", "Chl gya");
                              // // Notification Count Seen
                              // Notification_Seen_Count_Function(context);                         //remove

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Notification_Screen()),
                              );
                            },
                            icon: Image.asset(
                              "assets/Icons/notification_on.png",
                              // height: _size.width*0.6,
                              color: theme.primaryColor,
                            )),
                        Consumer<Notification_Icon_Provider>(
                            builder: (context, value, child) {
                          print(
                              "notificationnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn bell change");
                          return value.current_notification == "0"
                              ? Container()
                              : Positioned(
                                  right: _size.width * 0.017,
                                  bottom: _size.width * 0.072,
                                  child: Container(
                                    padding:
                                        EdgeInsets.all(_size.width * 0.003),
                                    width: _size.width * 0.08,
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        shape: BoxShape.circle),
                                    child: Center(
                                        child: AutoSizeText(
                                      value.current_notification.toString(),
                                      maxLines: 1,
                                      style: GoogleFonts.ubuntu(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02,
                                          color: Colors.white),
                                    )),
                                  ));
                        })
                      ]),
                    )

                    // Icons.notifications
                    // ))
                  ],
                ),
              ),

              // Container(
              //   margin: EdgeInsets.fromLTRB(0, 0, 0, _size.height * 0.02),
              //   child: Center(
              //     child: Text(
              //       "My Orders",
              //       style: GoogleFonts.ubuntu(
              //           fontSize: MediaQuery.of(context).size.height * 0.029,
              //           color: theme.focusColor),
              //     ),
              //   ),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TabButton(
                      text: "Orders",
                      selectedPage: _selectPage,
                      pageNumber: 0,
                      onPressed: () {
                        // Notification_Count_Function(context);
                        _changePage(0);
                      }),
                  TabButton(
                      text: "Order History",
                      selectedPage: _selectPage,
                      pageNumber: 1,
                      onPressed: () {
                        // Notification_Count_Function(context);
                        _changePage(1);
                      })
                ],
              ),

              //search bar
              // Container(
              //   margin: EdgeInsets.only(top: _size.height * 0.03),
              //   padding: EdgeInsets.all(_size.width * 0.01),
              //   height: _size.height * 0.05,
              //   width: _size.width / 1.2,
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(_size.height * 0.9),
              //       color: theme.dividerColor),
              //   child: Center(
              //     child: TextField(
              //       decoration: InputDecoration(
              //         border: InputBorder.none,
              //         prefixIcon: Image.asset("assets/Icons/Search.png",
              //             width: 20,
              //             // _size.width * 0.01,
              //             height: 20
              //             // _size.height * 0.01,
              //             ),
              //       ),
              //     ),
              //   ),
              // ),

              //Page view

              Expanded(
                child: PageView(
                  onPageChanged: (int page) {
                    setState(() {
                      _selectPage = page;
                    });
                  },
                  controller: _pageControle,
                  children: const [
                    //Active Orders

                    Order(),

                    //Order History
                    Order_History()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
