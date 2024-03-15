import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quran_app/core/cache/cache_helper.dart';
import 'package:quran_app/core/functions/navigation.dart';
import 'package:quran_app/core/utils/app_assets.dart';
import 'package:quran_app/core/utils/app_colors.dart';
import 'package:quran_app/core/utils/app_routes.dart';
import 'package:quran_app/core/utils/app_strings.dart';
import 'package:quran_app/features/prayer/data/models/prayer_model.dart';
import 'package:quran_app/features/sepha/data/sepha_model.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      if (CacheHelper().getData(key: AppStrings.started) ?? false) {
        customPushNavigation(AppRoutes.homeView, context, "extra");
      } else {
        customPushNavigation(AppRoutes.startView, context, "extra");
      }
    });
    super.initState();
  }

  registerHive() async {
    Hive.registerAdapter(PrayerModelAdapter());
    await Hive.openBox<PrayerModel>(AppStrings.prayerBox);
    Hive.registerAdapter(SebhaModelAdapter());
    await Hive.openBox<SebhaModel>(AppStrings.sebhaBox);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: FadeInUp(
        child: const Padding(
          padding: EdgeInsets.all(16),
          child: IntrinsicHeight(
            child: SpinKitThreeBounce(
              color: AppColors.primaryColor,
              size: 26,
            ),
          ),
        ),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FadeInUp(
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: Center(
                child: Image.asset(Assets.assetsHomeiconsAppLogo),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
