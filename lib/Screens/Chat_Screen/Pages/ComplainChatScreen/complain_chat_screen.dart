import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:zsz/Constant.dart';
import 'package:zsz/Screens/Chat_Screen/Pages/ComplainChatScreen/Widget/chat_header_widget.dart';
import 'package:zsz/Screens/Chat_Screen/Pages/ComplainScreen/Tile/complain_tile.dart';

class ComplainChatScreen extends StatelessWidget {
  const ComplainChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Scaffold(
        body: SafeArea(
            child: Column(
              children: [
                chatHeaderWidget(context, size, theme, "complainType", "status"),
                SingleChildScrollView(
                    child: Padding(
      padding: EdgeInsets.fromLTRB(
          size.width * padding_horizontal,
          size.height * padding_top,
          size.width * padding_horizontal,
          size.height * padding_bottom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // chatHeaderWidget(context, size, theme, "complainType", "status"),
          Container(
            padding: EdgeInsets.all(13),
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)) )    ,
              child: Text("data",style: TextStyle(fontSize: 17,color: Colors.white),),
          )
        ],
      ),
    )),
              ],
            )));
  }
}
