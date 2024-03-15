class AzkarModel {
  String? name;
  List<Array>? array;

  AzkarModel({this.name, this.array});

  AzkarModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['array'] != null) {
      array = <Array>[];
      json['array'].forEach((v) {
        array!.add(Array.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    if (array != null) {
      data['array'] = array!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Array {
  String? category;
  String? count;
  String? description;
  String? reference;
  String? content;

  Array(
      {this.category,
      this.count,
      this.description,
      this.reference,
      this.content});

  Array.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    count = json['count'];
    description = json['description'];
    reference = json['reference'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category'] = category;
    data['count'] = count;
    data['description'] = description;
    data['reference'] = reference;
    data['content'] = content;
    return data;
  }
}
