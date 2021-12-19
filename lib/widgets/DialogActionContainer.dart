// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gobat_app/widgets/FlexSpace.dart';

SizedBox DialogActionContainer(
    {required BuildContext context,
    required int height,
    required String pathFrame,
    required Column child,
    required Function() closeAction,
    required int key}) {
  return SizedBox(
    key: ValueKey<int>(key),
    width: MediaQuery.of(context).size.width,
    height: (MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top),
    child: Row(
      children: [
        FlexSpace(25),
        Flexible(
            flex: 1030,
            child: AspectRatio(
              aspectRatio: 1030 / height,
              child: Stack(
                children: [
                  Row(children: [
                    FlexSpace(50),
                    Flexible(
                        flex: 930,
                        child: Column(children: [
                          FlexSpace(50),
                          Flexible(
                            flex: height,
                            child: SizedBox(
                              width: double.infinity,
                              height: double.infinity,
                              child: Stack(
                                children: [
                                  SvgPicture.asset(pathFrame),
                                  SizedBox(
                                    width: double.infinity,
                                    height: double.infinity,
                                    child: Container(child: child),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          FlexSpace(50),
                        ])),
                    FlexSpace(50),
                  ]),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FlexSpace(930),
                            Flexible(
                              flex: 100,
                              child: AspectRatio(
                                  aspectRatio: 1 / 1,
                                  child: ElevatedButton(
                                    child: SvgPicture.asset(
                                        "assets/Icon_CloseDialog.svg"),
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.transparent,
                                      shadowColor: Colors.transparent,
                                      padding: EdgeInsets.all(0),
                                    ),
                                    onPressed: closeAction,
                                  )),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )),
        FlexSpace(25),
      ],
    ),
  );
}
