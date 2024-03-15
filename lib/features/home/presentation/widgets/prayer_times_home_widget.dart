import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/core/functions/navigation.dart';
import 'package:quran_app/core/utils/app_assets.dart';
import 'package:quran_app/core/utils/app_routes.dart';

class PrayerTimesHomeWidget extends StatelessWidget {
  const PrayerTimesHomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
        child: GestureDetector(
      onTap: () {
        customPushNavigation(AppRoutes.prayerTimes, context, "extra");
      },
      child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          child: Image.asset(Assets.assetsHomeiconsSalawat)),
    ));
  }
}
