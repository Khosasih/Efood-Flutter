class Kategori {
  List<Data> data;

  Kategori({this.data});

  Kategori.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String id;
  String kategori;

  Data({this.id, this.kategori});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['idkategori'];
    kategori = json['kategori'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idkategori'] = this.id;
    data['kategori'] = this.kategori;
    return data;
  }
}
