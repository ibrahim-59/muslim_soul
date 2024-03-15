import 'dart:developer';
import 'package:quran_app/core/services/local_notification_service.dart';
import 'package:quran_app/core/utils/app_strings.dart';
import 'package:workmanager/workmanager.dart';

class WorkManagerSevice {
  //! initialize workmanager service
  Future<void> init() async {
    await Workmanager().initialize(callbackDispatcher, isInDebugMode: false);
  }

  Future<void> registerMyTask({
    required String time,
    required String title,
    required String body,
    required String taskName,
    required int id,
  }) async {
    await Workmanager().registerPeriodicTask(
      id.toString(),
      taskName,
      inputData: {
        "id": id,
        "title": title,
        "time": time,
        "body": body,
      },
      frequency: const Duration(hours: 12),
    );
    log(taskName.toString());
  }

  void cancelTask(String uniqueName) {
    Workmanager().cancelByUniqueName(uniqueName);
  }
}

//! show notification
@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((taskName, inputData) async {
    switch (taskName) {
      case AppStrings.fajrkey:
        await LocalNotificationService.showDailySchduledNotification(
            inputData!['time'],
            inputData['title'],
            inputData['body'],
            inputData['id']);

      case AppStrings.zhrkey:
        await LocalNotificationService.showDailySchduledNotification(
            inputData!['time'],
            inputData['title'],
            inputData['body'],
            inputData['id']);

      case AppStrings.asrkey:
        await LocalNotificationService.showDailySchduledNotification(
            inputData!['time'],
            inputData['title'],
            inputData['body'],
            inputData['id']);

      case AppStrings.majribkey:
        await LocalNotificationService.showDailySchduledNotification(
            inputData!['time'],
            inputData['title'],
            inputData['body'],
            inputData['id']);

      case AppStrings.ishakey:
        await LocalNotificationService.showDailySchduledNotification(
            inputData!['time'],
            inputData['title'],
            inputData['body'],
            inputData['id']);
    }

    return Future.value(true);
  });
}
