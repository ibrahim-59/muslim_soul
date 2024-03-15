import 'package:quran_app/features/sepha/data/sepha_model.dart';

class SebhaState {}

final class SebhaInitial extends SebhaState {}

final class UpdateCounter extends SebhaState {}

final class UpdateData extends SebhaState {}

final class GetSebhaItemsLoading extends SebhaState {}

final class GetSebhaItemsSuccess extends SebhaState {
  final List<SebhaModel> sebhaList;

  GetSebhaItemsSuccess({required this.sebhaList});
}

final class GetSebhaItemsFailure extends SebhaState {
  final String errorMessage;

  GetSebhaItemsFailure({required this.errorMessage});
}
