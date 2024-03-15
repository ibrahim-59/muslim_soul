import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:iconly/iconly.dart';
import 'package:quran_app/core/utils/app_assets.dart';
import 'package:quran_app/core/utils/app_colors.dart';
import 'package:quran_app/core/utils/app_strings.dart';
import 'package:quran_app/core/utils/app_text_style.dart';

class MenuScreenPage extends StatelessWidget {
  const MenuScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          width: double.infinity,
          decoration:
              BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor),
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Image.asset(Assets.assetsHomeiconsAppLogo),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              ListTile(
                leading: const Icon(
                  IconlyLight.home,
                  color: AppColors.primaryColor,
                ),
                onTap: () {
                  ZoomDrawer.of(context)!.close();
                },
                title: const Text(
                  AppStrings.main,
                  style: CustomTextStyles.change18w400,
                ),
              ),
              const ListTile(
                leading: Icon(
                  IconlyLight.notification,
                  color: AppColors.primaryColor,
                ),
                title: Text(
                  AppStrings.main,
                  style: CustomTextStyles.change18w400,
                ),
              ),
              ValueListenableBuilder(
                valueListenable: Hive.box("darkModeBox").listenable(),
                builder: (context, box, child) {
                  var darkMode = box.get("darkMode", defaultValue: false);
                  return SwitchListTile(
                    contentPadding: const EdgeInsets.only(right: 16),
                    secondary: const Icon(
                      Icons.light_mode_outlined,
                      color: AppColors.primaryColor,
                    ),
                    title: const Text("الوضع الليلي",
                        style: CustomTextStyles.change18w400),
                    value: darkMode,
                    activeColor: AppColors.primaryColor,
                    inactiveThumbColor: AppColors.primaryColor,
                    onChanged: (bool value) {
                      box.put("darkMode", !darkMode);
                    },
                  );
                },
              ),
              const ListTile(
                leading: Icon(
                  IconlyLight.message,
                  color: AppColors.primaryColor,
                ),
                title: Text(
                  AppStrings.main,
                  style: CustomTextStyles.change18w400,
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
