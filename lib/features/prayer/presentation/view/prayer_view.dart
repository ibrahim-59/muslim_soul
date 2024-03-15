import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/utils/app_assets.dart';
import 'package:quran_app/core/utils/app_strings.dart';
import 'package:quran_app/core/widgets/custom_appbar.dart';
import 'package:quran_app/features/prayer/presentation/cubit/prayers_cubit.dart';
import 'package:quran_app/features/prayer/presentation/cubit/prayers_state.dart';
import 'package:quran_app/features/prayer/presentation/widgets/prayer_error_widget.dart';
import 'package:quran_app/features/prayer/presentation/widgets/prayer_success_widget.dart';

class PrayerView extends StatelessWidget {
  const PrayerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          image: Assets.assetsHomeiconsShalat, title: AppStrings.prayerTimes),
      body: BlocBuilder<PrayersCubit, PrayersState>(
        builder: (context, state) {
          return state is GetPrayerTimesSuccess
              //! prayer Success Widget
              ? PrayerSuccessWidget(
                  nextPrayer: state.nextPrayer,
                  prayerTimes: state.prayerTimes,
                  nextTime: state.nextTime)
              //! prayer Failure widget
              : state is GetPrayerTimesFailure
                  ? PrayerErrorWidget(errorMessage: state.errorMessage)
                  //! Loading widget
                  : const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
