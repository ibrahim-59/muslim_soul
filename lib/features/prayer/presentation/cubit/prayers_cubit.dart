import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:quran_app/core/api/api_consumer.dart';
import 'package:quran_app/core/api/end_ponits.dart';
import 'package:quran_app/core/cache/cache_helper.dart';
import 'package:quran_app/core/errors/exceptions.dart';
import 'package:quran_app/core/functions/format_time.dart';
import 'package:quran_app/core/services/local_notification_service.dart';
import 'package:quran_app/core/services/work_manager_service.dart';
import 'package:quran_app/core/utils/app_assets.dart';
import 'package:quran_app/core/utils/app_int.dart';
import 'package:quran_app/core/utils/app_strings.dart';
import 'package:quran_app/features/prayer/data/models/prayer_model.dart';
import 'package:quran_app/features/prayer/data/models/prayer_times_model.dart';
import 'package:quran_app/features/prayer/presentation/cubit/prayers_state.dart';

class PrayersCubit extends Cubit<PrayersState> {
  final ApiConsumer apiConsumer;
  PrayersCubit(this.apiConsumer) : super(PrayersInitial());

  Position? position;
  List<String> times = [];
  String? currentLocation;
  String currentTime = DateFormat('HH:mm').format(DateTime.now());
  String? nextTime;
  String? nextPrayer;
  List<PrayerModel> prayerItems = [];
  PrayerTimesModel? prayerTimes;

  //! get Prayer Times
  getPrayersTimes() async {
    var box = Hive.box<PrayerModel>(AppStrings.prayerBox);
    if (box.length == 0) {
      await Hive.box<PrayerModel>(AppStrings.prayerBox).clear();
      await getPrayersFromInternet();
    } else {
      await getPrayersFromCache();
    }
  }

  //! get Prayer time from internet
  Future<void> getPrayersFromInternet() async {
    double longitude = CacheHelper().getData(key: AppStrings.longitude);
    double latitude = CacheHelper().getData(key: AppStrings.latitude);
    try {
      emit(GetPrayerTimesLoading());
      final response = await apiConsumer.get(
          EndPoint.getPrayerTimeEndPoint(DateTime.now(), latitude, longitude));
      prayerTimes = PrayerTimesModel.fromJson(response['data']);
      cachingData(prayerTimes!);
      log("get Data From Internet");
      await getPrayersFromCache();
    } on ServerException catch (e) {
      emit(GetPrayerTimesFailure(errorMessage: e.errModel.errorMessage));
    }
  }

  //! get Prayer time from cache
  Future<void> getPrayersFromCache() async {
    try {
      emit(GetPrayerTimesLoading());
      await fetchPrayersData();
      await getNextPrayer(prayerItems);
      emit(GetPrayerTimesSuccess(
          prayerTimes: prayerItems,
          nextTime: nextTime!,
          nextPrayer: nextPrayer!));
      log("get data from cache");
    } on ServerException catch (e) {
      emit(GetPrayerTimesFailure(errorMessage: e.toString()));
    }
  }

  //! get next prayer time
  getNextPrayer(List<PrayerModel> prayerItems) async {
    for (var time in prayerItems) {
      times.add(time.time);
    }
    nextTime = getNextTime(times);
    for (var element in prayerItems) {
      if (element.time == nextTime) {
        nextPrayer = element.name;
      }
    }
  }

  //! send notification
  sendNotification(String time, PrayerModel prayerModel) async {
    await WorkManagerSevice().registerMyTask(
        time: time,
        title: prayerModel.name,
        body: " حان الأن وقت أذان ${prayerModel.name}",
        taskName: prayerModel.cacheKey,
        id: prayerModel.id);
  }

  //! cancel notification
  cancelNotification(PrayerModel prayerModel) async {
    await LocalNotificationService.cancelNotification(prayerModel.id);
    WorkManagerSevice().cancelTask(prayerModel.id.toString());
  }

  fetchPrayersData() async {
    try {
      prayerItems = Hive.box<PrayerModel>(AppStrings.prayerBox).values.toList();
    } on Exception catch (e) {
      emit(GetPrayerTimesFailure(errorMessage: e.toString()));
    }
  }

  cachingData(PrayerTimesModel prayerTimes) {
    addPrayersToHive(PrayerModel(
        name: AppStrings.fajr,
        time: prayerTimes.timings!.fajr!,
        image: Assets.assetsPrayertimesSubuh,
        cacheKey: AppStrings.fajrkey,
        id: AppIntegers.fajrId));
    addPrayersToHive(PrayerModel(
        name: AppStrings.sunRise,
        time: prayerTimes.timings!.sunrise!,
        image: Assets.assetsPrayertimesSunset,
        cacheKey: AppStrings.sunRisekey,
        id: AppIntegers.sunRiseId));
    addPrayersToHive(PrayerModel(
        name: AppStrings.zhr,
        time: prayerTimes.timings!.dhuhr!,
        image: Assets.assetsPrayertimesZhur,
        cacheKey: AppStrings.zhrkey,
        id: AppIntegers.zhrID));
    addPrayersToHive(PrayerModel(
        name: AppStrings.asr,
        time: prayerTimes.timings!.asr!,
        image: Assets.assetsPrayertimesAsr,
        cacheKey: AppStrings.asrkey,
        id: AppIntegers.asrId));
    addPrayersToHive(PrayerModel(
        name: AppStrings.majrib,
        time: prayerTimes.timings!.maghrib!,
        image: Assets.assetsPrayertimesMagrib,
        cacheKey: AppStrings.majribkey,
        id: AppIntegers.magribId));
    addPrayersToHive(PrayerModel(
        name: AppStrings.isha,
        time: prayerTimes.timings!.isha!,
        image: Assets.assetsPrayertimesIsyah,
        cacheKey: AppStrings.ishakey,
        id: AppIntegers.ishaId));
  }

  addPrayersToHive(PrayerModel prayerModel) async {
    await Hive.box<PrayerModel>(AppStrings.prayerBox).add(prayerModel);
  }
}
