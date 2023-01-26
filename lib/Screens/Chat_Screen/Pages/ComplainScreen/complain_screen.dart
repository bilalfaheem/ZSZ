import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zsz/Constant.dart';
import 'package:zsz/Models/Notification_History_Model/notification_history_model/notification_history_model.dart';
import 'package:zsz/Screens/Chat_Screen/Pages/ComplainScreen/AlertBox/generate_complain.dart';
import 'package:zsz/Screens/Chat_Screen/Pages/ComplainScreen/Function/complain_list_func.dart';
import 'package:zsz/Screens/Chat_Screen/Pages/ComplainScreen/Tile/complain_tile.dart';
import 'package:zsz/Screens/Notification_Screen/Tile/Notification_Tile/noti_history_tile.dart';
import 'package:zsz/Widgets/Heading_Bar/PopHeadingBar.dart';

class ComplainScreen extends StatelessWidget {
   ComplainScreen({super.key});

  TextEditingController chatSearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 15,right: 10),
        child: FloatingActionButton(
        onPressed: (){
          generateComplain(context, size.height, size.width, theme, "Tanker_Type", "Order_Id");
        },
        // isExtended: true,
        
        backgroundColor: theme.primaryColor,
        shape:CircleBorder(),
        child: Icon(Icons.add,size: 28,),
        // foregroundColor: theme.primaryColor,
        ),
      ),
      body:SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              size.width * padding_horizontal,
              size.height * padding_top,
              size.width * padding_horizontal,
              size.height * padding_bottom),
          child: Column(
            children: [
              //heading
              Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, size.height * 0.038),
                  child: PopHeadingBar(context, "Complain", 22, "null")),
             StreamBuilder(
                            stream: complainListFunc(context, User_Login_id_S.toString()).asStream(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Column(
                                  children: [
                                    SizedBox(
                                      height: size.height / 3.7,
                                    ),
                                   const Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                );
                              }
                              else {
                                return Container(
                                  child: ListView.builder(
                                      reverse: true,
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: complainList.length,
                                      itemBuilder: (context, index) {
                                         final indexx = complainList[index];
                                        return complainTile(context,size, theme, indexx.reason, indexx.status);
                                      }),
                                );
                              }
                            }),
              // Container(
              //   child: TextField(
              //     controller: chatSearchController,
              //     decoration: InputDecoration(
              //       suffixIcon: Icon(Icons.search),
              //       fillColor: Colors.black.withOpacity(0.2)
              //     ),
              //   ),
              // ),
            
              complainTile(context,size, theme, "maintenance","pending..."),
              complainTile(context,size, theme, "tanker","complete")
             
                  ])
      )),
    ));
  }
}


