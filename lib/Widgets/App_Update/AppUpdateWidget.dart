import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zsz/Constant.dart';
import 'package:zsz/responsive.dart';

Widget ff(){
  return Container(
    height: 300,
    color: Colors.amber,
  );
}

 Widget updateALert(context){
  print("updateeeeeeeeeeee");
    final size = MediaQuery.of(context).size;
    return
     WillPopScope(
   onWillPop: ()async =>false,
    child:Container(
      // color: Colors.transparent,
      child: Container(
           color: Colors.transparent,
           child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.07, vertical: 20),
              width: size.width * 0.9,
              height: height(230),
               margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(size.width * 0.1)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Material(
                        color: Colors.white,
                        child: AutoSizeText("Update Alert!",
                            maxLines: 2,
                            style: GoogleFonts.ubuntu(
                                fontSize: 22, color: Colors.black,fontWeight: FontWeight.w500)),
                  ),
                     ],
                   ),
                  // Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  //   Image.asset(zszlogo, width: width(180), height: height(43)),
                  // ]),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children:[ Image.asset(logo,height: 50,width: 50,),
                      AutoSizeText("WMS",
                          maxLines: 2,
                          style: GoogleFonts.ubuntu(
                              fontSize: 22, color: Colors.black))]),
                   
                  AutoSizeText("             Update available",
                      maxLines: 2,
                      style: GoogleFonts.ubuntu(
                          fontSize: 18, color: Colors.black)) ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(size.width * 0.1))),
                          onPressed: () {
                             Navigator.pop(context);
                          },
                          child: Padding(
                            padding: EdgeInsets.all(size.height * 0.01),
                            child: Text("Update",
                                style: GoogleFonts.ubuntu(
                                    fontSize: size.height * 0.024, color: Colors.white)),
                          ))
                      // Container(
                      //     padding: EdgeInsets.all(size.height * 0.001),
                      //     decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(size.height * 0.02),
                      //         color: theme.primaryColor),
                      //     child: TextButton(
                      //       style: ,
                      //         onPressed: () {},
                      //         child: Text("Confirm",
                      //             style: GoogleFonts.ubuntu(
                      //                 fontSize: size.height * 0.0,
                      //                 color: Colors.black)))),
                    ],
                  ),
                ],
              ),
              //  SizedBox.expand(child: FlutterLogo()),
             
            ),
               ),
         )
    ));}
  
// dd(context,theme,updateMsg){

//   return  
// }

 appUpdateWidget(BuildContext context, theme, Update_Msg) {
  final size = MediaQuery.of(context).size;
  return
  
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    // barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: Duration(milliseconds: 350),
    pageBuilder: (_, __, ___) {
      return Center(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.07, vertical: 20),
          width: size.width * 0.9,
          height: height(230),
           margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(size.width * 0.1)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Material(
                    color: Colors.white,
                    child: AutoSizeText("Update Alert!",
                        maxLines: 2,
                        style: GoogleFonts.ubuntu(
                            fontSize: 22, color: Colors.black,fontWeight: FontWeight.w500)),
              ),
                 ],
               ),
              // Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              //   Image.asset(zszlogo, width: width(180), height: height(43)),
              // ]),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children:[ Image.asset(logo,height: 50,width: 50,),
                  Material(
                    color: Colors.white,
                    child: AutoSizeText("WMS",
                        maxLines: 2,
                        style: GoogleFonts.ubuntu(
                            fontSize: 22, color: Colors.black)),
                  )]),
               
              Material(
                color: Colors.white,
                child: AutoSizeText("             Update available",
                    maxLines: 2,
                    style: GoogleFonts.ubuntu(
                        fontSize: 18, color: Colors.black)),
              ) ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(size.width * 0.1))),
                      onPressed: () {
                        // Navigator.pop(context);
                      },
                      child: Padding(
                        padding: EdgeInsets.all(size.height * 0.01),
                        child: Text("Update",
                            style: GoogleFonts.ubuntu(
                                fontSize: size.height * 0.024, color: Colors.white)),
                      ))
                  // Container(
                  //     padding: EdgeInsets.all(size.height * 0.001),
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(size.height * 0.02),
                  //         color: theme.primaryColor),
                  //     child: TextButton(
                  //       style: ,
                  //         onPressed: () {},
                  //         child: Text("Confirm",
                  //             style: GoogleFonts.ubuntu(
                  //                 fontSize: size.height * 0.0,
                  //                 color: Colors.black)))),
                ],
              ),
            ],
          ),
          //  SizedBox.expand(child: FlutterLogo()),
         
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween;
      if (anim.status == AnimationStatus.reverse) {
        tween = Tween(begin: Offset(-1, 0), end: Offset.zero);
      } else {
        tween = Tween(begin: Offset(1, 0), end: Offset.zero);
      }

      return SlideTransition(
        position: tween.animate(anim),
        child: FadeTransition(
          opacity: anim,
          child: child,
        ),
      );
    },
  );
}
