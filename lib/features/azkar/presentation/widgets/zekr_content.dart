import 'package:flutter/material.dart';
import 'package:quran_app/core/services/service_locator.dart';
import 'package:quran_app/features/azkar/presentation/cubit/azkar_cubit.dart';
import 'package:quran_app/features/azkar/presentation/widgets/zekr_widget.dart';

class ZekrContent extends StatelessWidget {
  const ZekrContent({
    super.key,
    required this.widget,
  });

  final ZekrWidget widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        child: Text(widget.azkarModel.content!,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: getit<AzkarCubit>().zekrSize.toDouble(),
                fontWeight: FontWeight.w500)));
  }
}
