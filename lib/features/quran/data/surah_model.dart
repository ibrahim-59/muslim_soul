class SurahModel {
  final String title;
  final String index;

  SurahModel({required this.title, required this.index});

  factory SurahModel.fromJson(Map<String, dynamic> json) {
    return SurahModel(title: json["titleAr"], index: json['index']);
  }
}
