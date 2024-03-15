import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/core/utils/app_text_style.dart';

class HomeItem extends StatelessWidget {
  const HomeItem(
      {super.key,
      required this.onTap,
      required this.image,
      required this.title});
  final void Function() onTap;
  final String image, title;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FadeInUp(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              width: size.width / 5,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(18)),
                color: Theme.of(context).cardColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Align(child: Image.asset(image)),
              ),
            ),
            const SizedBox(height: 6),
            Text(title, style: CustomTextStyles.change17meduim)
          ],
        ),
      ),
    );
  }
}
