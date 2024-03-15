import 'package:flutter/material.dart';
import 'package:quran_app/core/utils/app_colors.dart';
import 'package:quran_app/core/utils/app_strings.dart';
import 'package:quran_app/core/utils/app_text_style.dart';

class StartDescription extends StatelessWidget {
  const StartDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(AppStrings.locationPermission,
              style: CustomTextStyles.change20W500
                  .copyWith(color: AppColors.primaryColor)),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Text(AppStrings.locationUsed,
              textAlign: TextAlign.center,
              style: CustomTextStyles.change20W500
                  .copyWith(color: AppColors.primaryColor)),
        ),
      ],
    );
  }
}
