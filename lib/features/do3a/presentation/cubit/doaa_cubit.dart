import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/utils/app_assets.dart';
import 'package:quran_app/features/do3a/data/adaya_model.dart';
import 'package:quran_app/features/do3a/presentation/cubit/doaa_state.dart';
import 'package:quran_app/features/home/data/adaya_type.dart';
import 'package:flutter/services.dart' show rootBundle;

class DoaaCubit extends Cubit<DoaaState> {
  DoaaCubit() : super(DoaaInitial());
  List<AdayaModel> dataList = [];
  String? assetsName;
  loadAdayaItem(AdayaType adayaType) async {
    try {
      emit(GetAdayaLoding());
      switch (adayaType) {
        case AdayaType.ad3eyaKhatmAlQuran:
          assetsName = Assets.assetsDataEndquran;
        case AdayaType.ad3yaAl3elm:
          assetsName = Assets.assetsDataDo3aal3elm;
        case AdayaType.ad3yaAlMtwafy:
          assetsName = Assets.assetsDataDo3aalmotwafy;
        case AdayaType.ad3yaAlrezq:
          assetsName = Assets.assetsDataRezkandbaraka;
        case AdayaType.ad3yaAltwba:
          assetsName = Assets.assetsDataDo3aaltwba;
        case AdayaType.ad3yaQranya:
          assetsName = Assets.assetsDataAdayaqranya;
        case AdayaType.ad3yaNabwaya:
          assetsName = Assets.assetsDataAd3yanabawya;
        case AdayaType.ad3yaZehabAlham:
          assetsName = Assets.assetsDataZehabelham;
      }
      final String response = await rootBundle.loadString(assetsName!);
      final data = await json.decode(response);
      for (var i = 0; i < data.length; i++) {
        dataList.add(AdayaModel.fromJson(data[i]));
      }
      emit(GetAdayaSuccess(dataList: dataList));
    } on Exception catch (e) {
      emit(GetAdayaFailure(errorMessage: e.toString()));
    }
  }
}
