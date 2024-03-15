import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/utils/app_assets.dart';
import 'package:quran_app/core/utils/app_colors.dart';
import 'package:quran_app/core/utils/app_strings.dart';
import 'package:quran_app/core/utils/app_text_style.dart';
import 'package:quran_app/core/widgets/custom_center_image.dart';
import 'package:quran_app/features/prayer/presentation/cubit/prayers_cubit.dart';

class PrayerErrorWidget extends StatelessWidget {
  const PrayerErrorWidget({super.key, required this.errorMessage});
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CustomCenterImage(image: Assets.assetsSvgNoInternet),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(errorMessage,
              style: CustomTextStyles.change20W500
                  .copyWith(color: AppColors.primaryColor)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Container(
              margin: const EdgeInsets.all(8),
              height: size.width / 7.5,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.lightRed,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)))),
                  child: Text(
                    AppStrings.tryAgain,
                    style: CustomTextStyles.change17meduim
                        .copyWith(color: AppColors.whiteColor),
                  ),
                  onPressed: () async {
                    await context.read<PrayersCubit>().getPrayersTimes();
                  })),
        )
      ],
    );
  }
}
