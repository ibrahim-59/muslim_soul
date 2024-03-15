import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:quran_app/core/cache/cache_helper.dart';
import 'package:quran_app/core/utils/app_assets.dart';
import 'package:quran_app/core/utils/app_strings.dart';
import 'package:quran_app/features/quran/data/quran_model.dart';
import 'package:quran_app/features/quran/data/rectiters_model.dart';
import 'package:quran_app/features/quran/data/surah_model.dart';
import 'package:quran_app/features/quran/presentation/quran_cubit/quran_state.dart';
import 'package:flutter/services.dart' show rootBundle;

class QuranCubit extends Cubit<QuranState> {
  QuranCubit() : super(QuranInitial());

  List<QuranModel> quranList = [];
  List<SurahModel> surahList = [];
  List<RectitersModel> rectitersList = [];
  List<AudioSource> playList = [];
  late bool translationOn;

  Future<void> loadQuranData() async {
    try {
      quranList.clear();
      int lastReadAyah =
          CacheHelper().getData(key: AppStrings.lastReadIndex) ?? 0;
      int lastReadSurah =
          (CacheHelper().getData(key: AppStrings.lastReadSurah) ?? 0) - 1;
      emit(GetQueanLoading());
      final String response =
          await rootBundle.loadString(Assets.assetsDataQuran);
      final data = await json.decode(response);
      for (var i = 0; i < data.length; i++) {
        quranList.add(QuranModel.fromJson(data[i]));
      }
      emit(GetQueanSuccess(
          quranList: quranList,
          lastRedAyah: lastReadAyah,
          lastReadSurah: lastReadSurah));
    } on Exception catch (e) {
      emit(GetQueanFailure(errorMessage: e.toString()));
    }
  }

  refresh() async {
    emit(GetQueanLoading());
    await loadQuranData();
  }

  loadRectitersData() async {
    try {
      emit(GetRectitersLoading());
      final String response =
          await rootBundle.loadString(Assets.assetsDataReciters);
      final data = await json.decode(response);
      for (var i = 0; i < data.length; i++) {
        rectitersList.add(RectitersModel.fromJson(data[i]));
      }
      emit(GetRectitersSuccess(rectitersList: rectitersList));
    } on Exception catch (e) {
      emit(GetRectitersFailure(errorMessage: e.toString()));
    }
  }

  loadSurahsData(RectitersModel rectitersModel) async {
    try {
      emit(GetSurahListLoading());
      final String response =
          await rootBundle.loadString(Assets.assetsDataSurah);
      final data = await json.decode(response);
      for (var i = 0; i < data.length; i++) {
        surahList.add(SurahModel.fromJson(data[i]));
      }
      for (var i = 0; i < surahList.length; i++) {
        playList.add(AudioSource.uri(
          Uri.parse(
              "${rectitersModel.moshaf![0].server}${surahList[i].index}.mp3"),
          tag: MediaItem(
              id: "$i",
              title: "سورة ${surahList[i].title}",
              artist: rectitersModel.name,
              album: rectitersModel.image),
        ));
      }
      emit(GetSurahListSuccess(surahList: surahList, playList: playList));
    } catch (e) {
      emit(GetSurahListFailure(errorMessage: e.toString()));
    }
  }
}
