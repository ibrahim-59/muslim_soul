import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:quran_app/core/utils/app_colors.dart';
import 'package:quran_app/core/utils/app_text_style.dart';
import 'package:quran_app/features/sepha/cubit/sebha_cubit.dart';
import 'package:quran_app/features/sepha/cubit/sebha_state.dart';
import 'package:quran_app/features/sepha/data/sepha_model.dart';

class TasbihView extends StatelessWidget {
  const TasbihView({super.key, required this.sebhaModel});
  final SebhaModel sebhaModel;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                context.read<SebhaCubit>().recetAll(sebhaModel);
              },
              icon: const Icon(
                Icons.refresh_rounded,
                size: 30,
                color: AppColors.primaryColor,
              ))
        ],
      ),
      body: InkWell(
        splashColor: Colors.transparent, // Remove splash color
        highlightColor: Colors.transparent,
        onTap: () {
          context
              .read<SebhaCubit>()
              .updateCounter(sebhaModel.count, sebhaModel);
        },
        child: BlocBuilder<SebhaCubit, SebhaState>(
          builder: (context, state) {
            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Align(
                  child: Text(sebhaModel.content,
                      textAlign: TextAlign.center,
                      style: CustomTextStyles.change22w500
                          .copyWith(fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: size.width / 3),
                CircularPercentIndicator(
                    radius: size.width / 3,
                    lineWidth: 8,
                    percent: context.read<SebhaCubit>().percent,
                    center: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(context.read<SebhaCubit>().counter.toString(),
                            style: TextStyle(
                                fontSize: 70,
                                color: Theme.of(context).primaryColor)),
                        Text(sebhaModel.count.toString(),
                            style: TextStyle(
                                fontSize: 20,
                                color: Theme.of(context).primaryColor)),
                      ],
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                    progressColor: AppColors.primaryColor),
                SizedBox(height: size.width / 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("المرات الكتمله",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge),
                    Text(context.read<SebhaCubit>().counterCount.toString(),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("العدد الاجمالي",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge),
                    Text(context.read<SebhaCubit>().totalCount.toString(),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
