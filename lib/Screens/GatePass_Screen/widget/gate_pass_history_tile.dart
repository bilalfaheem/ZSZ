import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:zsz/Constant.dart';
import 'package:zsz/Screens/Chat_Screen/Pages/ComplainChatScreen/complain_chat_screen.dart';
import 'package:zsz/Screens/GatePass_Screen/screen/activePass_detail.dart';
import 'package:zsz/Screens/GatePass_Screen/widget/passDetail.dart';

Widget gatePassHistoryTile(context,iteration, complainType, date) {
  final size = MediaQuery.of(context).size;
  final theme = Theme.of(context);
  return GestureDetector(
    // onHorizontalDragEnd: (details) => print(details),
    onTap: () {
      // print(threadId);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ActivePassDetailScreen(qrCode: iteration.qrCode.toString(), name: iteration.contactName.toString(), 
            passType: iteration.passType.toString(), event: iteration.passEvent.toString(), date: date)
          ));
    },
    child: Container(
        margin: EdgeInsets.only(top: 12),
        child: ListTile(
          horizontalTitleGap: 15,
          selected: false,
          // contentPadding: EdgeInsets.symmetric(
          //     horizontal: size.width * 0.05, vertical: size.width * 0.01),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          tileColor: theme.shadowColor,
          leading: Container(
            // margin: EdgeInsets.fromLTRB(size.width * 0.03,
            //     size.width * 0.027, size.width * 0.1, size.width * 0.027),
            padding: EdgeInsets.all(10),
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
              ticket,
              // complainType == "tanker"
              //     ? "assets/Icons/Tanker.png"
              //     : complainType == "maintenance"
              //         ? "assets/Icons/Warning.png"
              //         : complainType == "regular"
              //             ? "assets/Logo_app.png"
              //             : complainType == "general"
              //                 ? "assets/Logo_app.png"
              //                 : "assets/Icons/Warning.png",
              color: complainType == "regular"
                  ? theme.primaryColor
                  : complainType == "general"
                      ? Colors.red
                      : Colors.white,
              height: 20,
              fit: BoxFit.fill,
            ),
          ),
          title: Text(
              complainType[0].toUpperCase() +
                  complainType.substring(1).toLowerCase(),
              style: GoogleFonts.ubuntu(fontSize: 15.5, color: Colors.black)),
          subtitle: Container(
            margin: EdgeInsets.only(top: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Text("Valid till:",
                          style: GoogleFonts.ubuntu(
                              fontSize: 13, color: Colors.black)),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                      decoration: BoxDecoration(
                          // color: Colors.purple,
                          borderRadius: BorderRadius.circular(30)),
                      child: Text(
                          DateFormat.MMMEd().format(DateTime.parse(date)),
                          style: GoogleFonts.ubuntu(
                              fontSize: 14, color: theme.highlightColor)),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 3),
                      child: Text("|",
                          style: GoogleFonts.ubuntu(
                              fontSize: 14, color: theme.highlightColor)),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                      decoration: BoxDecoration(
                          // color: Colors.purple,
                          borderRadius: BorderRadius.circular(30)),
                      child: Text(DateFormat.jm().format(DateTime.parse(date)),
                          style: GoogleFonts.ubuntu(
                              fontSize: 14, color: theme.highlightColor)),
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
              Container(
                // color: Colors.amber,
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: theme.primaryColor,
                ),
              ),
            ],
          ),
        )),
  );
}
Widget gatePassScannedTile(context, complainType, date) {
  final size = MediaQuery.of(context).size;
  final theme = Theme.of(context);
  return GestureDetector(
    onTap: () {
      // print(threadId);
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => ActivePassDetail()
      //     ));
    },
    child: Container(
        margin: EdgeInsets.only(top: 12),
        child: ListTile(
          horizontalTitleGap: 15,
          selected: false,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          tileColor: theme.shadowColor,
          leading: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: complainType == "tanker"
                    ? theme.primaryColor
                    :
                    complainType == "maintenance"
                        ? Color.fromARGB(191, 238, 62, 49)
                        : complainType == "regular" || complainType == "general"
                            ? Colors.white
                            :
                            theme.primaryColor,
                shape: BoxShape.circle),
            child: Image.asset(
              ticket,
              color: complainType == "regular"
                  ? theme.primaryColor
                  : complainType == "general"
                      ? Colors.red
                      : Colors.white,
              height: 20,
              fit: BoxFit.fill,
            ),
          ),
          title: Text(
              complainType[0].toUpperCase() +
                  complainType.substring(1).toLowerCase(),
              style: GoogleFonts.ubuntu(fontSize: 15.5, color: Colors.black)),
          subtitle: Container(
            margin: EdgeInsets.only(top: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Text("Expired at:",
                          style: GoogleFonts.ubuntu(
                              fontSize: 13, color: Colors.black)),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                      decoration: BoxDecoration(
                          // color: Colors.purple,
                          borderRadius: BorderRadius.circular(30)),
                      child: Text(
                          DateFormat.MMMEd().format(DateTime.parse(date)),
                          style: GoogleFonts.ubuntu(
                              fontSize: 14, color: theme.highlightColor)),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 3),
                      child: Text("|",
                          style: GoogleFonts.ubuntu(
                              fontSize: 14, color: theme.highlightColor)),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                      decoration: BoxDecoration(
                          // color: Colors.purple,
                          borderRadius: BorderRadius.circular(30)),
                      child: Text(DateFormat.jm().format(DateTime.parse(date)),
                          style: GoogleFonts.ubuntu(
                              fontSize: 14, color: theme.highlightColor)),
                    )
                  ],
                ),
              ],
            ),
          ),
          // trailing: Row(
          //   mainAxisSize: MainAxisSize.min,
          //   children: [
          //     Container(
          //       // color: Colors.amber,
          //       child: Icon(
          //         Icons.arrow_forward_ios,
          //         color: theme.primaryColor,
          //       ),
          //     ),
          //   ],
          // ),
        )),
  );
}
