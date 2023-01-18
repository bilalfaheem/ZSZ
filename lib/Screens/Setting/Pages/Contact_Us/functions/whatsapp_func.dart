import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_launch/flutter_launch.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:http/http.dart' as http;

// Future <void> whatsAppOpen() async {
//     bool whatsapp = await FlutterLaunch.hasApp(name: "whatsapp");
//     print("$whatsapp whatsapp status in app ");

//     if (whatsapp) {
//       print("whatapp present  ");
//       await FlutterLaunch.launchWhatsapp(
//           phone: "+923362314013", message: "Hello, flutter_launch");
//     } else {
//       print("erroe in whatsapp open");
//       // setState(() {
//         // err = false;
//         // msgErr = '';
//       // });
//     }
//   }

// void openwhatsappchat()async{
// String phone_no = "923417679812";
// String url = "https://api.whatsapp.com/send?phone=923172746242&text=safeer%20here";
// if ( phone_no == phone_no ){
//   final hit = await http.read(Uri.parse(url));
//     // http.post(Uri.parse(url));
// }else {
//   print("openwhatsappchat error");
// }
// }

void openwhatsappchat() async {
  String phone_no = "923417679812";
  var url = "https://wa.me/$phone_no?text=HelloWorld";
  if (phone_no == phone_no) {
    await launchUrlString(url);
  } else {
    print("openwhatsappchat error");
  }
}

openwhatsapp(context) async {
  var whatsapp = "03417679812";
  var whatsappURL_android = "whatsapp://send?phone=" + whatsapp + "&text=hello";
  var whatsappURL_ios = "https://wa.me/$whatsapp?text=${Uri.parse("hello")}";

  if (Platform.isIOS) {
    if (await canLaunchUrl(Uri.parse(whatsappURL_ios))) {
      await launchUrl(Uri.parse(whatsappURL_ios));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: new Text("Whatsapp not Installed")));
    }
  } else {
    if (await canLaunchUrl(Uri.parse(whatsappURL_android))) {
      await launchUrl(Uri.parse(whatsappURL_android));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: new Text("Whatsapp not Installed")));
    }
  }
}

void whatsAppOpen_web() async {
  await FlutterLaunch.launchWhatsapp(phone: "+923362314013", message: "Hello");
}
