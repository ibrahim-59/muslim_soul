import 'package:flutter/material.dart';
import 'package:quran_app/core/utils/app_colors.dart';
import 'package:quran_app/core/utils/app_strings.dart';
import 'package:quran_app/core/utils/app_text_style.dart';

class AboutAppView extends StatelessWidget {
  const AboutAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.aboutApp),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text("عن التطبيق",
              style: CustomTextStyles.change20W500
                  .copyWith(color: AppColors.primaryColor)),
          const SizedBox(height: 16),
          Text(
            "تطبيق روح المسلم هو تطبيق متكامل يقدم مجموعة من المميزات وم هذة المميزات :",
            style: CustomTextStyles.change20W500
                .copyWith(color: AppColors.primaryColor),
          ),
          const SizedBox(height: 16),
          Text(
            "- واجة جديدة وسهلة الاستخدام : تم تصميم التطبيق بواجه مستخم عصرية وبديهية تسهل تسهل علي المستخدم التنقل والوصول الي مزايا مختلفة ",
            style:
                Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 18),
          ),
          const SizedBox(height: 16),
          Text(
            " - ",
            style:
                Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
