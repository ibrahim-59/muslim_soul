import 'dart:convert';
import 'dart:developer';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/cache/cache_helper.dart';
import 'package:quran_app/core/utils/app_assets.dart';
import 'package:quran_app/core/utils/app_strings.dart';
import 'package:quran_app/features/quran/data/tafser_model.dart';
import 'package:quran_app/features/quran/presentation/surah_cubit/surah_state.dart';

class SurahCubit extends Cubit<SurahState> {
  SurahCubit() : super(SurahInitial());
  late bool translationOn;
  String? sizeName;
  late int ayahSize;
  late int transSize;
  List<TafsearModel> tafsearList = [];

  init() async {
    await getTranslation();
    await getSize();
    emit(UpdateSura(
        ayahSize: ayahSize,
        transSize: transSize,
        translation: translationOn,
        sizeName: sizeName!));
  }

  setTranslation(bool value) async {
    await CacheHelper().saveData(key: AppStrings.translation, value: value);
    getTranslation();
  }

  getTranslation() async {
    translationOn =
        await CacheHelper().getData(key: AppStrings.translation) ?? true;
  }

  updateSize(bool isPlus) async {
    if ((ayahSize == 24) && (isPlus == true)) {
      setSize(26, 20, AppStrings.med);
    } else if ((ayahSize == 26) && (isPlus == true)) {
      setSize(28, 22, AppStrings.max);
    } else if ((ayahSize == 26) && (isPlus == false)) {
      setSize(24, 18, AppStrings.min);
    } else if ((ayahSize == 28) && (isPlus == false)) {
      setSize(26, 20, AppStrings.med);
    }
  }

  setSize(int ayahSize, int transSize, String size) async {
    await CacheHelper().saveData(key: AppStrings.ayahSize, value: ayahSize);
    await CacheHelper()
        .saveData(key: AppStrings.translationSize, value: transSize);
    sizeName = size;
    log("aya size : $ayahSize transSize : $transSize name : $sizeName");
    await getSize();
    init();
  }

  getSize() async {
    ayahSize = await CacheHelper().getData(key: AppStrings.ayahSize) ?? 26;
    transSize =
        await CacheHelper().getData(key: AppStrings.translationSize) ?? 20;
    if (ayahSize == 28) {
      sizeName = AppStrings.max;
    } else if (ayahSize == 26) {
      sizeName = AppStrings.med;
    } else {
      sizeName = AppStrings.min;
    }
  }

  Future<String> loadAyahTafsear(String ayahNumber, String surahNumber) async {
    final String response =
        await rootBundle.loadString(Assets.assetsDataTafseer);
    final data = await json.decode(response);
    for (var i = 0; i < data.length; i++) {
      tafsearList.add(TafsearModel.fromJson(data[i]));
    }
    String tafser = tafsearList
        .firstWhere((element) =>
            element.aya == ayahNumber && element.number == surahNumber)
        .text!;
    return tafser;
  }
}
