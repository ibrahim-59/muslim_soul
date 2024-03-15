import 'package:flutter/material.dart';
import 'package:quran_app/core/utils/app_colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Divider(
        color: AppColors.primaryColor,
        thickness: 1,
        height: 0,
        endIndent: 5,
        indent: 5,
      ),
    );
  }
}
