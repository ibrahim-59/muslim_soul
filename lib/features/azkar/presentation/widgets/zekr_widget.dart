import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/utils/app_colors.dart';
import 'package:quran_app/features/azkar/data/azkar_type.dart';
import 'package:quran_app/features/azkar/data/models/azkar_model.dart';
import 'package:quran_app/features/azkar/presentation/cubit/azkar_cubit.dart';
import 'package:quran_app/features/azkar/presentation/cubit/azkar_state.dart';
import 'package:quran_app/features/azkar/presentation/widgets/custom_divider.dart';
import 'package:quran_app/features/azkar/presentation/widgets/iteraction_section.dart';
import 'package:quran_app/features/azkar/presentation/widgets/zekr_content.dart';
import 'package:quran_app/features/azkar/presentation/widgets/zekr_description.dart';

class ZekrWidget extends StatefulWidget {
  const ZekrWidget(
      {super.key,
      required this.azkarModel,
      this.azkarType,
      required this.array});
  final Array azkarModel;
  final AzkarType? azkarType;
  final List<Array> array;

  @override
  State<ZekrWidget> createState() => _ZekrWidgetState();
}

class _ZekrWidgetState extends State<ZekrWidget> {
  double percent = 0;
  bool visible = true;
  int counter = 0;
  int count = 0;
  @override
  void initState() {
    count = int.parse(widget.azkarModel.count!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        updateContent(context);
        setState(() {});
      },
      child: BlocBuilder<AzkarCubit, AzkarState>(
        builder: (context, state) {
          return Visibility(
            visible: visible,
            child: Container(
              margin: const EdgeInsets.all(14),
              width: size.width,
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  border: Border.all(
                      color: AppColors.primaryColor,
                      strokeAlign: 0,
                      width: 0.2)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //! zekr content
                  ZekrContent(widget: widget),
                  //! divider
                  const CustomDivider(),
                  const SizedBox(height: 10),
                  //! zekr description
                  ZekrDescription(widget: widget),
                  //! interaction section
                  InterActionSection(
                      count: count,
                      percent: percent,
                      content: widget.azkarModel.content!)
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void updateContent(BuildContext context) {
    counter++;
    percent = counter / int.parse(widget.azkarModel.count!);
    count--;
    log(count.toString());
    setState(() {});
    if (percent == 1) {
      visible = false;
      setState(() {});
    }
  }
}
