import 'package:flutter/material.dart';
import 'package:quran_app/core/functions/format_time.dart';
import 'package:quran_app/core/utils/app_colors.dart';
import 'package:quran_app/features/prayer/data/models/prayer_model.dart';

class PrayerItem extends StatefulWidget {
  const PrayerItem(
      {super.key, required this.prayerModel, required this.nextTime});
  final PrayerModel prayerModel;
  final String nextTime;

  @override
  State<PrayerItem> createState() => _PrayerItemState();
}

class _PrayerItemState extends State<PrayerItem> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(16),
      width: size.width,
      decoration: BoxDecoration(
          color: formatToPmOrAm(widget.nextTime) ==
                  formatToPmOrAm(widget.prayerModel.time)
              ? AppColors.thirdColor
              : Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          border: Border.all(color: AppColors.thirdColor)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //! prayer image
          Padding(
              padding: const EdgeInsets.all(8),
              child: Row(children: [
                Image.asset(widget.prayerModel.image,
                    width: size.width / 10, height: size.width / 10),
                const SizedBox(width: 14),
                Text(widget.prayerModel.name,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: formatToPmOrAm(widget.nextTime) ==
                                formatToPmOrAm(widget.prayerModel.time)
                            ? Colors.white
                            : Theme.of(context).primaryColor))
              ])),
          //! prayer time
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Row(
              children: [
                Text(formatToPmOrAm(widget.prayerModel.time),
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: formatToPmOrAm(widget.nextTime) ==
                                formatToPmOrAm(widget.prayerModel.time)
                            ? Colors.white
                            : Theme.of(context).primaryColor)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
