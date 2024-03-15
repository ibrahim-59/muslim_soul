import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:quran_app/core/utils/app_text_style.dart';
import 'package:quran_app/features/prayer/presentation/cubit/prayers_cubit.dart';

class AppCountDown extends StatefulWidget {
  const AppCountDown({super.key, required this.deadline});
  final DateTime deadline;

  @override
  State<AppCountDown> createState() => _AppCountDownState();
}

class _AppCountDownState extends State<AppCountDown> {
  late Timer timer;
  Duration duration = const Duration();

  @override
  void initState() {
    calculatetimeLeft(widget.deadline);
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      calculatetimeLeft(widget.deadline);
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void calculatetimeLeft(DateTime deadline) async {
    final seconds = deadline.difference(DateTime.now()).inSeconds;
    setState(() {
      duration = Duration(seconds: seconds);
    });
  }

  @override
  Widget build(BuildContext context) {
    final hours = duration.inHours.toString().padLeft(2, '0');
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');

    String convertCounterToArabic(String time) {
      List<String> parts = time.split(':');
      int hours = int.parse(parts[0]);
      int minutes = int.parse(parts[1]);
      int seconds = int.parse(parts[2]);
      String formattedTime = '';

      if (hours == 0) {
        formattedTime = DateFormat('hh:mm:ss', 'ar')
            .format(DateTime(0, 1, 1, 0, minutes, seconds));
        log(formattedTime.toString());
      } else {
        formattedTime = DateFormat('hh:mm:ss', 'ar')
            .format(DateTime(0, 1, 1, hours, minutes, seconds));
      }
      if (formattedTime.startsWith('١٢')) {
        formattedTime = '٠${formattedTime.substring(2)}';
      }
      return formattedTime;
    }

    if ((hours == "00" || hours == '0' || hours == "12") &&
        minutes == "00" &&
        seconds == "00") {
      setState(() {});
      context.read<PrayersCubit>().getPrayersTimes();
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
              convertCounterToArabic(
                  "${duration.inHours.toString().padLeft(2, '0')} : ${duration.inMinutes.remainder(60).toString().padLeft(2, '0')} : ${duration.inSeconds.remainder(60).toString().padLeft(2, '0')}"),
              style: CustomTextStyles.cairo24w600),
        ),
      ],
    );
  }
}
