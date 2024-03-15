import 'package:quran_app/features/do3a/data/adaya_model.dart';

class HomeState {}

final class HomeInitial extends HomeState {}

final class DailyContentLoading extends HomeState {}

final class DailyContentSuccess extends HomeState {
  final String surahName;
  final String ayahName;
  final String ayahIndex;
  final String zekrCount;
  final String zekrContent;
  final AdayaModel adayaModel;
  final String date;

  DailyContentSuccess({
    required this.zekrCount,
    required this.zekrContent,
    required this.surahName,
    required this.ayahName,
    required this.ayahIndex,
    required this.adayaModel,
    required this.date,
  });
}

final class DailyContentFailure extends HomeState {
  final String errorMessage;

  DailyContentFailure({required this.errorMessage});
}

final class UpdateCounter extends HomeState {}
