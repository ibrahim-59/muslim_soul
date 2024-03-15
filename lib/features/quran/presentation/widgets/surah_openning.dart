import 'package:flutter/material.dart';
import 'package:quran_app/core/utils/app_assets.dart';
import 'package:quran_app/core/utils/app_colors.dart';
import 'package:quran_app/core/utils/app_text_style.dart';
import 'package:quran_app/features/quran/data/quran_model.dart';
import 'package:svg_flutter/svg.dart';

class SurahOpenning extends StatelessWidget {
  const SurahOpenning({
    super.key,
    required this.quranModel,
  });

  final QuranModel quranModel;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: SvgPicture.asset(Assets.assetsSvgSurah, width: size.width),
        ),
        Column(
          children: [
            Text("سورة ${quranModel.name!}",
                style: CustomTextStyles.change22w500
                    .copyWith(color: AppColors.whiteColor)),
            const SizedBox(height: 12),
            SvgPicture.asset(Assets.assetsSvgDivider),
            const SizedBox(height: 12),
            Text(quranModel.nameEn!,
                style: CustomTextStyles.change20W500
                    .copyWith(color: AppColors.whiteColor)),
            const SizedBox(height: 6),
            Text(
              '${quranModel.type!} - عدد أياتها : ${quranModel.array!.length}',
              style: CustomTextStyles.change17meduim
                  .copyWith(color: AppColors.whiteColor),
            ),
            const SizedBox(height: 25),
            (quranModel.id != 1 && quranModel.id != 9)
                ? SvgPicture.asset(Assets.assetsSvgBsmellah)
                : const SizedBox.shrink(),
          ],
        ),
      ],
    );
  }
}
