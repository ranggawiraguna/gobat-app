import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gobat_app/pages/Article.dart';
import 'package:gobat_app/pages/Consultation.dart';
import 'package:gobat_app/pages/Home.dart';
import 'package:gobat_app/pages/Profile.dart';
import 'package:gobat_app/pages/Search.dart';

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  final fragments = [Search(), Article(), Home(), Consultation(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 2,
        height: 60.0,
        items: <Widget>[
          Icon(Icons.search, size: 30, color: Colors.white),
          Icon(Icons.article, size: 30, color: Colors.white),
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.chat_bubble, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
        ],
        color: Colors.black,
        buttonBackgroundColor: Colors.black,
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: fragments[_page],
      backgroundColor: Colors.white,
    );
  }
}
