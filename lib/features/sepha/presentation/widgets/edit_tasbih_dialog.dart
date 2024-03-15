import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/features/sepha/cubit/sebha_cubit.dart';
import 'package:quran_app/features/sepha/data/sepha_model.dart';
import 'package:quran_app/features/sepha/presentation/widgets/sebha_dialog_widget.dart';

Future<dynamic> editTasbihDialog(
    BuildContext context, SebhaModel sebhaModel, SebhaCubit sebhaCubit) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        contentPadding: EdgeInsets.zero,
        backgroundColor: Theme.of(context).cardColor,
        content: BlocProvider(
          create: (context) => sebhaCubit,
          child:
              SebhaDialogWidget(sebhaModel: sebhaModel, sebhaCubit: sebhaCubit),
        ),
      );
    },
  );
}
