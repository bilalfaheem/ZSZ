import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:provider/provider.dart';
import 'package:zsz/Constant.dart';
import 'package:zsz/Functions/Visitor_List_Func/pass_event_list.dart';
import 'package:zsz/Screens/GatePass_Screen/function/get_activepass_func.dart';
import 'package:zsz/Screens/GatePass_Screen/provider/gate_pass_provider.dart';
import 'package:zsz/Screens/GatePass_Screen/screen/generate_gate_pass_screen.dart';
import 'package:zsz/Screens/GatePass_Screen/screen/mygate_pass_screen.dart';
import 'package:zsz/Screens/GatePass_Screen/widget/gate_pass_history_tile.dart';
import 'package:zsz/Widgets/Heading_Bar/PopHeadingBar.dart';
import 'package:zsz/responsive.dart';

class GatePassScreen extends StatefulWidget {
  const GatePassScreen({super.key});

  @override
  State<GatePassScreen> createState() => _GatePassScreenState();
}

class _GatePassScreenState extends State<GatePassScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      passEventFunc();
      passDurationFunc();
      passTypeFunc();
      passVisitorTypeFunc();
      passVisitorContactFunc();
  }
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    
    SizeConfig().init(context);
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: Container(
          margin: EdgeInsets.only(bottom: 15, right: 10),
          child: FloatingActionButton(
            onPressed: () {
              // passEventFunc();
              // passDurationFunc();
              // passTypeFunc();
              // passVisitorTypeFunc();
              // passVisitorContactFunc();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => GenerateGatePassScreen()));
              // isExtended: true,
            },
            backgroundColor: theme.primaryColor,
            shape: CircleBorder(),
            child: Icon(
              Icons.add,
              size: 28,
            ),
            // foregroundColor: theme.primaryColor,
          ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      _size.width * padding_horizontal,
                      _size.height * padding_top,
                      _size.width * padding_horizontal,
                      0
                      // _size.height * padding_bottom
                      ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            // margin: EdgeInsets.fromLTRB(0, 0, 0,10),
                            child: PopHeadingBar(
                                context, "My GatePass", 20, "null")),
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(bottom: 15, top: 15),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            MyGatePassScreen()));
                              },
                              child: Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Container(
                                  padding: EdgeInsets.all(30),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: theme.shadowColor,
                                  ),
                                  child: PrettyQr(
                                    data: "User_Token_Shared",
                                    elementColor: theme.primaryColor,
                                    roundEdges: true,
                                    size: 100,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 25),
                          child: Consumer<GatePassProvider>(
                              builder: (context, value, child) {
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        value.changePropPage(0);
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(right: 18),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 13),
                                        decoration: BoxDecoration(
                                            color: value.propPage == 0
                                                ? theme.primaryColor
                                                : Colors.white,
                                            border: Border.all(
                                                width: 1,
                                                color: value.propPage == 0
                                                    ? theme.primaryColor
                                                    : theme.primaryColor),
                                            borderRadius:
                                                BorderRadius.circular(13)),
                                        child: Text("Active Passes",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: value.propPage == 0
                                                  ? Colors.white
                                                  : theme.primaryColor,
                                            )),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        value.changePropPage(1);
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(right: 18),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 13),
                                        decoration: BoxDecoration(
                                            color: value.propPage == 1
                                                ? theme.primaryColor
                                                : Colors.white,
                                            border: Border.all(
                                                width: 1,
                                                color: value.propPage == 1
                                                    ? theme.primaryColor
                                                    : theme.primaryColor),
                                            borderRadius:
                                                BorderRadius.circular(13)),
                                        child: Text("Scanned Passes",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: value.propPage == 1
                                                    ? Colors.white
                                                    : theme.primaryColor,
                                                fontWeight: FontWeight.w500)),
                                      ),
                                    ),
                                  ],
                                ),
                                value.propPage == 0
                                    ? Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 20),
                                        child: Column(children: [
                                          StreamBuilder(
                                              stream:
                                                  activePassFunc().asStream(),
                                              builder: (context, snapshot) {
                                                if (snapshot.connectionState ==
                                                    ConnectionState.waiting) {
                                                  return Column(
                                                    children: [
                                                      SizedBox(
                                                        height:100
                                                      ),
                                                      Center(
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: Colors.black,
                                                          strokeWidth: 2,
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                } else {
                                                  return Container(
                                                    child: ListView.builder(
                                                        // reverse: true,
                                                        shrinkWrap: true,
                                                        physics:
                                                            NeverScrollableScrollPhysics(),
                                                        itemCount:
                                                            activePassList
                                                                .length,
                                                        itemBuilder:
                                                            (context, index) {
                                                          final iteration =
                                                              activePassList[
                                                                  index];
                                                          return gatePassHistoryTile(
                                                              context,
                                                              iteration,
                                                              iteration
                                                                  .contactName,
                                                              iteration
                                                                  .endDate);
                                                        }),
                                                  );
                                                }
                                              })
                                        ]),
                                      )
                                    :  Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 20),
                                        child: Column(children: [
                                          StreamBuilder(
                                              stream:
                                                  scanPassFunc().asStream(),
                                              builder: (context, snapshot) {
                                                if (snapshot.connectionState ==
                                                    ConnectionState.waiting) {
                                                  return Column(
                                                    children: [
                                                      SizedBox(
                                                        height:100
                                                      ),
                                                      Center(
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: Colors.black,
                                                          strokeWidth: 2,
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                } else {
                                                  return Container(
                                                    child: ListView.builder(
                                                        // reverse: true,
                                                        shrinkWrap: true,
                                                        physics:
                                                            NeverScrollableScrollPhysics(),
                                                        itemCount:
                                                            scanPassList
                                                                .length,
                                                        itemBuilder:
                                                            (context, index) {
                                                          final iteration =
                                                              scanPassList[
                                                                  index];
                                                          return gatePassScannedTile(
                                                              context,
                                                              iteration
                                                                  .contactName,
                                                              iteration
                                                                  .isScan
                                                                  );
                                                        }),
                                                  );
                                                }
                                              })
                                        ]),
                                      )
                              ],
                            );
                          }),
                        ),
                      ]))),
        ));
  }
}
