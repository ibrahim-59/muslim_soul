import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/utils/app_assets.dart';
import 'package:quran_app/core/widgets/custom_appbar.dart';
import 'package:quran_app/core/widgets/custom_loading.dart';
import 'package:quran_app/features/hadith/data/hadith_type.dart';
import 'package:quran_app/features/hadith/presentation/cubit/hadith_cubit.dart';
import 'package:quran_app/features/hadith/presentation/cubit/hadith_state.dart';
import 'package:quran_app/features/hadith/presentation/widgets/hadith_widget.dart';
import 'package:quran_app/features/hadith/presentation/widgets/nwaii_widget.dart';

class HadithView extends StatelessWidget {
  const HadithView({super.key, required this.haditType});
  final HaditType haditType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          image: Assets.assetsHomeiconsHadith, title: haditType.title!),
      body: BlocBuilder<HadithCubit, HadithState>(
        builder: (context, state) {
          return state is GetArboonSuccess
              ? NwaiiWidget(hadithList: state.data)
              : state is GetAzkarSuccess
                  ? HadithWidget(
                      hadithList: state.hadithList, haditType: state.haditType)
                  : const CustomLoading();
        },
      ),
    );
  }
}
