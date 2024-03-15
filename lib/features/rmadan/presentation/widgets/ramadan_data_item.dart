import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:quran_app/core/utils/app_colors.dart';
import 'package:quran_app/core/utils/app_text_style.dart';
import 'package:quran_app/core/widgets/custom_interaction_buttons.dart';
import 'package:quran_app/features/rmadan/data/ramadan_data_model.dart';

class RamadanDataItem extends StatefulWidget {
  const RamadanDataItem(
      {super.key, required this.dataList, required this.index});

  final RamdanDataModel dataList;
  final int index;

  @override
  State<RamadanDataItem> createState() => _RamadanDataItemState();
}

class _RamadanDataItemState extends State<RamadanDataItem> {
  bool isShown = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        setState(() {
          isShown = !isShown;
        });
      },
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          padding: const EdgeInsets.all(16),
          width: size.width,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: const BorderRadius.all(Radius.circular(15)),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: size.width / 40,
                    child: Text("${widget.index + 1}",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: CustomTextStyles.change17meduim),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: size.width / 1.5,
                    child: Text(
                      widget.dataList.number!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: CustomTextStyles.change17meduim,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                      isShown
                          ? IconlyLight.arrow_down_2
                          : IconlyLight.arrow_left_2,
                      color: AppColors.primaryColor)
                ],
              ),
              Visibility(
                visible: isShown,
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      widget.dataList.label!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 22),
                    ),
                    const SizedBox(height: 10),
                    CustomInterActionButtons(title: widget.dataList.label!),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
