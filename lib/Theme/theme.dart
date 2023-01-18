import 'package:flutter/material.dart';

//stf custome theme bnani he

CustomTheme currentTheme = CustomTheme();

class CustomTheme with ChangeNotifier {
  // var context;
  // CustomTheme(this.context);

  static bool _isDarkTheme = false;
  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  // static BuildContext get context => BuildContext(MyApp());

// change theme function//

  void changeTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

// Light theme data

  static ThemeData get lightTheme {
    return ThemeData(
        primaryColor: Color(0xff015e8b),
        // Color.fromARGB(208, 23, 113, 109),
        // Colors.green,
        primaryColorDark: Color.fromARGB(255, 4, 68, 100),
        primaryColorLight: Color.fromARGB(193, 48, 129, 169),
        scrollbarTheme: ScrollbarThemeData(
          thickness: MaterialStateProperty.all(2),
          thumbColor: MaterialStateProperty.all(
            Color.fromARGB(21, 0, 0, 0),
          ),
          // thumbColor: MaterialStateProperty.all(Colors.grey[500]),
        ),
        //  Color.fromARGB(208, 23, 113, 109),
        // Color.fromARGB(177, 38, 116, 38),
//text colors
        focusColor: Colors.black,
        scaffoldBackgroundColor: Color(0xffF5F8FA),
        cardColor: Colors.white,
        // Color.fromARGB(236, 255, 255, 255),
        dividerColor: Color.fromARGB(21, 0, 0, 0),
//Card Text
        highlightColor: Color.fromARGB(135, 0, 0, 0)

        // textTheme: TextTheme(
        //     headline1: TextStyle(color: Colors.black, fontSize: 19),
        //     button: TextStyle(
        //       color: Color.fromRGBO(0, 0, 0, 1),
        //       // fontSize: MediaQuery.of(context).size.height * 0.4
        //     )
        //     )
        );
  }

// Dark theme data

  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: Colors.green,
//text colors
      focusColor: Colors.white,
      scaffoldBackgroundColor: Color.fromARGB(153, 0, 0, 0),
      // textTheme: TextTheme(
      //     headline1: TextStyle(color: Colors.white, fontSize: 19),
      //     button: TextStyle(
      //       color: Colors.white,
      //       //  fontSize: 20
      //     ))
    );
  }
}
