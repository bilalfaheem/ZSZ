import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zsz/Constant.dart';
import 'package:zsz/Screens/Chat_Screen/Fucntion/fetch_chat.dart';
import 'package:zsz/Screens/Chat_Screen/Fucntion/send_msg.dart';
import 'package:zsz/Screens/Chat_Screen/Pages/ComplainChatScreen/Widget/chat_header_widget.dart';


class ComplainChatScreen extends StatefulWidget {
   String complainType,complainStatus,threadId;
  ComplainChatScreen({required this.complainType,required this.complainStatus, required this.threadId});
  // const ComplainChatScreen({super.key});
  @override
  State<ComplainChatScreen> createState() => _ComplainChatScreenState();}

class _ComplainChatScreenState extends State<ComplainChatScreen> {
  StreamController _postsController = StreamController();
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController msgController = TextEditingController();
      loadPosts() async {
    fetchChat("4").then((res) async {
      _postsController.add(res);
      return res;
    });
  }
      Future<Null> _handleRefresh() async {
        print("<<<<<<<<<<<<<<<<<<<<handle Refresh>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    fetchChat("4").then((res) async {
      _postsController.add(res);
      
      return null;
    });
  }

  sendmessage()async{
     if(msgController.text.isNotEmpty){
                  print("msggggggg");
                  print(msgController.text);
                final send =await sendMsg("4", msgController.text);
                print("<<<<<<<<<<<<<<<<<<<<<<$send>>>>>>>>>>>>>>>>>>>>>>");
                msgController.clear();
                _handleRefresh();}
  }
    @override
  void initState() {
    _postsController = new StreamController();
    loadPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Scaffold(
        body: SafeArea(
            child: Stack(
      children: [
        
        Column(
          children: [
            
            Expanded(
              child: Container(
                 padding: EdgeInsets.only(top: size.height*0.086,bottom: 60),
              //  color: Colors.amber,
                 height: size.height*0.7,
                child: SingleChildScrollView(
                  dragStartBehavior: DragStartBehavior.down,
                  // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                  reverse: true,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      StreamBuilder(
              stream: _postsController.stream,
              builder:(BuildContext context, AsyncSnapshot snapshot) {
                      print('Has error: ${snapshot.hasError}');
                      print('Has data: ${snapshot.hasData}');
                      print('Snapshot Data ${snapshot.data}'); 
            
                       if (snapshot.hasError) {
              return Text(snapshot.error.toString());
                      } if(snapshot.hasData){
              return Column(
                children: [
                  Scrollbar(
                    child: RefreshIndicator(
                      onRefresh: _handleRefresh,
                    child:ListView.builder(
                            // reverse: true,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: chatHistoryList.length,
                            itemBuilder: (context, index) {
                              final indexx = chatHistoryList[index];
                              return
                              chatBubble(theme, indexx.type.toString(), indexx.message.toString());
                              //  complainTile(context, size, theme,
                              //     indexx.reason, indexx.status);
                            }),))
                ],
              );
              //  StreamBuilder(
              //             stream: fetchChat("4").asStream(),
              //             builder: (context, snapshot) {
                            
              //               if (snapshot.hasData) 
              //                {  
              //                 return Container(
              //                   child: ListView.builder(
              //                       reverse: true,
              //                       shrinkWrap: true,
              //                       physics: NeverScrollableScrollPhysics(),
              //                       itemCount: chatHistoryList.length,
              //                       itemBuilder: (context, index) {
              //                         final indexx = chatHistoryList[index];
              //                         return
              //                         chatBubble(theme, indexx.type.toString(), indexx.message.toString());
              //                         //  complainTile(context, size, theme,
              //                         //     indexx.reason, indexx.status);
              //                       }),
              //                 );
              //               } else{
              //                 return Text("null data");
              //               }
              //              });
                           }
                     if (snapshot.connectionState != ConnectionState.done) {
              return Center(
                child: CircularProgressIndicator(),
              );
                      }if (!snapshot.hasData &&
                snapshot.connectionState == ConnectionState.done) {
              return Text('No Posts');
                      }
                      else{
              return Text("null");
                      }
              }
                      ),
                      // StreamBuilder(
                      //             stream: fetchChat("4").asStream(),
                      //             builder: (context, snapshot) {
                      //               if (snapshot.connectionState ==
                      //                   ConnectionState.waiting) {
                      //                 return Column(
                      //                   children: [
                      //                     // SizedBox(
                      //                     //   height: size.height / 3.7,
                      //                     // ),
                      //                     const Center(
                      //                       child: CircularProgressIndicator(
                      //                         color: Colors.black,
                      //                       ),
                      //                     ),
                      //                   ],
                      //                 );
                      //               } else {
                      //                 return Container(
                      //                   child: ListView.builder(
                      //                       reverse: false,
                      //                       shrinkWrap: true,
                      //                      physics: NeverScrollableScrollPhysics(),
                      //                       itemCount: chatHistoryList.length,
                      //                       itemBuilder: (context, index) {
                                              
                      //                         final indexx = chatHistoryList[index];
                      //                         print(indexx);
                      //                         return
                      //                         chatBubble(theme, indexx.type.toString(), indexx.message.toString());
                      //                         //  complainTile(context, size, theme,
                      //                         //     indexx.reason, indexx.status);
                      //                       }),
                      //                 );
                      //               }
                      //             }),
                                 
                      // chatBubble(theme, "user", "hello its me"),
                      // chatBubble(theme, "admin",
                      //     "hello from the other side hello from the other side hello from the other side"),
                      // chatBubble(theme, "user",
                      //     "hello from the other side hello from the other from the other "),
                      // chatBubble(theme, "user", "hello its me"),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
         chatHeaderWidget(context, size, theme, widget.complainType, widget.complainStatus),
      // chatHeaderWidget(context, size, theme, complainType, complainStatus),
          //  msgField(theme, size, msgController, widget.threadId,_handleRefresh()),
        Column(
    mainAxisAlignment: MainAxisAlignment.end,
     children: [
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
              onTap: () {
                sendmessage();
              },
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
  ),
     ],
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
Widget msgField(theme,size,msgController,threadId,func){
  return
   Column(
    mainAxisAlignment: MainAxisAlignment.end,
     children: [
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
                sendMsg("4", msgController.text);
                msgController.clear();
                func();
                }
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