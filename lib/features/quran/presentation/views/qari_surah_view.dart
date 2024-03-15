import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/widgets/custom_appbar.dart';
import 'package:quran_app/core/widgets/custom_error_widget.dart';
import 'package:quran_app/core/widgets/custom_loading.dart';
import 'package:quran_app/features/quran/data/rectiters_model.dart';
import 'package:quran_app/features/quran/presentation/quran_cubit/quran_cubit.dart';
import 'package:quran_app/features/quran/presentation/quran_cubit/quran_state.dart';
import 'package:quran_app/features/quran/presentation/widgets/surah_item.dart';

class QariSuraView extends StatelessWidget {
  const QariSuraView({super.key, required this.rectitersModel});
  final RectitersModel rectitersModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          image: rectitersModel.image!, title: rectitersModel.name!),
      body: BlocBuilder<QuranCubit, QuranState>(
        builder: (context, state) {
          return state is GetSurahListSuccess
              ? ListView.builder(
                  itemCount: state.surahList.length,
                  itemBuilder: (context, index) {
                    return SurahItem(
                        index: index,
                        surahModel: state.surahList[index],
                        playList: state.playList);
                  })
              : state is GetSurahListFailure
                  ? CustomErrorWidget(
                      errorMessage: state.errorMessage,
                      onPressed: () {
                        context
                            .read<QuranCubit>()
                            .loadSurahsData(rectitersModel);
                      })
                  : const CustomLoading();
        },
      ),
    );
  }
}
