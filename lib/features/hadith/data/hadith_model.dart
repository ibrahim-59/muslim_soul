class HadithModel {
  final int number;
  final String arab;
  final String id;

  HadithModel({required this.number, required this.arab, required this.id});
  factory HadithModel.fromJson(Map<String, dynamic> json) {
    return HadithModel(
        number: json['number'], arab: json['arab'], id: json['id']);
  }

  get hadith => null;
}
