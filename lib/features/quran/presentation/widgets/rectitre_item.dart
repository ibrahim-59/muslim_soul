import 'package:flutter/material.dart';
import 'package:quran_app/core/functions/navigation.dart';
import 'package:quran_app/core/utils/app_routes.dart';
import 'package:quran_app/core/utils/app_text_style.dart';
import 'package:quran_app/features/quran/data/rectiters_model.dart';

class RectiterItem extends StatelessWidget {
  const RectiterItem({
    super.key,
    required this.rectitersList,
  });

  final RectitersModel rectitersList;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        customPushNavigation(AppRoutes.qariSurahView, context, rectitersList);
      },
      child: Container(
        width: size.width,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: const BorderRadius.all(Radius.circular(16))),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            CircleAvatar(backgroundImage: AssetImage(rectitersList.image!)),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "فضيلة الشيخ",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(rectitersList.name!, style: CustomTextStyles.change18w400)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
