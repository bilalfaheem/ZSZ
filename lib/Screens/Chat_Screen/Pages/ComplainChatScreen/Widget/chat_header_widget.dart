import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/ios.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zsz/Screens/Chat_Screen/Pages/ComplainChatScreen/complain_chat_screen.dart';

Widget msgHeader(context, complainType, status) {
  final theme = Theme.of(context);
  final size = MediaQuery.of(context).size;
  return SafeArea(
    child: Container(
      height: size.height * 0.08,
      color: theme.shadowColor,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios_new)),
          //  Image.asset(back, height: 15, width: 15)),
          Container(
            margin: EdgeInsets.only(right: 14, left: 14),
            padding: EdgeInsets.symmetric(vertical: 7, horizontal: 7),
            // height: size.height * 0.05,
            // width: size.height * 0.05,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
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
            ),
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
              height: 23,
              color: complainType == "regular"
                  ? theme.primaryColor
                  : complainType == "general"
                      ? Colors.red
                      : Colors.white,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(complainType,
                  style: GoogleFonts.ubuntu(fontSize: 18, color: Colors.black)),
              Container(
                // margin: EdgeInsets.only(top: 4),
                child: Text(status,
                    maxLines: 2,
                    style: GoogleFonts.ubuntu(
                        fontSize: 13,
                        color: theme.highlightColor,
                        fontWeight: FontWeight.w600)),
              ),
            ],
          ),
          Spacer(),
          Column(
            children: [
              //  Container(
              //         padding: EdgeInsets.symmetric(
              //             horizontal: 8,
              //             vertical: 8),
              //         decoration: BoxDecoration(
              //             color: Colors.white.withOpacity(0.12),
              //             borderRadius: BorderRadius.circular(11)),
              //         child: Image.asset(
              //           search,
              //           height:18,
              //         )),
            ],
          )
        ],
      ),
    ),
  );
}

Widget chatHeaderWidget(context, size, theme, complainType, status) {
  return GestureDetector(
    child: Container(
        height: size.height * 0.085,
        color: theme.shadowColor,
        // margin: EdgeInsets.only(top: size.height * 0.01),
        child: ListTile(
          autofocus: true,
          focusColor: Colors.white,
          // focusNode: true,
          horizontalTitleGap: size.width * 0.05,
          selected: false,
          contentPadding: EdgeInsets.symmetric(
              horizontal: size.width * 0.05, vertical: size.width * 0.01),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(size.height * 0.02)),
          // tileColor: theme.shadowColor,
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
                Container(
                  padding: EdgeInsets.symmetric(vertical: 3, horizontal: 0),
                  decoration: BoxDecoration(
                      // color: Colors.purple,
                      borderRadius: BorderRadius.circular(30)),
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
          trailing: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.close_outlined,
              color: theme.primaryColor,
            ),
          ),
        )),
  );
}
