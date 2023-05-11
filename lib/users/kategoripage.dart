import 'dart:convert';
import 'package:efood/models/m_kategori.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';

class KategoriPage extends StatefulWidget {
  @override
  _KategoriPageState createState() => _KategoriPageState();
}

class _KategoriPageState extends State<KategoriPage> {
  Future<MKategori> fetchCategory() async {
    final response =
        await http.get(Uri.parse("${Palette.sUrl}kategoribyproduk"));
    if (response.statusCode == 200) {
      return MKategori.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: fetchCategory(),
          builder: (context, snapshot) {
            MKategori mKategori = snapshot.data;
            return snapshot.hasData
                ? ListView.builder(
                    itemCount: mKategori.data.length,
                    itemBuilder: (context, index) {
                      Data data = mKategori.data[index];
                      return Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(15)),
                        margin: EdgeInsets.only(
                            bottom: 5, top: 5, left: 10, right: 10),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Text(data.kategori),
                      );
                    },
                  )
                : Center(child: CircularProgressIndicator());
          }),
    );
  }
}
