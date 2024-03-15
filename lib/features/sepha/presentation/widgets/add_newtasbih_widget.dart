import 'package:flutter/material.dart';
import 'package:quran_app/core/utils/app_colors.dart';
import 'package:quran_app/core/utils/app_strings.dart';
import 'package:quran_app/core/utils/app_text_style.dart';
import 'package:quran_app/features/sepha/cubit/sebha_cubit.dart';
import 'package:quran_app/features/sepha/presentation/widgets/add_newtasbih_dialog.dart';

class AddNewTasbihWidget extends StatelessWidget {
  const AddNewTasbihWidget({
    super.key,
    required this.sebhaCubit,
  });
  final SebhaCubit sebhaCubit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        addNewTasbihDialog(context, sebhaCubit);
      },
      child: Container(
        width: double.infinity,
        color: Theme.of(context).cardColor,
        padding: const EdgeInsets.all(16),
        child: const Row(
          children: [
            Icon(Icons.add_circle_outline_sharp,
                size: 36, color: AppColors.primaryColor),
            SizedBox(width: 20),
            Text(AppStrings.addNewTasbih,
                style: CustomTextStyles.change17meduim),
          ],
        ),
      ),
    );
  }
}
