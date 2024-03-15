String convertNumbers(String inputStr) {
  Map<String, Map<String, String>> numberSets = {
    'العربية': {
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
    },
    'English': {
      '0': '0',
      '1': '1',
      '2': '2',
      '3': '3',
      '4': '4',
      '5': '5',
      '6': '6',
      '7': '7',
      '8': '8',
      '9': '9',
    },
    'বাংলা': {
      '0': '০',
      '1': '১',
      '2': '২',
      '3': '৩',
      '4': '৪',
      '5': '৫',
      '6': '৬',
      '7': '৭',
      '8': '৮',
      '9': '৯',
    },
    'اردو': {
      '0': '۰',
      '1': '۱',
      '2': '۲',
      '3': '۳',
      '4': '۴',
      '5': '۵',
      '6': '۶',
      '7': '۷',
      '8': '۸',
      '9': '۹',
    },
  };

  Map<String, String>? numSet = numberSets['العربية'];

  if (numSet == null) {
    return inputStr;
  }

  for (var entry in numSet.entries) {
    inputStr = inputStr.replaceAll(entry.key, entry.value);
  }

  return inputStr;
}
