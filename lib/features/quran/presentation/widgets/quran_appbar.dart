import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:quran_app/core/functions/navigation.dart';
import 'package:quran_app/core/services/service_locator.dart';
import 'package:quran_app/core/utils/app_colors.dart';
import 'package:quran_app/core/utils/app_routes.dart';
import 'package:quran_app/core/utils/app_strings.dart';
import 'package:quran_app/core/utils/app_text_style.dart';
import 'package:quran_app/features/quran/presentation/quran_cubit/quran_cubit.dart';

AppBar quranAppBar(BuildContext context) {
  return AppBar(
    title: Text(AppStrings.qurankareem,
        style: CustomTextStyles.change22w500
            .copyWith(color: AppColors.primaryColor)),
    actions: [
      Padding(
        padding: const EdgeInsets.all(12),
        child: GestureDetector(
            onTap: () {
              customPushNavigation(
                  AppRoutes.searchView, context, getit<QuranCubit>().quranList);
            },
            child: const Icon(IconlyLight.search,
                size: 26, color: AppColors.primaryColor)),
      )
    ],
  );
}
