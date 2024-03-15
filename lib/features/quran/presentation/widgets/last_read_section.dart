import 'package:flutter/material.dart';
import 'package:quran_app/core/utils/app_assets.dart';
import 'package:quran_app/core/utils/app_colors.dart';
import 'package:quran_app/core/utils/app_text_style.dart';
import 'package:quran_app/features/quran/data/quran_model.dart';

class LastRedSection extends StatelessWidget {
  const LastRedSection(
      {super.key,
      required this.quranModel,
      required this.lastRedAyah,
      required this.lastReadSurah});
  final List<QuranModel> quranModel;
  final int lastRedAyah;
  final int lastReadSurah;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FittedBox(
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Image.asset(Assets.assetsLastRead, width: size.width),
          ),
          Positioned(
            right: size.width / 1.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  quranModel[lastReadSurah].name!,
                  style: CustomTextStyles.change20W500.copyWith(
                      color: AppColors.whiteColor, fontWeight: FontWeight.bold),
                ),
                Text(
                  "أية رقم : $lastRedAyah",
                  style: CustomTextStyles.change17meduim
                      .copyWith(color: AppColors.whiteColor),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
