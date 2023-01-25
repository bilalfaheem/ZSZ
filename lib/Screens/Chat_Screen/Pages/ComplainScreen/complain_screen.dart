import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zsz/Constant.dart';
import 'package:zsz/Models/Notification_History_Model/notification_history_model/notification_history_model.dart';
import 'package:zsz/Screens/Chat_Screen/Pages/ComplainScreen/AlertBox/generate_complain.dart';
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
                  child: PopHeadingBar(context, "Complain", 22, "Back")),
              // Container(
              //   child: TextField(
              //     controller: chatSearchController,
              //     decoration: InputDecoration(
              //       suffixIcon: Icon(Icons.search),
              //       fillColor: Colors.black.withOpacity(0.2)
              //     ),
              //   ),
              // ),
            
              complainTile(size, theme, "maintenance","pending..."),
              complainTile(size, theme, "tanker","complete")
             
                  ])
      )),
    ));
  }
}


Widget complainTile(size,theme,complainType,status){
  return  Container(
      margin: EdgeInsets.only(top: size.height * 0.01),
      child: ListTile(
        horizontalTitleGap: size.width * 0.05,
        selected: false,
        contentPadding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05, vertical: size.width * 0.01),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(size.height * 0.02)),
        tileColor: theme.shadowColor,
        leading: Container(
          // margin: EdgeInsets.fromLTRB(size.width * 0.03,
          //     size.width * 0.027, size.width * 0.1, size.width * 0.027),
          padding: EdgeInsets.all(size.width * 0.02),
          decoration: BoxDecoration(
              color: complainType == "tanker"
                  ? theme.primaryColor
                  :
                  //  Color.fromARGB(190, 20, 72, 111):
                  complainType == "maintenance"
                      ? Color.fromARGB(191, 238, 62, 49)
                      : complainType == "regular" || complainType == "general"
                          ? Colors.white
                          :
                          // Color.fromARGB(198, 87, 24, 98):
                          theme.primaryColor,

              // Paid
              //     ? Color.fromARGB(203, 210, 4, 45)
              //     : Color.fromARGB(240, 20, 72, 111),
              // Color.fromARGB(240, 20, 72, 111),
              // Color.fromARGB(255, 228, 114, 106),
              shape: BoxShape.circle),
          child: Image.asset(
            complainType == "tanker"
                ? "assets/Icons/Tanker.png"
                : complainType == "maintenance"
                    ? "assets/Icons/Warning.png"
                    : complainType == "regular"
                        ? "assets/Logo_app.png"
                        : complainType == "general"
                            ? "assets/Logo_app.png"
                            : "assets/Icons/Warning.png",
            color: complainType == "regular"
                ? theme.primaryColor
                : complainType == "general"
                    ? Colors.red
                    : Colors.white,
            height: size.height * 0.03,
            fit: BoxFit.fill,
          ),
        ),
        title: Text(
            complainType[0].toUpperCase() + complainType.substring(1).toLowerCase(),
            //  complainType == "tanker"?   complainType.replaceFirst(RegExp(r"t"), "T",0):
            //       complainType == "maintenance"?  complainType.replaceFirst(RegExp(r"m"), "M",0):
            //       complainType == "regular"?   complainType.replaceFirst(RegExp(r"r"), "R",0):
            //        complainType,

            style: GoogleFonts.ubuntu(
                fontSize: size.height * 0.021, color: Colors.black)),
        subtitle: Container(
          margin: EdgeInsets.only(top: size.width * 0.012),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 3,horizontal: 0),
                decoration: BoxDecoration(
                  // color: Colors.purple,
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Text(status,
                    style: GoogleFonts.ubuntu(
                        fontSize: 16, color: theme.highlightColor)),
              ),
              // Container(
              //   margin: EdgeInsets.only(top: size.width * 0.01),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.end,
              //     children: [
              //       Text(
              //           // DateFormat.yMMMd()
              //           //                       .format(DateTime.parse("$date 00:00:00")),
              //           "date",
              //           style: GoogleFonts.ubuntu(
              //               fontSize: size.height * 0.02, color: Colors.black))
              //     ],
              //   ),
              // )
            ],
            
          ),
          
        ),
        trailing: IconButton(onPressed: (){}, icon:Icon( Icons.arrow_forward_ios,color: theme.primaryColor,),
      ),
    ));
}