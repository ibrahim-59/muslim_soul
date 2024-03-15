import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran_app/core/utils/app_strings.dart';
import 'package:quran_app/core/widgets/custom_button.dart';
import 'package:share_plus/share_plus.dart';

class CustomInterActionButtons extends StatelessWidget {
  const CustomInterActionButtons({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
                title: AppStrings.copy,
                onTap: () async {
                  await Clipboard.setData(ClipboardData(text: title));
                }),
            const SizedBox(width: 20),
            CustomButton(
                title: AppStrings.share,
                onTap: () {
                  Share.share(title);
                }),
          ],
        ),
      ),
    );
  }
}
