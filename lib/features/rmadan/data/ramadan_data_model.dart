class RamdanDataModel {
  String? number;
  String? text;
  String? label;

  RamdanDataModel({this.number, this.text, this.label});

  RamdanDataModel.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    text = json['text'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['number'] = number;
    data['text'] = text;
    data['label'] = label;
    return data;
  }
}
