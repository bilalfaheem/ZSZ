import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:zsz/Screens/Orders_Screen/Pages/Order/Pages/Order_Details/screen/order_details.dart';

class Order_tile extends StatefulWidget {
  String id,
      name,
      address,
      date,
      status,
      time,
      tanker_type,
      delivery_time,
      Expected;
  num margin_delivery_date;
  Order_tile(
      this.id,
      this.name,
      this.address,
      this.date,
      this.status,
      this.time,
      this.tanker_type,
      this.delivery_time,
      this.Expected,
      this.margin_delivery_date);

  @override
  State<Order_tile> createState() => _Order_tileState();
}

class _Order_tileState extends State<Order_tile> {
  var Status_color = Colors.black;
  // var date_time = "null";
  // var split_datee = "date";
  // var split_timee = "time";
  String order_Status_var = "null status";
  // String tanker_Type = "Type";

  void initState() {
    super.initState();
    status_color_check();
    // splitt();
    // Tanker_Type_Check();
    print("fasdfdskfajfajfadfklaflaflkfasdflasfasfjalsfla");
  }

  void status_color_check() {
    order_Status_var = widget.status.toString();
    print("Status _colorCheck");
    if (order_Status_var == "Completed") {
      Status_color = Colors.green;
      order_Status_var = "Delivered";
    } else if (order_Status_var == "Active") {
      Status_color = Color.fromARGB(251, 155, 39, 176);
    } else {
      Status_color = Color.fromARGB(151, 238, 62, 49);
    }
  }

  // void splitt() {
  //   print("${widget.date} widget date");
  //   // date_time = widget.date;
  //   // date_time = "2022-05-20 19:08:05";
  //   var ss = widget.date.split(" ");
  //   split_datee = ss[0].trim();
  //   print("${split_datee} split date");
  //   split_timee = ss[1].trim();
  //   print("${split_timee} split time");
  // }

  // void Tanker_Type_Check() {
  //   print("Tanker_Type_Check");
  //   if (widget.tanker_type == "2T") {
  //     tanker_Type = "Double Tanker";
  //   } else if (widget.tanker_type == "T") {
  //     tanker_Type = "Single Tanker";
  //   } else if (widget.tanker_type == "S") {
  //     tanker_Type = "Swap";
  //   } else if (widget.tanker_type == "C") {
  //     tanker_Type = "Cash";
  //   } else {
  //     tanker_Type = "type";
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final size = MediaQuery.of(context).size.height;
    return order_Tile(
        context,
        size,
        theme,
        widget.id,
        widget.name,
        widget.address,
        DateFormat.MMMEd().format(DateTime.parse(widget.date)),
        // split_datee.toString(),
        order_Status_var,
        // widget.status,
        Status_color,
        widget.tanker_type,
        DateFormat.jm().format(DateTime.parse(widget.date)),
        //  split_timee.toString(),
        widget.delivery_time,
        // DateFormat.MMMEd().format(DateTime.parse(widget.delivery_time)),
        // widget.delivery_time,
        widget.Expected,
        widget.margin_delivery_date);
  }
}

Widget order_Tile(
    context,
    size,
    theme,
    id,
    name,
    address,
    date,
    status,
    status_Color,
    Tanker_type,
    time,
    delivery_time,
    Expected,
    num margin_delivery_date) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Order_Details(
                name,
                address,
                id,
                status,
                Tanker_type,
                time,
                date,
                delivery_time,
                Expected,
                margin_delivery_date)),
      );

      print("On tap Order Details");
    },
    child: Container(
      margin: EdgeInsets.only(top: size * 0.02),
      // height: size * 0.19,
      child: Card(
        shadowColor: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(size * 0.028)),
        color: theme.cardColor,
        child: Padding(
          padding: EdgeInsets.all(size * 0.025),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Order Id: ${id}",
                      style: GoogleFonts.ubuntu(
                          fontSize: size * 0.022,
                          color: theme.focusColor,
                          fontWeight: FontWeight.w500)),
                  // Text("PKR 288",
                  //     style: GoogleFonts.ubuntu(
                  //         fontSize: size * 0.024, color: theme.primaryColor))
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: size * 0.014),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/Icons/Tanker.png",
                      // width: 40,
                      height: size / 27,
                      fit: BoxFit.cover,
                      color: theme.primaryColor,
                    ),
                    Text("   $Tanker_type",
                        style: GoogleFonts.ubuntu(
                            fontSize: size * 0.022,
                            color: theme.highlightColor)),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: size * 0.014),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/Bottom_Bar/Clock.png",
                      // width: 40,
                      height: size / 34,
                      fit: BoxFit.cover,
                      color: theme.primaryColor,
                    ),
                    Text("    ${time}",
                        style: GoogleFonts.ubuntu(
                            fontSize: size * 0.021,
                            color: theme.highlightColor)),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Image.asset(
                      "assets/Icons/Date.png",
                      // width: 40,
                      height: size / 34,
                      fit: BoxFit.cover,
                      color: theme.primaryColor,
                    ),
                    Text("    ${date}",
                        style: GoogleFonts.ubuntu(
                            fontSize: size * 0.021,
                            color: theme.highlightColor)),
                  ]),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: size * 0.007, horizontal: size * 0.012),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(size * 0.02),
                        color: status_Color
                        //  Color.fromARGB(202, 126, 38, 141)
                        ),
                    child: Text("$status",
                        style: GoogleFonts.ubuntu(
                            fontSize: size * 0.02, color: Colors.white)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}
