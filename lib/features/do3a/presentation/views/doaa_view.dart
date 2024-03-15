import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/utils/app_assets.dart';
import 'package:quran_app/core/widgets/custom_appbar.dart';
import 'package:quran_app/core/widgets/custom_error_widget.dart';
import 'package:quran_app/core/widgets/custom_loading.dart';
import 'package:quran_app/features/do3a/presentation/cubit/doaa_cubit.dart';
import 'package:quran_app/features/do3a/presentation/cubit/doaa_state.dart';
import 'package:quran_app/features/do3a/presentation/widgets/doaa_item.dart';
import 'package:quran_app/features/home/data/adaya_type.dart';

class DoaaView extends StatelessWidget {
  const DoaaView({super.key, required this.adayaType});
  final AdayaType adayaType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          image: Assets.assetsHomeiconsDo3aa, title: adayaType.title!),
      body: BlocBuilder<DoaaCubit, DoaaState>(
        builder: (context, state) {
          return state is GetAdayaSuccess
              ? ListView.builder(
                  itemCount: state.dataList.length,
                  itemBuilder: (context, index) {
                    return DoaaItem(
                        adayaType: adayaType,
                        title: state.dataList[index].text,
                        index: index);
                  })
              : state is GetAdayaFailure
                  ? CustomErrorWidget(
                      errorMessage: state.errorMessage, onPressed: () {})
                  : const CustomLoading();
        },
      ),
    );
  }
}
