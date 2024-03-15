import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/features/notifications/cubit/notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());
  // sendPeriodicNotification() async {
  //   await Workmanager().registerPeriodicTask(
  //     id.toString(),
  //     taskName,
  //     inputData: {
  //       "id": id,
  //       "title": title,
  //       "body": body,
  //     },
  //     frequency: const Duration(minutes: 15),
  //   );
  // }
}
