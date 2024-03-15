import 'package:flutter/material.dart';
import 'package:quran_app/core/functions/navigation.dart';
import 'package:quran_app/core/utils/app_assets.dart';
import 'package:quran_app/core/utils/app_routes.dart';
import 'package:quran_app/core/utils/app_strings.dart';
import 'package:quran_app/features/home/presentation/widgets/home_item.dart';
import 'package:quran_app/features/home/presentation/widgets/show_doaa.dart';
import 'package:quran_app/features/home/presentation/widgets/show_hadith.dart';
import 'package:quran_app/features/home/presentation/widgets/show_ramadan.dart';

class HomeItems extends StatelessWidget {
  const HomeItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HomeItem(
                onTap: () {
                  customPushNavigation(AppRoutes.azkarview, context, "extra");
                },
                image: Assets.assetsAzkariconsPray,
                title: AppStrings.azkar),
            HomeItem(
                onTap: () {
                  customPushNavigation(
                      AppRoutes.sebhaItemsView, context, "extra");
                },
                image: Assets.assetsHomeiconsSebha,
                title: AppStrings.sebha),
            HomeItem(
                onTap: () {
                  showHadith(context);
                },
                image: Assets.assetsHomeiconsHadith,
                title: AppStrings.hadith),
            HomeItem(
                onTap: () {
                  customPushNavigation(AppRoutes.quranView, context, "extra");
                },
                image: Assets.assetsHomeiconsQuran,
                title: AppStrings.quran),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HomeItem(
                onTap: () {
                  customPushNavigation(AppRoutes.radioView, context, "extra");
                },
                image: Assets.assetsHomeiconsRadio,
                title: AppStrings.radio),
            HomeItem(
                onTap: () {
                  customPushNavigation(AppRoutes.qariView, context, "extra");
                },
                image: Assets.assetsHomeiconsListening,
                title: AppStrings.listenToQuran),
            HomeItem(
                onTap: () {
                  showRamadan(context);
                },
                image: Assets.assetsHomeiconsRamadan,
                title: AppStrings.ramadan),
            HomeItem(
                onTap: () {
                  showAdaya(context);
                },
                image: Assets.assetsHomeiconsDo3aa,
                title: AppStrings.do3a2),
          ],
        ),
      ],
    );
  }
}
