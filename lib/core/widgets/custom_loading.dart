import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quran_app/core/utils/app_assets.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
        child: LottieBuilder.asset(
      Assets.assetsLottieLoading,
      width: size.width / 2,
      height: size.width / 2,
    ));
  }
}
