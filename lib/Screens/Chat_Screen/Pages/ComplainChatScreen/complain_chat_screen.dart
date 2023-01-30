import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zsz/Constant.dart';
import 'package:zsz/Screens/Chat_Screen/Fucntion/fetch_chat.dart';
import 'package:zsz/Screens/Chat_Screen/Fucntion/send_msg.dart';
import 'package:zsz/Screens/Chat_Screen/Pages/ComplainChatScreen/Widget/chat_header_widget.dart';

class ComplainChatScreen extends StatelessWidget {
  String complainType,complainStatus,threadId;
  ComplainChatScreen({required this.complainType,required this.complainStatus, required this.threadId});

  StreamController _postsController = StreamController();
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController msgController = TextEditingController();
  //   showSnack() {
  //   return scaffoldKey.currentState.showSnackBar(
  //     SnackBar(
  //       content: Text('New content loaded'),
  //     ),
  //   );
  // }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
         chatHeaderWidget(context, size, theme, complainType, complainStatus),
        Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            StreamBuilder(
                        stream: fetchChat(threadId).asStream(),
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
                                  itemCount: chatHistoryList.length,
                                  itemBuilder: (context, index) {
                                    final indexx = chatHistoryList[index];
                                    return
                                    chatBubble(theme, indexx.type.toString(), indexx.message.toString());
                                    //  complainTile(context, size, theme,
                                    //     indexx.reason, indexx.status);
                                  }),
                            );
                          }
                        }),
            // chatBubble(theme, "user", "hello its me"),
            // chatBubble(theme, "admin",
            //     "hello from the other side hello from the other side hello from the other side"),
            // chatBubble(theme, "user",
            //     "hello from the other side hello from the other from the other "),
            // chatBubble(theme, "user", "hello its me"),
          ],
        ),
        Spacer(),
        Container(
    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    decoration: BoxDecoration(
        color: theme.primaryColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(20))),
    child: Row(
      children: [
        // Expanded(
        //   child: TextField(
        //     decoration: InputDecoration(
        //       hintText: "Message..."
        //     ),
        //   ),
        // ),
        Container(
            // height: 40,
            // width: 200,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10)),
            child: Image.asset(
              file,
              height: 25,
            )),
        Container(
            // height: 40,
            margin: EdgeInsets.symmetric(horizontal: 5),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10)),
            child: Image.asset(galleryIcon, height: 25)),
        Flexible(
          fit: FlexFit.loose,
          child: Container(
            // height: 40,
            // width: 200,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10)),
            child: TextField(
              controller: msgController,
              minLines: 1,
              maxLines: 4,
              style: GoogleFonts.ubuntu(fontSize: 16, color: Colors.white),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Message...",
                  contentPadding: EdgeInsets.symmetric(horizontal: 8)),
            ),
          ),
        ),
        GestureDetector(
          onTap: (() {
            if(msgController.text.isNotEmpty){
              print("msggggggg");
              print(msgController.text);
            sendMsg(threadId, msgController.text);}
          }),
          child: Container(
              // height: 40,
              margin: EdgeInsets.only(left: 5),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10)),
              child: Image.asset(
                send,
                height: 25,
              )),
        ),
      ],
    ),
  )
      ],
    )));
  }
}

Widget chatBubble(theme, String msgType, String text) {
  return Row(
    mainAxisAlignment:
        msgType == "user" ? MainAxisAlignment.end : MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
          margin: EdgeInsets.symmetric(horizontal: 7),
          // margin: EdgeInsets.fromLTRB(size.width * 0.03,
          //     size.width * 0.027, size.width * 0.1, size.width * 0.027),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: msgType == "admin" ? Colors.grey : Colors.transparent,
              shape: BoxShape.circle),
          child: Image.asset(zsz,
              height: 15,
              color: msgType == "admin" ? null : Colors.transparent,
              fit: BoxFit.contain)),
      Flexible(
        fit: FlexFit.loose,
        child: Container(
          margin: EdgeInsets.only(
              bottom: 10,
              right: msgType == "admin" ? 30 : 8,
              left: msgType == "user" ? 30 : 0),
          // left: msgType == "user"?30:0),
          padding: EdgeInsets.all(13),
          decoration: BoxDecoration(
              color: msgType == "admin"
                  ? theme.primaryColor
                  : Color.fromARGB(255, 208, 205, 205),
              borderRadius: BorderRadius.only(
                  topRight: msgType == "admin"
                      ? Radius.circular(20)
                      : Radius.circular(0),
                  topLeft: msgType == "user"
                      ? Radius.circular(20)
                      : Radius.circular(0),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          child: Text(
            "$text",
            style: TextStyle(fontSize: 17, color: Colors.white),
          ),
        ),
      ),
    ],
  );
}

// Widget typeMsg(theme,threadId) {
//   TextEditingController msgController = TextEditingController();
//   return Container(
//     padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//     decoration: BoxDecoration(
//         color: theme.primaryColor,
//         borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(10), topRight: Radius.circular(20))),
//     child: Row(
//       children: [
//         // Expanded(
//         //   child: TextField(
//         //     decoration: InputDecoration(
//         //       hintText: "Message..."
//         //     ),
//         //   ),
//         // ),
//         Container(
//             // height: 40,
//             // width: 200,
//             padding: EdgeInsets.all(5),
//             decoration: BoxDecoration(
//                 color: Colors.white.withOpacity(0.2),
//                 borderRadius: BorderRadius.circular(10)),
//             child: Image.asset(
//               file,
//               height: 25,
//             )),
//         Container(
//             // height: 40,
//             margin: EdgeInsets.symmetric(horizontal: 5),
//             padding: EdgeInsets.all(5),
//             decoration: BoxDecoration(
//                 color: Colors.white.withOpacity(0.2),
//                 borderRadius: BorderRadius.circular(10)),
//             child: Image.asset(galleryIcon, height: 25)),
//         Flexible(
//           fit: FlexFit.loose,
//           child: Container(
//             // height: 40,
//             // width: 200,
//             decoration: BoxDecoration(
//                 color: Colors.white.withOpacity(0.2),
//                 borderRadius: BorderRadius.circular(10)),
//             child: TextField(
//               controller: msgController,
//               minLines: 1,
//               maxLines: 4,
//               style: GoogleFonts.ubuntu(fontSize: 16, color: Colors.white),
//               decoration: InputDecoration(
//                   border: InputBorder.none,
//                   hintText: "Message...",
//                   contentPadding: EdgeInsets.symmetric(horizontal: 8)),
//             ),
//           ),
//         ),
//         GestureDetector(
//           onTap: (() {
//             if(msgController.text.isNotEmpty){
//             sendMsg(threadId, msgController.text);}
//           }),
//           child: Container(
//               // height: 40,
//               margin: EdgeInsets.only(left: 5),
//               padding: EdgeInsets.all(5),
//               decoration: BoxDecoration(
//                   color: Colors.white.withOpacity(0.2),
//                   borderRadius: BorderRadius.circular(10)),
//               child: Image.asset(
//                 send,
//                 height: 25,
//               )),
//         ),
//       ],
//     ),
//   );
// }
