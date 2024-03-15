import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/services/service_locator.dart';
import 'package:quran_app/core/utils/app_colors.dart';
import 'package:quran_app/core/utils/app_text_style.dart';
import 'package:quran_app/features/quran/presentation/surah_cubit/surah_cubit.dart';
import 'package:quran_app/features/quran/presentation/surah_cubit/surah_state.dart';

class SizeManageWidget extends StatelessWidget {
  const SizeManageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<SurahCubit, SurahState>(
      builder: (context, state) {
        return Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "حجم الخط",
                    style: CustomTextStyles.change17meduim
                        .copyWith(color: AppColors.primaryColor),
                  ),
                  SizedBox(
                      width: size.width / 2.4,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                await getit<SurahCubit>().updateSize(true);
                              },
                              child: const Icon(
                                  Icons.add_circle_outline_outlined,
                                  size: 28,
                                  color: AppColors.primaryColor),
                            ),
                            Text(getit<SurahCubit>().sizeName ?? "",
                                style: Theme.of(context).textTheme.titleMedium),
                            GestureDetector(
                              onTap: () async {
                                await getit<SurahCubit>().updateSize(false);
                              },
                              child: const Icon(Icons.remove_circle_outline,
                                  size: 28, color: AppColors.primaryColor),
                            )
                          ]))
                ]));
      },
    );
  }
}
