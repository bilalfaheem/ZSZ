import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget Profile_Tile(_size, theme, name, cnic, contact, unit_no, society_name) {
  return Column(
    children: [
      //Full_name
      Container(
        margin: EdgeInsets.only(top: _size.height * 0.07),
        child: ListTile(
          horizontalTitleGap: _size.width * 0.05,
          selected: false,
          contentPadding: EdgeInsets.symmetric(
              horizontal: _size.width * 0.05, vertical: _size.height * 0.005),
          leading: Image.asset(
            "assets/Bottom_Bar/Profile.png",
            color: theme.primaryColor,
            height: _size.height * 0.02,
          ),
          title: Text(name,
              style: GoogleFonts.ubuntu(
                  fontSize: _size.height * 0.023, color: Colors.black)),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(_size.height * 0.02)),
          tileColor: theme.dividerColor,
        ),
      ),
      //Cnic
      Container(
        margin: EdgeInsets.only(top: _size.height * 0.03),
        child: ListTile(
          horizontalTitleGap: _size.width * 0.05,
          selected: false,
          contentPadding: EdgeInsets.symmetric(
              horizontal: _size.width * 0.05, vertical: _size.height * 0.005),
          leading: Image.asset(
            "assets/Icons/Cnic.png",
            color: theme.primaryColor,
            height: _size.height * 0.025,
          ),
          title: Text(cnic,
              // Single_User_List[0].ownerCnic.toString(),

              // User_login_Cnic,
              //   "${Profile_List[0].ownerCnic
              // }",
              // ownerCnic}",
              // "${User_Login_Data["full_name"]}",
              style: GoogleFonts.ubuntu(
                  fontSize: _size.height * 0.023, color: Colors.black)),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(_size.height * 0.02)),
          tileColor: theme.dividerColor,
        ),
      ),
      // Contact
      Container(
        margin: EdgeInsets.only(top: _size.height * 0.03),
        child: ListTile(
          horizontalTitleGap: _size.width * 0.05,
          selected: false,
          contentPadding: EdgeInsets.symmetric(
              horizontal: _size.width * 0.05, vertical: _size.height * 0.005),
          leading: Image.asset(
            "assets/Icons/Phone.png",
            color: theme.primaryColor,
            height: _size.height * 0.025,
          ),
          // Image.asset(
          //   "assets/Bottom_Bar/Profile.png",
          //   color: theme.primaryColor,
          // ),
          title: Text(contact,
              // Single_User_List[0].contact.toString(),

              // "${Profile_List[0].contact}",
              // "${User_Login_Data["contact"]}",
              style: GoogleFonts.ubuntu(
                  fontSize: _size.height * 0.023, color: Colors.black)),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(_size.height * 0.02)),
          tileColor: theme.dividerColor,
        ),
      ),

      // Unit No
      Container(
        margin: EdgeInsets.only(top: _size.height * 0.03),
        child: ListTile(
          horizontalTitleGap: _size.width * 0.05,
          selected: false,
          contentPadding: EdgeInsets.symmetric(
              horizontal: _size.width * 0.05, vertical: _size.height * 0.005),
          leading: Image.asset(
            "assets/Icons/Home2.png",
            color: theme.primaryColor,
            height: _size.height * 0.025,
          ),
          // Image.asset(
          //   "assets/Bottom_Bar/Profile.png",
          //   color: theme.primaryColor,
          // ),
          title: Text(unit_no,

              // "${Profile_List[0].unitNo}",
              // "${User_Login_Data["unit_no"]}",
              style: GoogleFonts.ubuntu(
                  fontSize: _size.height * 0.023, color: Colors.black)),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(_size.height * 0.02)),
          tileColor: theme.dividerColor,
        ),
      ),

// society name

      Container(
        margin: EdgeInsets.only(top: _size.height * 0.03),
        child: ListTile(
          horizontalTitleGap: _size.width * 0.05,
          selected: false,
          contentPadding: EdgeInsets.symmetric(
              horizontal: _size.width * 0.05, vertical: _size.height * 0.005),
          leading: Image.asset(
            "assets/Icons/Society.png",
            color: theme.primaryColor,
            height: _size.height * 0.03,
          ),
          // Image.asset(
          //   "assets/Bottom_Bar/Profile.png",
          //   color: theme.primaryColor,
          // ),
          title: Text(society_name,

              // "${Profile_List[0].unitNo}",
              // "${User_Login_Data["unit_no"]}",
              style: GoogleFonts.ubuntu(
                  fontSize: _size.height * 0.023, color: Colors.black)),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(_size.height * 0.02)),
          tileColor: theme.dividerColor,
        ),
      ),
    ],
  );
}
