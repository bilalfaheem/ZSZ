import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:zsz/Constant.dart';
import 'package:zsz/Screens/Chat_Screen/Fucntion/fetch_chat.dart';
import 'package:zsz/Screens/Chat_Screen/Pages/ComplainChatScreen/complain_chat_screen.dart';

class Fun extends StatefulWidget {
  const Fun({super.key});

  @override
  State<Fun> createState() => _FunState();
}

class _FunState extends State<Fun> {
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
            return  StreamBuilder(
                        stream: fetchChat("4").asStream(),
                        builder: (context, snapshot) {
                          
                          if (snapshot.hasData) 
                          // {
                          //   return Column(
                          //     children: [
                          //       SizedBox(
                          //         height: size.height / 3.7,
                          //       ),
                          //       const Center(
                          //         child: CircularProgressIndicator(
                          //           color: Colors.black,
                          //         ),
                          //       ),
                          //     ],
                          //   );
                          // } else
                           {  
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
                          } else{
                            return Text("null data");
                          }
                         });}
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
          )
        ],
      ),
    );
  }
}
