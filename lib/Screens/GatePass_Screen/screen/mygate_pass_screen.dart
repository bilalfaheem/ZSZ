import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:zsz/Constant.dart';
import 'package:zsz/Screens/GatePass_Screen/widget/mypass_widget.dart';
import 'package:zsz/Widgets/Heading_Bar/PopHeadingBar.dart';

class MyGatePassScreen extends StatelessWidget {
  const MyGatePassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final _size = MediaQuery.of(context).size;
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
                  child: PopHeadingBar(context, "Gate Pass", 22, "Back")),
              myQrWidget(context),
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
