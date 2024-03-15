import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/cache/cache_helper.dart';
import 'package:quran_app/core/functions/navigation.dart';
import 'package:quran_app/core/utils/app_routes.dart';
import 'package:quran_app/core/utils/app_strings.dart';
import 'package:quran_app/features/splash/cubit/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  goToNext(BuildContext context) {
    Timer(const Duration(seconds: 1), () {
      if (CacheHelper().getData(key: AppStrings.started) ?? false) {
        customPushNavigation(AppRoutes.homeView, context, "extra");
      } else {
        customPushNavigation(AppRoutes.startView, context, "extra");
      }
    });
  }
}
