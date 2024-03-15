// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Future<void> sendEmail() async {
//   final Email email = Email(
//     body: 'يرجي كتابه اي ملاحظه او استفسار ',
//     subject: 'تطبيق القرأن الكريم - روح المسلم',
//     recipients: ['recipient@example.com'],
//     cc: ['cc@example.com'],
//     bcc: ['bcc@example.com'],
//     attachmentPaths: ['/path/to/attachment'],
//     isHTML: false,
//   );

//   String platformResponse;

//   try {
//     await FlutterEmailSender.send(email);
//     platformResponse = 'Email sent successfully';
//   } catch (error) {
//     platformResponse = error.toString();
//   }

//   log(platformResponse);
// }
Future sendEmail(BuildContext context) async {
  // Email parameters
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: "hemaabdullah6@gmail.com",
  );

  // Check if the URL can be launched
  if (await canLaunchUrl(emailLaunchUri)) {
    await launchUrl(emailLaunchUri);
  } else {
    throw 'Could not launch $emailLaunchUri';
  }
}
