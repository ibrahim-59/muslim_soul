import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:quran_app/features/home/presentation/widgets/app_settings.dart';

AppBar homeAppBar(BuildContext context) {
  return AppBar(
    title: Text(
      DateTime.now().hour < 12 ? 'صبحكم الله بالخير' : 'مساكم الله بالخير',
      style: const TextStyle(
        fontSize: 22.0,
        fontFamily: 'kufi',
      ),
    ),
    leading: IconButton(
        onPressed: () {
          appSettings(context);
        },
        icon: const Icon(IconlyBold.setting, size: 26)),
  );
}
