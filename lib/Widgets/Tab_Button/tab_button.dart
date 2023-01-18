import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabButton extends StatelessWidget {
  final String? text;
  final int? selectedPage;
  final int? pageNumber;
  final VoidCallback? onPressed;
  TabButton(
      {required this.text,
      required this.selectedPage,
      required this.pageNumber,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final _size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressed,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 1000),
        curve: Curves.fastLinearToSlowEaseIn,
        decoration: BoxDecoration(
          // color: selectedPage == pageNumber ? Colors.blue : Colors.transparent,
          // borderRadius: BorderRadius.circular(4.0),
          border: Border(
              bottom: selectedPage == pageNumber
                  ? BorderSide(
                      // color: theme.primaryColor,
                      width: 2.5,
                    )
                  : BorderSide(
                      color: Color.fromRGBO(0, 0, 0, 0.1),
                      width: 2.5,
                    )),
        ),
        padding: EdgeInsets.symmetric(
          vertical: selectedPage == pageNumber ? 8.0 : 8.0,
          horizontal: selectedPage == pageNumber ? 8.0 : 8.0,
        ),
        margin: EdgeInsets.symmetric(
          vertical: selectedPage == pageNumber ? 0 : 8.0,
          horizontal: selectedPage == pageNumber ? 0 : 8.0,
        ),
        child: Text(text ?? "Tab Button",
            style: GoogleFonts.ubuntu(
                fontSize: _size.height * 0.023,
                color: selectedPage == pageNumber
                    ? theme.primaryColor
                    : Colors.black,
                fontWeight: FontWeight.w500)
            // style: TextStyle(
            //   color:

            //   fontSize: 18,
            //   fontWeight: FontWeight.w400,
            // ),
            ),
      ),
    );
  }
}
