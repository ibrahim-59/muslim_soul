import 'package:flutter/material.dart';
import 'package:quran_app/core/cache/cache_helper.dart';
import 'package:quran_app/core/services/service_locator.dart';
import 'package:quran_app/core/utils/app_strings.dart';
import 'package:quran_app/features/quran/data/quran_model.dart';
import 'package:quran_app/features/quran/presentation/quran_cubit/quran_cubit.dart';
import 'package:quran_app/features/quran/presentation/widgets/ayah_item.dart';
import 'package:quran_app/features/quran/presentation/widgets/surah_openning.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class AyahItems extends StatefulWidget {
  const AyahItems({
    super.key,
    required this.quranModel,
  });

  final QuranModel quranModel;

  @override
  State<AyahItems> createState() => _AyahItemsState();
}

class _AyahItemsState extends State<AyahItems> {
  late AutoScrollController scrollController;
  int currentIndex = CacheHelper().getData(key: AppStrings.lastReadIndex) ?? 0;
  int currentSurahIndex =
      CacheHelper().getData(key: AppStrings.lastReadSurah) ?? 0;
  @override
  void initState() {
    scrollController = AutoScrollController();
    if (currentSurahIndex == widget.quranModel.id!) {
      scrollController.scrollToIndex(currentIndex,
          preferPosition: AutoScrollPosition.begin);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      controller: scrollController,
      itemCount: widget.quranModel.array!.length + 1,
      itemBuilder: (context, index) {
        Array item = widget.quranModel.array![index == 0 ? 0 : index - 1];
        if (index == 0) {
          return SurahOpenning(quranModel: widget.quranModel);
        } else {
          return AutoScrollTag(
              key: ValueKey(index),
              controller: scrollController,
              index: index,
              child: AyahItem(
                item: item,
                onTap: () async {
                  CacheHelper().removeData(key: AppStrings.lastReadSurah);
                  CacheHelper().removeData(key: AppStrings.lastReadIndex);
                  CacheHelper().saveData(
                      key: AppStrings.lastReadSurah,
                      value: widget.quranModel.id!);
                  CacheHelper()
                      .saveData(key: AppStrings.lastReadIndex, value: index);
                  await getit<QuranCubit>().loadQuranData();
                  currentIndex = index;
                  currentSurahIndex = widget.quranModel.id!;
                  setState(() {});
                },
                currentIndex: currentIndex,
                currentSurahIndex: currentSurahIndex,
                quranModel: widget.quranModel,
              ));
        }
      },
    );
  }
}
