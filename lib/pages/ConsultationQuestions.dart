// ignore_for_file: non_constant_identifier_names, unused_element

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gobat_app/models/Product.dart';
import 'package:gobat_app/models/User.dart';
import 'package:gobat_app/pages/ConsultationResult.dart';
import 'package:gobat_app/services/FirestoreService.dart';
import 'package:gobat_app/services/GlobalValue.dart';
import 'package:gobat_app/services/NavigatorServices.dart';
import 'package:gobat_app/widgets/DialogConsultationError.dart';
import 'package:gobat_app/widgets/FlexButton.dart';
import 'package:gobat_app/widgets/FlexSpace.dart';
import 'package:gobat_app/widgets/SubProfileContainer.dart';
import 'package:provider/provider.dart';

class ConsultationQuestions extends StatefulWidget {
  @override
  _ConsultationQuestionsState createState() => _ConsultationQuestionsState();
}

class _ConsultationQuestionsState extends State<ConsultationQuestions> {
  final List<List<String>> contents = [
    [
      "Apakah Anda Mengalami\nGejala Sakit Kepala ?\n",
      "assets/Illustration_Gejala_1.png",
    ],
    [
      "Apakah Anda Mengalami\nGejala Mengeluarkan Cairan\ndi Hidung ?",
      "assets/Illustration_Gejala_2.png",
    ],
    [
      "Apakah Anda Mengalami\nGejala Batuk ?\n",
      "assets/Illustration_Gejala_3.png",
    ],
    [
      "Apakah Anda Mengalami\nGejala Sulit Menelan ?\n",
      "assets/Illustration_Gejala_4.png",
    ],
    [
      "Apakah Anda Mengalami\nGejala Mengeluarkan Cairan\nLendiri dari Mulut ?",
      "assets/Illustration_Gejala_5.png",
    ],
    [
      "Apakah Anda Mengalami\nGejala Muncul Bintik\nGatal pada Kulit ?",
      "assets/Illustration_Gejala_6.png",
    ],
    [
      "Apakah Anda Mengalami\nGejala Suhu Badan Naik ?\n",
      "assets/Illustration_Gejala_7.png",
    ],
    [
      "Apakah Anda Mengalami\nGejala Gatal pada\nTenggorkan ?",
      "assets/Illustration_Gejala_8.png",
    ],
    [
      "Apakah Anda Mengalami\nGejala Hidung\nTersumbat ?",
      "assets/Illustration_Gejala_9.png",
    ],
    [
      "Apakah Anda Mengalami\nGejala Kelelahan ?\n",
      "assets/Illustration_Gejala_10.png",
    ],
    [
      "Apakah Anda Mengalami\nGejala Sakit Perut ?\n",
      "assets/Illustration_Gejala_11.png",
    ],
    [
      "Apakah Anda Mengalami\nGejala Hilang\nKeseimbangan ?",
      "assets/Illustration_Gejala_12.png",
    ],
    [
      "Apakah Anda Mengalami\nGejala Berat Badan\nTurun ?",
      "assets/Illustration_Gejala_13.png",
    ],
    [
      "Apakah Anda Mengalami\nGejala Bersin-Bersin\nPada Hidung ?",
      "assets/Illustration_Gejala_14.png",
    ],
    [
      "Apakah Anda Mengalami\nGejala Terasa Pegal\ndibagian Badan ?",
      "assets/Illustration_Gejala_15.png",
    ],
    [
      "Apakah Anda Mengalami\nGejala Nyeri di Bagian\nBadan Tertentu ?",
      "assets/Illustration_Gejala_16.png",
    ],
    [
      "Apakah Anda Mengalami\nGejala Mual ?\n",
      "assets/Illustration_Gejala_17.png",
    ],
    [
      "Apakah Anda Mengalami\nGejala Sesak Nafas ?\n",
      "assets/Illustration_Gejala_18.png",
    ],
    [
      "Apakah Anda Mengalami\nGejala Sering Buang Air ?\n",
      "assets/Illustration_Gejala_20.png",
    ],
    [
      "Apakah Anda Mengalami\nGejala Lemas pada\nBadan ?",
      "assets/Illustration_Gejala_20.png",
    ],
  ];

  late Map<int, dynamic> questionTree;
  late Iterator questionIterator;

  @override
  void initState() {
    questionTree = {
      1: {
        2: {
          7: {14: "P1"}
        },
        12: "P2",
        6: {7: "P5"},
        10: {
          13: {20: "P7"}
        },
      },
      2: {
        7: {14: "P1"},
        9: {14: "P1"}
      },
      3: {
        5: {
          8: {18: "P3"}
        },
        4: {8: "P1"}
      },
      11: {
        13: {17: "P8"},
        19: "P9"
      },
      15: {16: "P6"},
    };
    questionIterator = questionTree.keys.toList().iterator;
    questionIterator.moveNext();

    super.initState();
  }

