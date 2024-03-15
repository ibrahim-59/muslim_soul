import 'package:flutter/material.dart';
import 'package:quran_app/features/quran/data/rectiters_model.dart';
import 'package:quran_app/features/quran/presentation/widgets/rectitre_item.dart';

class RectitresItems extends StatelessWidget {
  const RectitresItems({super.key, required this.rectitersList});

  final List<RectitersModel> rectitersList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: rectitersList.length,
      itemBuilder: (context, index) {
        return FittedBox(
            child: RectiterItem(rectitersList: rectitersList[index]));
      },
    );
  }
}
