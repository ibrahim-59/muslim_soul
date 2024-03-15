import 'package:flutter/material.dart';
import 'package:quran_app/core/services/service_locator.dart';
import 'package:quran_app/core/utils/app_colors.dart';
import 'package:quran_app/core/utils/app_text_style.dart';
import 'package:quran_app/features/azkar/presentation/cubit/azkar_cubit.dart';
import 'package:quran_app/features/azkar/presentation/widgets/zekr_widget.dart';

class ZekrDescription extends StatelessWidget {
  const ZekrDescription({
    super.key,
    required this.widget,
  });

  final ZekrWidget widget;

  @override
  Widget build(BuildContext context) {
    return widget.azkarModel.description! == ""
        ? const SizedBox.shrink()
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
            child: Text(widget.azkarModel.description!,
                textAlign: TextAlign.center,
                style: CustomTextStyles.quran24.copyWith(
                    color: AppColors.primaryColor,
                    fontSize: getit<AzkarCubit>().descSize.toDouble())));
  }
}
