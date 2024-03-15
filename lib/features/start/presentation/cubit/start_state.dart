import 'package:geolocator/geolocator.dart';

class StartState {}

final class StartInitial extends StartState {}

final class ServiceLocationEnabled extends StartState {
  final Position position;

  ServiceLocationEnabled({required this.position});
}

final class ServiceLocationLoading extends StartState {}

final class ServiceLocationDisabled extends StartState {
  final String errorMessage;

  ServiceLocationDisabled({required this.errorMessage});
}

final class PrayerTimesLoading extends StartState {}

final class PrayerTimesSuccess extends StartState {}

final class PrayerTimesFailure extends StartState {
  final String errorMessage;

  PrayerTimesFailure({required this.errorMessage});
}
