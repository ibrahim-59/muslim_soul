import 'package:flutter/material.dart';
import 'package:quran_app/core/utils/app_colors.dart';
import 'package:quran_app/core/utils/app_text_style.dart';
import 'package:quran_app/features/quran/data/quran_model.dart';
import 'package:quran_app/features/quran/presentation/widgets/search_item.dart';
import 'package:quran_app/features/quran/presentation/widgets/search_widget.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key, required this.quranList});
  final List<QuranModel> quranList;

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late TextEditingController searchController;
  List<QuranModel> searchedList = [];
  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(height: 30),
            SearchWidget(
              searchController: searchController,
              onChanged: (value) {
                searchController.text = value;
                searchedList = widget.quranList
                    .where((element) =>
                        element.name!.toLowerCase().startsWith(value))
                    .toList();
                setState(() {});
              },
              ondelete: () {
                FocusScope.of(context).unfocus();
                searchedList.clear();
                searchController.clear();
              },
            ),
            searchController.text.isEmpty
                ? Center(
                    child: Text("ابدأ البحث",
                        style: CustomTextStyles.change20W500
                            .copyWith(color: AppColors.primaryColor)),
                  )
                : searchedList.isEmpty
                    ? Center(
                        child: Text("لا يوجد عنصر بهذا الاسم",
                            style: CustomTextStyles.change20W500
                                .copyWith(color: AppColors.primaryColor)))
                    : Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: searchedList.length,
                          itemBuilder: (context, index) {
                            return SearchItem(quranModel: searchedList[index]);
                          },
                        ),
                      )
          ],
        ),
      ),
    );
  }
}
