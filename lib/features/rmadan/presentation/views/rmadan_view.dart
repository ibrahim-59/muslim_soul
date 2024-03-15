import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/utils/app_assets.dart';
import 'package:quran_app/core/widgets/custom_appbar.dart';
import 'package:quran_app/core/widgets/custom_error_widget.dart';
import 'package:quran_app/core/widgets/custom_loading.dart';
import 'package:quran_app/features/home/data/ramadan_type.dart';
import 'package:quran_app/features/rmadan/presentation/cubit/ramadan_cubit.dart';
import 'package:quran_app/features/rmadan/presentation/cubit/ramadan_state.dart';
import 'package:quran_app/features/rmadan/presentation/widgets/ramadan_data_items.dart';

class RamadanView extends StatelessWidget {
  const RamadanView({super.key, required this.rmadanType});
  final RmadanType rmadanType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          image: Assets.assetsHomeiconsRamadan, title: rmadanType.title!),
      body: BlocBuilder<RamadanCubit, RamadanState>(
        builder: (context, state) {
          return state is GetRamadanDataSuccess
              ? RamadanDataItems(dataList: state.dataList)
              : state is GetRamadanDataFailure
                  ? CustomErrorWidget(
                      errorMessage: state.errorMessage, onPressed: () {})
                  : const CustomLoading();
        },
      ),
    );
  }
}
