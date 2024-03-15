import 'package:flutter/material.dart';
import 'package:quran_app/core/utils/app_colors.dart';
import 'package:quran_app/core/utils/app_text_style.dart';
import 'package:quran_app/core/widgets/custom_interaction_buttons.dart';
import 'package:quran_app/features/quran/data/tafseer_view_model.dart';

class TafseerView extends StatelessWidget {
  const TafseerView({
    super.key,
    required this.tafseerViewModel,
  });
  final TafseerViewModel tafseerViewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("تفسير الميسر",
            style: CustomTextStyles.change22w500
                .copyWith(color: AppColors.primaryColor)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("سورة ${tafseerViewModel.surahName}",
                  style: CustomTextStyles.change18w400),
              const SizedBox(height: 16),
              Text(tafseerViewModel.ayahName,
                  style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    border: Border.all(color: AppColors.primaryColor)),
                child: Column(
                  children: [
                    Text(tafseerViewModel.ayahTafseer,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontSize: 22)),
                    const SizedBox(height: 22),
                    CustomInterActionButtons(
                        title: tafseerViewModel.ayahTafseer)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
