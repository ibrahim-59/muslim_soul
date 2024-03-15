// ignore_for_file: deprecated_member_use, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:quran_app/core/functions/navigation.dart';
import 'package:quran_app/core/services/service_locator.dart';
import 'package:quran_app/core/utils/app_assets.dart';
import 'package:quran_app/core/utils/app_colors.dart';
import 'package:quran_app/core/utils/app_routes.dart';
import 'package:quran_app/features/quran/data/quran_model.dart';
import 'package:quran_app/features/quran/data/tafseer_view_model.dart';
import 'package:quran_app/features/quran/presentation/surah_cubit/surah_cubit.dart';
import 'package:quran_app/features/quran/presentation/surah_cubit/surah_state.dart';
import 'package:svg_flutter/svg.dart';

class AyahItem extends StatelessWidget {
  const AyahItem({
    super.key,
    required this.item,
    required this.onTap,
    required this.currentIndex,
    required this.currentSurahIndex,
    required this.quranModel,
  });

  final Array item;
  final void Function() onTap;
  final int currentIndex;
  final int currentSurahIndex;
  final QuranModel quranModel;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocBuilder<SurahCubit, SurahState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () async {
            String tafser = await getit<SurahCubit>().loadAyahTafsear(
                item.id!.toString(), quranModel.id!.toString());
            customPushNavigation(
                AppRoutes.tafseerView,
                context,
                TafseerViewModel(
                    surahName: quranModel.name!,
                    ayahName: item.ar!,
                    ayahTafseer: tafser));
          },
          child: Container(
            width: size.width,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                border: Border.all(
                    color: currentIndex == item.id &&
                            currentSurahIndex == quranModel.id
                        ? AppColors.primaryColor
                        : Colors.transparent)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(item.ar!,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize:
                                getit<SurahCubit>().ayahSize.toDouble()))),
                getit<SurahCubit>().translationOn
                    ? Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(item.en!,
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontSize:
                                      getit<SurahCubit>().transSize.toDouble(),
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.w500)),
                        ))
                    : const SizedBox.shrink(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Stack(alignment: Alignment.center, children: [
                        SvgPicture.asset(Assets.assetsSvgNumIcon,
                            color: AppColors.primaryColor),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Center(
                              child: Text("${item.id!}",
                                  style:
                                      Theme.of(context).textTheme.titleMedium)),
                        )
                      ]),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Icon(Icons.share_outlined,
                              color: AppColors.primaryColor, size: 26),
                          const SizedBox(width: 14),
                          GestureDetector(
                            onTap: onTap,
                            child: Icon(
                                currentIndex == item.id &&
                                        currentSurahIndex == quranModel.id
                                    ? IconlyBold.bookmark
                                    : IconlyLight.bookmark,
                                color: AppColors.primaryColor,
                                size: 26),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
