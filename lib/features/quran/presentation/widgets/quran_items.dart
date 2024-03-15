import 'package:flutter/material.dart';
import 'package:quran_app/core/cache/cache_helper.dart';
import 'package:quran_app/core/utils/app_strings.dart';
import 'package:quran_app/features/quran/data/quran_model.dart';
import 'package:quran_app/features/quran/presentation/widgets/quran_item.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class QuranItems extends StatefulWidget {
  const QuranItems({super.key, required this.quranList});
  final List<QuranModel> quranList;

  @override
  State<QuranItems> createState() => _QuranItemsState();
}

class _QuranItemsState extends State<QuranItems> {
  late AutoScrollController scrollController;

  @override
  void initState() {
    scrollController = AutoScrollController();
    if ((CacheHelper().getData(key: AppStrings.lastReadSurah) ?? 0) != 0) {
      scrollController.scrollToIndex(
          CacheHelper().getData(key: AppStrings.lastReadSurah) - 1,
          duration: const Duration(milliseconds: 1),
          preferPosition: AutoScrollPosition.begin);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          controller: scrollController,
          shrinkWrap: true,
          itemCount: widget.quranList.length,
          itemBuilder: (context, index) {
            return AutoScrollTag(
                key: ValueKey(index),
                controller: scrollController,
                index: index,
                child: FittedBox(
                    child: QuranItem(quranModel: widget.quranList[index])));
          }),
    );
  }
}
