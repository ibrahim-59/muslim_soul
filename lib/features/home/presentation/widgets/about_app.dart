import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:quran_app/core/functions/navigation.dart';
import 'package:quran_app/core/utils/app_colors.dart';
import 'package:quran_app/core/utils/app_routes.dart';
import 'package:quran_app/core/utils/app_text_style.dart';

class AboutAppWidget extends StatelessWidget {
  const AboutAppWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      child: ListTile(
        onTap: () {
          customPushNavigation(AppRoutes.aboutApp, context, "extra");
        },
        title: const Text("عن التطبيق", style: CustomTextStyles.change18w400),
        leading: const Icon(IconlyLight.setting, color: AppColors.primaryColor),
        trailing:
            const Icon(IconlyLight.arrow_left_2, color: AppColors.primaryColor),
      ),
    );
  }
}
