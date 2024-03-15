import 'package:flutter/material.dart';
import 'package:quran_app/features/azkar/data/azkar_type.dart';
import 'package:quran_app/features/azkar/data/models/azkar_model.dart';
import 'package:quran_app/features/azkar/presentation/widgets/zekr_widget.dart';

class AzkarDetailsItem extends StatelessWidget {
  const AzkarDetailsItem({
    super.key,
    required this.azkarModel,
    required this.azkarType,
  });

  final AzkarModel azkarModel;
  final AzkarType azkarType;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: azkarModel.array!.length,
      itemBuilder: (context, index) {
        return ZekrWidget(
            azkarModel: azkarModel.array![index],
            azkarType: azkarType,
            array: azkarModel.array!);
      },
    );
  }
}
