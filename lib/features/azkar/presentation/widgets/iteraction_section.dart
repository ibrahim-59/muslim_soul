import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:quran_app/core/utils/app_colors.dart';
import 'package:quran_app/core/utils/app_strings.dart';
import 'package:share_plus/share_plus.dart';

class InterActionSection extends StatelessWidget {
  const InterActionSection(
      {super.key,
      required this.count,
      required this.percent,
      required this.content,
      this.color});
  final int count;
  final double percent;
  final String content;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                  side: BorderSide(
                      color: Theme.of(context).primaryColor, width: 1.5)),
              onPressed: () async {
                await Clipboard.setData(ClipboardData(text: content));
              },
              label: Text(AppStrings.copy,
                  style: Theme.of(context).textTheme.titleMedium),
              icon: Icon(Icons.copy,
                  color: Theme.of(context).primaryColor, size: 15),
            ),
            const SizedBox(width: 20),
            CircularPercentIndicator(
              radius: 35,
              lineWidth: 4,
              progressColor: AppColors.primaryColor,
              backgroundColor: Theme.of(context).primaryColor,
              percent: percent,
              center: Center(
                child: Text(count.toString(),
                    style: Theme.of(context).textTheme.titleMedium),
              ),
            ),
            const SizedBox(width: 20),
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                  side: BorderSide(
                      color: Theme.of(context).primaryColor, width: 1.5)),
              onPressed: () {
                Share.share(content);
              },
              label: Text(
                AppStrings.share,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              icon: Icon(Icons.share,
                  color: Theme.of(context).primaryColor, size: 15),
            ),
          ],
        ),
      ),
    );
  }
}
