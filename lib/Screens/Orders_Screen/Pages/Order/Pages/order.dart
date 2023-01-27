import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:zsz/Functions/LogoutCheck/LogoutCheckFunc.dart';
import 'package:zsz/Functions/Push_Notification/Notification.dart';
import 'package:zsz/Provider/Left_Tanker_Count_Provider/left_tanker_count_provider.dart';
import 'package:zsz/Provider/Order_screen_refresh_provider.dart/order_screen_refresh_provider.dart';
import 'package:zsz/Screens/Orders_Screen/Pages/Order/Order_Dialog_Box/order_type_dialog_box.dart';
import 'package:zsz/Screens/Orders_Screen/Pages/Order/functions/order_fetch_api_func.dart';
import 'package:zsz/Screens/Orders_Screen/Tile/order_tile.dart';
import 'package:zsz/Constant.dart';
import 'package:zsz/main.dart';

class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
// void order_screen_refresh(){
//   Timer(Duration(seconds: 2), (){
//     print("Order screen refreshhhhhhhhh");

//     setState(() {

//     });

//   });
// }

//  @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     if(order_screen_refresh_status == true){
//       order_screen_refresh();
//       order_screen_refresh_status = false;
//     }
//     else{}
//   }

  @override
  Widget build(BuildContext context) {
    print("build");
    final ThemeData theme = Theme.of(context);
    final _size = MediaQuery.of(context).size;
    print("${_size.height} height");
    return Scaffold(
        body: Container(
      width: _size.width,
      height: _size.height,
      child: Stack(
        children: [
          Container(
            // height: _size.height,
            child: SingleChildScrollView(
              child: Container(
                  margin: EdgeInsets.only(bottom: _size.width * 0.13),
                  child: Consumer<Order_Screen_refresh_provider>(
                      builder: (context, value, child) {
                    return Column(
                      children: [
                        StreamBuilder(
                            stream: Active_Order_Function(
                                    userLoginIdShared.toString(), context)
                                .asStream(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Column(
                                  children: [
                                    SizedBox(
                                      height: _size.height / 3.7,
                                    ),
                                    Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                );
                              }

                              // else if ( InternetConnectionChecker().hasConnection == false) {
                              //   return Center(child: Text("connection state None"));
                              // }
                              else {
                                return Container(
                                  child: ListView.builder(
                                      reverse: true,
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: Active_Order_List.length,
                                      itemBuilder: (context, index) {
                                        return Order_tile(
                                            Active_Order_List[index]
                                                .orderId
                                                .toString(),
                                            Active_Order_List[index]
                                                .fullName
                                                .toString(),
                                            Active_Order_List[index]
                                                .address
                                                .toString(),
                                            Active_Order_List[index]
                                                .createdAt
                                                .toString(),
                                            Active_Order_List[index]
                                                .status
                                                .toString(),
                                            Active_Order_List[index]
                                                .createdAt
                                                .toString(),
                                            Active_Order_List[index]
                                                .type
                                                .toString(),
                                            Active_Order_List[index]
                                                .deliveryAt
                                                .toString(),
                                            " Expected\n Delivery",
                                            0.0);
                                      }),
                                );
                              }
                            })
                        // order_History_Tile(_size.height, theme),
                      ],
                    );
                  })
                  //     Column(
                  //   children: [
                  //     StreamBuilder(
                  //         stream: Active_Order_Function(userLoginIdShared.toString())
                  //             .asStream(),
                  //         builder: (context, snapshot) {
                  //           if (snapshot.connectionState ==
                  //               ConnectionState.waiting) {
                  //             return Column(
                  //               children: [
                  //                 SizedBox(
                  //                   height: _size.height / 3.7,
                  //                 ),
                  //                 Center(
                  //                   child: CircularProgressIndicator(
                  //                     color: Colors.black,
                  //                   ),
                  //                 ),
                  //               ],
                  //             );
                  //           }

                  //           // else if ( InternetConnectionChecker().hasConnection == false) {
                  //           //   return Center(child: Text("connection state None"));
                  //           // }
                  //           else {
                  //             return Container(
                  //               child: ListView.builder(
                  //                   shrinkWrap: true,
                  //                   physics: NeverScrollableScrollPhysics(),
                  //                   itemCount: Active_Order_List.length,
                  //                   itemBuilder: (context, index) {
                  //                     return Order_tile(
                  //                         Active_Order_List[index]
                  //                             .orderId
                  //                             .toString(),
                  //                         Active_Order_List[index]
                  //                             .fullName
                  //                             .toString(),
                  //                         Active_Order_List[index]
                  //                             .unitNo
                  //                             .toString(),
                  //                         Active_Order_List[index]
                  //                             .createdAt
                  //                             .toString(),
                  //                         Active_Order_List[index]
                  //                             .status
                  //                             .toString(),
                  //                         Active_Order_List[index]
                  //                             .createdAt
                  //                             .toString(),
                  //                         Active_Order_List[index].type.toString(),
                  //                         Active_Order_List[index]
                  //                             .deliveryAt
                  //                             .toString());
                  //                   }),
                  //             );
                  //           }
                  //         })
                  //     // order_History_Tile(_size.height, theme),
                  //   ],
                  // )
                  ),
            ),
          ),
          Positioned(
            bottom: _size.height * 0,
            right: _size.width * 0.00,
            child:
                //about
                Container(

                    // height: _size.height * 0.055,
                    // width: _size.width * 0.8,
                    //  padding: EdgeInsets.all(_size.height * 0.011),
                    // margin: EdgeInsets.fromLTRB(0, _size.height * 0.05, 0, 0),
                    padding: EdgeInsets.only(left: _size.width * 0.01),
                    // padding: EdgeInsets.zero,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: theme.primaryColor, width: 1.4),
                        borderRadius: BorderRadius.circular(_size.width * 0.15),
                        color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: _size.height * 0.008,
                              horizontal: _size.width * 0.02),
                          // color: Colors.amber,
                          child: Row(
                            children: [
                              Text("Tanker Left: ",
                                  style: GoogleFonts.ubuntu(
                                      fontSize: _size.width * 0.038,
                                      color: theme.primaryColor,
                                      fontWeight: FontWeight.w400)),

                              // Consumer Left Taanker
                              Consumer<Left_Tanker_Count_Provider>(
                                  builder: (context, value, child) {
                                return Text(value.left_tanker_count,
                                    style: GoogleFonts.ubuntu(
                                        fontSize: _size.width * 0.043,
                                        color: theme.primaryColor,
                                        fontWeight: FontWeight.bold));
                              }),
                            ],
                          ),
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                // backgroundColor: theme.primaryColor,
                                primary: theme.primaryColor,
                                //  elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        _size.width * 0.15))),
                            onPressed: () {
                              //   FlutterLocalNotificationsPlugin flp = FlutterLocalNotificationsPlugin();
                              // flp.show(12522, "title", "body",
                              //  NotificationDetails(android: AndroidNotificationDetails("12522", "channel Name",importance: Importance.high)));
                              // show_General_Notification("msg", flp);
                              //remove
                              Order_Type_dialog_box(
                                  context, _size.height, _size.width, theme);
                              LogoutCheckFunc(userLoginIdShared, context);
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: _size.height * 0.011,
                                  horizontal: _size.width * 0.02),
                              child: Text("Request Tanker",
                                  style: GoogleFonts.ubuntu(
                                      fontSize: _size.width * 0.04,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400)),
                            )),
                      ],
                    )),
            //  InkWell(
            //   onTap: (() {
            //     Order_Type_dialog_box(
            //         context, _size.height, _size.width, theme);
            //     // Order_dialog_box(context, _size.height, _size.width, theme);
            //     print("Request Bowser Pressed");
            //   }),
            //   child: Container(
            //     padding: EdgeInsets.all(_size.height * 0.011),
            //     decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(_size.height * 0.02),
            //         color: Color.fromARGB(255, 84, 172, 96)),
            //     child:

            //      Text("Request Tanker",
            //         style: GoogleFonts.ubuntu(
            //             fontSize: _size.height * 0.03, color: Colors.white)),
            //   ),
            // )
          )
        ],
      ),
    ));
  }
}
