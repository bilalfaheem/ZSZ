import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

String first_term =
    "Daily Tanker Request Quota is 100. If the orders exceeded from quota, you will not be able to place your order till next day.";
String second_term =
    "Delivery Timing is from 8:00 am – 11:59 pm. Water Tanker can be delayed due to any force majeure/ electricity failure and maintenance. In case someone tries trespass, damage or harass workers/ private property Wenergy International has the right to take legal action against that person.";
String third_term =
    "Order will be considered failed, if no one at delivery point receives the water tanker within 7 minutes and you have to place a new request.";
String fourth_term =
    "Residents will be notified via notification when their delivery is scheduled.";
String fifth_term = "Once order is placed, it can take upto 3 days to deliver.";
String sixth_term =
    "Monthly Water Tanker Quota is limited to 4 tankers. If there’s a need of 5th tanker you can place order via cash option.";

class Term_text extends StatelessWidget {
  String term_text;
  Term_text(this.term_text);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final _size = MediaQuery.of(context).size;
    return ListTile(
      minLeadingWidth: _size.width * 0.04,
      leading: Icon(Icons.circle_rounded,
          size: _size.width * 0.03, color: theme.primaryColorLight
          //  Color.fromARGB(255, 112, 205, 115)
          ),
      title: Text(term_text,
          // "Daily Tanker Request Quota is 100 if the orders exceeded from quota you will not be able to place order you have to wait for next day",
          style: GoogleFonts.ubuntu(
              fontSize: MediaQuery.of(context).size.height * 0.0185,
              color: Color.fromARGB(210, 0, 0, 0))),
    );
  }
}
