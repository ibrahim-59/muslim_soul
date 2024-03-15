import 'package:audioplayers/audioplayers.dart';
import 'package:get_it/get_it.dart';
import 'package:quran_app/core/cache/cache_helper.dart';
import 'package:quran_app/features/azkar/presentation/cubit/azkar_cubit.dart';
import 'package:quran_app/features/hadith/cubit/hadit_size_cubit.dart';
import 'package:quran_app/features/quran/presentation/quran_cubit/quran_cubit.dart';
import 'package:quran_app/features/quran/presentation/surah_cubit/surah_cubit.dart';
import 'package:quran_app/features/sepha/cubit/sebha_cubit.dart';

final getit = GetIt.instance;

void setupServiceLocator() {
  getit.registerSingleton<AudioPlayer>(AudioPlayer());
  getit.registerSingleton<CacheHelper>(CacheHelper());
  getit.registerSingleton<SebhaCubit>(SebhaCubit());
  getit.registerSingleton<QuranCubit>(QuranCubit());
  getit.registerSingleton<SurahCubit>(SurahCubit()).init();
  getit.registerSingleton<AzkarCubit>(AzkarCubit()).init();
  getit.registerSingleton<HaditSizeCubit>(HaditSizeCubit()).init();
}
