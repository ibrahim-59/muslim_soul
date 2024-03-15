import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/services/service_locator.dart';
import 'package:quran_app/core/utils/app_colors.dart';
import 'package:quran_app/core/utils/app_text_style.dart';
import 'package:quran_app/features/quran/presentation/surah_cubit/surah_cubit.dart';
import 'package:quran_app/features/quran/presentation/surah_cubit/surah_state.dart';

class TranslationSwitch extends StatelessWidget {
  const TranslationSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurahCubit, SurahState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "الترجمه",
                style: CustomTextStyles.change17meduim
                    .copyWith(color: AppColors.primaryColor),
              ),
              Switch(
                value: getit<SurahCubit>().translationOn,
                onChanged: (value) async {
                  await getit<SurahCubit>().setTranslation(value);
                  await getit<SurahCubit>().init();
                },
                activeColor: AppColors.primaryColor,
                inactiveTrackColor: AppColors.lightGrey,
              ),
            ],
          ),
        );
      },
    );
  }
}
