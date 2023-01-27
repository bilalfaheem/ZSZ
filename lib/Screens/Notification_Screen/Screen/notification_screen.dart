import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zsz/Screens/Notification_Screen/Functions/noti_history_fetch_api_func.dart';
import 'package:zsz/Screens/Notification_Screen/Tile/Notification_Tile/noti_history_tile.dart';
import 'package:zsz/Theme/theme.dart';
import 'package:zsz/Widgets/Heading_Bar/PopHeadingBar.dart';
import 'package:zsz/Constant.dart';

class Notification_Screen extends StatelessWidget {
  const Notification_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final _size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        body: SafeArea(
          child: Scrollbar(
            isAlwaysShown: false,
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
                        margin:
                            EdgeInsets.fromLTRB(0, 0, 0, _size.height * 0.038),
                        child: PopHeadingBar(
                            context, "Notifications", 20, "Back")),
                    //remove
                    Container(
                        child: StreamBuilder(
                            stream: Noti_History_Api_Function(
                                    userLoginIdShared.toString())
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
                              } else {
                                return Container(
                                  child: ListView.builder(
                                      reverse: true,
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: Noti_History_List.length,
                                      itemBuilder: (context, index) {
                                        return NotiHistoryTile(
                                            Noti_History_List[index]
                                                .type
                                                .toString(),
                                            Noti_History_List[index]
                                                .message
                                                .toString(),
                                            Noti_History_List[index]
                                                .createdAt
                                                .toString());
                                        //  Notification_Tile(true, Noti_History_List[index].message.toString(), Noti_History_List[index].type.toString());
                                        // noto(false);
                                      }),
                                );
                              }
                            })),
                    // Container(height: 100,color: Colors.amber,),
                    //  Notification_Tile(true,"Your Dues are Pending"),
                    //  Notification_Tile(false, "Your Dues Have been Paid"),

                    //  Notification_Tanker_Tile(false),
                    //  Notification_Tanker_Tile(true),
                    //  Notification_History_Tile(false),
                    // noto(false),
                    // noto(true)
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
