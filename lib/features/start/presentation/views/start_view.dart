// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connectivity_checker/internet_connectivity_checker.dart';
import 'package:quran_app/core/functions/navigation.dart';
import 'package:quran_app/core/functions/show_toast.dart';
import 'package:quran_app/core/utils/app_assets.dart';
import 'package:quran_app/core/utils/app_colors.dart';
import 'package:quran_app/core/utils/app_routes.dart';
import 'package:quran_app/core/widgets/no_internet_widget.dart';
import 'package:quran_app/features/start/presentation/cubit/start_cubit.dart';
import 'package:quran_app/features/start/presentation/cubit/start_state.dart';
import 'package:quran_app/features/start/presentation/widgets/bottom_section.dart';
import 'package:quran_app/features/start/presentation/widgets/start_descrption.dart';
import 'package:quran_app/core/widgets/custom_center_image.dart';

class StartView extends StatelessWidget {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ConnectivityBuilder(
        builder: (ConnectivityStatus status) {
          if (status == ConnectivityStatus.online) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CustomCenterImage(image: Assets.assetsSvgLocation),
                const StartDescription(),
                SizedBox(height: size.width / 5),
                BlocConsumer<StartCubit, StartState>(
                  listener: (context, state) async {
                    if (state is ServiceLocationDisabled) {
                      showToast(msg: state.errorMessage, context: context);
                    } else if (state is PrayerTimesFailure) {
                      showToast(msg: state.errorMessage, context: context);
                    } else if (state is ServiceLocationEnabled) {
                      customReplacementNavigation(AppRoutes.homeView, context);
                    }
                  },
                  builder: (context, state) {
                    return state is ServiceLocationLoading
                        ? const Center(child: CircularProgressIndicator())
                        : const StartBottomSection();
                  },
                )
              ],
            );
          } else if (status == ConnectivityStatus.offline) {
            return const NoInternetWidget();
          } else {
            // status == ConnectivityStatus.checking
            return const Center(
                child: SizedBox(
                    width: 25,
                    height: 25,
                    child: CircularProgressIndicator(
                        color: AppColors.primaryColor)));
          }
        },
      ),
    );
  }
}
