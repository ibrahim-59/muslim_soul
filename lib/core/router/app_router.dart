import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quran_app/core/api/dio_consumer.dart';
import 'package:quran_app/core/services/service_locator.dart';
import 'package:quran_app/core/utils/app_routes.dart';
import 'package:quran_app/features/azkar/presentation/cubit/azkar_cubit.dart';
import 'package:quran_app/features/azkar/presentation/views/azkar_details_view.dart';
import 'package:quran_app/features/azkar/presentation/views/azkar_view.dart';
import 'package:quran_app/features/do3a/presentation/cubit/doaa_cubit.dart';
import 'package:quran_app/features/do3a/presentation/views/doaa_view.dart';
import 'package:quran_app/features/hadith/data/hadith_type.dart';
import 'package:quran_app/features/hadith/presentation/cubit/hadith_cubit.dart';
import 'package:quran_app/features/hadith/presentation/views/hadith_view.dart';
import 'package:quran_app/features/home/data/adaya_type.dart';
import 'package:quran_app/features/home/data/ramadan_type.dart';
import 'package:quran_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:quran_app/features/home/presentation/view/about_app_view.dart';
import 'package:quran_app/features/home/presentation/view/home_view.dart';
import 'package:quran_app/features/prayer/presentation/cubit/prayers_cubit.dart';
import 'package:quran_app/features/prayer/presentation/view/prayer_view.dart';
import 'package:quran_app/features/quran/data/quran_model.dart';
import 'package:quran_app/features/quran/data/rectiters_model.dart';
import 'package:quran_app/features/quran/data/tafseer_view_model.dart';
import 'package:quran_app/features/quran/presentation/quran_cubit/quran_cubit.dart';
import 'package:quran_app/features/quran/presentation/surah_cubit/surah_cubit.dart';
import 'package:quran_app/features/quran/presentation/views/qari_surah_view.dart';
import 'package:quran_app/features/quran/presentation/views/qari_view.dart';
import 'package:quran_app/features/quran/presentation/views/quran_view.dart';
import 'package:quran_app/features/quran/presentation/views/search_view.dart';
import 'package:quran_app/features/quran/presentation/views/surah_view.dart';
import 'package:quran_app/features/quran/presentation/views/tafseer_view.dart';
import 'package:quran_app/features/radio/presentation/views/radio_view.dart';
import 'package:quran_app/features/rmadan/presentation/cubit/ramadan_cubit.dart';
import 'package:quran_app/features/rmadan/presentation/views/rmadan_view.dart';
import 'package:quran_app/features/sepha/cubit/sebha_cubit.dart';
import 'package:quran_app/features/sepha/data/sepha_model.dart';
import 'package:quran_app/features/sepha/presentation/views/sebha_items_view.dart';
import 'package:quran_app/features/sepha/presentation/views/tasbih_view.dart';
import 'package:quran_app/features/splash/presentation/views/splash_view.dart';
import 'package:quran_app/features/start/presentation/cubit/start_cubit.dart';
import 'package:quran_app/features/start/presentation/views/start_view.dart';

