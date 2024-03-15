import 'package:flutter/material.dart';
import 'package:quran_app/core/utils/app_colors.dart';
import 'package:share_plus/share_plus.dart';

class CustomShareIcon extends StatelessWidget {
  const CustomShareIcon({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Share.share(title);
      },
      child: const CircleAvatar(
          backgroundColor: AppColors.primaryColor,
          child: Icon(Icons.share, color: AppColors.whiteColor)),
    );
  }
}
