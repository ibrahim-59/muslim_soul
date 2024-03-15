import 'package:hive_flutter/hive_flutter.dart';
import 'package:quran_app/core/utils/app_strings.dart';
import 'package:quran_app/features/prayer/data/models/prayer_model.dart';
import 'package:quran_app/features/sepha/data/sepha_model.dart';

Future<void> setupHive() async {
  await Hive.initFlutter();
  await Hive.openBox("darkModeBox");
  Hive.registerAdapter(PrayerModelAdapter());
  await Hive.openBox<PrayerModel>(AppStrings.prayerBox);
  Hive.registerAdapter(SebhaModelAdapter());
  await Hive.openBox<SebhaModel>(AppStrings.sebhaBox);
}
