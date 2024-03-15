import 'dart:convert';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/utils/app_assets.dart';
import 'package:quran_app/features/home/data/ramadan_type.dart';
import 'package:quran_app/features/rmadan/data/ramadan_data_model.dart';
import 'package:quran_app/features/rmadan/presentation/cubit/ramadan_state.dart';
import 'package:flutter/services.dart' show rootBundle;

class RamadanCubit extends Cubit<RamadanState> {
  RamadanCubit() : super(RamadanInitial());
  List<RamdanDataModel> dataList = [];
  String? assetsName;
  loadRamadanItem(RmadanType rmadanType) async {
    try {
      emit(GetRamadanDataLoading());
      switch (rmadanType) {
        case RmadanType.ad3ya:
          assetsName = Assets.assetsDataRamadanAdeya;
        case RmadanType.advices:
          assetsName = Assets.assetsDataRamadanAdvices;
        case RmadanType.health:
          assetsName = Assets.assetsDataRamadanHealth;
        case RmadanType.waysToFinishQuran:
          assetsName = Assets.assetsDataRamadanWays;
        case RmadanType.ahkam:
          assetsName = Assets.assetsDataRamadanAhkam;
      }
      final String response = await rootBundle.loadString(assetsName!);
      final data = await json.decode(response);
      for (var i = 0; i < data.length; i++) {
        dataList.add(RamdanDataModel.fromJson(data[i]));
      }
      log(dataList.length.toString());
      emit(GetRamadanDataSuccess(dataList: dataList));
    } on Exception catch (e) {
      emit(GetRamadanDataFailure(errorMessage: e.toString()));
    }
  }
}
