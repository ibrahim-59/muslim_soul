import 'package:flutter/material.dart';
import 'package:quran_app/core/utils/app_colors.dart';
import 'package:quran_app/core/utils/app_text_style.dart';
import 'package:quran_app/core/widgets/custom_copy_icon.dart';
import 'package:quran_app/core/widgets/custom_share_icon.dart';
import 'package:quran_app/features/home/data/adaya_type.dart';

class DoaaItem extends StatelessWidget {
  const DoaaItem({
    super.key,
    required this.adayaType,
    required this.title,
    required this.index,
  });

  final AdayaType adayaType;
  final String title;
  final int index;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.all(Radius.circular(15))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.w500)),
        const Divider(
          color: AppColors.primaryColor,
          indent: 10,
          endIndent: 10,
          thickness: 0.5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: size.width / 2,
                child: Text("# ${index + 1} | ${adayaType.title!}",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.change14meduim
                        .copyWith(color: AppColors.primaryColor)),
              ),
              Row(
                children: [
                  CustomCopyIcon(title: title),
                  const SizedBox(width: 10),
                  CustomShareIcon(title: title),
                ],
              )
            ],
          ),
        )
      ]),
    );
  }
}
