import 'package:flutter/material.dart';
import 'package:quran_app/core/utils/app_text_style.dart';

class MediaMetaData extends StatelessWidget {
  const MediaMetaData(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.artist});
  final String imageUrl;
  final String title;
  final String artist;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FittedBox(
      child: SizedBox(
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(backgroundImage: AssetImage(imageUrl)),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: CustomTextStyles.change18w400,
                ),
                Text("فضيلة الشيخ : $artist",
                    style: Theme.of(context).textTheme.titleSmall),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
