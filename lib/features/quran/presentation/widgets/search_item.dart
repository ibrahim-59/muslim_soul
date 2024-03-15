// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:quran_app/core/functions/navigation.dart';
import 'package:quran_app/core/utils/app_assets.dart';
import 'package:quran_app/core/utils/app_routes.dart';
import 'package:quran_app/features/quran/data/quran_model.dart';
import 'package:svg_flutter/svg.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({super.key, required this.quranModel});
  final QuranModel quranModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        customPushNavigation(AppRoutes.surahView, context, quranModel);
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Stack(alignment: Alignment.center, children: [
              SvgPicture.asset(
                Assets.assetsSvgNumIcon,
                color: Theme.of(context).primaryColor,
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Center(
                    child: Text(quranModel.id.toString(),
                        style: Theme.of(context).textTheme.titleSmall)),
              )
            ]),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "سورة ${quranModel.name!}",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontSize: 18),
                ),
                Text(
                    '${quranModel.type!} - عدد أياتها : ${quranModel.array!.length}',
                    style: Theme.of(context).textTheme.titleSmall),
              ],
            )
          ],
        ),
      ),
    );
  }
}
