import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:zsz/Screens/Chat_Screen/Pages/ComplainChatScreen/complain_chat_screen.dart';
import 'package:zsz/Screens/GatePass_Screen/screen/activePass_detail.dart';
import 'package:zsz/Screens/GatePass_Screen/widget/passDetail.dart';

Widget gatePassHistoryTile(context, complainType, date) {
  final size = MediaQuery.of(context).size;
  final theme = Theme.of(context);
  return GestureDetector(
    // onHorizontalDragEnd: (details) => print(details),
    onTap: () {
      // print(threadId);
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => ActivePassDetail()
      //     ));
    },
    child: Container(
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
              complainType[0].toUpperCase() +
                  complainType.substring(1).toLowerCase(),
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
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 0),
                      decoration: BoxDecoration(
                          // color: Colors.purple,
                          borderRadius: BorderRadius.circular(30)),
                      child: Text(
                          DateFormat.MMMEd().format(DateTime.parse(date)),
                          style: GoogleFonts.ubuntu(
                              fontSize: 16, color: theme.highlightColor)),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Text("|",
                          style: GoogleFonts.ubuntu(
                              fontSize: 16, color: theme.highlightColor)),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 0),
                      decoration: BoxDecoration(
                          // color: Colors.purple,
                          borderRadius: BorderRadius.circular(30)),
                      child: Text(DateFormat.jm().format(DateTime.parse(date)),
                          style: GoogleFonts.ubuntu(
                              fontSize: 16, color: theme.highlightColor)),
                    )
                  ],
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
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // count == "0"?Container():
              // Container(
              //   padding: EdgeInsets.all(8),
              //   decoration: BoxDecoration(shape: BoxShape.circle,
              //   color: Colors.red),
              //   child: Text(count,
              //         style: GoogleFonts.ubuntu(
              //             fontSize: 16, color: Colors.white)),
              // ),
              IconButton(
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => ComplainChatScreen(complainType: complainType, complaindate: date, threadId: threadId)
                  //     ));
                },
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: theme.primaryColor,
                ),
              ),
            ],
          ),
        )),
  );
}
