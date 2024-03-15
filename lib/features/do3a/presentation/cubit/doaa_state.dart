import 'package:quran_app/features/do3a/data/adaya_model.dart';

class DoaaState {}

final class DoaaInitial extends DoaaState {}

final class GetAdayaLoding extends DoaaState {}

final class GetAdayaFailure extends DoaaState {
  final String errorMessage;

  GetAdayaFailure({required this.errorMessage});
}

final class GetAdayaSuccess extends DoaaState {
  final List<AdayaModel> dataList;

  GetAdayaSuccess({required this.dataList});
}