final GoRouter routes = GoRouter(routes: [
  GoRoute(
    path: "/",
    builder: (context, state) {
      return const SplashView();
    },
  ),
  GoRoute(
    path: AppRoutes.startView,
    pageBuilder: (context, state) {
      return customTransaction(
          state,
          BlocProvider(
              create: (context) => StartCubit(DioConsumer(dio: Dio())),
              child: const StartView()));
    },
  ),
  GoRoute(
    path: AppRoutes.aboutApp,
    pageBuilder: (context, state) {
      return customTransaction(state, const AboutAppView());
    },
  ),
  GoRoute(
    path: AppRoutes.hadithview,
    builder: (context, state) {
      return BlocProvider(
        create: (context) =>
            HadithCubit()..loadAzkarData(state.extra as HaditType),
        child: HadithView(haditType: state.extra as HaditType),
      );
    },
  ),
  GoRoute(
    path: AppRoutes.adayaView,
    pageBuilder: (context, state) {
      return customTransaction(
          state,
          BlocProvider(
            create: (context) =>
                DoaaCubit()..loadAdayaItem(state.extra as AdayaType),
            child: DoaaView(adayaType: state.extra as AdayaType),
          ));
    },
  ),
  GoRoute(
    path: AppRoutes.homeView,
    pageBuilder: (context, state) {
      return customTransaction(
          state,
          MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => HadithCubit(),
              ),
              BlocProvider(
                create: (context) => HomeCubit()..loadDailyContentData(),
              ),
            ],
            child: const HomeView(),
          ));
    },
  ),
  GoRoute(
    path: AppRoutes.searchView,
    pageBuilder: (context, state) {
      return customTransaction(
          state, SearchView(quranList: state.extra as List<QuranModel>));
    },
  ),
  GoRoute(
    path: AppRoutes.tasbihView,
    pageBuilder: (context, state) {
      return customTransaction(
          state,
          BlocProvider(
            create: (context) =>
                SebhaCubit()..getTotalCount(state.extra as SebhaModel),
            child: TasbihView(sebhaModel: state.extra as SebhaModel),
          ));
    },
  ),
  GoRoute(
    path: AppRoutes.sebhaItemsView,
    pageBuilder: (context, state) {
      return customTransaction(
          state,
          BlocProvider(
            create: (context) => SebhaCubit()..loadSebhaItemsFromHive(),
            child: const SebhaItemView(),
          ));
    },
  ),
  GoRoute(
    path: AppRoutes.ramadanView,
    pageBuilder: (context, state) {
      return customTransaction(
          state,
          BlocProvider(
            create: (context) =>
                RamadanCubit()..loadRamadanItem(state.extra as RmadanType),
            child: RamadanView(rmadanType: state.extra as RmadanType),
          ));
    },
  ),
  GoRoute(
    path: AppRoutes.qariView,
    pageBuilder: (context, state) {
      return customTransaction(
          state,
          BlocProvider(
            create: (context) => QuranCubit()..loadRectitersData(),
            child: const QariView(),
          ));
    },
  ),
  GoRoute(
    path: AppRoutes.qariSurahView,
    pageBuilder: (context, state) {
      return customTransaction(
          state,
          BlocProvider(
            create: (context) =>
                QuranCubit()..loadSurahsData(state.extra as RectitersModel),
            child: QariSuraView(rectitersModel: state.extra as RectitersModel),
          ));
    },
  ),
  GoRoute(
    path: AppRoutes.radioView,
    pageBuilder: (context, state) {
      return customTransaction(state, const RadioView());
    },
  ),
  GoRoute(
      path: AppRoutes.quranView,
      builder: (context, state) {
        return BlocProvider.value(
            value: getit<QuranCubit>(), child: const QuranView());
      }),
  GoRoute(
    path: AppRoutes.tafseerView,
    pageBuilder: (context, state) {
      return customTransaction(state,
          TafseerView(tafseerViewModel: state.extra as TafseerViewModel));
    },
  ),
  GoRoute(
      path: AppRoutes.surahView,
      builder: (context, state) {
        return BlocProvider.value(
          value: getit<SurahCubit>(),
          child: SurahView(quranModel: state.extra as QuranModel),
        );
      }),
  GoRoute(
    path: AppRoutes.prayerTimes,
    pageBuilder: (context, state) {
      return customTransaction(
          state,
          BlocProvider(
            create: (context) =>
                PrayersCubit(DioConsumer(dio: Dio()))..getPrayersTimes(),
            child: const PrayerView(),
          ));
    },
  ),
  GoRoute(
    path: AppRoutes.azkarview,
    pageBuilder: (context, state) {
      return customTransaction(
          state,
          BlocProvider(
            create: (context) => AzkarCubit()..loadAzkarData(),
            child: const AzkarView(),
          ));
    },
  ),
  GoRoute(
    path: AppRoutes.azkarDetailsView,
    pageBuilder: (context, state) {
      return customTransaction(
          state,
          BlocProvider.value(
            value: getit<AzkarCubit>(),
            child: AzkarDetailsView(
              azkarData: state.extra! as List<dynamic>,
            ),
          ));
    },
  ),
]);

CustomTransitionPage<dynamic> customTransaction(
    GoRouterState state, Widget child) {
  return CustomTransitionPage(
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return ScaleTransition(
        key: state.pageKey,
        scale: Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          ),
        ),
        child: child,
      );
    },
  );
}
