// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:quran_app/core/functions/show_toast.dart';
import 'package:quran_app/core/utils/app_strings.dart';

checkInternet(BuildContext context) async {
  try {
    var result = await InternetAddress.lookup("google.com");
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
  } on SocketException catch (_) {
    showToast(msg: AppStrings.checkYourInternet, context: context);
    return false;
  }
}
