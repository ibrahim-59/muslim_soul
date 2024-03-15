import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/widgets/custom_error_widget.dart';
import 'package:quran_app/core/widgets/custom_loading.dart';
import 'package:quran_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:quran_app/features/home/presentation/cubit/home_state.dart';
import 'package:quran_app/features/home/presentation/widgets/daily_ayah.dart';
import 'package:quran_app/features/home/presentation/widgets/daily_doaa.dart';
import 'package:quran_app/features/home/presentation/widgets/daily_zekr.dart';

class DailyContent extends StatelessWidget {
  const DailyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return state is DailyContentSuccess
            ? Column(
                children: [
                  FadeInUp(child: DailyDoaa(adayaModel: state.adayaModel)),
                  const SizedBox(height: 16),
                  FadeInUp(
                      child: DailyZekr(
                          content: state.zekrContent, count: state.zekrCount)),
                  const SizedBox(height: 16),
                  FadeInUp(
                    child: DailyAyah(
                        content: state.ayahName,
                        surahName: state.surahName,
                        ayahIndex: state.ayahIndex),
                  )
                ],
              )
            : state is DailyContentFailure
                ? CustomErrorWidget(
                    errorMessage: state.errorMessage,
                    onPressed: () {
                      context.read<HomeCubit>().loadDailyContentData();
                    })
                : const CustomLoading();
      },
    );
  }
}
