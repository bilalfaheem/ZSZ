import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
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
                Column(
                  
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // chatHeaderWidget(context, size, theme, "complainType", "status"),
                   chatBubble(theme,"user","hello its me"),
                   chatBubble(theme,"admin","hello from the other side hello from the other side hello from the other side"),
                   chatBubble(theme,"user","hello from the other side hello from the other from the other "),
                   chatBubble(theme,"user","hello its me"),
                  //  chatBubble("admin","hello from the other side hello from the other side hello from the other side"),
                  //  chatBubble("user","hello from the other side hello from  "),
                    // chatBubble("user","hello its me"),
                  //  chatBubble("admin","hello from the other side hello from the other side hello from the other side"),
                  //  chatBubble("user","hello from the other side hello from the other from the other "),
                  
                //     // Container(
                //     //   padding: EdgeInsets.all(13),
                //     //   decoration: BoxDecoration( 
                //     //     color: Colors.amber,
                //     //     borderRadius: BorderRadius.only(
                //     //     topLeft: Radius.circular(20),
                //     //     bottomLeft: Radius.circular(20),
                //     //     bottomRight: Radius.circular(20)) )    ,
                //     //     child: Text("data",style: TextStyle(fontSize: 17,color: Colors.white),),
                //     // )
                    
                    
                  ],
                ),
                    Spacer(),
                     typeMsg(theme)
              ],
            )
            ));
  }
}

Widget chatBubble(theme,String msgType,String text){
  return  Row(
    mainAxisAlignment: msgType == "user"? MainAxisAlignment.end:MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
               Container(
                margin: EdgeInsets.symmetric(horizontal: 7),
            // margin: EdgeInsets.fromLTRB(size.width * 0.03,
            //     size.width * 0.027, size.width * 0.1, size.width * 0.027),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: msgType == "admin"?  Colors.grey :Colors.transparent,
                shape: BoxShape.circle),
            child:Image.asset(zsz,
             height: 15,
             color: msgType == "admin"? null :Colors.transparent, 
              fit: BoxFit.contain )
          ),
              Flexible(
                fit: FlexFit.loose,
                child: Container(
                  margin: EdgeInsets.only(bottom: 10,right: msgType == "admin"?30:8,left:msgType == "user"?30:0 ),
                  // left: msgType == "user"?30:0),
                  padding: EdgeInsets.all(13),
                  decoration: BoxDecoration(
                    color: msgType == "admin"? theme.primaryColor :Color.fromARGB(255, 208, 205, 205),
                    borderRadius: BorderRadius.only(
                    topRight: msgType == "admin"?Radius.circular(20):Radius.circular(0),
                    topLeft:  msgType == "user"?Radius.circular(20):Radius.circular(0),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)) )    ,
                    child: Text("$text",style: TextStyle(fontSize: 17,color: Colors.white),),
                ),
              ),
            ],
          );
}

Widget typeMsg(theme){
  return Container(
    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
    decoration: BoxDecoration(
      color: theme.primaryColor,
      borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(20))
    ),
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
              borderRadius: BorderRadius.circular(10)
            ),
            child:Image.asset(file,height: 25,)),
        Container(
            // height: 40,
            margin: EdgeInsets.symmetric(horizontal: 5),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10)
            ),
            child:Image.asset(galleryIcon,height: 25)),
        Flexible(
          fit: FlexFit.loose,
          child: Container(
            // height: 40,
            // width: 200,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10)
            ),
            child:  TextField(
              minLines: 1,
              maxLines: 4,
              style:GoogleFonts.ubuntu(
                          fontSize: 16, color: Colors.white),
              decoration: 
              InputDecoration(
                border: InputBorder.none,
                hintText: "Message...",
                contentPadding: EdgeInsets.symmetric(horizontal: 8)
              ),
            ),
          ),
        ),
         Container(
            // height: 40,
           margin: EdgeInsets.only(left: 5),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10)
            ),
            child:Image.asset(send,height: 25,)),
      ],
    ),
  );
}
