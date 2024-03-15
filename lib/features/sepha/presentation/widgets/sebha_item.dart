import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:quran_app/core/functions/navigation.dart';
import 'package:quran_app/core/utils/app_assets.dart';
import 'package:quran_app/core/utils/app_colors.dart';
import 'package:quran_app/core/utils/app_routes.dart';
import 'package:quran_app/core/utils/app_text_style.dart';
import 'package:quran_app/features/sepha/cubit/sebha_cubit.dart';
import 'package:quran_app/features/sepha/data/sepha_model.dart';
import 'package:quran_app/features/sepha/presentation/widgets/delete_tasbih_dialog.dart';
import 'package:quran_app/features/sepha/presentation/widgets/edit_tasbih_dialog.dart';

class SebhaItem extends StatelessWidget {
  const SebhaItem({
    super.key,
    required this.sebhaModel,
    required this.sebhaCubit,
  });
  final SebhaModel sebhaModel;
  final SebhaCubit sebhaCubit;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Dismissible(
      key: UniqueKey(),
      background: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          color: Theme.of(context).scaffoldBackgroundColor,
          child: const Align(
              alignment: Alignment.centerRight,
              child: Icon(IconlyLight.delete, color: AppColors.primaryColor))),
      secondaryBackground: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          color: Theme.of(context).scaffoldBackgroundColor,
          child: const Align(
              alignment: Alignment.centerLeft,
              child: Icon(IconlyLight.edit, color: AppColors.primaryColor))),
      onDismissed: (direction) async {
        if (direction == DismissDirection.startToEnd) {
          deleteTasbihDialog(context, sebhaCubit, sebhaModel);
        } else {
          editTasbihDialog(context, sebhaModel, sebhaCubit);
        }
      },
      child: GestureDetector(
        onTap: () async {
          customPushNavigation(AppRoutes.tasbihView, context, sebhaModel);
        },
        child: Container(
          width: size.width,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: const BorderRadius.all(Radius.circular(15))),
          child: Row(
            children: [
              Image.asset(Assets.assetsHomeiconsSebha,
                  width: size.width / 10, height: size.width / 10),
              const SizedBox(width: 20),
              SizedBox(
                width: size.width / 1.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(sebhaModel.content,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: CustomTextStyles.change17meduim),
                    Text("التكرار : ${sebhaModel.count}",
                        style: Theme.of(context).textTheme.titleSmall),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
