import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final int page;

  Main({required this.page});

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  late int _page;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  String? _userId;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);

    _page = widget.page;

    AccountSessionManager()
        .isUserLoggedIn()
        .then((value) => AccountSessionManager().getActiveUserId().then(
              (value) => setState(() => _userId = value),
            ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 1)).then((_) =>
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarColor: _page == 4 ? Color(0xFF404040) : Color(0xFFFF9F9F9),
          statusBarIconBrightness:
              _page == 4 ? Brightness.light : Brightness.dark,
          statusBarBrightness: _page == 4 ? Brightness.light : Brightness.dark,
        )));

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
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 0,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          bottomNavigationBar: CurvedNavigationBar(
            key: _bottomNavigationKey,
            index: _page,
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
            backgroundColor: Color(0xFFF9F9F9),
            animationCurve: Curves.easeInOut,
            animationDuration: Duration(milliseconds: 500),
            onTap: (index) {
              setState(() {
                _page = index;
              });
            },
            letIndexChange: (index) => true,
          ),
          body: getCurrentPage(_page),
          backgroundColor: Color(0xFFF9F9F9),
        ),
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
