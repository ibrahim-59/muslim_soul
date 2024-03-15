// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:quran_app/core/functions/show_toast.dart';
import 'package:quran_app/core/utils/app_colors.dart';
import 'package:quran_app/core/utils/app_strings.dart';
import 'package:quran_app/core/utils/app_text_style.dart';
import 'package:quran_app/features/sepha/cubit/sebha_cubit.dart';
import 'package:quran_app/features/sepha/data/sepha_model.dart';

Future<dynamic> deleteTasbihDialog(
    BuildContext context, SebhaCubit sebhaCubit, SebhaModel sebhaModel) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Theme.of(context).cardColor,
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(AppStrings.doyouwanttoDeleteTis,
              style: CustomTextStyles.change20W500
                  .copyWith(color: AppColors.primaryColor)),
        ),
        actions: [
          TextButton(
              onPressed: () async {
                await sebhaCubit.deleteItem(sebhaModel);
                showToast(msg: AppStrings.tasbihDeleted, context: context);
                Navigator.pop(context);
              },
              child: Text("حذف",
                  style: CustomTextStyles.change14meduim.copyWith(
                      color: Colors.red, fontWeight: FontWeight.bold))),
          TextButton(
              onPressed: () async {
                await sebhaCubit.loadSebhaItemsFromHive();
                Navigator.pop(context);
              },
              child: Text("الغاء",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontWeight: FontWeight.bold))),
        ],
      );
    },
  );
}
