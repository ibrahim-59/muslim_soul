import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/services/service_locator.dart';
import 'package:quran_app/core/utils/app_colors.dart';
import 'package:quran_app/features/azkar/data/models/azkar_model.dart';
import 'package:quran_app/features/azkar/presentation/cubit/azkar_cubit.dart';
import 'package:quran_app/features/azkar/presentation/cubit/azkar_state.dart';

class LengthAndSizeWidget extends StatefulWidget {
  const LengthAndSizeWidget({
    super.key,
    required this.azkarModel,
  });

  final AzkarModel azkarModel;

  @override
  State<LengthAndSizeWidget> createState() => _LengthAndSizeWidgetState();
}

class _LengthAndSizeWidgetState extends State<LengthAndSizeWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AzkarCubit, AzkarState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //! Size
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(14)),
                  border: Border.all(
                      color: AppColors.primaryColor, width: 1, strokeAlign: 0)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        await getit<AzkarCubit>().updateSize(true);
                      },
                      child: Icon(
                        Icons.add_circle_outline,
                        color: Theme.of(context).primaryColor,
                        size: 26,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(getit<AzkarCubit>().sizeName!,
                        style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () async {
                        await getit<AzkarCubit>().updateSize(false);
                      },
                      child: Icon(
                        Icons.remove_circle_outline,
                        color: Theme.of(context).primaryColor,
                        size: 26,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
