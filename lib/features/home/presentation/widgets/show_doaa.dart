import 'package:flutter/material.dart';
import 'package:quran_app/core/constants.dart';
import 'package:quran_app/core/functions/navigation.dart';
import 'package:quran_app/core/utils/app_assets.dart';
import 'package:quran_app/core/utils/app_routes.dart';
import 'package:quran_app/core/utils/app_strings.dart';
import 'package:quran_app/core/utils/app_text_style.dart';
import 'package:quran_app/core/widgets/custom_dialog_icon.dart';
import 'package:quran_app/core/widgets/custom_dialog_item.dart';

showAdaya(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CustomDialogIcon(image: Assets.assetsHomeiconsDo3aa),
                const SizedBox(height: 16),
                const Text(AppStrings.ramadanMonth,
                    style: CustomTextStyles.change22w500),
                ...List.generate(
                  adayaDialogList.length,
                  (index) => CustomDialogItem(
                      title: adayaDialogList[index][AppStrings.title],
                      onTap: () async {
                        customPushNavigation(AppRoutes.adayaView, context,
                            adayaDialogList[index][AppStrings.type]);
                        Navigator.pop(context);
                      }),
                ),
              ],
            ),
          ),
        );
      });
}
