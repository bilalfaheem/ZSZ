import 'package:flutter/material.dart';
import 'package:zsz/Screens/Orders_Screen/Pages/Order/functions/order_fetch_api_func.dart';
import 'package:zsz/Screens/Orders_Screen/Tile/order_tile.dart';
import 'package:zsz/Screens/Orders_Screen/Pages/Order_History/functions/order_history_fetch_api_func.dart';
import 'package:zsz/Screens/Orders_Screen/Pages/Order_History/order_history_tile.dart';
import 'package:zsz/Constant.dart';

class Order_History extends StatefulWidget {
  const Order_History({Key? key}) : super(key: key);

  @override
  State<Order_History> createState() => _Order_HistoryState();
}

class _Order_HistoryState extends State<Order_History> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child:
            //remove conatainer
            Column(
          children: [
            StreamBuilder(
                stream: History_Order_Function(userLoginIdShared.toString())
                    .asStream(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Column(
                      children: [
                        SizedBox(
                          height: _size.height / 3.7,
                        ),
                        Center(
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Container(
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: History_Order_List.length,
                          itemBuilder: (context, index) {
                            return Order_tile(
                                History_Order_List[index].orderId.toString(),
                                History_Order_List[index].fullName.toString(),
                                History_Order_List[index].unitNo.toString(),
                                History_Order_List[index].createdAt.toString(),
                                History_Order_List[index].status.toString(),
                                History_Order_List[index].createdAt.toString(),
                                History_Order_List[index].type.toString(),
                                History_Order_List[index].deliveryAt.toString(),
                                "Delivered",
                                0.02);
                          }),
                    );
                  }
                })
//               StreamBuilder(
//                 stream: History_Order_Function(70).asStream(),
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         SizedBox(
//                           height: _size.height / 3.7,
//                         ),
//                         Center(
//                           child: CircularProgressIndicator(
//                             color: Colors.black,
//                           ),
//                         )
//                       ],
//                     );
//                   } else {
//                     return Container(
//                       child: ListView.builder(
//                           physics: NeverScrollableScrollPhysics(),
//                           shrinkWrap: true,
//                           itemCount: History_Order_List.length,
//                           itemBuilder: (context, index) {
//                             return

//                             Order_tile("id", "name", "address", "date", "status", "time", "tanker_type");
// //remove

//                             // Order_tile(History_Order_List[index].id.toString(),
//                             //  History_Order_List[index].fullName.toString(), History_Order_List[index].unitNo.toString(),
//                             //  History_Order_List[index].id.toString(),
//                             // History_Order_List[index].status.toString(), History_Order_List[index].id.toString(),
//                             //  History_Order_List[index].type.toString());

//                                 // order_History_Tile(_size.height, theme);

//                             //  Order_tile("${History_Order_List[index].id}", "${History_Order_List[index].unitNo}",  "${History_Order_List[index].date}",
//                             //   "${History_Order_List[index].status}","${History_Order_List[index].type},"${History_Order_List[index].time}");

//                             //  order_Tile(context, _size.height, theme, History_Order_List[index].id, History_Order_List[index].unitNo, History_Order_List[index].createdAt, History_Order_List[index].status);
//                             //  order_History_Tile(_size.height, theme);
//                           }),
//                     );
//                   }
//                 },
//               )

            // order_History_Tile(_size.height, theme),
            //             order_History_Tile(_size.height, theme)
          ],
        ),
      ),
    );
  }
}
