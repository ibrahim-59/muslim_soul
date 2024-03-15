// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:quran_app/core/cache/cache_helper.dart';
import 'package:quran_app/core/functions/show_toast.dart';
import 'package:quran_app/core/utils/app_strings.dart';
import 'package:quran_app/features/sepha/cubit/sebha_state.dart';
import 'package:quran_app/features/sepha/data/sepha_model.dart';
import 'package:uuid/uuid.dart';

class SebhaCubit extends Cubit<SebhaState> {
  SebhaCubit() : super(SebhaInitial());
  List<SebhaModel> sebhaHiveList = [];
  int counter = 0;
  double percent = 0;
  int counterCount = 0;
  int totalCount = 0;

  Future loadSebhaItemsFromHive() async {
    log("1");
    try {
      emit(GetSebhaItemsLoading());
      sebhaHiveList = Hive.box<SebhaModel>(AppStrings.sebhaBox).values.toList();
      emit(GetSebhaItemsSuccess(sebhaList: sebhaHiveList));
    } on Exception catch (e) {
      emit(GetSebhaItemsFailure(errorMessage: e.toString()));
    }
  }

  deleteItem(SebhaModel sebhaModel) async {
    sebhaModel.delete();
    await loadSebhaItemsFromHive();
  }

  addSebhaToHive(TextEditingController nameController,
      TextEditingController countController, BuildContext context) async {
    if (nameController.value.text.isNotEmpty ||
        countController.value.text.isNotEmpty) {
      await Hive.box<SebhaModel>(AppStrings.sebhaBox).add(SebhaModel(
        content: nameController.value.text,
        count: int.parse(countController.value.text),
        id: const Uuid().v4(),
      ));
      showToast(msg: AppStrings.newTasbihAdded, context: context);
    }
    emit(UpdateData());
    await loadSebhaItemsFromHive();
    FocusScope.of(context).unfocus();
    Navigator.pop(context);
  }

  setTotalCount(SebhaModel sebhaModel, int value) async {
    await CacheHelper().saveData(key: sebhaModel.id, value: value);
    getTotalCount(sebhaModel);
  }

  getTotalCount(SebhaModel sebhaModel) async {
    totalCount = await CacheHelper().getData(key: sebhaModel.id) ?? 0;
    emit(UpdateCounter());
  }

  updateCounter(int count, SebhaModel sebhaModel) {
    if (counter == count) {
      counter = 1;
      percent = 1 / count;
      counterCount++;
      setTotalCount(sebhaModel, totalCount + 1);
      emit(UpdateCounter());
    } else {
      counter++;
      setTotalCount(sebhaModel, totalCount + 1);
      percent = counter / count;
      emit(UpdateCounter());
    }
  }

  recetAll(SebhaModel sebhaModel) {
    setTotalCount(sebhaModel, 0);
    percent = 0;
    counter = 0;
    counterCount = 0;
  }
}
