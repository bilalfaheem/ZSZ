import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zsz/Constant.dart';
import 'package:zsz/Widgets/Heading_Bar/PopHeadingBar.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
    final List items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];

// Widget drop(context){
//   final theme = Theme.of(context);
//   return  DropdownButtonHideUnderline(
//           child: DropdownButton2(
//             isExpanded: true,
//             hint: Row(
//               children: const [
//                 Expanded(
//                   child: Text(
//                     'Select Event',
//                     style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ),
//               ],
//             ),
//             items: items
//                 .map((item) => DropdownMenuItem<String>(
//                       value: item,
//                       child: Text(
//                         item,
//                         style:  TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black
//                         ),
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ))
//                 .toList(),
//             value: selectedValue,
//             onChanged: 
//             (value) {
//               setState(() {
//                 selectedValue = value as String;
//               }
//               );
//             },
//             icon: const Icon(
//               Icons.arrow_forward_ios_outlined,
//             ),
//             iconSize: 14,
//             iconEnabledColor: Colors.black,
//             iconDisabledColor: Colors.grey,
//             buttonHeight: 50,
//             buttonWidth: 160,
//             buttonPadding: const EdgeInsets.only(left: 14, right: 14),
//             buttonDecoration: BoxDecoration(
//               boxShadow: [BoxShadow(color: Colors.transparent)],
//               color: theme.dividerColor,
//               borderRadius: BorderRadius.circular(14),
//               // border: Border.all(
//               //   color: Colors.black26,
//               // ),
//               // color: Colors.redAccent,
//             ),
//              buttonElevation: 1,

//             itemHeight: 40,
//             itemPadding:  EdgeInsets.only(left: 14, right: 14),
//             dropdownMaxHeight: 200,
//             dropdownWidth: 200,
//             dropdownPadding: null,
//             dropdownDecoration: BoxDecoration(
//               boxShadow: [BoxShadow(color: Colors.transparent)],
//               borderRadius: BorderRadius.circular(14),
//                color: theme.scaffoldBackgroundColor
//             ),
//             dropdownElevation: 8,
//             scrollbarRadius: const Radius.circular(40),
//             scrollbarThickness: 6,
//             scrollbarAlwaysShow: true,
//              offset: const Offset(-20, 0),
//           ),
//         );
// }

class GenerateGatePassScreen extends StatefulWidget {
  const GenerateGatePassScreen({super.key});

  @override
  State<GenerateGatePassScreen> createState() => _GenerateGatePassScreenState();
}

class _GenerateGatePassScreenState extends State<GenerateGatePassScreen> {


