import 'package:flutter/material.dart';
import 'package:quran_app/core/functions/navigation.dart';
import 'package:quran_app/core/utils/app_routes.dart';
import 'package:quran_app/core/utils/app_text_style.dart';
import 'package:quran_app/features/azkar/data/azkar_type.dart';
import 'package:quran_app/features/azkar/data/models/azkar_model.dart';

class AzkarItemWidget extends StatelessWidget {
  const AzkarItemWidget({
    super.key,
    required this.azkarModel,
    required this.azkarType,
  });
  final AzkarModel azkarModel;
  final AzkarType azkarType;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        customPushNavigation(
            AppRoutes.azkarDetailsView, context, [azkarModel, azkarType]);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        width: size.width,
        height: size.width / 4,
        decoration: BoxDecoration(
            color: azkarType.color,
            borderRadius: const BorderRadius.all(Radius.circular(18))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(azkarModel.name!, style: CustomTextStyles.change20W500),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset(azkarType.image!),
            )
          ],
        ),
      ),
    );
  }
}
