import 'package:flutter/material.dart';
import 'package:quran_app/core/utils/app_colors.dart';

class SebhaInputField extends StatelessWidget {
  const SebhaInputField(
      {super.key,
      required this.controller,
      required this.isNumber,
      required this.hintText});
  final TextEditingController controller;
  final bool isNumber;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: Theme.of(context).textTheme.titleMedium,
      keyboardType: isNumber ? TextInputType.number : TextInputType.name,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.titleMedium,
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(color: AppColors.primaryColor)),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(color: AppColors.primaryColor))),
    );
  }
}
