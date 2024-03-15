import 'package:flutter/material.dart';
import 'package:quran_app/features/home/presentation/widgets/app_settings_widget.dart';

Future<dynamic> appSettings(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    builder: (context) {
      return const AppSettingsWidget();
    },
  );
}
