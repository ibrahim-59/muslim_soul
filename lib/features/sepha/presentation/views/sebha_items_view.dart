import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/utils/app_assets.dart';
import 'package:quran_app/core/utils/app_strings.dart';
import 'package:quran_app/core/widgets/custom_appbar.dart';
import 'package:quran_app/core/widgets/custom_error_widget.dart';
import 'package:quran_app/core/widgets/custom_loading.dart';
import 'package:quran_app/features/sepha/cubit/sebha_cubit.dart';
import 'package:quran_app/features/sepha/cubit/sebha_state.dart';
import 'package:quran_app/features/sepha/presentation/widgets/add_newtasbih_widget.dart';
import 'package:quran_app/features/sepha/presentation/widgets/sebha_item.dart';

class SebhaItemView extends StatelessWidget {
  const SebhaItemView({super.key});

  @override
  Widget build(BuildContext context) {
    SebhaCubit sebhaCubit = context.read<SebhaCubit>();
    return BlocBuilder<SebhaCubit, SebhaState>(
      builder: (context, state) {
        return Scaffold(
          bottomSheet: AddNewTasbihWidget(sebhaCubit: sebhaCubit),
          appBar: customAppBar(
              image: Assets.assetsHomeiconsSebha, title: AppStrings.sebha),
          body: BlocConsumer<SebhaCubit, SebhaState>(
            builder: (context, state) {
              return state is GetSebhaItemsSuccess
                  ? ListView.builder(
                      padding: const EdgeInsets.only(
                          bottom: kBottomNavigationBarHeight),
                      itemCount: state.sebhaList.length,
                      itemBuilder: (context, index) {
                        return SebhaItem(
                            sebhaModel: state.sebhaList[index],
                            sebhaCubit: sebhaCubit);
                      })
                  : state is GetSebhaItemsFailure
                      ? CustomErrorWidget(
                          errorMessage: state.errorMessage, onPressed: () {})
                      : const CustomLoading();
            },
            listener: (BuildContext context, SebhaState state) async {},
          ),
        );
      },
    );
  }
}
