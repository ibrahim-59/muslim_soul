class AdayaModel {
  final String text;

  AdayaModel({required this.text});

  factory AdayaModel.fromJson(Map<String, dynamic> json) {
    return AdayaModel(text: json['text']);
  }
}
