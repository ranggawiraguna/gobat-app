import 'package:flutter/material.dart';
import 'package:gobat_app/models/Article.dart';
import 'package:gobat_app/models/User.dart';
import 'package:gobat_app/services/GlobalValue.dart';
import 'package:gobat_app/widgets/DialogFilterArticle.dart';
import 'package:gobat_app/widgets/FlexSpace.dart';
import 'package:gobat_app/widgets/ListViewMainArticles.dart';
import 'package:gobat_app/widgets/TextFieldShadow.dart';
import 'package:provider/provider.dart';

class Articles extends StatefulWidget {
  @override
  _ArticlesState createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  final TextEditingController _searchArticleController =
      TextEditingController();

  late User user;
  late List<Article> articles;
  late List<Article> articlesFilter;
  List<String> sortCriterias = [
    "Judul Artikel",
    "Menaik",
  ];

  _showDialogFilterProduct() {
    showGeneralDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 300),
      barrierDismissible: true,
      barrierLabel: '',
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      },
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return DialogFilterArticle(
          sortCriteria: sortCriterias,
          onConfirmed: (String sort, String type) {
            setState(() {
              sortCriterias = [sort, type];
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    user = Provider.of<User>(context);
    articles = Provider.of<List<Article>>(context);

    articlesFilter = articles;
    if (articles.isNotEmpty) {
      if (sortCriterias[0] == "Judul Artikel" && sortCriterias[1] == 'Menaik') {
        articlesFilter.sort(
            (a, b) => a.information['title'].compareTo(b.information['title']));
      } else if (sortCriterias[0] == "Judul Artikel" &&
          sortCriterias[1] == 'Menurun') {
        articlesFilter.sort(
            (a, b) => b.information['title'].compareTo(a.information['title']));
      } else if (sortCriterias[0] == "Paling Banyak Dilihat" &&
          sortCriterias[1] == 'Menurun') {
        articlesFilter
            .sort((a, b) => b.counter['views']!.compareTo(a.counter['views']!));
      } else if (sortCriterias[0] == "Paling Banyak Dilihat" &&
          sortCriterias[1] == 'Menaik') {
        articlesFilter
            .sort((a, b) => a.counter['views']!.compareTo(b.counter['views']!));
      } else if (sortCriterias[0] == "Paling Banyak Disukai" &&
          sortCriterias[1] == 'Menurun') {
        articlesFilter.sort((a, b) =>
            b.counter['favorites']!.compareTo(a.counter['favorites']!));
      } else if (sortCriterias[0] == "Paling Banyak Disukai" &&
          sortCriterias[1] == 'Menaik') {
        articlesFilter.sort((a, b) =>
            a.counter['favorites']!.compareTo(b.counter['favorites']!));
      }
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
                      FlexSpace(60),
                      Flexible(
                        flex: 930,
                        child: Row(
                          children: [
                            Flexible(
                              flex: 800,
                              child: SizedBox(
                                  width: double.infinity,
                                  height: double.infinity,
                                  child: TextFieldShadow(
                                    labelText:
                                        "Ketik judul dari artikel yang ingin dicari",
                                    controller: _searchArticleController,
                                    borderSize: 10,
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: GlobalValue.getSizeConstraint(
                                            context, 34),
                                        horizontal:
                                            GlobalValue.getSizeConstraint(
                                                context, 30)),
                                    shadowBlur: 10,
                                    shadowSpread: 3,
                                    shadowColor: const Color(0x40000000),
                                    textFieldBackground: Colors.white,
                                    fontSize: 36,
                                  )),
                            ),
                            FlexSpace(30),
                            Flexible(
                              flex: 100,
                              child: Center(
                                child: AspectRatio(
                                  aspectRatio: 1 / 1,
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: double.infinity,
                                    child: IconButton(
                                      onPressed: () =>
                                          _showDialogFilterProduct(),
                                      padding: EdgeInsets.all(0),
                                      icon: Image.asset(
                                          "assets/Icon_FilterBox.png"),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      FlexSpace(60),
                    ],
                  ),
                ),
                ListViewMainArticles(context, user, articlesFilter, true),
                AspectRatio(aspectRatio: 1080 / 300),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
