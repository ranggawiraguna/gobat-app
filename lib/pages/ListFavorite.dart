// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:gobat_app/models/Article.dart';
import 'package:gobat_app/models/Product.dart';
import 'package:gobat_app/models/User.dart';
import 'package:gobat_app/services/AccountSessionManager.dart';
import 'package:gobat_app/services/FirestoreService.dart';
import 'package:gobat_app/widgets/SubProfileContainer.dart';
import 'package:provider/provider.dart';

class ListFavorite extends StatefulWidget {
  @override
  _ListFavoriteState createState() => _ListFavoriteState();
}

class _ListFavoriteState extends State<ListFavorite> {
  String? _userId;
  int _indexTabSelected = 0;

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
      child: SubProfileContainer(
        context: context,
        title: "Riwayat Aktivitas",
        withAppBar: true,
        indexTabSelected: _indexTabSelected,
        tabActions: <Function>[
          () => setState(() => _indexTabSelected = 0),
          () => setState(() => _indexTabSelected = 1),
        ],
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          child: (_indexTabSelected == 0)
              ? TabPage_Products()
              : TabPage_Articles(),
        ),
        makeClearFocus: false,
      ),
    );
  }
}

Container TabPage_Products() {
  return Container(
    key: ValueKey<int>(0),
    color: Colors.red,
    height: 1000,
  );
}

Container TabPage_Articles() {
  return Container(
    key: ValueKey<int>(1),
    color: Colors.blue,
    height: 1000,
  );
}
