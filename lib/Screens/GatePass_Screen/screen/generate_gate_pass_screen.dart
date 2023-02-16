import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zsz/Constant.dart';
import 'package:zsz/Functions/Visitor_List_Func/pass_event_list.dart';
import 'package:zsz/Screens/GatePass_Screen/function/generatePassApi.dart';
import 'package:zsz/Widgets/Heading_Bar/PopHeadingBar.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:zsz/responsive.dart';

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

  TextEditingController  contactNameController = TextEditingController();
  TextEditingController  contactNoController = TextEditingController();

  String? eventId;
  String? passTypeId;
  String? passDurationId;
  String? passContactId;
  String? visitorTypeId;
  bool contactVisibility = false;

  @override
  Widget build(BuildContext context) {
    var textsize_details = 0.027;
    var textsize = 0.06;
    var paddingsize = 0.45;
    var text_color = Colors.black;
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    SizeConfig().init(context);
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      size.width * padding_horizontal,
                      size.height * padding_top,
                      size.width * padding_horizontal,
                      0),
                  child: Column(children: [
                    //heading
                    Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, size.height * 0.038),
                        child: PopHeadingBar(
                            context, "Generate Gate Pass", 19, "Back")),
            
                    Container(
                      margin: EdgeInsets.only(bottom: size.height * 0.03),
                      width: size.width,
                      padding: EdgeInsets.fromLTRB(size.width * 0.07,
                          size.width * 0.07, size.width * 0.07, size.width * 0.1),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(size.height * 0.02),
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
                                    child: DropdownButtonHideUnderline(
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
                                        items: passEventList
                                            .map(
                                              (e) => DropdownMenuItem(
                                                  value: e.id.toString(),
                                                  child: Text(e.name.toString())),
                                            )
                                            .toList(),
                                        value: eventId,
                                        onChanged: (value) {
                                          setState(() {
                                            eventId = value.toString();
                                            print('eventId $eventId');
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.arrow_forward_ios_outlined,
                                        ),
                                        iconSize: 14,
                                        iconEnabledColor: Colors.black,
                                        iconDisabledColor: Colors.grey,
                                        buttonHeight: 50,
                                        buttonWidth: 160,
                                        buttonPadding: const EdgeInsets.only(
                                            left: 14, right: 14),
                                        buttonDecoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(color: Colors.transparent)
                                          ],
                                          color: theme.dividerColor,
                                          borderRadius: BorderRadius.circular(14),
                                          // border: Border.all(
                                          //   color: Colors.black26,
                                          // ),
                                          // color: Colors.redAccent,
                                        ),
                                        buttonElevation: 1,
                                        itemHeight: 40,
                                        itemPadding:
                                            EdgeInsets.only(left: 14, right: 14),
                                        dropdownMaxHeight: 200,
                                        dropdownWidth: 200,
                                        dropdownPadding: null,
                                        dropdownDecoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(color: Colors.transparent)
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(14),
                                            color: theme.scaffoldBackgroundColor),
                                        dropdownElevation: 8,
                                        scrollbarRadius:
                                            const Radius.circular(40),
                                        scrollbarThickness: 6,
                                        scrollbarAlwaysShow: true,
                                        offset: const Offset(-20, 0),
                                      ),
                                    ))
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
                                              color: text_color),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                      // color: Colors.blue,
                                      width: constraints.maxWidth * paddingsize,
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton2(
                                          isExpanded: true,
                                          hint: Row(
                                            children: const [
                                              Expanded(
                                                child: Text(
                                                  'Select Pass type',
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
                                          items: passTypeList
                                              .map(
                                                (e) => DropdownMenuItem(
                                                    value: e.id.toString(),
                                                    child:
                                                        Text(e.name.toString())),
                                              )
                                              .toList(),
                                          value: passTypeId,
                                          onChanged: (value) {
                                            setState(() {
                                              passTypeId = value as String;
                                              print(passTypeId);
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.arrow_forward_ios_outlined,
                                          ),
                                          iconSize: 14,
                                          iconEnabledColor: Colors.black,
                                          iconDisabledColor: Colors.grey,
                                          buttonHeight: 50,
                                          buttonWidth: 160,
                                          buttonPadding: const EdgeInsets.only(
                                              left: 14, right: 14),
                                          buttonDecoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(color: Colors.transparent)
                                            ],
                                            color: theme.dividerColor,
                                            borderRadius:
                                                BorderRadius.circular(14),
                                            // border: Border.all(
                                            //   color: Colors.black26,
                                            // ),
                                            // color: Colors.redAccent,
                                          ),
                                          buttonElevation: 1,
                                          itemHeight: 40,
                                          itemPadding: EdgeInsets.only(
                                              left: 14, right: 14),
                                          dropdownMaxHeight: 200,
                                          dropdownWidth: 200,
                                          dropdownPadding: null,
                                          dropdownDecoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.transparent)
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(14),
                                              color:
                                                  theme.scaffoldBackgroundColor),
                                          dropdownElevation: 8,
                                          scrollbarRadius:
                                              const Radius.circular(40),
                                          scrollbarThickness: 6,
                                          scrollbarAlwaysShow: true,
                                          offset: const Offset(-20, 0),
                                        ),
                                      ))
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
                                          width:
                                              constraints.maxWidth * paddingsize,
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton2(
                                              isExpanded: true,
                                              hint: Row(
                                                children: const [
                                                  Expanded(
                                                    child: Text(
                                                      'Pass Duration',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black,
                                                      ),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              items: passDurationList
                                                  .map(
                                                    (e) => DropdownMenuItem(
                                                        value: e.id.toString(),
                                                        child: Text(
                                                            e.hours.toString())),
                                                  )
                                                  .toList(),
                                              value: passDurationId,
                                              onChanged: (value) {
                                                setState(() {
                                                  passDurationId = value as String;
                                                  print(passDurationId);
                                                });
                                              },
                                              icon: const Icon(
                                                Icons.arrow_forward_ios_outlined,
                                              ),
                                              iconSize: 14,
                                              iconEnabledColor: Colors.black,
                                              iconDisabledColor: Colors.grey,
                                              buttonHeight: 50,
                                              buttonWidth: 160,
                                              buttonPadding:
                                                  const EdgeInsets.only(
                                                      left: 14, right: 14),
                                              buttonDecoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.transparent)
                                                ],
                                                color: theme.dividerColor,
                                                borderRadius:
                                                    BorderRadius.circular(14),
                                                // border: Border.all(
                                                //   color: Colors.black26,
                                                // ),
                                                // color: Colors.redAccent,
                                              ),
                                              buttonElevation: 1,
                                              itemHeight: 40,
                                              itemPadding: EdgeInsets.only(
                                                  left: 14, right: 14),
                                              dropdownMaxHeight: 200,
                                              dropdownWidth: 200,
                                              dropdownPadding: null,
                                              dropdownDecoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.transparent)
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(14),
                                                  color: theme
                                                      .scaffoldBackgroundColor),
                                              dropdownElevation: 8,
                                              scrollbarRadius:
                                                  const Radius.circular(40),
                                              scrollbarThickness: 6,
                                              scrollbarAlwaysShow: true,
                                              offset: const Offset(-20, 0),
                                            ),
                                          )))
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
                                              fontSize:
                                                  constraints.maxWidth * textsize,
                                              color: text_color),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            contactVisibility = !contactVisibility; 
                                            setState(() {
                                              
                                            });
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              color: theme.primaryColor,
                                              shape: BoxShape.circle),
                                            child: Icon(Icons.add,color: Colors.white,size: 20,),
                                          ),
                                        ),
                                        Text(
                                          ":",
                                          textAlign: TextAlign.end,
                                          style: GoogleFonts.ubuntu(
                                              fontSize:
                                                  constraints.maxWidth * textsize,
                                              color: text_color),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                      // color: Colors.blue,
                                      width: constraints.maxWidth * paddingsize,
                                      child: contactVisibility?
                                      Column(
                                        children: [
                                          TextFormField(
                                            controller: contactNameController,
                                            decoration: InputDecoration(
                                              hintText: "Name",contentPadding: EdgeInsets.zero,
                                               enabledBorder: UnderlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: theme.primaryColor)),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: theme.primaryColor)),
                                          focusColor: theme.primaryColor,
                                          border: UnderlineInputBorder(),),
                                             inputFormatters: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp("[a-zA-Z ]")),
                        ],
                                          ),
                                        
                                      TextFormField(
                                        controller: contactNoController,
                                        decoration: InputDecoration(hintText: "Contact",
                                         enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: theme.primaryColor)),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: theme.primaryColor)),
                                      focusColor: theme.primaryColor,
                                      border: UnderlineInputBorder(),),
                                        keyboardType: TextInputType.number,
                                        maxLength: 11,
                                      )],
                                      ):
                                      DropdownButtonHideUnderline(
                                        child: DropdownButton2(
                                          isExpanded: true,
                                          hint: Row(
                                            children: const [
                                              Expanded(
                                                child: Text(
                                                  'Contact',
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
                                              items: passVisitorContactList
                                                  .map(
                                                    (e) => DropdownMenuItem(
                                                        value: e.id.toString(),
                                                        child: Text(
                                                            e.contactName.toString())),
                                                  )
                                                  .toList(),
                                              value: passContactId,
                                              onChanged: (value) {
                                                setState(() {
                                                  passContactId = value as String;
                                                  print(passContactId);
                                                });
                                              },
                                          icon: const Icon(
                                            Icons.arrow_forward_ios_outlined,
                                          ),
                                          iconSize: 14,
                                          iconEnabledColor: Colors.black,
                                          iconDisabledColor: Colors.grey,
                                          buttonHeight: 50,
                                          buttonWidth: 160,
                                          buttonPadding: const EdgeInsets.only(
                                              left: 14, right: 14),
                                          buttonDecoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(color: Colors.transparent)
                                            ],
                                            color: theme.dividerColor,
                                            borderRadius:
                                                BorderRadius.circular(14),
                                            // border: Border.all(
                                            //   color: Colors.black26,
                                            // ),
                                            // color: Colors.redAccent,
                                          ),
                                          buttonElevation: 1,
                                          itemHeight: 40,
                                          itemPadding: EdgeInsets.only(
                                              left: 14, right: 14),
                                          dropdownMaxHeight: 200,
                                          dropdownWidth: 200,
                                          dropdownPadding: null,
                                          dropdownDecoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.transparent)
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(14),
                                              color:
                                                  theme.scaffoldBackgroundColor),
                                          dropdownElevation: 8,
                                          scrollbarRadius:
                                              const Radius.circular(40),
                                          scrollbarThickness: 6,
                                          scrollbarAlwaysShow: true,
                                          offset: const Offset(-20, 0),
                                        ),
                                      ))
                                ],
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
                                      child: DropdownButtonHideUnderline(
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
                                          items: passVisitorTypeList
                                              .map(
                                                (e) => DropdownMenuItem(
                                                    value: e.id.toString(),
                                                    child:
                                                        Text(e.name.toString())),
                                              )
                                              .toList(),
                                          value: visitorTypeId,
                                          onChanged: (value) {
                                            setState(() {
                                              visitorTypeId = value as String;
                                              print(visitorTypeId);
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.arrow_forward_ios_outlined,
                                          ),
                                          iconSize: 14,
                                          iconEnabledColor: Colors.black,
                                          iconDisabledColor: Colors.grey,
                                          buttonHeight: 50,
                                          buttonWidth: 160,
                                          buttonPadding: const EdgeInsets.only(
                                              left: 14, right: 14),
                                          buttonDecoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(color: Colors.transparent)
                                            ],
                                            color: theme.dividerColor,
                                            borderRadius:
                                                BorderRadius.circular(14),
                                            // border: Border.all(
                                            //   color: Colors.black26,
                                            // ),
                                            // color: Colors.redAccent,
                                          ),
                                          buttonElevation: 1,
                                          itemHeight: 40,
                                          itemPadding: EdgeInsets.only(
                                              left: 14, right: 14),
                                          dropdownMaxHeight: 200,
                                          dropdownWidth: 200,
                                          dropdownPadding: null,
                                          dropdownDecoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.transparent)
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(14),
                                              color:
                                                  theme.scaffoldBackgroundColor),
                                          dropdownElevation: 8,
                                          scrollbarRadius:
                                              const Radius.circular(40),
                                          scrollbarThickness: 6,
                                          scrollbarAlwaysShow: true,
                                          offset: const Offset(-20, 0),
                                        ),
                                      ))
                                  //     ),
                                  //   ),
                                  // )
                                ],
                              ),
                            )
                          ],
                        );
                      }),
                    ),
                      Container(
                    margin:
                        EdgeInsets.only(top: height(20), bottom: height(20)),
                    height: height(50),
                    width: width(250),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.amber),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: theme.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        onPressed: () {
                          if(contactVisibility==false){
                             if(eventId == null||passTypeId==null || passDurationId==null||passContactId==null||visitorTypeId==null){
                            final snackBar = SnackBar(
                                content: const Text('Fill Form '),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          }else{
                            print(DateTime.now().toString());
                            print("eventID$eventId passTypeId$passTypeId passDurationId$passDurationId passContactId$passContactId visitorTYpeID$visitorTypeId");
                            print("APi");
                            // generate();
                             generatePassFunc(context,contactVisibility, eventId.toString(), passTypeId, passDurationId, visitorTypeId, passContactId, contactNameController.text.toString(), contactNoController.text.toString());
                          }
                          }if(contactVisibility==true){
                             if(eventId == null||passTypeId==null || passDurationId==null||visitorTypeId==null||contactNameController.text.isEmpty
                             ||contactNoController.text.isEmpty||contactNoController.text.length<11||contactNameController.text.length<3){
                                final snackBar = SnackBar(
                                content: const Text('Fill Form Completely'),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            print("fill form Field............");
                          }else{
                            
                            print("API Api");
                            generatePassFunc(context,contactVisibility, eventId.toString(), passTypeId, passDurationId, visitorTypeId, passContactId, contactNameController.text.toString(), contactNoController.text.toString());
                          }
                          }
                        },
                        child: LayoutBuilder(builder:
                            (BuildContext context, BoxConstraints constraints) {
                          return Text(
                              // constraints.maxWidth.toStringAsFixed(2),
                              "Generate Pass",
                              style: GoogleFonts.ubuntu(
                                  fontSize: constraints.maxHeight * 0.4,
                                  // width(30),
                                  // MediaQuery.of(context).size.height * 0.04,
                                  color: theme.cardColor));
                        }))),
                  ])),
            )));
  }
}
