import 'dart:async';
import 'dart:io' as io;
import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:zsz/Constant.dart';
import 'package:cross_file/cross_file.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:zsz/Screens/GatePass_Screen/provider/gate_pass_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:zsz/Screens/GatePass_Screen/widget/passDetail.dart';
import 'package:zsz/Screens/fun.dart';
import 'package:zsz/responsive.dart';

class ActivePassDetailScreen extends StatelessWidget {
  String qrCode, name, passType, event, date;
  ActivePassDetailScreen(
      {required this.qrCode,
      required this.name,
      required this.passType,
      required this.event,
      required this.date});

  @override
  Widget build(BuildContext context) {

  /// Get storage premission request from user
  Future<bool> getStoragePremission() async {
    return await Permission.storage.request().isGranted;
  }
  
    final ThemeData theme = Theme.of(context);
    final _size = MediaQuery.of(context).size;
    SizeConfig().init(context);
        final passSSController = ScreenshotController();
        final gatePassProvider = Provider.of<GatePassProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(_size.width * padding_horizontal,
              _size.height * padding_top, _size.width * padding_horizontal, 0
              // _size.height * padding_bottom
              ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //heading
              Container(
                  margin: EdgeInsets.fromLTRB(
                      0,
                      0,
                      0,
                      // 0
                      _size.height * 0.033),
                  child:Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      IconButton(
          onPressed: () {
                  Navigator.pop(context);
      //             Timer(
      // Duration(seconds: 2),
      // (){
      //   gatePassProvider.reloadFunc();
      // });
                },
          icon: Icon(
                      Icons.arrow_back_ios,
                      size: height(20),
                    ),
          color: theme.primaryColor),
      // SizedBox(width: _size.width * 0.205),
      Center(
        child: Text(
          "Pass Detail",
          style: GoogleFonts.ubuntu(
              fontSize: height(22), color: theme.focusColor),
        ),
      ),
      IconButton(
          onPressed: null,
          icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.transparent,
                      size: height(20),
                    ),
          color: Colors.transparent),
    ],
  )),
                  //  PopHeadingBar(context, "Pass Detail", 22, "Back")),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Screenshot(
                    controller:passSSController ,
                    child: passDetailWidget(context, qrCode, name, passType, event, date))),
                  
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: ()async{
                      print(name);
                      print("share");
                      await passSSController.capture().then((image)async{
                        print("Capture");
                        if(image != null){
                          print("not Null");
                          if(await getStoragePremission()){
                          final directory = await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DOWNLOADS);
                          final String v = name.split(" ").first;
                          final String d = date.split(":").last;
                          String downloadImagePath = '${directory}/${v+d}.png';
                          print(downloadImagePath);
                          final bool fileExist = await io.File(downloadImagePath).exists();
                          print("<<<<<<<<<<<<<<<<<<<<<$fileExist>>>>>>>>>>>>>>>>>>>>>");
                          if(!fileExist){
                            final imagePath = await io.File(downloadImagePath).create();
                           await imagePath.writeAsBytes(image);
                           downloadImagePath = imagePath.path;
                          }
                          
                           List<XFile> shareList = [];
                           shareList.add(XFile(downloadImagePath));
                          // print(imagePath.path);
                          print(shareList);
                          await Share.shareXFiles(shareList,text: "$userLoginSociety_S Gate Pass");}
                        }
                      });
                    },
                    // onTap: ()async{
                    //   final pass = await passSSController.capture();
                    //   if (pass != null){
                    //     await savePass(name+date,pass).then((value) async {
                    //       print("<<<<<<<<<<<<<<<<$value>>>>>>>>>>>>>>>>");
                    //      final String v = value.split(":").last;
                    //      print("<<<<<<<<<<<<$v>>>>value>>>>>>>>");
                    //      final bool fileExist = await io.File(v).exists();
                    //      print("<<<<<<<<<<<<<<<<<<<<<$fileExist>>>>>>>>>>>>>file exist>>>>>>>>");
                    //     //  OpenFile.open(v);
                    //     });
                    //   }
                    // },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 15),
                      padding: EdgeInsets.symmetric(vertical:13,horizontal: 20),
                      decoration: BoxDecoration(
                        color: theme.shadowColor,
                        borderRadius: BorderRadius.circular(20)),
                      child: Text("Share",style: GoogleFonts.ubuntu(fontSize: 18,color: Colors.black),),
                    ),
                  ),
                ],
              )
              // PrettyQr(

              //     data: "User_Token_Shared",

              //   roundEdges: true,

              //   size:100,

              //   //  size.width*0.6,

              //   image: AssetImage("assets/shell.png")

              //   ),
            ],
          ),
        ),
      ),
    );
  }
}
