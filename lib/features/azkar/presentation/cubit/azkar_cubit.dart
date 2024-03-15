import 'dart:convert';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/cache/cache_helper.dart';
import 'package:quran_app/core/utils/app_strings.dart';
import 'package:quran_app/features/azkar/data/models/azkar_model.dart';
import 'package:quran_app/features/azkar/presentation/cubit/azkar_state.dart';
import 'package:flutter/services.dart' show rootBundle;

class AzkarCubit extends Cubit<AzkarState> {
  AzkarCubit() : super(AzkarInitial());
  String? sizeName;
  late int zekrSize;
  late int descSize;

  loadAzkarData() async {
    List<AzkarModel> azkar = [];
    emit(GetAzkarLoading());
    final String response =
        await rootBundle.loadString('assets/data/azkar.json');
    final data = await json.decode(response);
    for (var i = 0; i < data.length; i++) {
      azkar.add(AzkarModel.fromJson(data[i]));
    }
    emit(GetAzkarSuccess(azkar: azkar));
  }

  init() async {
    await getSize();

    emit(UpdateSize());
  }

  updateSize(bool isPlus) async {
    if ((zekrSize == 24) && (isPlus == true)) {
      setSize(26, 20, AppStrings.med);
    } else if ((zekrSize == 26) && (isPlus == true)) {
      setSize(28, 22, AppStrings.max);
    } else if ((zekrSize == 26) && (isPlus == false)) {
      setSize(24, 18, AppStrings.min);
    } else if ((zekrSize == 28) && (isPlus == false)) {
      setSize(26, 20, AppStrings.med);
    }
    emit(UpdateSize());
  }

  setSize(int zekrSize, int descSize, String size) async {
    await CacheHelper().saveData(key: AppStrings.zekrSize, value: zekrSize);
    await CacheHelper().saveData(key: AppStrings.zekrDescSize, value: descSize);
    sizeName = size;
    log("aya size : $zekrSize descSize : $descSize name : $sizeName");
    await getSize();
    init();
  }

  getSize() async {
    zekrSize = await CacheHelper().getData(key: AppStrings.zekrSize) ?? 26;
    descSize = await CacheHelper().getData(key: AppStrings.zekrDescSize) ?? 20;
    if (zekrSize == 28) {
      sizeName = AppStrings.max;
    } else if (zekrSize == 26) {
      sizeName = AppStrings.med;
    } else {
      sizeName = AppStrings.min;
    }
    emit(UpdateSize());
  }
}
