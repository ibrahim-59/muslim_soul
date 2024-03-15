class ArboonModel {
  final String description;
  final String hadith;

  ArboonModel({required this.description, required this.hadith});
  factory ArboonModel.fromJson(Map<String, dynamic> json) {
    return ArboonModel(
        description: json['description'], hadith: json['hadith']);
  }
}
