import 'package:efood/constants.dart';
import 'package:efood/users/depan.dart';
import 'package:efood/users/depanpage.dart';
import 'package:efood/users/kategoripage.dart';
import 'package:flutter/material.dart';

class BerandaPage extends StatefulWidget {
  @override
  _BerandaPageState createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int _activetabIndex;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    _tabController.addListener(_setActiveTabIndex);
  }

  void _setActiveTabIndex() {
    _activetabIndex = _tabController.index;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onTap: () {},
          readOnly: true,
          style: TextStyle(fontSize: 15),
          decoration: InputDecoration(
              hintText: 'Search',
              prefixIcon: Icon(Icons.search, color: Palette.orange),
              contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.white),
              ),
              fillColor: Color(0xfff3f3f4),
              filled: true),
        ),
        backgroundColor: Palette.bg1,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Palette.orange,
          labelColor: Palette.orange,
          unselectedLabelColor: Colors.grey,
          labelPadding: EdgeInsets.all(0),
          tabs: [
            Tab(text: 'Beranda'),
            Tab(text: 'Kategori'),
          ],
        ),
      ),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: [
          DepanPage(),
          KategoriPage(),
        ],
      ),
    );
  }
}
