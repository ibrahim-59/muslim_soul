import 'package:quran_app/features/azkar/data/models/azkar_model.dart';

class AzkarState {}

final class AzkarInitial extends AzkarState {}

final class UpdateCounter extends AzkarState {}

final class UpdateSize extends AzkarState {}

final class GetAzkarLoading extends AzkarState {}

final class GetAzkarFailure extends AzkarState {
  final String errorMEssage;

  GetAzkarFailure({required this.errorMEssage});
}

final class GetAzkarSuccess extends AzkarState {
  final List<AzkarModel> azkar;

  GetAzkarSuccess({required this.azkar});
}
