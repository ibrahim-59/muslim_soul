// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:just_audio/just_audio.dart';
import 'package:quran_app/core/functions/check_internet.dart';
import 'package:quran_app/core/utils/app_colors.dart';
import 'package:quran_app/core/utils/app_text_style.dart';
import 'package:quran_app/features/quran/data/surah_model.dart';
import 'package:quran_app/features/quran/presentation/widgets/show_audio_player.dart';

class SurahItem extends StatelessWidget {
  const SurahItem({
    super.key,
    required this.index,
    required this.surahModel,
    required this.playList,
  });
  final int index;
  final SurahModel surahModel;
  final List<AudioSource> playList;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (await checkInternet(context)) {
          showAudioPlayer(
              context: context, playList: playList, currentIndex: index);
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: const BorderRadius.all(Radius.circular(15))),
        child: Row(
          children: [
            const Icon(IconlyBold.play,
                color: AppColors.primaryColor, size: 35),
            const SizedBox(width: 10),
            Text(surahModel.title,
                style: CustomTextStyles.change20W500
                    .copyWith(color: AppColors.primaryColor))
          ],
        ),
      ),
    );
  }
}
