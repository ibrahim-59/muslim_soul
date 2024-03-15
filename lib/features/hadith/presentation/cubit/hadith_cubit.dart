import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/cache/cache_helper.dart';
import 'package:quran_app/core/utils/app_strings.dart';
import 'package:quran_app/features/hadith/data/arboon_model.dart';
import 'package:quran_app/features/hadith/data/hadith_model.dart';
import 'package:quran_app/features/hadith/data/hadith_type.dart';
import 'package:quran_app/features/hadith/presentation/cubit/hadith_state.dart';
import 'package:flutter/services.dart' show rootBundle;

class HadithCubit extends Cubit<HadithState> {
  HadithCubit() : super(HadithInitial());
  List<ArboonModel> arboon = [];
  List<HadithModel> hadithList = [];
  String? sizeName;
  late int haditSize;

  init() async {
    await getSize();
  }

  updateSize(bool isPlus, HaditType haditType) async {
    if ((haditSize == 24) && (isPlus == true)) {
      setSize(26, AppStrings.med);
    } else if ((haditSize == 26) && (isPlus == true)) {
      setSize(28, AppStrings.max);
    } else if ((haditSize == 26) && (isPlus == false)) {
      setSize(24, AppStrings.min);
    } else if ((haditSize == 28) && (isPlus == false)) {
      setSize(26, AppStrings.med);
    }
    loadAzkarData(haditType);
  }

  setSize(int hadithSize, String size) async {
    await CacheHelper().saveData(key: AppStrings.hadithSize, value: hadithSize);
    sizeName = size;
    await getSize();
    init();
  }

  getSize() async {
    haditSize = await CacheHelper().getData(key: AppStrings.hadithSize) ?? 26;
    if (haditSize == 28) {
      sizeName = AppStrings.max;
    } else if (haditSize == 26) {
      sizeName = AppStrings.med;
    } else {
      sizeName = AppStrings.min;
    }
  }

  loadAzkarData(HaditType haditType) async {
    try {
      emit(GetAzkarLoading());
      if (haditType == HaditType.arboon) {
        await getArboonData();
        await init();
        emit(GetArboonSuccess(data: arboon));
      } else if (haditType == HaditType.muslim) {
        await getMuslimData();
        await init();
        emit(GetAzkarSuccess(
          hadithList: hadithList,
          haditType: HaditType.muslim,
        ));
      } else {
        await getBukhariData();
        await init();
        emit(GetAzkarSuccess(
            hadithList: hadithList, haditType: HaditType.bukhari));
      }
    } on Exception catch (e) {
      emit(GetFailureFailure(errorMessage: e.toString()));
    }
  }

  //! get hadith الاربعون النوويه
  getArboonData() async {
    final String response =
        await rootBundle.loadString('assets/data/40-hadith-nawawi.json');
    final data = await json.decode(response);
    for (var i = 0; i < data.length; i++) {
      arboon.add(ArboonModel.fromJson(data[i]));
    }
  }

  //! get hadith muslim
  getMuslimData() async {
    hadithList.clear();
    final String response =
        await rootBundle.loadString('assets/data/muslim.json');
    final data = await json.decode(response);
    for (var i = 0; i < data.length; i++) {
      hadithList.add(HadithModel.fromJson(data[i]));
    }
  }

  //! get hadith bukhari
  getBukhariData() async {
    hadithList.clear();
    final String response =
        await rootBundle.loadString('assets/data/bukhari.json');
    final data = await json.decode(response);
    for (var i = 0; i < data.length; i++) {
      hadithList.add(HadithModel.fromJson(data[i]));
    }
  }
}
