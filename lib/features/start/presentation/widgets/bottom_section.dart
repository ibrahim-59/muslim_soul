import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/utils/app_colors.dart';
import 'package:quran_app/core/utils/app_strings.dart';
import 'package:quran_app/core/utils/app_text_style.dart';
import 'package:quran_app/features/start/presentation/cubit/start_cubit.dart';

class StartBottomSection extends StatelessWidget {
  const StartBottomSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.all(8),
      height: size.width / 6.3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.lightRed,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)))),
            onPressed: () async {
              await context.read<StartCubit>().determinePosition();
            },
            child: Text(
              AppStrings.selectLocation,
              style: CustomTextStyles.change17meduim
                  .copyWith(color: AppColors.whiteColor),
            )),
      ),
    );
  }
}
