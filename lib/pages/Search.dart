import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gobat_app/models/Article.dart';
import 'package:gobat_app/models/Product.dart';
import 'package:gobat_app/models/User.dart';
import 'package:gobat_app/services/GlobalValue.dart';
import 'package:gobat_app/widgets/FlexSpace.dart';
import 'package:gobat_app/widgets/GridViewMainProducts.dart';
import 'package:gobat_app/widgets/ListViewMainArticles.dart';
import 'package:gobat_app/widgets/TextFieldShadow.dart';
import 'package:provider/provider.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _searchController = TextEditingController();

  String _textEditingValue = "";

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    List<Product> products = Provider.of<List<Product>>(context);
    List<Article> articles = Provider.of<List<Article>>(context);

    if (_textEditingValue.isNotEmpty) {
      products = products
          .where((element) => element.information['name']
              .toString()
              .toLowerCase()
              .contains(_textEditingValue.toLowerCase()))
          .toList();
      articles = articles
          .where((element) => element.information['title']
              .toString()
              .toLowerCase()
              .contains(_textEditingValue.toLowerCase()))
          .toList();
    } else {
      products = [];
      articles = [];
    }

    return Container(
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Stack(
          children: [
            Column(
              children: [
                AspectRatio(aspectRatio: 1080 / 50),
                AspectRatio(
                  aspectRatio: 1080 / 100,
                  child: Row(
                    children: [
                      FlexSpace(75),
                      Flexible(
                        flex: 930,
                        child: SizedBox(
                            width: double.infinity,
                            height: double.infinity,
                            child: TextFieldShadow(
                              labelText:
                                  "Ketik nama produk atau judul artikel yang ingin dicari",
                              controller: _searchController,
                              borderSize: 10,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: GlobalValue.getSizeConstraint(
                                      context, 34),
                                  horizontal: GlobalValue.getSizeConstraint(
                                      context, 30)),
                              shadowBlur: 10,
                              shadowSpread: 3,
                              shadowColor: const Color(0x40000000),
                              textFieldBackground: Colors.white,
                              fontSize: 36,
                              onChanged: (String value) {
                                setState(() {
                                  _textEditingValue = value;
                                });
                              },
                            )),
                      ),
                      FlexSpace(75),
                    ],
                  ),
                ),
                AspectRatio(aspectRatio: 1080 / 75),
                products.isNotEmpty || articles.isNotEmpty
                    ? Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: GlobalValue.getSizeConstraint(context, 75),
                              right: GlobalValue.getSizeConstraint(context, 75),
                            ),
                            child: SizedBox(
                              width: double.infinity,
                              child: Text(
                                "Produk Obat-Obatan",
                                textAlign: TextAlign.start,
                                maxLines: 1,
                                style: TextStyle(
                                  overflow: TextOverflow.clip,
                                  fontSize: GlobalValue.getSizeConstraint(
                                      context, 48),
                                  fontFamily: "Folks",
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          AspectRatio(aspectRatio: 1080 / 25),
                          products.isNotEmpty
                              ? GridViewMainProducts(context, user, products)
                              : Padding(
                                  padding: EdgeInsets.only(
                                    left: GlobalValue.getSizeConstraint(
                                        context, 75),
                                    right: GlobalValue.getSizeConstraint(
                                        context, 75),
                                  ),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: Text(
                                      "Produk tidak ditemukan.",
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      style: TextStyle(
                                        overflow: TextOverflow.clip,
                                        fontSize: GlobalValue.getSizeConstraint(
                                            context, 36),
                                        fontFamily: "Folks",
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                ),
                          AspectRatio(aspectRatio: 1080 / 75),
                          Padding(
                            padding: EdgeInsets.only(
                              left: GlobalValue.getSizeConstraint(context, 75),
                              right: GlobalValue.getSizeConstraint(context, 75),
                            ),
                            child: SizedBox(
                              width: double.infinity,
                              child: Text(
                                "Artikel Kesehatan",
                                textAlign: TextAlign.start,
                                maxLines: 1,
                                style: TextStyle(
                                  overflow: TextOverflow.clip,
                                  fontSize: GlobalValue.getSizeConstraint(
                                      context, 48),
                                  fontFamily: "Folks",
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          AspectRatio(aspectRatio: 1080 / 25),
                          articles.isNotEmpty
                              ? ListViewMainArticles(
                                  context, user, articles, true)
                              : Padding(
                                  padding: EdgeInsets.only(
                                    left: GlobalValue.getSizeConstraint(
                                        context, 75),
                                    right: GlobalValue.getSizeConstraint(
                                        context, 75),
                                  ),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: Text(
                                      "Artikel tidak ditemukan.",
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      style: TextStyle(
                                        overflow: TextOverflow.clip,
                                        fontSize: GlobalValue.getSizeConstraint(
                                            context, 36),
                                        fontFamily: "Folks",
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                ),
                        ],
                      )
                    : SizedBox.shrink(),
                AspectRatio(aspectRatio: 1080 / 300),
              ],
            ),
            products.isEmpty && articles.isEmpty
                ? SizedBox(
                    height: GlobalValue.getHeight(context) -
                        MediaQuery.of(context).padding.top -
                        60,
                    width: GlobalValue.getWidth(context),
                    child: Center(
                      child: Row(
                        children: [
                          FlexSpace(150),
                          Flexible(
                            flex: 780,
                            child: AspectRatio(
                              aspectRatio: 780 / 722,
                              child: SvgPicture.asset(
                                  "assets/Illustration_EmptySearch.svg"),
                            ),
                          ),
                          FlexSpace(150),
                        ],
                      ),
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
