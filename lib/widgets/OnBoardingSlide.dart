// ignore_for_file: import_of_legacy_library_into_null_safe, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_svg/svg.dart';

import 'FlexSpace.dart';

Container OnBoardingSlide(
    {required Color color,
    required String asset,
    required String title,
    required String description}) {
  return Container(
    color: color,
    child: SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          FlexSpace(150),
          Flexible(
              flex: 1449,
              child: Column(
                children: [
                  Flexible(
                      flex: 923,
                      child: Row(
                        children: [
                          FlexSpace(75),
                          Flexible(flex: 930, child: SvgPicture.asset(asset)),
                          FlexSpace(75)
                        ],
                      )),
                  FlexSpace(150),
                  Flexible(
                      flex: 176,
                      child: AutoSizeText(title,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 100,
                              color: Colors.white,
                              fontFamily: "Folks",
                              fontWeight: FontWeight.bold))),
                  FlexSpace(50),
                  Flexible(
                      flex: 150,
                      child: AutoSizeText(description,
                          maxLines: 3,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 100,
                              fontFamily: "Folks",
                              color: Colors.white,
                              fontWeight: FontWeight.bold))),
                ],
              )),
          FlexSpace(507)
        ],
      ),
    ),
  );
}
