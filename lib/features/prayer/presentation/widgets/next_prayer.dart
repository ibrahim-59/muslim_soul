import 'package:flutter/material.dart';
import 'package:quran_app/core/functions/format_time.dart';
import 'package:quran_app/core/utils/app_assets.dart';
import 'package:quran_app/core/utils/app_text_style.dart';
import 'package:quran_app/features/prayer/presentation/widgets/count_down.dart';

class NextPrayerWidget extends StatelessWidget {
  const NextPrayerWidget(
      {super.key, required this.nextPrayer, required this.nextTime});
  final String nextPrayer;
  final String nextTime;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      margin: const EdgeInsets.all(16),
      height: size.width / 2,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.assetsPrayertimesWal), fit: BoxFit.fill),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("$nextPrayer بعد", style: CustomTextStyles.change24W600),
          AppCountDown(deadline: convertToDateTime(nextTime)),
        ],
      )),
    );
  }
}
