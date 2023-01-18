import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class NotiHistoryTile extends StatelessWidget {
  String msg, Noti_Type, date;
  NotiHistoryTile(this.Noti_Type, this.msg, this.date);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final _size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: _size.height * 0.01),
      child: ListTile(
        horizontalTitleGap: _size.width * 0.05,
        selected: false,
        contentPadding: EdgeInsets.symmetric(
            horizontal: _size.width * 0.05, vertical: _size.width * 0.01),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_size.height * 0.02)),
        tileColor: theme.dividerColor,
        leading: Container(
          // margin: EdgeInsets.fromLTRB(_size.width * 0.03,
          //     _size.width * 0.027, _size.width * 0.1, _size.width * 0.027),
          padding: EdgeInsets.all(_size.width * 0.02),
          decoration: BoxDecoration(
              color: Noti_Type == "tanker"
                  ? theme.primaryColor
                  :
                  //  Color.fromARGB(190, 20, 72, 111):
                  Noti_Type == "maintenance"
                      ? Color.fromARGB(191, 238, 62, 49)
                      : Noti_Type == "regular" || Noti_Type == "general"
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
            Noti_Type == "tanker"
                ? "assets/Icons/Tanker.png"
                : Noti_Type == "maintenance"
                    ? "assets/Icons/Warning.png"
                    : Noti_Type == "regular"
                        ? "assets/Logo_app.png"
                        : Noti_Type == "general"
                            ? "assets/Logo_app.png"
                            : "assets/Icons/Warning.png",
            color: Noti_Type == "regular"
                ? theme.primaryColor
                : Noti_Type == "general"
                    ? Colors.red
                    : Colors.white,
            height: _size.height * 0.03,
            fit: BoxFit.fill,
          ),
        ),
        title: Text(
            Noti_Type[0].toUpperCase() + Noti_Type.substring(1).toLowerCase(),
            //  Noti_Type == "tanker"?   Noti_Type.replaceFirst(RegExp(r"t"), "T",0):
            //       Noti_Type == "maintenance"?  Noti_Type.replaceFirst(RegExp(r"m"), "M",0):
            //       Noti_Type == "regular"?   Noti_Type.replaceFirst(RegExp(r"r"), "R",0):
            //        Noti_Type,

            style: GoogleFonts.ubuntu(
                fontSize: _size.height * 0.021, color: Colors.black)),
        subtitle: Container(
          margin: EdgeInsets.only(top: _size.width * 0.012),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(msg,
                  style: GoogleFonts.ubuntu(
                      fontSize: _size.width * 0.042, color: Colors.black)),
              Container(
                margin: EdgeInsets.only(top: _size.width * 0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                        // DateFormat.yMMMd()
                        //                       .format(DateTime.parse("$date 00:00:00")),
                        date,
                        style: GoogleFonts.ubuntu(
                            fontSize: _size.height * 0.02, color: Colors.black))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
