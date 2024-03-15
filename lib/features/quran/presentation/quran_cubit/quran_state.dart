import 'package:just_audio/just_audio.dart';
import 'package:quran_app/features/quran/data/quran_model.dart';
import 'package:quran_app/features/quran/data/rectiters_model.dart';
import 'package:quran_app/features/quran/data/surah_model.dart';

class QuranState {}

final class QuranInitial extends QuranState {}

final class GetSurahListLoading extends QuranState {}

final class GetSurahListFailure extends QuranState {
  final String errorMessage;

  GetSurahListFailure({required this.errorMessage});
}

final class GetSurahListSuccess extends QuranState {
  final List<SurahModel> surahList;
  final List<AudioSource> playList;

  GetSurahListSuccess({required this.playList, required this.surahList});
}

final class GetRectitersLoading extends QuranState {}

final class GetRectitersSuccess extends QuranState {
  final List<RectitersModel> rectitersList;

  GetRectitersSuccess({required this.rectitersList});
}

final class GetRectitersFailure extends QuranState {
  final String errorMessage;

  GetRectitersFailure({required this.errorMessage});
}

final class GetQueanLoading extends QuranState {}

final class GetQueanSuccess extends QuranState {
  final List<QuranModel> quranList;
  final int lastRedAyah;
  final int lastReadSurah;

  GetQueanSuccess(
      {required this.lastRedAyah,
      required this.lastReadSurah,
      required this.quranList});
}

final class GetQueanFailure extends QuranState {
  final String errorMessage;

  GetQueanFailure({required this.errorMessage});
}
