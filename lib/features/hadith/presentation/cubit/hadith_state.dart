import 'package:quran_app/features/hadith/data/arboon_model.dart';
import 'package:quran_app/features/hadith/data/hadith_model.dart';
import 'package:quran_app/features/hadith/data/hadith_type.dart';

class HadithState {}

final class HadithInitial extends HadithState {}

final class UpdateSize extends HadithState {}

final class GetAzkarLoading extends HadithState {}

final class GetAzkarSuccess extends HadithState {
  final List<HadithModel> hadithList;
  final HaditType haditType;

  GetAzkarSuccess({required this.haditType, required this.hadithList});
}

final class GetArboonSuccess extends HadithState {
  final List<ArboonModel> data;

  GetArboonSuccess({required this.data});
}

final class GetFailureFailure extends HadithState {
  final String errorMessage;

  GetFailureFailure({required this.errorMessage});
}
