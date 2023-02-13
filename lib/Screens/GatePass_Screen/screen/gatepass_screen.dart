import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:zsz/Constant.dart';
import 'package:zsz/Widgets/Heading_Bar/PopHeadingBar.dart';
import 'package:zsz/responsive.dart';

class GatePassScreen extends StatelessWidget {
  const GatePassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    SizeConfig().init(context);
    return Scaffold(
body: SafeArea(
  child:   Padding(
    padding: EdgeInsets.fromLTRB(_size.width * padding_horizontal,
              _size.height * padding_top, _size.width * padding_horizontal, 0
              // _size.height * padding_bottom
              ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
    children: [
            Container(
                  margin: EdgeInsets.fromLTRB(
                      0,0,0,
                      _size.height * 0.033),
                  child:PopHeadingBar(
                            context, "My GatePass", 20, "null")),
             
        Center(
          child: Container( margin: EdgeInsets.only(bottom: 15),
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Container(
                 padding: EdgeInsets.all(30),
              
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color:theme.shadowColor ,
              
                      ),
              
                      child: PrettyQr(
                        data: "User_Token_Shared",
                        elementColor: theme.primaryColor,
                      roundEdges: true,
              
                      size:100,
              
                      ),
              
                    ),
            ),
          ),
        ),
         Container(
                  margin: EdgeInsets.fromLTRB(_size.width * 0.018,
                      _size.height * 0.02, 0, _size.height * 0.02),
                  child: Text("Visitor History",
                      style: GoogleFonts.ubuntu(
                          fontSize: height(18), color: theme.focusColor))),

        Container(
          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: theme.shadowColor
          ),
          child: Row(
            children: [
               Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text("Name",
                          style: GoogleFonts.ubuntu(
                              fontSize: 15, color: theme.highlightColor)),
                   Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                     child: Text("Date",
                            style: GoogleFonts.ubuntu(
                                fontSize: 15, color: theme.highlightColor)),
                   ),
                     Text("Time",
                          style: GoogleFonts.ubuntu(
                              fontSize: 15, color: theme.highlightColor)),
                 ],
               ),
               Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                 child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text(":",
                            style: GoogleFonts.ubuntu(
                                fontSize: 15, color: theme.highlightColor)),
                     Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                       child: Text(":",
                              style: GoogleFonts.ubuntu(
                                  fontSize: 15, color: theme.highlightColor)),
                     ),
                       Text(":",
                            style: GoogleFonts.ubuntu(
                                fontSize: 15, color: theme.highlightColor)),
                   ],
                 ),
               ),
               Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text("Farhan",
                          style: GoogleFonts.ubuntu(
                              fontSize: 15, color: theme.highlightColor)),
                   Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                     child: Text("12-May-23",
                            style: GoogleFonts.ubuntu(
                                fontSize: 15, color: theme.highlightColor)),
                   ),
                     Text("12:03",
                          style: GoogleFonts.ubuntu(
                              fontSize: 15, color: theme.highlightColor)),
                 ],
               ),
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