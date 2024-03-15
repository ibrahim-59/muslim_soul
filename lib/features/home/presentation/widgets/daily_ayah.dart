import 'package:flutter/material.dart';
import 'package:quran_app/core/utils/app_colors.dart';
import 'package:quran_app/core/utils/app_text_style.dart';
import 'package:share_plus/share_plus.dart';

class DailyAyah extends StatelessWidget {
  const DailyAyah(
      {super.key,
      required this.content,
      required this.surahName,
      required this.ayahIndex});
  final String content;
  final String surahName;
  final String ayahIndex;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.all(Radius.circular(15))),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("أية اليوم",
                    style: CustomTextStyles.change17meduim
                        .copyWith(color: AppColors.primaryColor)),
                GestureDetector(
                  onTap: () async {
                    await Share.share(content);
                  },
                  child: const Icon(Icons.share_outlined,
                      size: 30, color: AppColors.primaryColor),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(content,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: 30),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "سورة : $surahName , الأية : $ayahIndex",
                    style: CustomTextStyles.change14meduim
                        .copyWith(color: AppColors.primaryColor),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
