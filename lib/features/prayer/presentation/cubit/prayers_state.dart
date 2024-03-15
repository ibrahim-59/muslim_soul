import 'package:quran_app/features/prayer/data/models/prayer_model.dart';

class PrayersState {}

final class PrayersInitial extends PrayersState {}

final class SendNotify extends PrayersState {}

final class UnSendNotify extends PrayersState {}

final class GetPrayerTimesLoading extends PrayersState {}

final class GetPrayerTimesSuccess extends PrayersState {
  final List<PrayerModel> prayerTimes;
  final String nextTime;
  final String nextPrayer;

  GetPrayerTimesSuccess(
      {required this.prayerTimes,
      required this.nextTime,
      required this.nextPrayer});
}

final class GetPrayerTimesFailure extends PrayersState {
  final String errorMessage;

  GetPrayerTimesFailure({required this.errorMessage});
}
