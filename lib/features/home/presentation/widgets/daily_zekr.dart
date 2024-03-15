import 'package:flutter/material.dart';
import 'package:quran_app/features/home/presentation/widgets/random_zekr.dart';

class DailyZekr extends StatelessWidget {
  const DailyZekr({super.key, required this.content, required this.count});
  final String content;
  final String count;

  @override
  Widget build(BuildContext context) {
    return RandomZekr(content: content, count: count);
  }
}
