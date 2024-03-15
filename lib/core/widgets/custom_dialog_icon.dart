import 'package:flutter/material.dart';
import 'package:quran_app/core/utils/app_colors.dart';

class CustomDialogIcon extends StatelessWidget {
  const CustomDialogIcon({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColors.blackColor,
      radius: 50,
      child: CircleAvatar(
        radius: 45,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(image),
        ),
      ),
    );
  }
}
