import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:quran_app/core/utils/app_colors.dart';

class NumberAndBookMarkSection extends StatelessWidget {
  const NumberAndBookMarkSection(
      {super.key,
      required this.index,
      required this.currentindex,
      required this.onTap});
  final int index;
  final int currentindex;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundColor: AppColors.primaryColor,
            radius: 20,
            child: CircleAvatar(
              radius: 18,
              backgroundColor: Theme.of(context).cardColor,
              child: Text("${index + 1}",
                  style: Theme.of(context).textTheme.titleMedium),
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: CircleAvatar(
              backgroundColor: AppColors.primaryColor,
              radius: 20,
              child: CircleAvatar(
                radius: 18,
                backgroundColor: Theme.of(context).cardColor,
                child: Icon(
                    index == currentindex
                        ? IconlyBold.bookmark
                        : IconlyLight.bookmark,
                    color: Theme.of(context).primaryColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
