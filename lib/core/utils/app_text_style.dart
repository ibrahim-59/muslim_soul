import 'package:flutter/material.dart';
import 'package:quran_app/core/utils/app_colors.dart';

abstract class CustomTextStyles {
  static const change22w500 = TextStyle(
      color: AppColors.primaryColor,
      fontSize: 22,
      fontFamily: "Change",
      fontWeight: FontWeight.w500);
  static const change17meduim = TextStyle(
      color: AppColors.primaryColor, fontSize: 17, fontFamily: "Change");
  static const change14meduim = TextStyle(
      color: AppColors.pink2Color, fontSize: 14, fontFamily: "Change");
  static const change20W500 = TextStyle(
      fontSize: 20,
      color: AppColors.whiteColor,
      fontWeight: FontWeight.w500,
      fontFamily: "Change");
  static const change24W600 = TextStyle(
      fontSize: 24,
      color: AppColors.whiteColor,
      fontWeight: FontWeight.w600,
      fontFamily: "Change");
  static const uthman24w500 = TextStyle(
      fontSize: 24,
      fontFamily: "Uthman",
      fontWeight: FontWeight.w500,
      color: AppColors.thirdColor);
  static const change20w400 = TextStyle(
      fontSize: 20,
      fontFamily: "Change",
      fontWeight: FontWeight.w400,
      color: AppColors.pink2Color);
  static const change18w400 = TextStyle(
    fontSize: 18,
    fontFamily: "Change",
    fontWeight: FontWeight.w400,
    color: AppColors.primaryColor,
  );
  static const cairo24w600 = TextStyle(
      fontSize: 24,
      color: AppColors.whiteColor,
      fontFamily: "cairo",
      fontWeight: FontWeight.w600);
  static const amiri26bold = TextStyle(
      fontSize: 26,
      color: AppColors.pink2Color,
      fontWeight: FontWeight.bold,
      fontFamily: "amiri");
  static const quran24 = TextStyle(
      fontFamily: "quran",
      fontSize: 24,
      color: AppColors.lightGrey,
      fontWeight: FontWeight.w600);
}
