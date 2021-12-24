// ignore_for_file: unused_field

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gobat_app/models/Article.dart';
import 'package:gobat_app/models/User.dart';
import 'package:gobat_app/services/FirestoreService.dart';
import 'package:gobat_app/services/GlobalValue.dart';
import 'package:gobat_app/widgets/FlexSpace.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ArticleRead extends StatefulWidget {
  const ArticleRead({Key? key}) : super(key: key);

  @override
  _ArticleReadState createState() => _ArticleReadState();
}

class _ArticleReadState extends State<ArticleRead> {
  bool _isActiveFavorite = false, _doneInsertView = false;

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    Article article = Provider.of<Article>(context);

    if (user.id != "" && article.id != "") {
      if (!_doneInsertView) {
        setState(() => _doneInsertView = true);

        Map<String, List<String>> userViews =
            Map<String, List<String>>.from(user.views);
        if (userViews['articles']!.contains(article.id)) {
          userViews['articles']!
              .removeWhere((element) => element == article.id);
        } else {
          Map<String, int> counterArticle =
              Map<String, int>.from(article.counter);
          counterArticle['views'] = (counterArticle['views']! + 1);
          FirestoreService().updateArticle(
            articleId: article.id,
            newData: {"counter": counterArticle},
          );
        }
        userViews['articles']!.insert(0, article.id);
        FirestoreService().updateUser(
          userId: user.id,
          newData: {"views": userViews},
        );
      }

      setState(() {
        _isActiveFavorite = user.favorites['articles']!.contains(article.id);
      });
    }

