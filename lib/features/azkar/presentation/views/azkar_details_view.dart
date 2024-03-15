import 'package:flutter/material.dart';
import 'package:quran_app/features/azkar/data/azkar_type.dart';
import 'package:quran_app/features/azkar/data/models/azkar_model.dart';
import 'package:quran_app/core/widgets/custom_appbar.dart';
import 'package:quran_app/features/azkar/presentation/widgets/azkar_details_item.dart';
import 'package:quran_app/features/azkar/presentation/widgets/length_size_widget.dart';

class AzkarDetailsView extends StatelessWidget {
  const AzkarDetailsView({super.key, required this.azkarData});
  final List<dynamic> azkarData;

  @override
  Widget build(BuildContext context) {
    AzkarType azkarType = azkarData[1];
    AzkarModel azkarModel = azkarData[0];
    return Scaffold(
      appBar: customAppBar(title: azkarModel.name!, image: azkarType.image!),
      body: ListView(
        children: [
          LengthAndSizeWidget(azkarModel: azkarModel),
          AzkarDetailsItem(azkarModel: azkarModel, azkarType: azkarType),
        ],
      ),
    );
  }
}
