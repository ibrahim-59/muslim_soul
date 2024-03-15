import 'dart:developer';

import 'package:intl/intl.dart';

String formatToPmOrAm(String time) {
  // Parse the time string to a DateTime object
  DateTime parsedTime = DateFormat("HH:mm").parse(time);

  // Format the time in 12-hour format with AM/PM indicator
  String convertedDate = DateFormat("h:mm a").format(parsedTime);
  String formatedDate = convertToArabic(convertedDate);
  return formatedDate;
}

String convertToArabic(String time) {
  // Split the time string into hour and minute parts
  List<String> parts = time.split(' ');
  String timeIndicator = parts[0]; // AM or PM
  String timeString = parts[1];
// Time in HH:mm format

  // Split the time string into hour and minute
  List<String> timeParts = timeIndicator.split(':');
  String hour = timeParts[0];
  String minute = timeParts[1];

  // Convert hour to Arabic numeral if it's in the AM format
  if (timeString == 'AM') {
    return 'ص ${_convertNumberToArabic(hour)}:${_convertNumberToArabic(minute)}';
  } else {
    return 'م ${_convertNumberToArabic(hour)}:${_convertNumberToArabic(minute)}';
  }
}

String _convertNumberToArabic(String number) {
  String arabicNumber = '';
  String englishDigits = number.toString();
  Map<String, String> arabicDigitsMap = {
    '0': '٠',
    '1': '١',
    '2': '٢',
    '3': '٣',
    '4': '٤',
    '5': '٥',
    '6': '٦',
    '7': '٧',
    '8': '٨',
    '9': '٩',
  };

  for (int i = 0; i < englishDigits.length; i++) {
    String digit = englishDigits[i];
    arabicNumber += arabicDigitsMap[digit]!;
  }

  return arabicNumber;
}

DateTime convertToDateTime(String timeString) {
  // Get current date
  DateTime now = DateTime.now();

  // Split the time string into hour and minute parts
  List<String> timeParts = timeString.split(':');
  int hour = int.parse(timeParts[0]);
  int minute = int.parse(timeParts[1]);

  // Create a new DateTime object with today's date and the given time
  DateTime dateTime = DateTime(now.year, now.month, now.day, hour, minute);

  return dateTime;
}

String getNextTime(List<String> times) {
  final now = DateTime.now();

  // Find the next time
  String nextTime = '';
  for (String time in times) {
    final timeParts = time.split(':');
    final hour = int.parse(timeParts[0]);
    final minute = int.parse(timeParts[1]);

    // Create DateTime object for the time in the list
    final timeInList = DateTime(now.year, now.month, now.day, hour, minute);

    // Check if the time is in the future
    if (timeInList.isAfter(now)) {
      nextTime = time;
      break;
    }
  }

  // If no next time found, take the first time from the list
  if (nextTime.isEmpty) {
    nextTime = times.first;
  }
  log(nextTime);
  return nextTime;
}
