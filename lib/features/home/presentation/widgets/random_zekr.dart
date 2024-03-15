import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/utils/app_colors.dart';
import 'package:quran_app/core/utils/app_text_style.dart';
import 'package:quran_app/features/azkar/presentation/widgets/iteraction_section.dart';
import 'package:quran_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:quran_app/features/home/presentation/cubit/home_state.dart';

class RandomZekr extends StatefulWidget {
  const RandomZekr({
    super.key,
    required this.content,
    required this.count,
  });
  final String content;
  final String count;

  @override
  State<RandomZekr> createState() => _RandomZekrState();
}

class _RandomZekrState extends State<RandomZekr> {
  double percent = 0;
  int counter = 0;
  int count = 0;
  @override
  void initState() {
    count = int.parse(widget.count);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        updateContent(context);
      },
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Container(
            width: size.width,
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                    padding: EdgeInsets.only(top: 16, right: 16, left: 16),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        "ذكر اليوم",
                        style: CustomTextStyles.change17meduim,
                      ),
                    )),
                //! zekr content
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 15),
                    child: Text(widget.content,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium)),
                //! interaction section
                InterActionSection(
                  count: count,
                  percent: percent,
                  content: widget.content,
                  color: AppColors.lightGrey,
                )
              ],
            ),
          );
        },
      ),
    );
  }

  void updateContent(BuildContext context) {
    counter++;
    percent = counter / int.parse(widget.count);
    count--;
    setState(() {});
    if (percent == 1) {
      counter = 0;
      percent = 0;
      count = int.parse(widget.count);
      setState(() {});
    }
  }
}
