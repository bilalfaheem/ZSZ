// import 'dart:async';

// import 'package:connectivity/connectivity.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// Future<void> initConnectivity() async {
//   ConnectivityResult result = ConnectivityResult.none;

//   try {
//     result = await _connectivity.checkConnectivity();
//   } on PlatformException catch (e) {
//     print(e.toString());
//   }

//   if (!mounted) {
//     return Future.value(null);
//   }

//   return _updateConnectionStatus(result);
// }

// Future<void> _updateConnectionStatus(ConnectivityResult result) async {
//   switch (result) {
//     case ConnectivityResult.wifi:
//       setState(() => _connectionStatus = "wifi");
//       break;
//     case ConnectivityResult.mobile:
//     case ConnectivityResult.none:
//       setState(() => _connectionStatus = "none");
//       break;
//     default:
//       setState(() => _connectionStatus = 'Failed to get connectivity.');
//       break;
//   }
// }

// //
// final Connectivity _connectivity = Connectivity();
// StreamSubscription<ConnectivityResult> _connectivitySubscription;

// //
// String _connectionStatus = 'Unknown';

// //
// // initConnectivity();
// _connectivitySubscription =
//     _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);

// //
// // connectivity: ^3.0.6
// // stream_subscription_builder: ^0.1.0+4

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

// interner connection status
bool Has_Connection = false;

Future<void> connectivity_status_func(context) async {
  Has_Connection = false;

  Has_Connection = await InternetConnectionChecker().hasConnection;
  if (Has_Connection == false) {
    dd(context);
  }
//   else if(Has_Connection == true){
// func;
//   }
}

Future<void> connectivity_func_pop(context) async {
  Has_Connection = false;

  Has_Connection = await InternetConnectionChecker().hasConnection;
  if (Has_Connection == false) {
    Navigator.pop(context);
    dd(context);
  }
//   else if(Has_Connection == true){
// func;
//   }
}

void dd(context) {
  ScaffoldMessenger.of(context).showSnackBar(
    new SnackBar(
      backgroundColor: Theme.of(context).primaryColorLight,
      //  Color.fromARGB(133, 76, 175, 79),

      // backgroundColor: Colors.amber,
      content: Container(
        // height: 40,
        // color: Colors.amber,
        child: ListTile(
            leading: Icon(Icons.signal_wifi_connected_no_internet_4_sharp,
                color: Colors.white),
            title: Text("No Internet",
                style: GoogleFonts.ubuntu(
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                    color: Colors.white))),
      ),
      // Text('No Internet Access'),

      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(MediaQuery.of(context).size.width * 0.03),
      ),
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height * 0.75,
          right: MediaQuery.of(context).size.width * 0.05,
          left: MediaQuery.of(context).size.width * 0.05),
    ),
  );
}
