import 'dart:convert';
import 'dart:math';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:quran_app/core/utils/app_assets.dart';
import 'package:quran_app/features/do3a/data/adaya_model.dart';
import 'package:quran_app/features/quran/data/quran_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/features/azkar/data/models/azkar_model.dart';
import 'package:quran_app/features/home/presentation/cubit/home_state.dart';
import 'package:flutter/services.dart' show rootBundle;

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  HijriCalendar today = HijriCalendar.now();
  DateTime day = DateTime.now();
  DateFormat dateFormat = DateFormat('EEE , d MMM yyyy');
  String? greating;

  Random random = Random();
  List<AzkarModel> azkar = [];
  List<QuranModel> quranItems = [];
  List<AdayaModel> adeyaList = [];

  loadAzkarData() async {
    final String response =
        await rootBundle.loadString('assets/data/azkar.json');
    final data = await json.decode(response);
    for (var i = 0; i < data.length; i++) {
      azkar.add(AzkarModel.fromJson(data[i]));
    }
  }

  loadDailyAyah() async {
    final String response = await rootBundle.loadString(Assets.assetsDataQuran);
    final data = await json.decode(response);
    for (var i = 0; i < data.length; i++) {
      quranItems.add(QuranModel.fromJson(data[i]));
    }
  }

  loadDailyDoaa() async {
    final String response = await rootBundle.loadString(Assets.assetsDataAdeya);
    final data = await json.decode(response);
    for (var i = 0; i < data.length; i++) {
      adeyaList.add(AdayaModel.fromJson(data[i]));
    }
  }

  loadDailyContentData() async {
    HijriCalendar.setLocal("ar");
    String date = dateFormat.format(day);
    try {
      emit(DailyContentLoading());
      await loadAzkarData();
      await loadDailyAyah();
      await loadDailyDoaa();
      int randomAzkarIndex = random.nextInt(azkar.length);
      AzkarModel randomAzkarModel = azkar[randomAzkarIndex];
      int randomZekrIndex = random.nextInt(randomAzkarModel.array!.length);
      var randomZekr = randomAzkarModel.array![randomZekrIndex];
      int randomSurahIndex = random.nextInt(quranItems.length);
      QuranModel randomQuranModel = quranItems[randomSurahIndex];
      int randomAyahIndex = random.nextInt(randomQuranModel.array!.length);
      var randomAyah = randomQuranModel.array![randomAyahIndex];
      int randomAdyaIndex = random.nextInt(adeyaList.length);
      AdayaModel randomDoaaModel = adeyaList[randomAdyaIndex];
      emit(DailyContentSuccess(
          zekrCount: randomZekr.count!,
          zekrContent: randomZekr.content!,
          surahName: randomQuranModel.name!,
          ayahName: randomAyah.ar!,
          ayahIndex: randomAyah.id!.toString(),
          adayaModel: randomDoaaModel,
          date: date));
    } catch (e) {
      emit(DailyContentFailure(errorMessage: e.toString()));
    }
  }

  updateGreeting() {
    final now = DateTime.now();
    final isMorning = now.hour < 12;
    greating = isMorning ? 'صبحكم الله بالخير' : 'مساكم الله بالخير';
  }
}