  String? selectedValue;
  @override
  Widget build(BuildContext context) {
      var textsize_details = 0.027;
  var textsize = 0.06;
  var paddingsize = 0.45;
  var text_color = Colors.black;
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return  Scaffold(
      body: SafeArea(child: Padding(padding: EdgeInsets.fromLTRB(size.width * padding_horizontal,
              size.height * padding_top, size.width * padding_horizontal, 0
              ),
              child: Column(
                children: [
                  //heading
                    Container(
                        margin:
                            EdgeInsets.fromLTRB(0, 0, 0, size.height * 0.038),
                        child: PopHeadingBar(context, "Generate Gate Pass", 22, "Back")),



                    Container(
                    margin: EdgeInsets.only(bottom: size.height * 0.03),
                    width: size.width,
                    padding: EdgeInsets.fromLTRB(
                        size.width * 0.07,
                        size.width * 0.07,
                        size.width * 0.07,
                        size.width * 0.1),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(size.height * 0.02),
                        color: theme.dividerColor),
                    child: LayoutBuilder(builder:
                        (BuildContext context, BoxConstraints constraints) {
                      print(constraints.maxWidth.toStringAsFixed(2));
                      return Column(
                        children: [
                          Center(
                            child: Image.asset(
                              zszlogo,
                              width: MediaQuery.of(context).size.width * 0.4,
                              height:
                                  MediaQuery.of(context).size.height * 0.055,
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: constraints.maxWidth * paddingsize,
                                margin: EdgeInsets.symmetric(
                                    vertical: size.height * 0.01),
                                // color: Colors.amber,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Event",
                                      textAlign: TextAlign.end,
                                      style: GoogleFonts.ubuntu(
                                          fontSize:
                                              constraints.maxWidth * textsize,
                                          color: text_color),
                                    ),
                                    Text(
                                      ":",
                                      textAlign: TextAlign.end,
                                      style: GoogleFonts.ubuntu(
                                          fontSize:
                                              constraints.maxWidth * textsize,
                                          // MediaQuery.of(context).size.height *
                                          //     textsize_details,
                                          color: text_color),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                // color: Colors.blue,
                                width: constraints.maxWidth * paddingsize,
                                child:DropdownButtonHideUnderline(
          child: DropdownButton2(
            isExpanded: true,
            hint: Row(
              children: const [
                Expanded(
                  child: Text(
                    'Select Event',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            items: items
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style:  TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ))
                .toList(),
            value: selectedValue,
            onChanged: 
            (value) {
              setState(() {
                selectedValue = value as String;
              }
              );
            },
            icon: const Icon(
              Icons.arrow_forward_ios_outlined,
            ),
            iconSize: 14,
            iconEnabledColor: Colors.black,
            iconDisabledColor: Colors.grey,
            buttonHeight: 50,
            buttonWidth: 160,
            buttonPadding: const EdgeInsets.only(left: 14, right: 14),
            buttonDecoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.transparent)],
              color: theme.dividerColor,
              borderRadius: BorderRadius.circular(14),
              // border: Border.all(
              //   color: Colors.black26,
              // ),
              // color: Colors.redAccent,
            ),
             buttonElevation: 1,

            itemHeight: 40,
            itemPadding:  EdgeInsets.only(left: 14, right: 14),
            dropdownMaxHeight: 200,
            dropdownWidth: 200,
            dropdownPadding: null,
            dropdownDecoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.transparent)],
              borderRadius: BorderRadius.circular(14),
               color: theme.scaffoldBackgroundColor
            ),
            dropdownElevation: 8,
            scrollbarRadius: const Radius.circular(40),
            scrollbarThickness: 6,
            scrollbarAlwaysShow: true,
             offset: const Offset(-20, 0),
          ),
        )
                              )
                            ],
                          ),
                          Divider(
                              thickness: 1, color: Color.fromARGB(75, 0, 0, 0)
                              // Colors.black,
                              ),

                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: size.height * 0.01),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  // color: Colors.amber,
                                  width: constraints.maxWidth * paddingsize,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Pass Type",
                                        textAlign: TextAlign.end,
                                        style: GoogleFonts.ubuntu(
                                            fontSize: constraints.maxWidth *
                                                textsize,
                                            color: text_color),
                                      ),
                                      Text(
                                        ":",
                                        textAlign: TextAlign.end,
                                        style: GoogleFonts.ubuntu(
                                            fontSize: constraints.maxWidth *
                                                textsize,
                                            color: text_color),
                                      ),
                                    ],
                                  ),
                                ),
                                  Container(
                                // color: Colors.blue,
                                width: constraints.maxWidth * paddingsize,
                                child:DropdownButtonHideUnderline(
          child: DropdownButton2(
            isExpanded: true,
            hint: Row(
              children: const [
                Expanded(
                  child: Text(
                    'Select Event',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            items: items
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style:  TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ))
                .toList(),
            value: selectedValue,
            onChanged: 
            (value) {
              setState(() {
                selectedValue = value as String;
              }
              );
            },
            icon: const Icon(
              Icons.arrow_forward_ios_outlined,
            ),
            iconSize: 14,
            iconEnabledColor: Colors.black,
            iconDisabledColor: Colors.grey,
            buttonHeight: 50,
            buttonWidth: 160,
            buttonPadding: const EdgeInsets.only(left: 14, right: 14),
            buttonDecoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.transparent)],
              color: theme.dividerColor,
              borderRadius: BorderRadius.circular(14),
              // border: Border.all(
              //   color: Colors.black26,
              // ),
              // color: Colors.redAccent,
            ),
             buttonElevation: 1,

            itemHeight: 40,
            itemPadding:  EdgeInsets.only(left: 14, right: 14),
            dropdownMaxHeight: 200,
            dropdownWidth: 200,
            dropdownPadding: null,
            dropdownDecoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.transparent)],
              borderRadius: BorderRadius.circular(14),
               color: theme.scaffoldBackgroundColor
            ),
            dropdownElevation: 8,
            scrollbarRadius: const Radius.circular(40),
            scrollbarThickness: 6,
            scrollbarAlwaysShow: true,
             offset: const Offset(-20, 0),
          ),
        )
                              )
                              ],
                            ),
                          ),
                          // Container(

                          Divider(
                              thickness: 1, color: Color.fromARGB(75, 0, 0, 0)),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: size.height * 0.01),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: constraints.maxWidth * paddingsize,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Duration",
                                        textAlign: TextAlign.end,
                                        style: GoogleFonts.ubuntu(
                                            fontSize: constraints.maxWidth *
                                                textsize,
                                            color: text_color),
                                      ),
                                      Text(
                                        ":",
                                        textAlign: TextAlign.end,
                                        style: GoogleFonts.ubuntu(
                                            fontSize: constraints.maxWidth *
                                                textsize,
                                            color: text_color),
                                      ),
                                    ],
                                  ),
                                ),
                                  Container(
                                // color: Colors.blue,
                                width: constraints.maxWidth * paddingsize,
                                child: Container(
                                // color: Colors.blue,
                                width: constraints.maxWidth * paddingsize,
                                child:DropdownButtonHideUnderline(
          child: DropdownButton2(
            isExpanded: true,
            hint: Row(
              children: const [
                Expanded(
                  child: Text(
                    'Select Event',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            items: items
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style:  TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ))
                .toList(),
            value: selectedValue,
            onChanged: 
            (value) {
              setState(() {
                selectedValue = value as String;
              }
              );
            },
            icon: const Icon(
              Icons.arrow_forward_ios_outlined,
            ),
            iconSize: 14,
            iconEnabledColor: Colors.black,
            iconDisabledColor: Colors.grey,
            buttonHeight: 50,
            buttonWidth: 160,
            buttonPadding: const EdgeInsets.only(left: 14, right: 14),
            buttonDecoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.transparent)],
              color: theme.dividerColor,
              borderRadius: BorderRadius.circular(14),
              // border: Border.all(
              //   color: Colors.black26,
              // ),
              // color: Colors.redAccent,
            ),
             buttonElevation: 1,

            itemHeight: 40,
            itemPadding:  EdgeInsets.only(left: 14, right: 14),
            dropdownMaxHeight: 200,
            dropdownWidth: 200,
            dropdownPadding: null,
            dropdownDecoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.transparent)],
              borderRadius: BorderRadius.circular(14),
               color: theme.scaffoldBackgroundColor
            ),
            dropdownElevation: 8,
            scrollbarRadius: const Radius.circular(40),
            scrollbarThickness: 6,
            scrollbarAlwaysShow: true,
             offset: const Offset(-20, 0),
          ),
        ))
                              )
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            color: Color.fromARGB(75, 0, 0, 0),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: size.height * 0.01),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: constraints.maxWidth * paddingsize,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Contact",
                                        textAlign: TextAlign.end,
                                        style: GoogleFonts.ubuntu(
                                            fontSize: constraints.maxWidth *
                                                textsize,
                                            color: text_color),
                                      ),
                                      Text(
                                        ":",
                                        textAlign: TextAlign.end,
                                        style: GoogleFonts.ubuntu(
                                            fontSize: constraints.maxWidth *
                                                textsize,
                                            color: text_color),
                                      ),
                                    ],
                                  ),
                                ),
                                  Container(
                                // color: Colors.blue,
                                width: constraints.maxWidth * paddingsize,
                                child:DropdownButtonHideUnderline(
          child: DropdownButton2(
            isExpanded: true,
            hint: Row(
              children: const [
                Expanded(
                  child: Text(
                    'Select Event',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            items: items
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style:  TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ))
                .toList(),
            value: selectedValue,
            onChanged: 
            (value) {
              setState(() {
                selectedValue = value as String;
              }
              );
            },
            icon: const Icon(
              Icons.arrow_forward_ios_outlined,
            ),
            iconSize: 14,
            iconEnabledColor: Colors.black,
            iconDisabledColor: Colors.grey,
            buttonHeight: 50,
            buttonWidth: 160,
            buttonPadding: const EdgeInsets.only(left: 14, right: 14),
            buttonDecoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.transparent)],
              color: theme.dividerColor,
              borderRadius: BorderRadius.circular(14),
              // border: Border.all(
              //   color: Colors.black26,
              // ),
              // color: Colors.redAccent,
            ),
             buttonElevation: 1,

            itemHeight: 40,
            itemPadding:  EdgeInsets.only(left: 14, right: 14),
            dropdownMaxHeight: 200,
            dropdownWidth: 200,
            dropdownPadding: null,
            dropdownDecoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.transparent)],
              borderRadius: BorderRadius.circular(14),
               color: theme.scaffoldBackgroundColor
            ),
            dropdownElevation: 8,
            scrollbarRadius: const Radius.circular(40),
            scrollbarThickness: 6,
            scrollbarAlwaysShow: true,
             offset: const Offset(-20, 0),
          ),
        )
                              )                              ],
                            ),
                          ),
                          Divider(
                              thickness: 1, color: Color.fromARGB(75, 0, 0, 0)),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: size.height * 0.01),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: constraints.maxWidth * paddingsize,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Visitor Type",
                                        textAlign: TextAlign.end,
                                        style: GoogleFonts.ubuntu(
                                            fontSize: constraints.maxWidth *
                                                textsize,
                                            color: text_color),
                                      ),
                                      Text(
                                        ":",
                                        textAlign: TextAlign.end,
                                        style: GoogleFonts.ubuntu(
                                            fontSize: constraints.maxWidth *
                                                textsize,
                                            color: text_color),
                                      ),
                                    ],
                                  ),
                                ),
                                // Expanded(
                                //   child: Container(
                                //     child: Center(
                                //       child:
                                  Container(
                                // color: Colors.blue,
                                width: constraints.maxWidth * paddingsize,
                                child:DropdownButtonHideUnderline(
          child: DropdownButton2(
            isExpanded: true,
            hint: Row(
              children: const [
                Expanded(
                  child: Text(
                    'Select Event',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            items: items
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style:  TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ))
                .toList(),
            value: selectedValue,
            onChanged: 
            (value) {
              setState(() {
                selectedValue = value as String;
              }
              );
            },
            icon: const Icon(
              Icons.arrow_forward_ios_outlined,
            ),
            iconSize: 14,
            iconEnabledColor: Colors.black,
            iconDisabledColor: Colors.grey,
            buttonHeight: 50,
            buttonWidth: 160,
            buttonPadding: const EdgeInsets.only(left: 14, right: 14),
            buttonDecoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.transparent)],
              color: theme.dividerColor,
              borderRadius: BorderRadius.circular(14),
              // border: Border.all(
              //   color: Colors.black26,
              // ),
              // color: Colors.redAccent,
            ),
             buttonElevation: 1,

            itemHeight: 40,
            itemPadding:  EdgeInsets.only(left: 14, right: 14),
            dropdownMaxHeight: 200,
            dropdownWidth: 200,
            dropdownPadding: null,
            dropdownDecoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.transparent)],
              borderRadius: BorderRadius.circular(14),
               color: theme.scaffoldBackgroundColor
            ),
            dropdownElevation: 8,
            scrollbarRadius: const Radius.circular(40),
            scrollbarThickness: 6,
            scrollbarAlwaysShow: true,
             offset: const Offset(-20, 0),
          ),
        )
                              )
                                //     ),
                                //   ),
                                // )
                              ],
                            ),
                          )
                              ],
                            );}
              ),)]))));}
    
  }
