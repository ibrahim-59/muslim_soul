import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/core/utils/app_colors.dart';
import 'package:quran_app/core/utils/app_text_style.dart';
import 'package:quran_app/features/home/presentation/widgets/contact_withus.dart';
import 'package:quran_app/features/home/presentation/widgets/theme_widget.dart';

class AppSettingsWidget extends StatelessWidget {
  const AppSettingsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16),
          FadeInUp(
            child: Center(
                child: Text("اعدادات التطبيق",
                    style: CustomTextStyles.change20W500.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w600))),
          ),
          const SizedBox(height: 20),
          FadeInUp(
            child: const Divider(
                thickness: 0,
                endIndent: 16,
                indent: 16,
                color: AppColors.primaryColor),
          ),
          FadeInUp(child: const ThemeSwitch()),
          const SizedBox(height: 16),
          const ContactWithUsWidegt(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
