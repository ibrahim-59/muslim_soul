class RectitersModel {
  int? id;
  String? name;
  String? letter;
  String? image;
  List<Moshaf>? moshaf;

  RectitersModel({this.id, this.name, this.letter, this.image, this.moshaf});

  RectitersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    letter = json['letter'];
    image = json['image'];
    if (json['moshaf'] != null) {
      moshaf = <Moshaf>[];
      json['moshaf'].forEach((v) {
        moshaf!.add(Moshaf.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['letter'] = letter;
    data['image'] = image;
    if (moshaf != null) {
      data['moshaf'] = moshaf!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Moshaf {
  int? id;
  String? name;
  String? server;
  int? surahTotal;
  int? moshafType;
  String? surahList;

  Moshaf(
      {this.id,
      this.name,
      this.server,
      this.surahTotal,
      this.moshafType,
      this.surahList});

  Moshaf.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    server = json['server'];
    surahTotal = json['surah_total'];
    moshafType = json['moshaf_type'];
    surahList = json['surah_list'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['server'] = server;
    data['surah_total'] = surahTotal;
    data['moshaf_type'] = moshafType;
    data['surah_list'] = surahList;
    return data;
  }
}
