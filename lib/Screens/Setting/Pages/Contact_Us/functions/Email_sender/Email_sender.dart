import 'package:url_launcher/url_launcher_string.dart';

Future launchEmail(String email_address, String subject, String body) async {
  final url =
      'mailto:$email_address?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(body)}';
  print(url);
  print("Launch Email Func");
  if (1 == 1) {
    await launchUrlString(url);
  }
}

// mailto:John.Doe@example.com?subject=Example
