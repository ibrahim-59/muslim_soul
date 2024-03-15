class QuranModel {
  int? id;
  String? name;
  String? nameEn;
  String? nameTranslation;
  int? words;
  int? letters;
  String? type;
  String? typeEn;
  String? ar;
  String? en;
  List<Array>? array;

  QuranModel(
      {this.id,
      this.name,
      this.nameEn,
      this.nameTranslation,
      this.words,
      this.letters,
      this.type,
      this.typeEn,
      this.ar,
      this.en,
      this.array});

  QuranModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameEn = json['name_en'];
    nameTranslation = json['name_translation'];
    words = json['words'];
    letters = json['letters'];
    type = json['type'];
    typeEn = json['type_en'];
    ar = json['ar'];
    en = json['en'];
    if (json['array'] != null) {
      array = <Array>[];
      json['array'].forEach((v) {
        array!.add(Array.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['name_en'] = nameEn;
    data['name_translation'] = nameTranslation;
    data['words'] = words;
    data['letters'] = letters;
    data['type'] = type;
    data['type_en'] = typeEn;
    data['ar'] = ar;
    data['en'] = en;
    if (array != null) {
      data['array'] = array!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Array {
  int? id;
  String? ar;
  String? en;
  String? filename;
  String? path;
  String? dir;
  int? size;

  Array(
      {this.id,
      this.ar,
      this.en,
      this.filename,
      this.path,
      this.dir,
      this.size});

  Array.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ar = json['ar'];
    en = json['en'];
    filename = json['filename'];
    path = json['path'];
    dir = json['dir'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['ar'] = ar;
    data['en'] = en;
    data['filename'] = filename;
    data['path'] = path;
    data['dir'] = dir;
    data['size'] = size;
    return data;
  }
}
