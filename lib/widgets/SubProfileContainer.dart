// ignore_for_file: non_constant_identifier_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gobat_app/widgets/FlexSpace.dart';

GestureDetector SubProfileContainer({
  required BuildContext context,
  required String title,
  required Widget child,
  required bool makeClearFocus,
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
          body: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Stack(
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
                                            Navigator.of(context).pop(context),
                                      ),
                                    ),
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
                      Expanded(child: child),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
