// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:gobat_app/models/Article.dart';
import 'package:gobat_app/models/Product.dart';
import 'package:gobat_app/models/User.dart';
import 'package:gobat_app/widgets/GridViewProducts.dart';
import 'package:gobat_app/widgets/ListViewArticles.dart';
import 'package:gobat_app/widgets/SubProfileContainer.dart';
import 'package:provider/provider.dart';

class ActivityHistory extends StatefulWidget {
  @override
  _ActivityHistoryState createState() => _ActivityHistoryState();
}

class _ActivityHistoryState extends State<ActivityHistory> {
  String? _userId;
  int _indexTabSelected = 0;
  User? user;
  late List<Product> products;
  late List<Article> articles;

  @override
  void initState() {
    user = User.empty;
    articles = [];
    products = [];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    user = Provider.of<User?>(context);
    articles = Provider.of<List<Article>>(context);
    products = Provider.of<List<Product>>(context);

    return SubProfileContainer(
      context: context,
      userId: _userId,
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
            ? GridViewProducts(context, user ?? User.empty, products)
            : ListViewArticles(context, user ?? User.empty, articles),
      ),
      makeClearFocus: false,
    );
  }
}
