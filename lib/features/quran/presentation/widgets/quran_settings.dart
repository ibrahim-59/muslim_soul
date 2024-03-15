import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/services/service_locator.dart';
import 'package:quran_app/core/utils/app_colors.dart';
import 'package:quran_app/core/utils/app_text_style.dart';
import 'package:quran_app/features/quran/presentation/surah_cubit/surah_cubit.dart';
import 'package:quran_app/features/quran/presentation/widgets/translation_switch.dart';
import 'package:quran_app/features/quran/presentation/widgets/update_size_widget.dart';

Future<dynamic> quranSettingsWidget(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: BlocProvider.value(
          value: getit<SurahCubit>(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              Center(
                  child: Text("اعدادات القرأن",
                      style: CustomTextStyles.change20W500.copyWith(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600))),
              const SizedBox(height: 20),
              const SizeManageWidget(),
              const Divider(
                  thickness: 0,
                  endIndent: 16,
                  indent: 16,
                  color: AppColors.primaryColor),
              const TranslationSwitch()
            ],
          ),
        ),
      );
    },
  );
}
