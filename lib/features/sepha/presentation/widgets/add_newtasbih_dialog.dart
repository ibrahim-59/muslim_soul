import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/features/sepha/cubit/sebha_cubit.dart';
import 'package:quran_app/features/sepha/presentation/widgets/sebha_dialog_widget.dart';

Future<dynamic> addNewTasbihDialog(
    BuildContext context, SebhaCubit sebhaCubit) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        contentPadding: EdgeInsets.zero,
        backgroundColor: Theme.of(context).cardColor,
        content: BlocProvider(
          create: (context) => sebhaCubit,
          child: SebhaDialogWidget(sebhaCubit: sebhaCubit),
        ),
      );
    },
  );
}
