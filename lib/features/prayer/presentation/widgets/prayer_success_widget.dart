import 'package:flutter/material.dart';
import 'package:quran_app/features/prayer/data/models/prayer_model.dart';
import 'package:quran_app/features/prayer/presentation/widgets/next_prayer.dart';
import 'package:quran_app/features/prayer/presentation/widgets/prayer_item.dart';

class PrayerSuccessWidget extends StatelessWidget {
  const PrayerSuccessWidget({
    super.key,
    required this.prayerTimes,
    required this.nextTime,
    required this.nextPrayer,
  });
  final List<PrayerModel> prayerTimes;
  final String nextTime;
  final String nextPrayer;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        NextPrayerWidget(nextPrayer: nextPrayer, nextTime: nextTime),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: prayerTimes.length,
          itemBuilder: (context, index) {
            return PrayerItem(
                prayerModel: prayerTimes[index], nextTime: nextTime);
          },
        ),
      ],
    );
  }
}
