import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gobat_app/models/Product.dart';
import 'package:gobat_app/models/User.dart';
import 'package:gobat_app/models/Article.dart';
import 'package:gobat_app/pages/Reading.dart';
import 'package:gobat_app/pages/Consultation.dart';
import 'package:gobat_app/pages/Home.dart';
import 'package:gobat_app/pages/Profile.dart';
import 'package:gobat_app/pages/Search.dart';
import 'package:gobat_app/services/AccountSessionManager.dart';
import 'package:gobat_app/services/FirestoreService.dart';
import 'package:provider/provider.dart';

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  int _page = 2;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  String? _userId;

  @override
  void initState() {
    AccountSessionManager()
        .isUserLoggedIn()
        .then((value) => AccountSessionManager().getActiveUserId().then(
              (value) => setState(() => _userId = value),
            ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<User?>.value(
            value: FirestoreService().user(_userId ?? ""),
            initialData: User.empty),
        StreamProvider<List<Product>>.value(
            value: FirestoreService().products, initialData: []),
        StreamProvider<List<Article>>.value(
            value: FirestoreService().articles, initialData: []),
      ],
      child: Scaffold(
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
        body: getCurrentPage(_page),
        backgroundColor: Colors.white,
      ),
    );
  }

  Widget getCurrentPage(int pos) {
    switch (pos) {
      case 0:
        return Search();

      case 1:
        return Reading();

      case 2:
        return Home();

      case 3:
        return Consultation();

      case 4:
        return Profile();

      default:
        return Container();
    }
  }
}
