import 'package:efood/constants.dart';
import 'package:efood/models/Category.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:async';

class DepanPage extends StatefulWidget {
  @override
  _DepanPageState createState() => _DepanPageState();
}

class _DepanPageState extends State<DepanPage> {
  List<Category> Categorylist = [];

  @override
  void initState() {
    super.initState();
    fetchCategory();
  }

  @override
  void dispose() {
    super.dispose();
    Categorylist = null;
  }

  Future<List<Category>> fetchCategory() async {
    List<Category> usersList;
    var params = "/Categorybyproduk";
    try {
      var jsonResponse = await http.get(Palette.sUrl + params);
      print(Palette.sUrl + params);
      print(jsonResponse.statusCode);
      print(jsonResponse.body);
      if (jsonResponse.statusCode == 200) {
        final jsonItems =
            json.decode(jsonResponse.body).cast<Map<String, dynamic>>();
        usersList = jsonItems.map<Category>((json) {
          return Category.fromJson(json);
        }).toList();

        setState(() {
          Categorylist = usersList;
        });
      }
    } catch (e) {
      usersList = Categorylist;
    }
    return usersList;
  }

  Future<Null> _refresh() {
    return fetchCategory().then((_Category) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  produkbyCategory(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget produkbyCategory() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          for (int i = 0; i < Categorylist.length; i++)
            WidgetbyCategory(
                Categorylist[i].id, Categorylist[i].nama.toString(), i),
        ],
      ),
    );
  }
}

class WidgetbyCategory extends StatefulWidget {
  final Widget child;
  final int id;
  final String Category;
  final int warna;

  WidgetbyCategory(this.id, this.Category, this.warna, {Key key, this.child})
      : super(key: key);
  _WidgetbyCategoryState createState() => _WidgetbyCategoryState();
}

class _WidgetbyCategoryState extends State<WidgetbyCategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Text(
                    widget.Category,
                    style: TextStyle(color: Colors.white),
                  ),
                  width: 200.0,
                  padding: EdgeInsets.only(
                      left: 10.0, right: 10.0, top: 2.0, bottom: 2.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0)),
                    color: Palette.colors[widget.warna],
                    boxShadow: [
                      BoxShadow(
                          color: Palette.colors[widget.warna], spreadRadius: 1),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute<Null>(
                    //     builder: (BuildContext context) {
                    //   return new ProdukPage(
                    //       "kat", widget.id, 0, widget.Category);
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
  }
}
