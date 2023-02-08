import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zsz/Constant.dart';
import 'package:zsz/Screens/Chat_Screen/Pages/ComplainScreen/AlertBox/generate_complain.dart';
import 'package:zsz/Screens/Chat_Screen/Pages/ComplainScreen/Function/complain_list_func.dart';
import 'package:zsz/Screens/Chat_Screen/Pages/ComplainScreen/Provider/complain_screen_provider.dart';
import 'package:zsz/Screens/Chat_Screen/Pages/ComplainScreen/Tile/complain_tile.dart';
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
          margin: EdgeInsets.only(bottom: 15, right: 10),
          child: FloatingActionButton(
            onPressed: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => Fun(),));
              generateComplain(context, size.height, size.width, theme,
                  "Tanker_Type", "Order_Id");
            },
            // isExtended: true,

            backgroundColor: theme.primaryColor,
            shape: CircleBorder(),
            child: Icon(
              Icons.add,
              size: 28,
            ),
            // foregroundColor: theme.primaryColor,
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      size.width * padding_horizontal,
                      size.height * padding_top,
                      size.width * padding_horizontal,
                      size.height * padding_bottom),
                  child: Column(children: [
                    //heading
                    Container(
                        margin:
                            EdgeInsets.fromLTRB(0, 0, 0, size.height * 0.038),
                        child: PopHeadingBar(context, "Complaint", 22, "null")),
                    Consumer<ComplainScreenProvider>(
                      builder: (context,value,child) {
                        return StreamBuilder(
                            stream: complainListFunc(
                                    context, userLoginIdShared.toString())
                                .asStream(),
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
                              } else {
                                return Container(
                                  child: ListView.builder(
                                      reverse: true,
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: complainList.length,
                                      itemBuilder: (context, index) {
                                        final indexx = complainList[index];
                                        return complainTile(context, size, theme,
                                            indexx.reason, indexx.status,indexx.id,indexx.count);
                                      }),
                                );
                              }
                            });
                      }
                    ),
                    // Container(
                    //   child: TextField(
                    //     controller: chatSearchController,
                    //     decoration: InputDecoration(
                    //       suffixIcon: Icon(Icons.search),
                    //       fillColor: Colors.black.withOpacity(0.2)
                    //     ),
                    //   ),
                    // ),

                    // complainTile(context,size, theme, "maintenance","pending..."),
                    // complainTile(context,size, theme, "tanker","complete")
                  ]))),
        ));
  }
}
