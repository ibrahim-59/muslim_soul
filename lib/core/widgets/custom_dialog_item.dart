import 'package:flutter/material.dart';
import 'package:quran_app/core/utils/app_text_style.dart';

class CustomDialogItem extends StatelessWidget {
  const CustomDialogItem({super.key, required this.title, required this.onTap});
  final String title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
        onTap: onTap,
        child: Container(
            width: size.width,
            height: size.width / 4,
            padding: EdgeInsets.all(10),
            margin: const EdgeInsets.only(top: 16),
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: Center(
                child: Text(
              title,
              style: CustomTextStyles.change17meduim,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ))));
  }
}