    return SafeArea(
      child: Container(
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 0,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          body: Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: (MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top),
                child: Column(
                  children: [
                    AspectRatio(
                        aspectRatio: 1080 / 120,
                        child: Container(
                          color: Color(0xFF404040),
                          child: Row(
                            children: [
                              FlexSpace(40),
                              Flexible(
                                flex: 60,
                                child: Column(
                                  children: [
                                    FlexSpace(35),
                                    Flexible(
                                      flex: 50,
                                      child: Center(
                                        child: AspectRatio(
                                          aspectRatio: 1 / 1,
                                          child: ElevatedButton(
                                            child: SvgPicture.asset(
                                                "assets/Icon_ArrowBack.svg"),
                                            style: ElevatedButton.styleFrom(
                                              padding: EdgeInsets.all(0),
                                              primary: Colors.transparent,
                                              shadowColor: Colors.transparent,
                                            ),
                                            onPressed: () =>
                                                Navigator.of(context)
                                                    .pop(context),
                                          ),
                                        ),
                                      ),
                                    ),
                                    FlexSpace(35),
                                  ],
                                ),
                              ),
                              FlexSpace(50),
                              Flexible(
                                  flex: 780,
                                  child: Column(
                                    children: [
                                      FlexSpace(30),
                                      Flexible(
                                        flex: 60,
                                        child: Center(
                                          child: AutoSizeText(
                                            "Artikel Kesehatan",
                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                            minFontSize: 1,
                                            style: TextStyle(
                                              fontSize: 100,
                                              fontFamily: "Folks",
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      FlexSpace(30),
                                    ],
                                  )),
                              FlexSpace(150),
                            ],
                          ),
                        )),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: ClampingScrollPhysics(),
                        child: Column(
                          children: [
                            AspectRatio(aspectRatio: 1080 / 50),
                            Row(
                              children: [
                                FlexSpace(50),
                                Flexible(
                                    flex: 980,
                                    child: article.id != ""
                                        ? Image.network(article
                                            .information['image']
                                            .toString())
                                        : Container()),
                                FlexSpace(50),
                              ],
                            ),
                            AspectRatio(aspectRatio: 1080 / 20),
                            AspectRatio(
                              aspectRatio: 1080 / 60,
                              child: Row(
                                children: [
                                  AspectRatio(aspectRatio: 50 / 60),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        AspectRatio(aspectRatio: 50 / 60),
                                        AspectRatio(
                                          aspectRatio: 1 / 1,
                                          child: SvgPicture.asset(
                                              "assets/Icon_Eye.svg"),
                                        ),
                                        AspectRatio(aspectRatio: 5 / 45),
                                        Text(
                                          article.counter['views'].toString(),
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.clip,
                                          maxLines: 1,
                                          style: TextStyle(
                                            overflow: TextOverflow.clip,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.028,
                                            fontFamily: "Folks",
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        AspectRatio(aspectRatio: 25 / 45),
                                        AspectRatio(
                                          aspectRatio: 1 / 1,
                                          child: SvgPicture.asset(
                                              "assets/Icon_Love.svg"),
                                        ),
                                        Text(
                                          article.counter['favorites']
                                              .toString(),
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.clip,
                                          maxLines: 1,
                                          style: TextStyle(
                                            overflow: TextOverflow.clip,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.028,
                                            fontFamily: "Folks",
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        AspectRatio(aspectRatio: 50 / 45),
                                      ],
                                    ),
                                  ),
                                  AspectRatio(aspectRatio: 50 / 60),
                                ],
                              ),
                            ),
                            AspectRatio(aspectRatio: 1080 / 20),
                            Row(
                              children: [
                                FlexSpace(50),
                                Flexible(
                                    flex: 980,
                                    child: Stack(
                                      children: [
                                        Column(
                                          children: [
                                            AspectRatio(aspectRatio: 980 / 75),
                                            SizedBox(
                                              width: double.infinity,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFFFFFFF)
                                                      .withOpacity(1),
                                                  shape: BoxShape.rectangle,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color(0x26000000),
                                                      offset: Offset(
                                                          0,
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              (4 / 1080)),
                                                      blurRadius:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              (100 / 1080),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft: Radius.circular(
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            (100 / 1080)),
                                                    topRight: Radius.circular(
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            (100 / 1080)),
                                                  ),
                                                ),
                                                child: Row(
                                                  children: [
                                                    FlexSpace(50),
                                                    Flexible(
                                                        flex: 880,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            AspectRatio(
                                                                aspectRatio:
                                                                    880 / 50),
                                                            AspectRatio(
                                                              aspectRatio:
                                                                  880 / 100,
                                                              child: SizedBox(
                                                                width: double
                                                                    .infinity,
                                                                height: double
                                                                    .infinity,
                                                                child: Row(
                                                                  children: [
                                                                    AspectRatio(
                                                                      aspectRatio:
                                                                          1 / 1,
                                                                      child: Image
                                                                          .asset(
                                                                              "assets/Icon_ArticleNarasumber.png"),
                                                                    ),
                                                                    AspectRatio(
                                                                        aspectRatio:
                                                                            50 /
                                                                                100),
                                                                    Expanded(
                                                                      child:
                                                                          SizedBox(
                                                                        width: double
                                                                            .infinity,
                                                                        child:
                                                                            Text(
                                                                          "Sumber : " +
                                                                              (article.id != "" ? article.information["created_by"].toString() : ""),
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          maxLines:
                                                                              1,
                                                                          overflow:
                                                                              TextOverflow.clip,
                                                                          style: TextStyle(
                                                                              fontFamily: 'Folks',
                                                                              fontSize: GlobalValue.getSizeConstraint(context, 36)),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    AspectRatio(
                                                                        aspectRatio:
                                                                            200 /
                                                                                100)
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            AspectRatio(
                                                                aspectRatio:
                                                                    880 / 75),
                                                            Text(
                                                              (article.id != ""
                                                                  ? article
                                                                      .information[
                                                                          "title"]
                                                                      .toString()
                                                                  : ""),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      'Folks',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: GlobalValue
                                                                      .getSizeConstraint(
                                                                          context,
                                                                          54)),
                                                            ),
                                                            AspectRatio(
                                                                aspectRatio:
                                                                    880 / 15),
                                                            Text(
                                                              (article.id != ""
                                                                  ? DateFormat('dd-MM-yyyy - kk:mm WIB').format(DateTime.parse(article
                                                                      .information[
                                                                          "post_date"]
                                                                      .toDate()
                                                                      .toString()))
                                                                  : ""),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      'Folks',
                                                                  fontSize: GlobalValue
                                                                      .getSizeConstraint(
                                                                          context,
                                                                          36)),
                                                            ),
                                                            AspectRatio(
                                                                aspectRatio:
                                                                    880 / 50),
                                                            Text(
                                                              (article.id != ""
                                                                  ? article
                                                                      .information[
                                                                          "description"]
                                                                      .toString()
                                                                      .replaceAll(
                                                                          "/n",
                                                                          "\n")
                                                                  : ""),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      'Folks',
                                                                  fontSize: GlobalValue
                                                                      .getSizeConstraint(
                                                                          context,
                                                                          42)),
                                                            ),
                                                            AspectRatio(
                                                                aspectRatio:
                                                                    880 / 50),
                                                          ],
                                                        )),
                                                    FlexSpace(50),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Positioned(
                                          top: 0,
                                          right: GlobalValue.getSizeConstraint(
                                              context, 75),
                                          child: SizedBox(
                                            width:
                                                GlobalValue.getSizeConstraint(
                                                    context, 150),
                                            child: AspectRatio(
                                              aspectRatio: 1 / 1,
                                              child: SizedBox(
                                                width: double.infinity,
                                                height: double.infinity,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    shape: BoxShape.rectangle,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color:
                                                            Color(0x26000000),
                                                        offset: Offset(
                                                            0,
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                (4 / 1080)),
                                                        blurRadius:
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                (100 / 1080),
                                                      )
                                                    ],
                                                    borderRadius: BorderRadius
                                                        .all(Radius.circular(
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                (100 / 1080))),
                                                  ),
                                                  child: IconButton(
                                                    onPressed: () {
                                                      if (user.id != "" &&
                                                          article.id != "") {
                                                        Map<String,
                                                                List<String>>
                                                            userFavorites = Map<
                                                                    String,
                                                                    List<
                                                                        String>>.from(
                                                                user.favorites);
                                                        Map<String, int>
                                                            counterArticle =
                                                            Map<String,
                                                                    int>.from(
                                                                article
                                                                    .counter);
                                                        if (_isActiveFavorite) {
                                                          userFavorites[
                                                                  'articles']!
                                                              .removeWhere(
                                                                  (element) =>
                                                                      element ==
                                                                      article
                                                                          .id);
                                                          FirestoreService()
                                                              .updateUser(
                                                            userId: user.id,
                                                            newData: {
                                                              "favorites":
                                                                  userFavorites
                                                            },
                                                          );

                                                          counterArticle[
                                                                  'favorites'] =
                                                              (counterArticle[
                                                                      'favorites']! -
                                                                  1);
                                                          FirestoreService()
                                                              .updateArticle(
                                                            articleId:
                                                                article.id,
                                                            newData: {
                                                              "counter":
                                                                  counterArticle
                                                            },
                                                          );
                                                        } else {
                                                          userFavorites[
                                                                  'articles']!
                                                              .insert(0,
                                                                  article.id);
                                                          FirestoreService()
                                                              .updateUser(
                                                            userId: user.id,
                                                            newData: {
                                                              "favorites":
                                                                  userFavorites
                                                            },
                                                          );

                                                          counterArticle[
                                                                  'favorites'] =
                                                              (counterArticle[
                                                                      'favorites']! +
                                                                  1);
                                                          FirestoreService()
                                                              .updateArticle(
                                                            articleId:
                                                                article.id,
                                                            newData: {
                                                              "counter":
                                                                  counterArticle
                                                            },
                                                          );
                                                        }
                                                      }
                                                    },
                                                    padding: EdgeInsets.all(0),
                                                    splashRadius: 1,
                                                    icon: SvgPicture.asset(
                                                        _isActiveFavorite
                                                            ? "assets/Icon_ButtonLike_Active.svg"
                                                            : "assets/Icon_ButtonLike_Inactive.svg"),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    )),
                                FlexSpace(50),
                              ],
                            ),
                            AspectRatio(aspectRatio: 1080 / 50)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          backgroundColor: Color(0xFFF6F8FA),
        ),
      ),
    );
  }
}
