class SurahState {}

final class SurahInitial extends SurahState {}

final class UpdateSura extends SurahState {
  final int ayahSize;
  final int transSize;
  final bool translation;
  final String sizeName;

  UpdateSura(
      {required this.ayahSize,
      required this.transSize,
      required this.translation,
      required this.sizeName});
}
