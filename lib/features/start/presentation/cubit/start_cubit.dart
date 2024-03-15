import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hive/hive.dart';
import 'package:quran_app/core/api/api_consumer.dart';
import 'package:quran_app/core/api/end_ponits.dart';
import 'package:quran_app/core/cache/cache_helper.dart';
import 'package:quran_app/core/constants.dart';
import 'package:quran_app/core/errors/exceptions.dart';
import 'package:quran_app/core/utils/app_assets.dart';
import 'package:quran_app/core/utils/app_int.dart';
import 'package:quran_app/core/utils/app_strings.dart';
import 'package:quran_app/features/prayer/data/models/prayer_model.dart';
import 'package:quran_app/features/prayer/data/models/prayer_times_model.dart';
import 'package:quran_app/features/sepha/data/sepha_model.dart';
import 'package:quran_app/features/start/presentation/cubit/start_state.dart';

class StartCubit extends Cubit<StartState> {
  final ApiConsumer apiConsumer;
  StartCubit(this.apiConsumer) : super(StartInitial());

  PrayerTimesModel? prayerTimes;
  Position? position;
  String? currentLocation;

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    emit(ServiceLocationLoading());
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      emit(ServiceLocationDisabled(errorMessage: "تم تعطيل خدمات الموقع"));
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        emit(ServiceLocationDisabled(errorMessage: "تم رفض أذونات الموقع"));
      }
    }
    if (permission == LocationPermission.deniedForever) {
      emit(ServiceLocationDisabled(
          errorMessage:
              "تم رفض أذونات الموقع بشكل دائم، ولا يمكننا طلب الأذونات"));
    }
    position = await Geolocator.getCurrentPosition();
    await CacheHelper().saveData(key: AppStrings.started, value: true);
    await CacheHelper()
        .saveData(key: AppStrings.latitude, value: position!.latitude);
    await CacheHelper()
        .saveData(key: AppStrings.longitude, value: position!.longitude);
    await addSebhaItemsToHive();
    await getPrayersFromInternet();

    emit(ServiceLocationEnabled(position: position!));

    return position!;
  }

  Future<void> getPrayersFromInternet() async {
    double longitude = CacheHelper().getData(key: AppStrings.longitude);
    double latitude = CacheHelper().getData(key: AppStrings.latitude);
    try {
      final response = await apiConsumer.get(
          EndPoint.getPrayerTimeEndPoint(DateTime.now(), latitude, longitude));
      prayerTimes = PrayerTimesModel.fromJson(response['data']);
      cachingData(prayerTimes!);
      log("get Data From Internet");
    } on ServerException catch (e) {
      emit(ServiceLocationDisabled(errorMessage: e.toString()));
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

  addSebhaItemsToHive() async {
    for (var element in sebhaList) {
      await Hive.box<SebhaModel>(AppStrings.sebhaBox).add(element);
    }
  }
}
