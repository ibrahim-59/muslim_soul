import 'package:flutter/material.dart';
import 'package:quran_app/features/rmadan/data/ramadan_data_model.dart';
import 'package:quran_app/features/rmadan/presentation/widgets/ramadan_data_item.dart';

class RamadanDataItems extends StatelessWidget {
  const RamadanDataItems({
    super.key,
    required this.dataList,
  });

  final List<RamdanDataModel> dataList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          return RamadanDataItem(dataList: dataList[index], index: index);
        },
      ),
    );
  }
}
