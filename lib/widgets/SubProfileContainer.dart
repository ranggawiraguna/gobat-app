// ignore_for_file: non_constant_identifier_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gobat_app/widgets/FlexSpace.dart';

GestureDetector SubProfileContainer({
  required BuildContext context,
  required String? userId,
  required String title,
  required Widget child,
  required bool makeClearFocus,
  required bool withAppBar,
  int? indexTabSelected,
  List<Function>? tabActions,
}) {
  Future.delayed(Duration(milliseconds: 1))
      .then((_) => SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
            statusBarColor: Color(0xFF404040),
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
          )));

  return GestureDetector(
    onTap: makeClearFocus
        ? () => FocusManager.instance.primaryFocus?.unfocus()
        : null,
    child: SafeArea(
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
                                            title,
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
                    withAppBar
                        ? Expanded(
                            child: Column(
                              children: [
                                AspectRatio(
                                  aspectRatio: 1080 / 120,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Color(0xFF404040),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0x33404040),
                                            blurRadius: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                (9 / 1080),
                                          ),
                                          BoxShadow(
                                              color: Color(0x66404040),
                                              blurRadius: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  (9 / 1080),
                                              offset: Offset(
                                                  0,
                                                  MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      (12 / 1080)))
                                        ]),
                                    child: Row(
                                      children: [
                                        Flexible(
                                          flex: 1,
                                          child: Column(
                                            children: [
                                              FlexSpace(20),
                                              Flexible(
                                                  flex: 72,
                                                  child: AspectRatio(
                                                    aspectRatio: 1 / 1,
                                                    child: ElevatedButton(
                                                      child: AnimatedSwitcher(
                                                        duration: Duration(
                                                            milliseconds: 500),
                                                        child: indexTabSelected !=
                                                                    null &&
                                                                indexTabSelected ==
                                                                    0
                                                            ? Icon(
                                                                Icons
                                                                    .medication,
                                                                color: Colors
                                                                    .white,
                                                                key: ValueKey<
                                                                    int>(0),
                                                              )
                                                            : Icon(
                                                                Icons
                                                                    .medication,
                                                                color: Color(
                                                                    0x32FFFFFF),
                                                                key: ValueKey<
                                                                    int>(1),
                                                              ),
                                                      ),
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        padding:
                                                            EdgeInsets.all(0),
                                                        primary:
                                                            Colors.transparent,
                                                        shadowColor:
                                                            Colors.transparent,
                                                      ),
                                                      onPressed: () {
                                                        if (tabActions != null)
                                                          tabActions[0]();
                                                      },
                                                    ),
                                                  )),
                                              FlexSpace(20),
                                              Flexible(
                                                flex: 8,
                                                child: AnimatedSwitcher(
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                  child: (indexTabSelected !=
                                                              null &&
                                                          indexTabSelected == 0)
                                                      ? Container(
                                                          key: ValueKey<int>(0),
                                                          color: Colors.white)
                                                      : Container(
                                                          key: ValueKey<int>(1),
                                                          color: Colors
                                                              .transparent),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Flexible(
                                          flex: 1,
                                          child: Column(
                                            children: [
                                              FlexSpace(20),
                                              Flexible(
                                                  flex: 72,
                                                  child: AspectRatio(
                                                    aspectRatio: 1 / 1,
                                                    child: ElevatedButton(
                                                      child: AnimatedSwitcher(
                                                        duration: Duration(
                                                            milliseconds: 500),
                                                        child: indexTabSelected !=
                                                                    null &&
                                                                indexTabSelected ==
                                                                    1
                                                            ? Icon(
                                                                Icons.article,
                                                                color: Colors
                                                                    .white,
                                                                key: ValueKey<
                                                                    int>(0),
                                                              )
                                                            : Icon(
                                                                Icons.article,
                                                                color: Color(
                                                                    0x32FFFFFF),
                                                                key: ValueKey<
                                                                    int>(1),
                                                              ),
                                                      ),
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        padding:
                                                            EdgeInsets.all(0),
                                                        primary:
                                                            Colors.transparent,
                                                        shadowColor:
                                                            Colors.transparent,
                                                      ),
                                                      onPressed: () {
                                                        if (tabActions != null)
                                                          tabActions[1]();
                                                      },
                                                    ),
                                                  )),
                                              FlexSpace(20),
                                              Flexible(
                                                flex: 8,
                                                child: AnimatedSwitcher(
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                  child: (indexTabSelected !=
                                                              null &&
                                                          indexTabSelected == 1)
                                                      ? Container(
                                                          key: ValueKey<int>(0),
                                                          color: Colors.white)
                                                      : Container(
                                                          key: ValueKey<int>(1),
                                                          color: Colors
                                                              .transparent),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: SizedBox(
                                      width: double.infinity,
                                      height: double.infinity,
                                      child: child),
                                )
                              ],
                            ),
                          )
                        : Expanded(
                            child: SingleChildScrollView(
                              physics: ClampingScrollPhysics(),
                              child: child,
                            ),
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
