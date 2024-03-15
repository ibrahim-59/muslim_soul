import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quran_app/core/cache/cache_helper.dart';
import 'package:quran_app/core/functions/setup_hive.dart';
import 'package:quran_app/core/router/app_router.dart';
import 'package:quran_app/core/services/local_notification_service.dart';
import 'package:quran_app/core/services/service_locator.dart';
import 'package:quran_app/core/services/work_manager_service.dart';
import 'package:quran_app/core/utils/app_style.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlutterNativeSplash.remove();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Future.wait([
    CacheHelper().init(),
    LocalNotificationService.init(),
    WorkManagerSevice().init(),
    setupHive(),
  ]);
  setupServiceLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box("darkModeBox").listenable(),
      builder: (BuildContext context, Box<dynamic> box, Widget? child) {
        Brightness defaultThemeMode = MediaQuery.of(context).platformBrightness;
        var darktheme = box.get("darkMode",
            defaultValue: defaultThemeMode == Brightness.dark ? true : false);
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: "روح المسلم",
          locale: const Locale("ar", "AR"),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: const [Locale("ar", "AR")],
          routerConfig: routes,
          theme: darktheme ? darkMode() : lightMode(),
        );
      },
    );
  }
}
