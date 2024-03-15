import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/utils/app_colors.dart';
import 'package:quran_app/core/utils/app_text_style.dart';
import 'package:quran_app/core/widgets/custom_error_widget.dart';
import 'package:quran_app/core/widgets/custom_loading.dart';
import 'package:quran_app/features/quran/presentation/quran_cubit/quran_cubit.dart';
import 'package:quran_app/features/quran/presentation/quran_cubit/quran_state.dart';
import 'package:quran_app/features/quran/presentation/widgets/rectitres_items.dart';

class QariView extends StatelessWidget {
  const QariView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("القرأن مسموع",
            style: CustomTextStyles.change22w500
                .copyWith(color: AppColors.primaryColor)),
      ),
      body: BlocBuilder<QuranCubit, QuranState>(
        builder: (context, state) {
          return state is GetRectitersSuccess
              ? RectitresItems(rectitersList: state.rectitersList)
              : state is GetRectitersFailure
                  ? CustomErrorWidget(
                      errorMessage: state.errorMessage,
                      onPressed: () {
                        context.read<QuranCubit>().loadRectitersData();
                      })
                  : const CustomLoading();
        },
      ),
    );
  }
}