  _changeQuestionTree(User user) {
    if (questionTree[questionIterator.current] is String) {
      Navigator.of(context).pushReplacement(NavigatorFade(
        child: MultiProvider(
            providers: [
              StreamProvider<User?>.value(
                  value: FirestoreService().user(user.id),
                  initialData: User.empty),
              StreamProvider<List<Product>>.value(
                  value: FirestoreService().products, initialData: []),
            ],
            child: ConsultationResult(
                resultCode: questionTree[questionIterator.current].toString())),
      ));
    } else {
      setState(() {
        questionTree = questionTree[questionIterator.current];
        questionIterator = questionTree.keys.toList().iterator;
      });
      questionIterator.moveNext();
    }
  }

  _nextQuestionTree(User user) {
    if (questionIterator.moveNext()) {
      setState(() {});
    } else {
      showGeneralDialog(
        context: context,
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: const Duration(milliseconds: 300),
        barrierDismissible: false,
        barrierLabel: '',
        transitionBuilder: (context, animation, secondaryAnimation, child) {
          return ScaleTransition(
            scale: animation,
            child: child,
          );
        },
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return DialogConsultationError(userId: user.id);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);

    return SubProfileContainer(
      context: context,
      userId: null,
      title: "Konsultasi",
      withAppBar: false,
      child: AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: (MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top) -
                GlobalValue.getSizeConstraint(context, 120),
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(scale: animation, child: child);
              },
              child: Container(
                key: ValueKey<int>(questionIterator.current),
                color: Color(0xFFF6F8FA),
                child: Center(
                  child: AspectRatio(
                    aspectRatio: 1080 / 1390,
                    child: Row(
                      children: [
                        FlexSpace(50),
                        Flexible(
                            flex: 980,
                            child: SizedBox(
                              width: double.infinity,
                              height: double.infinity,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: AspectRatio(
                                      aspectRatio: 980 / 1322,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.rectangle,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                  MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      (50 / 1080))),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black
                                                  .withOpacity(0.15),
                                              blurRadius:
                                                  (MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      (50 / 1080)),
                                              offset: Offset(
                                                  0,
                                                  GlobalValue.getSizeConstraint(
                                                      context,
                                                      4)), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: SizedBox(
                                          width: double.infinity,
                                          height: double.infinity,
                                          child: Column(
                                            children: [
                                              FlexSpace(75),
                                              Flexible(
                                                flex: 88,
                                                child: Row(
                                                  children: [
                                                    FlexSpace(110),
                                                    Flexible(
                                                      flex: 760,
                                                      child: SizedBox(
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        child: AutoSizeText(
                                                          "Gejala",
                                                          textAlign:
                                                              TextAlign.center,
                                                          maxLines: 1,
                                                          minFontSize: 1,
                                                          style: TextStyle(
                                                            overflow:
                                                                TextOverflow
                                                                    .clip,
                                                            fontSize: 100,
                                                            fontFamily: "Folks",
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    FlexSpace(110),
                                                  ],
                                                ),
                                              ),
                                              FlexSpace(150),
                                              Flexible(
                                                  flex: 454,
                                                  child: Center(
                                                    child: Image.asset(contents[
                                                        questionIterator
                                                                .current -
                                                            1][1]),
                                                  )),
                                              FlexSpace(150),
                                              Flexible(
                                                flex: 187,
                                                child: Row(
                                                  children: [
                                                    FlexSpace(110),
                                                    Flexible(
                                                      flex: 760,
                                                      child: SizedBox(
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        child: AutoSizeText(
                                                          contents[
                                                              questionIterator
                                                                      .current -
                                                                  1][0],
                                                          textAlign:
                                                              TextAlign.center,
                                                          maxLines: 3,
                                                          minFontSize: 1,
                                                          style: TextStyle(
                                                            overflow:
                                                                TextOverflow
                                                                    .clip,
                                                            fontSize: 100,
                                                            fontFamily: "Folks",
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    FlexSpace(110),
                                                  ],
                                                ),
                                              ),
                                              FlexSpace(218),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: AspectRatio(
                                      aspectRatio: 980 / 136,
                                      child: Row(
                                        children: [
                                          FlexSpace(60),
                                          FlexButton(
                                              flexButton: 380,
                                              innerSpaceVertical: 30,
                                              innerSpaceHorizontal: 104,
                                              flexTextVertical: 76,
                                              flexTextHorizontal: 173,
                                              textContent: "Benar",
                                              textColor: Colors.white,
                                              buttonColor: Color(0xFFFF583C),
                                              buttonRadius:
                                                  MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      (20 / 1080),
                                              action: () {
                                                _changeQuestionTree(user);
                                              }),
                                          FlexSpace(50),
                                          FlexButton(
                                              flexButton: 380,
                                              innerSpaceVertical: 30,
                                              innerSpaceHorizontal: 101,
                                              flexTextVertical: 76,
                                              flexTextHorizontal: 159,
                                              textContent: "Tidak",
                                              textColor: Colors.white,
                                              buttonColor: Color(0xFFFF583C),
                                              buttonRadius:
                                                  MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      (20 / 1080),
                                              action: () {
                                                _nextQuestionTree(user);
                                              }),
                                          FlexSpace(60),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )),
                        FlexSpace(50),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )),
      makeClearFocus: false,
    );
  }
}
