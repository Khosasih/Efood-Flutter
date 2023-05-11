import 'dart:convert';
import 'package:efood/models/m_kategori.dart';
import 'package:efood/users/depanpage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';

class FrontPage extends StatefulWidget {
  // final Widget child;
  // final int id;
  // final String kategori;
  // final int warna;

  // // const FrontPage({
  // //   Key key,
  // //   this.id,
  // //   this.kategori,
  // //   this.warna,
  // //   this.child,
  // // }) : super(key: key);
  @override
  _FrontPageState createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  Future<MKategori> fetchKategori() async {
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
          future: fetchKategori(),
          builder: (context, snapshot) {
            MKategori mKategori = snapshot.data;
            return snapshot.hasData
                ? ListView.builder(
                    itemCount: mKategori.data.length,
                    itemBuilder: (context, index) {
                      Data data = mKategori.data[index];
                      return Container(
                        // child: Text(data.kategori),
                        margin: EdgeInsets.only(bottom: 20.0),
                        padding: EdgeInsets.only(right: 10.0),
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                              padding: EdgeInsets.only(right: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      data.kategori,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    width: 200.0,
                                    padding: EdgeInsets.only(
                                        left: 10.0,
                                        right: 10.0,
                                        top: 2.0,
                                        bottom: 2.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10.0),
                                          bottomRight: Radius.circular(10.0)),
                                      // color: Palette.colors[widget.warna],
                                      color: Palette.bg1,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Palette.orange,
                                            spreadRadius: 1),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      // Navigator.of(context).push(MaterialPageRoute<Null>(
                                      //     builder: (BuildContext context) {
                                      //   return new ProdukPage(
                                      //       "kat", widget.id, 0, widget.kategori);
                                      // }));
                                    },
                                    child: Text('Selengkapnya',
                                        style: TextStyle(color: Colors.blue)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  )
                : Center(child: CircularProgressIndicator());
          }),
    );
  }
}
