// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:gobat_app/models/Article.dart';
import 'package:gobat_app/models/Product.dart';
import 'package:gobat_app/models/User.dart';
import 'package:gobat_app/pages/Main.dart';
import 'package:gobat_app/services/NavigatorServices.dart';
import 'package:gobat_app/widgets/GridViewFavoriteProducts.dart';
import 'package:gobat_app/widgets/ListViewFavoriteArticles.dart';
import 'package:gobat_app/widgets/ProfileIllustrationEmpty.dart';
import 'package:gobat_app/widgets/SubProfileContainer.dart';
import 'package:provider/provider.dart';

class ListFavorite extends StatefulWidget {
  @override
  _ListFavoriteState createState() => _ListFavoriteState();
}

class _ListFavoriteState extends State<ListFavorite> {
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
    user = Provider.of<User?>(context) ?? User.empty;
    articles = Provider.of<List<Article>>(context);
    products = Provider.of<List<Product>>(context);

    return SubProfileContainer(
      context: context,
      userId: user!.id,
      title: "Daftar Favorit",
      withAppBar: true,
      indexTabSelected: _indexTabSelected,
      tabActions: <Function>[
        () => setState(() => _indexTabSelected = 0),
        () => setState(() => _indexTabSelected = 1),
      ],
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 500),
        child: (_indexTabSelected == 0)
            ? ((user!.favorites["products"]!.length != 0)
                ? GridViewFavoriteProducts(
                    context, user ?? User.empty, products)
                : ProfileIllustrationEmpty(
                    context,
                    -1,
                    "assets/Illustration_EmptyFavoriteProduct.svg",
                    150,
                    462,
                    "Lihat Obat-Obatan",
                    () {
                      Navigator.of(context).push(NavigatorSlide(
                          child: Main(page: 2), direction: AxisDirection.up));
                    },
                  ))
            : ((user!.favorites["articles"]!.length != 0)
                ? ListViewFavoriteArticles(
                    context, user ?? User.empty, articles)
                : ProfileIllustrationEmpty(
                    context,
                    -2,
                    "assets/Illustration_EmptyFavoriteArticle.svg",
                    235,
                    292,
                    "Lihat Artikel",
                    () {
                      Navigator.of(context).push(NavigatorSlide(
                          child: Main(page: 1), direction: AxisDirection.up));
                    },
                  )),
      ),
      makeClearFocus: false,
    );
  }
}
