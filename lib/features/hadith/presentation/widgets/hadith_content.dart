import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/features/hadith/presentation/cubit/hadith_cubit.dart';

class HadithContent extends StatelessWidget {
  const HadithContent({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: context.read<HadithCubit>().haditSize.toDouble()));
  }
}
