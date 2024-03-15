import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran_app/core/utils/app_colors.dart';

class CustomCopyIcon extends StatelessWidget {
  const CustomCopyIcon({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Clipboard.setData(ClipboardData(text: title));
      },
      child: const CircleAvatar(
          backgroundColor: AppColors.primaryColor,
          child: Icon(Icons.copy_rounded, color: AppColors.whiteColor)),
    );
  }
}
