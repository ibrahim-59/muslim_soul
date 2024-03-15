import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:quran_app/core/functions/send_email.dart';
import 'package:quran_app/core/utils/app_colors.dart';
import 'package:quran_app/core/utils/app_text_style.dart';

class ContactWithUsWidegt extends StatelessWidget {
  const ContactWithUsWidegt({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      child: ListTile(
        onTap: () async {
          await sendEmail(context);
        },
        title: const Text("تواصل معنا", style: CustomTextStyles.change18w400),
        leading: const Icon(IconlyLight.message, color: AppColors.primaryColor),
        trailing:
            const Icon(IconlyLight.arrow_left_2, color: AppColors.primaryColor),
      ),
    );
  }
}
