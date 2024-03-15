import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:quran_app/core/utils/app_colors.dart';
import 'package:quran_app/core/utils/app_text_style.dart';
import 'package:quran_app/features/quran/data/quran_model.dart';
import 'package:quran_app/features/quran/presentation/widgets/ayah_items.dart';
import 'package:quran_app/features/quran/presentation/widgets/quran_settings.dart';

class SurahView extends StatelessWidget {
  const SurahView({super.key, required this.quranModel});
  final QuranModel quranModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("سورة ${quranModel.name!}",
                style: CustomTextStyles.change22w500
                    .copyWith(color: AppColors.primaryColor)),
            actions: [
              Padding(
                  padding: const EdgeInsets.all(12),
                  child: GestureDetector(
                    onTap: () async {
                      quranSettingsWidget(context);
                    },
                    child: const Icon(IconlyBold.setting,
                        color: AppColors.primaryColor, size: 26),
                  ))
            ]),
        body: AyahItems(quranModel: quranModel));
  }
}
