class MKategori {
  List<Data> data;

  MKategori({this.data});

  MKategori.fromJson(Map<String, dynamic> json) {
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
  String idkategori;
  String kategori;

  Data({this.idkategori, this.kategori});

  Data.fromJson(Map<String, dynamic> json) {
    idkategori = json['idkategori'];
    kategori = json['kategori'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idkategori'] = this.idkategori;
    data['kategori'] = this.kategori;
    return data;
  }
}
