// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gobat_app/pages/ArticleRead.dart';
import 'package:gobat_app/services/FirestoreService.dart';
import 'package:gobat_app/services/NavigatorServices.dart';
import 'package:intl/intl.dart';
import 'package:gobat_app/models/Article.dart';
import 'package:gobat_app/models/User.dart';
import 'package:gobat_app/widgets/FlexSpace.dart';
import 'package:provider/provider.dart';

ListView ListViewFavoriteArticles(
    BuildContext context, User user, List<Article> articles) {
  double fullWidth = MediaQuery.of(context).size.width;
  List<double> padding = [fullWidth * 0.0463, fullWidth * 0.02315];

  try {
    return ListView.builder(
        key: ValueKey<int>(1),
        itemCount: user.favorites["articles"]!.length,
        itemBuilder: (context, index) {
          Article article = (articles.firstWhere((element) =>
              element.id.contains(user.favorites["articles"]![index])));

          return Padding(
            padding: EdgeInsets.only(
              top: (index == 0) ? padding[0] : padding[1],
              left: padding[0],
              right: padding[0],
              bottom: (index == (user.favorites["articles"]!.length - 1))
                  ? padding[0]
                  : padding[1],
            ),
            child: AspectRatio(
              aspectRatio: 980 / 300,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    NavigatorScale(
                      child: MultiProvider(providers: [
                        StreamProvider<User?>.value(
                            value: FirestoreService().user(user.id),
                            initialData: User.empty),
                        StreamProvider<Article>.value(
                            value: FirestoreService().article(article.id),
                            initialData: Article.empty),
                      ], child: ArticleRead()),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(0),
                  elevation: 0,
                  primary: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                child: Card(
                  elevation: fullWidth * 0.02,
                  clipBehavior: Clip.hardEdge,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(fullWidth * 0.0185)),
                  child: Row(
                    children: [
                      AspectRatio(
                        aspectRatio: 1 / 1,
                        child: Container(
                          clipBehavior: Clip.hardEdge,
                          margin: EdgeInsets.all(fullWidth * 0.015),
                          decoration: BoxDecoration(
                              color: Color(0xFFF2F2F2),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(fullWidth * (10 / 1080)))),
                          child: article.id != ""
                              ? FittedBox(
                                  fit: BoxFit.cover,
                                  child: Image(
                                    image: NetworkImage(
                                      article.information["image"],
                                    ),
                                  ),
                                )
                              : Container(),
                        ),
                      ),
                      AspectRatio(aspectRatio: 15 / 258),
                      Expanded(
                          child: Container(
                        child: Column(
                          children: [
                            Flexible(
                                flex: 188,
                                child: Container(
                                  child: Row(
                                    children: [
                                      Flexible(
                                          flex: 607,
                                          child: Container(
                                            child: Column(
                                              children: [
                                                FlexSpace(25),
                                                Flexible(
                                                  flex: 44,
                                                  child: SizedBox(
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    child: Text(
                                                      article
                                                          .information["title"],
                                                      overflow:
                                                          TextOverflow.clip,
                                                      textAlign:
                                                          TextAlign.start,
                                                      maxLines: 1,
                                                      style: TextStyle(
                                                        overflow:
                                                            TextOverflow.clip,
                                                        fontSize: fullWidth *
                                                            (36 / 1080),
                                                        fontFamily: "Folks",
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                FlexSpace(5),
                                                Flexible(
                                                  flex: 144,
                                                  child: SizedBox(
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    child: Text(
                                                      article.information[
                                                          "description"],
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign:
                                                          TextAlign.start,
                                                      maxLines: 3,
                                                      style: TextStyle(
                                                        overflow:
                                                            TextOverflow.clip,
                                                        fontSize: fullWidth *
                                                            (32 / 1080),
                                                        fontFamily: "Folks",
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )),
                                      FlexSpace(15),
                                      Flexible(
                                          flex: 80,
                                          child: Container(
                                            child: Column(children: [
                                              AspectRatio(
                                                aspectRatio: 1 / 1,
                                                child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    padding: EdgeInsets.all(0),
                                                    primary: Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent,
                                                  ),
                                                  child: SvgPicture.asset(
                                                      "assets/Icon_TrashDeleteItem2.svg"),
                                                  onPressed: () {
                                                    user.favorites["articles"]!
                                                        .removeAt(index);
                                                    FirestoreService()
                                                        .updateUser(
                                                            userId: user.id,
                                                            newData: {
                                                          "favorites":
                                                              user.favorites
                                                        });

                                                    article.counter[
                                                            'favorites'] =
                                                        article.counter[
                                                                'favorites']! -
                                                            1;
                                                    FirestoreService()
                                                        .updateArticle(
                                                            articleId:
                                                                article.id,
                                                            newData: {
                                                          "counter":
                                                              article.counter
                                                        });
                                                  },
                                                ),
                                              )
                                            ]),
                                          )),
                                    ],
                                  ),
                                )),
                            FlexSpace(10),
                            Flexible(
                                flex: 35,
                                child: Row(
                                  children: [
                                    Center(
                                      child: Text(
                                        DateFormat('dd-MM-yyyy ??? kk:mm WIB')
                                            .format(DateTime.parse(article
                                                .information["post_date"]
                                                .toDate()
                                                .toString())),
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: fullWidth * (28 / 1080),
                                          fontFamily: "Folks",
                                          color: Color(0xFF888888),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        child: Wrap(
                                      alignment: WrapAlignment.end,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: fullWidth * 0.005,
                                                  horizontal: fullWidth * 0.01),
                                              decoration: BoxDecoration(
                                                  color: Color(0x4D000000),
                                                  shape: BoxShape.rectangle,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              fullWidth *
                                                                  (5 / 1080)))),
                                              margin: EdgeInsets.only(
                                                bottom: fullWidth * (20 / 1080),
                                                right: fullWidth * (20 / 1080),
                                              ),
                                              child: Wrap(
                                                crossAxisAlignment:
                                                    WrapCrossAlignment.center,
                                                spacing: fullWidth * 0.01,
                                                children: [
                                                  Text(
                                                    article.counter["views"]
                                                        .toString(),
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                      fontSize: fullWidth *
                                                          (28 / 1080),
                                                      fontFamily: "Folks",
                                                      color: Color(0xFFFFFFFF),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      height: fullWidth *
                                                          (16 / 1080),
                                                      width: fullWidth *
                                                          (28.57 / 1080),
                                                      child: SvgPicture.asset(
                                                          "assets/Icon_EyeView.svg")),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: fullWidth * 0.005,
                                                  horizontal: fullWidth * 0.01),
                                              decoration: BoxDecoration(
                                                  color: Color(0x4D000000),
                                                  shape: BoxShape.rectangle,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              fullWidth *
                                                                  (5 / 1080)))),
                                              margin: EdgeInsets.only(
                                                bottom: fullWidth * (20 / 1080),
                                                right: fullWidth * (20 / 1080),
                                              ),
                                              child: Wrap(
                                                crossAxisAlignment:
                                                    WrapCrossAlignment.center,
                                                spacing: fullWidth * 0.01,
                                                children: [
                                                  Text(
                                                    article.counter["favorites"]
                                                        .toString(),
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                      fontSize: fullWidth *
                                                          (28 / 1080),
                                                      fontFamily: "Folks",
                                                      color: Color(0xFFFFFFFF),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      height: fullWidth *
                                                          (22 / 1080),
                                                      width: fullWidth *
                                                          (23.98 / 1080),
                                                      child: SvgPicture.asset(
                                                          "assets/Icon_FavItem.svg")),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ))
                                  ],
                                )),
                            FlexSpace(25),
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  } catch (e) {
    return ListView.builder(
        itemCount: 0, itemBuilder: (context, index) => Container());
  }
}
