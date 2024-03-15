class TafsearModel {
  String? number;
  String? aya;
  String? text;

  TafsearModel({this.number, this.aya, this.text});

  TafsearModel.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    aya = json['aya'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['number'] = number;
    data['aya'] = aya;
    data['text'] = text;
    return data;
  }
}
