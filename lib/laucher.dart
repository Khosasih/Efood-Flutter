import 'dart:async';

import 'package:efood/constants.dart';
import 'package:flutter/material.dart';
import 'package:efood/users/landingpage.dart' as users;

class LaucherPage extends StatefulWidget {
  @override
  _LaucherPageState createState() => _LaucherPageState();
}

class _LaucherPageState extends State<LaucherPage> {
  @override
  void initState() {
    super.initState();
    startLaunching();
  }

  @override
  void dispose() {
    super.dispose();
  }

  startLaunching() async {
    var duration = const Duration(seconds: 3);
    return new Timer(duration, () {
      Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (_) {
        return new users.LandingPage();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(0)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Palette.bg1, Palette.bg2])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
                child: Image.asset(
              "assets/Logo.png",
              height: 190.0,
              width: 190.0,
            )),
          ],
        ),
      ),
    );
  }
}
