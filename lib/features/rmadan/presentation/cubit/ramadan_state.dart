import 'package:quran_app/features/rmadan/data/ramadan_data_model.dart';

class RamadanState {}

final class RamadanInitial extends RamadanState {}

final class GetRamadanDataLoading extends RamadanState {}

final class GetRamadanDataSuccess extends RamadanState {
  final List<RamdanDataModel> dataList;

  GetRamadanDataSuccess({required this.dataList});
}

final class GetRamadanDataFailure extends RamadanState {
  final String errorMessage;

  GetRamadanDataFailure({required this.errorMessage});
}
