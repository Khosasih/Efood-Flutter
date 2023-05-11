class Category {
  final int id;
  final String nama;

  Category({this.id, this.nama});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(id: json['id'] as int, nama: json['nama'] as String);
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = id;
    map['nama'] = nama;
    return map;
  }
}
