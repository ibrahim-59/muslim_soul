import 'package:flutter/material.dart';
import 'package:quran_app/core/utils/app_colors.dart';
import 'package:quran_app/core/utils/app_text_style.dart';
import 'package:quran_app/features/do3a/data/adaya_model.dart';
import 'package:share_plus/share_plus.dart';

class DailyDoaa extends StatelessWidget {
  const DailyDoaa({
    super.key,
    required this.adayaModel,
  });
  final AdayaModel adayaModel;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("دعاء اليوم",
                    style: CustomTextStyles.change17meduim
                        .copyWith(color: AppColors.primaryColor)),
                GestureDetector(
                  onTap: () async {
                    await Share.share(adayaModel.text);
                  },
                  child: const Icon(Icons.share_outlined,
                      size: 30, color: AppColors.primaryColor),
                ),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
              child: Text(adayaModel.text,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium)),
        ],
      ),
    );
  }
}
