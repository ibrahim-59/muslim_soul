// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:quran_app/core/functions/show_toast.dart';
import 'package:quran_app/core/utils/app_colors.dart';
import 'package:quran_app/core/utils/app_strings.dart';
import 'package:quran_app/core/utils/app_text_style.dart';
import 'package:quran_app/features/sepha/cubit/sebha_cubit.dart';
import 'package:quran_app/features/sepha/data/sepha_model.dart';
import 'package:quran_app/features/sepha/presentation/widgets/sebha_inputfield.dart';

class SebhaDialogWidget extends StatefulWidget {
  const SebhaDialogWidget(
      {super.key, this.sebhaModel, required this.sebhaCubit});
  final SebhaModel? sebhaModel;
  final SebhaCubit sebhaCubit;

  @override
  State<SebhaDialogWidget> createState() => _SebhaDialogWidgetState();
}

class _SebhaDialogWidgetState extends State<SebhaDialogWidget> {
  late TextEditingController nameController;
  late TextEditingController countController;
  @override
  void initState() {
    nameController = TextEditingController();
    countController = TextEditingController();
    nameController.text = widget.sebhaModel?.content ?? "";
    countController.text = widget.sebhaModel?.count.toString() ?? "";
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    countController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            child: Text(AppStrings.addNewTasbih,
                style: CustomTextStyles.change20W500.copyWith(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 16),
          Text("اسم التسبيح",
              style: CustomTextStyles.change14meduim
                  .copyWith(color: AppColors.primaryColor)),
          const SizedBox(height: 10),
          SebhaInputField(
              controller: nameController,
              isNumber: false,
              hintText: "اسم التسبيح"),
          const SizedBox(height: 16),
          Text("عدد التسبيحات",
              style: CustomTextStyles.change14meduim
                  .copyWith(color: AppColors.primaryColor)),
          const SizedBox(height: 10),
          SebhaInputField(
              controller: countController,
              isNumber: true,
              hintText: "عدد التسبيحات"),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () async {
              if (widget.sebhaModel == null) {
                await widget.sebhaCubit
                    .addSebhaToHive(nameController, countController, context);
              } else {
                widget.sebhaModel!.content = nameController.text;
                widget.sebhaModel!.count = int.parse(countController.text);
                widget.sebhaModel!.save();
                await widget.sebhaCubit.loadSebhaItemsFromHive();
                showToast(msg: AppStrings.tasbihEdited, context: context);
                Navigator.pop(context);
              }
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Center(
                child: Text(
                    widget.sebhaModel != null
                        ? AppStrings.edit
                        : AppStrings.addTasbih,
                    style: CustomTextStyles.change17meduim
                        .copyWith(color: AppColors.whiteColor)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
