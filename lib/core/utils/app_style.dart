import 'package:flutter/material.dart';
import 'package:quran_app/core/utils/app_colors.dart';
import 'package:quran_app/core/utils/app_text_style.dart';

ThemeData lightMode() {
  return ThemeData(
      cardColor: AppColors.whiteColor,
      primaryColor: AppColors.textColor,
      bottomSheetTheme: const BottomSheetThemeData(
          elevation: 0,
          shadowColor: Colors.transparent,
          backgroundColor: AppColors.lightBackGroundColor),
      appBarTheme: AppBarTheme(
          iconTheme: const IconThemeData(color: AppColors.primaryColor),
          backgroundColor: AppColors.lightBackGroundColor,
          surfaceTintColor: AppColors.lightBackGroundColor,
          centerTitle: true,
          titleTextStyle: CustomTextStyles.change20W500.copyWith(
              color: AppColors.primaryColor,
              height: 0,
              overflow: TextOverflow.ellipsis),
          elevation: 0),
      scaffoldBackgroundColor: AppColors.lightBackGroundColor,
      textTheme: TextTheme(
        bodyMedium:
            CustomTextStyles.quran24.copyWith(color: AppColors.textColor),
        titleLarge:
            CustomTextStyles.change20W500.copyWith(color: AppColors.textColor),
        titleMedium: CustomTextStyles.change17meduim
            .copyWith(color: AppColors.textColor),
        titleSmall: CustomTextStyles.change14meduim
            .copyWith(color: AppColors.textColor),
      ),
      useMaterial3: true);
}

ThemeData darkMode() {
  return ThemeData(
      cardColor: AppColors.blackColor,
      primaryColor: AppColors.lightGrey,
      bottomSheetTheme: const BottomSheetThemeData(
          elevation: 0,
          shadowColor: Colors.transparent,
          backgroundColor: AppColors.darkBackGroundColor),
      appBarTheme: AppBarTheme(
          iconTheme: const IconThemeData(color: AppColors.primaryColor),
          backgroundColor: AppColors.darkBackGroundColor,
          surfaceTintColor: AppColors.darkBackGroundColor,
          centerTitle: true,
          titleTextStyle: CustomTextStyles.change20W500.copyWith(
              color: AppColors.primaryColor,
              height: 0,
              overflow: TextOverflow.ellipsis),
          elevation: 0),
      scaffoldBackgroundColor: AppColors.darkBackGroundColor,
      textTheme: TextTheme(
          bodyMedium:
              CustomTextStyles.quran24.copyWith(color: AppColors.lightGrey),
          titleMedium: CustomTextStyles.change17meduim
              .copyWith(color: AppColors.lightGrey),
          titleSmall: CustomTextStyles.change14meduim
              .copyWith(color: AppColors.lightGrey),
          titleLarge: CustomTextStyles.change20W500
              .copyWith(color: AppColors.lightGrey),
          headlineLarge: CustomTextStyles.change22w500),
      useMaterial3: true);
}
