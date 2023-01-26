import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zsz/Screens/Billing_Screen/Functions/Billing_Function/billing_func.dart';
import 'package:zsz/Screens/Billing_Screen/Functions/Billing_Function/gas_current_billing.dart';
import 'package:zsz/Screens/Billing_Screen/Functions/Billing_History_Function/billing_history_func.dart';
import 'package:zsz/Screens/Billing_Screen/Tile/billing_history_tile.dart';
import 'package:zsz/Screens/Billing_Screen/Tile/billing_tile.dart';
import 'package:zsz/Screens/Billing_Screen/Tile/gas_bill_tile.dart';
import 'package:zsz/Widgets/Heading_Bar/PopHeadingBar.dart';
import 'package:zsz/Constant.dart';
import 'package:zsz/responsive.dart';

class Billing_Screen extends StatelessWidget {
  const Billing_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final _size = MediaQuery.of(context).size;
    SizeConfig().init(context);

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
                  child: PopHeadingBar(context, "My Billing", 22, "null")),

              // Billing_Tile("$User_Login_name_S", "$User_Login_Address_S", "....",
              //     ".....", "....."),

              // Billing Tile
              Container(
                child: StreamBuilder(
                    stream:
                        MaintenanceApiFunc(context, User_Login_id_S.toString())
                            .asStream(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Billing_Tile(
                            "$User_Login_name_S",
                            "$User_Login_Address_S",
                            ".....",
                            ".....",
                            ".....",
                            ".....");
                      } else if (snapshot.hasData) {
                        var Index_B = MaintenanceList.first;
                        return Billing_Tile(
                            User_Login_name_S.toString(),
                            User_Login_Address_S.toString(),
                            Index_B.month.toString(),
                            Index_B.dueDate.toString(),
                            Index_B.amount.toString(),
                            Index_B.payDate.toString());
                        // Billing_Tile(
                        //     Billing_List.first.user.toString(),
                        //     Billing_List.first.address.toString(),
                        //     Billing_List.first.month.toString(),
                        //     Billing_List.first.dueDate.toString(),
                        //     Billing_List.first.amount.toString(),
                        //     Billing_List.first.payDate.toString());
                      } else {
                        return Billing_Tile(
                            "$User_Login_name_S",
                            "$User_Login_Address_S",
                            "....",
                            ".....",
                            ".....",
                            ".....");
                      }
                    }),
              ),
              StreamBuilder(
                  stream:
                      GasCurrentBillingFunc(context, User_Login_Address_Id_S)
                          .asStream(),
                  // gasBillingAllFunc("242").asStream(),
                  // MaintenanceApiFunc(context, User_Login_id_S.toString())
                  //     .asStream(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Gas_bill_widget(
                          context, "....", "....", "....", "....", 1, 1);
                      // Billing_Tile(
                      //     "$User_Login_name_S",
                      //     "$User_Login_Address_S",
                      //     ".....",
                      //     ".....",
                      //     ".....",
                      //     ".....");
                    } else if (snapshot.hasData) {
                      var Index_current = GasCurrentBillingList.first;
                      // MaintenanceList.first;
                      return Gas_bill_widget(
                          context,
                          Index_current.month.toString(),
                          Index_current.payment.toString(),
                          Index_current.dueDate.toString(),
                          Index_current.message.toString(),
                          int.parse(Index_current.currentReading.toString()),
                          int.parse(
                            Index_current.previousReading.toString(),
                          ));
                      // Billing_Tile(
                      //     User_Login_name_S.toString(),
                      //     User_Login_Address_S.toString(),
                      //     Index_B.month.toString(),
                      //     Index_B.dueDate.toString(),
                      //     Index_B.amount.toString(),
                      //     Index_B.payDate.toString());

                    } else {
                      return Gas_bill_widget(
                          context, "....", "....", "....", "....", 1, 1);
                      //  Billing_Tile(
                      //     "$User_Login_name_S",
                      //     "$User_Login_Address_S",
                      //     "....",
                      //     ".....",
                      //     ".....",
                      //     ".....");
                    }
                  }),

              // Gas_bill_widget(context, "Mar", "2323", "Mar,22,2020"),

              // Billing History
              Container(
                  margin: EdgeInsets.fromLTRB(_size.width * 0.018,
                      _size.height * 0.02, 0, _size.height * 0.02),
                  child: Text("Billing History",
                      style: GoogleFonts.ubuntu(
                          fontSize: height(20), color: theme.focusColor))),

              Expanded(
                child: Container(
                  height: _size.height * 0.38,
                  child: StreamBuilder(
                      stream:
                          MaintenanceHistoryApiFunc(User_Login_id_S.toString())
                              .asStream(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Column(
                            children: [
                              Billing_History_Tile(
                                  "...", "....", "....", "...."),
                              // Billing_History_Tile(
                              //     "...", "....", "....", "...."),
                              // Billing_History_Tile("...", "....", "....", "....")
                            ],
                          );
                        } else {
                          return Scrollbar(
                            // thickness: 2,
                            isAlwaysShown: true,
                            child: ListView.builder(
                                // physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: MaintenanceHistoryList.length,
                                itemBuilder: (context, index) {
                                  final Index_m = MaintenanceHistoryList[index];
                                  return Billing_History_Tile(
                                      Index_m.month.toString(),
                                      Index_m.billAmount.toString(),
                                      Index_m.payDate.toString(),
                                      Index_m.payment.toString());
                                }),
                          );
                        }
                      }),
                ),
              ),
              // Billing_History_Tile()
            ],
          ),
        ),
      ),
    );
  }
}
