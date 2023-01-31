import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:zsz/Constant.dart';
import 'package:zsz/Screens/Chat_Screen/Fucntion/fetch_chat.dart';
import 'package:zsz/Screens/Chat_Screen/Fucntion/send_msg.dart';
import 'package:zsz/Screens/Chat_Screen/Pages/ComplainChatScreen/complain_chat_screen.dart';

class Fun extends StatefulWidget {
  const Fun({super.key});

  @override
  State<Fun> createState() => _FunState();
}

class _FunState extends State<Fun> {
  TextEditingController msgController = TextEditingController();
 late StreamController _postsController;
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  // int count = 1;
  

      loadPosts() async {
    fetchChat("4").then((res) async {
      _postsController.add(res);
      return res;
    });
  }
    Future<Null> _handleRefresh() async {
    // count++;
    // print(count);
    fetchChat("4").then((res) async {
      _postsController.add(res);
      
      return null;
    });
  }

    @override
  void initState() {
    _postsController = new StreamController();
    loadPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(onPressed: (){
          _handleRefresh();
        }, icon: Icon( Icons.refresh_sharp))
      ],),
      body: Column(
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
            sendMsg("4", msgController.text);}
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
      ),
    );
  }
}
