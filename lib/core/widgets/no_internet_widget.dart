import 'package:flutter/material.dart';
import 'package:quran_app/core/utils/app_assets.dart';
import 'package:quran_app/core/utils/app_colors.dart';
import 'package:quran_app/core/utils/app_strings.dart';
import 'package:quran_app/core/utils/app_text_style.dart';
import 'package:quran_app/core/widgets/custom_center_image.dart';

class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CustomCenterImage(image: Assets.assetsSvgNoInternet),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(AppStrings.checkYourInternet,
              style: CustomTextStyles.change20W500
                  .copyWith(color: AppColors.primaryColor)),
        ),
      ],
    );
  }
}
