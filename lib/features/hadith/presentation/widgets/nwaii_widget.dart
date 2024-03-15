import 'package:flutter/material.dart';
import 'package:quran_app/core/cache/cache_helper.dart';
import 'package:quran_app/core/utils/app_colors.dart';
import 'package:quran_app/core/utils/app_strings.dart';
import 'package:quran_app/features/hadith/data/arboon_model.dart';
import 'package:quran_app/core/widgets/custom_interaction_buttons.dart';
import 'package:quran_app/features/hadith/presentation/widgets/hadith_content.dart';
import 'package:quran_app/features/hadith/presentation/widgets/number_bookmark.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class NwaiiWidget extends StatefulWidget {
  const NwaiiWidget({super.key, required this.hadithList});
  final List<ArboonModel> hadithList;

  @override
  State<NwaiiWidget> createState() => _NwaiiWidgetState();
}

class _NwaiiWidgetState extends State<NwaiiWidget> {
  late AutoScrollController scrollController;
  final GlobalKey key = GlobalKey();
  int currentIndex = CacheHelper().getData(key: AppStrings.hadithArboon) ?? 0;
  @override
  void initState() {
    scrollController = AutoScrollController();
    scrollController.scrollToIndex(currentIndex,
        preferPosition: AutoScrollPosition.begin);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
      controller: scrollController,
      itemCount: widget.hadithList.length,
      itemBuilder: (context, index) {
        return AutoScrollTag(
          key: ValueKey(index),
          controller: scrollController,
          index: index,
          child: Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            width: size.width,
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                border: Border.all(
                    color: currentIndex == index
                        ? AppColors.primaryColor
                        : Colors.transparent)),
            child: Column(
              children: [
                NumberAndBookMarkSection(
                    index: index,
                    currentindex: currentIndex,
                    onTap: () {
                      setState(() {});
                      CacheHelper()
                          .saveData(key: AppStrings.hadithArboon, value: index);
                      currentIndex = index;
                    }),
                const SizedBox(height: 14),
                HadithContent(title: widget.hadithList[index].hadith),
                const SizedBox(height: 30),
                CustomInterActionButtons(title: widget.hadithList[index].hadith)
              ],
            ),
          ),
        );
      },
    );
  }
}
