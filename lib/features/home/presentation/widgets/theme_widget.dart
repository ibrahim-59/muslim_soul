import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quran_app/core/utils/app_colors.dart';
import 'package:quran_app/core/utils/app_text_style.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box("darkModeBox").listenable(),
      builder: (context, box, child) {
        Brightness defaultThemeMode = MediaQuery.of(context).platformBrightness;
        var darktheme = box.get("darkMode",
            defaultValue: defaultThemeMode == Brightness.dark ? true : false);
        return SwitchListTile(
          contentPadding: const EdgeInsets.only(right: 16),
          secondary: const Icon(
            Icons.light_mode_outlined,
            color: AppColors.primaryColor,
          ),
          title:
              const Text("الوضع الليلي", style: CustomTextStyles.change18w400),
          value: darktheme,
          activeColor: AppColors.primaryColor,
          inactiveThumbColor: AppColors.primaryColor,
          onChanged: (bool value) {
            box.put("darkMode", !darktheme);
          },
        );
      },
    );
  }
}
