import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/utils/app_assets.dart';
import 'package:quran_app/core/utils/app_strings.dart';
import 'package:quran_app/features/azkar/data/azkar_type.dart';
import 'package:quran_app/features/azkar/presentation/cubit/azkar_cubit.dart';
import 'package:quran_app/features/azkar/presentation/cubit/azkar_state.dart';
import 'package:quran_app/core/widgets/custom_appbar.dart';
import 'package:quran_app/features/azkar/presentation/widgets/azkar_item_widget.dart';

class AzkarView extends StatelessWidget {
  const AzkarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(
            title: AppStrings.azkarelmuslim,
            image: Assets.assetsAzkariconsPray),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: BlocConsumer<AzkarCubit, AzkarState>(
            listener: (context, state) {},
            builder: (context, state) {
              AzkarType? azkarType;
              return state is GetAzkarSuccess
                  ? ListView.builder(
                      itemCount: state.azkar.length,
                      itemBuilder: (context, index) {
                        azkarType = checkAzkarType(state, index, azkarType);
                        return FadeInUp(
                          child: AzkarItemWidget(
                              azkarModel: state.azkar[index],
                              azkarType: azkarType!),
                        );
                      },
                    )
                  : const Center(child: CircularProgressIndicator());
            },
          ),
        ));
  }

  AzkarType? checkAzkarType(
      GetAzkarSuccess state, int index, AzkarType? azkarType) {
    if (state.azkar[index].name == AppStrings.morningazkar) {
      azkarType = AzkarType.morning;
    } else if (state.azkar[index].name == AppStrings.eveningAzkar) {
      azkarType = AzkarType.evening;
    } else if (state.azkar[index].name == AppStrings.mosqueAzkar) {
      azkarType = AzkarType.mosque;
    } else if (state.azkar[index].name == AppStrings.prayAzkar) {
      azkarType = AzkarType.pray;
    } else if (state.azkar[index].name == AppStrings.afterPray) {
      azkarType = AzkarType.afterPray;
    } else if (state.azkar[index].name == AppStrings.slepingAzkar) {
      azkarType = AzkarType.sleeping;
    } else if (state.azkar[index].name == AppStrings.wakeupAzkar) {
      azkarType = AzkarType.wakup;
    }
    return azkarType;
  }
}
