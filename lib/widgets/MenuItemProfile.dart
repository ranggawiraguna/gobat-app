// ignore_for_file: non_constant_identifier_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gobat_app/widgets/FlexSpace.dart';

Flexible MenuItemProfile(String iconPath, String name, Function nextAction) =>
    Flexible(
      flex: 100,
      child: ElevatedButton(
        child: Row(
          children: [
            Flexible(flex: 100, child: SvgPicture.asset(iconPath)),
            FlexSpace(50),
            Flexible(
              flex: 480,
              child: Column(
                children: [
                  FlexSpace(24),
                  Flexible(
                    flex: 52,
                    child: SizedBox(
                      height: double.infinity,
                      width: double.infinity,
                      child: AutoSizeText(
                        name,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        minFontSize: 1,
                        style: TextStyle(
                          fontSize: 100,
                          fontFamily: "Folks",
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  FlexSpace(24),
                ],
              ),
            ),
            FlexSpace(50),
            Flexible(
                flex: 50, child: SvgPicture.asset("assets/Icon_ArrowNext.svg")),
          ],
        ),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(0),
          primary: Colors.transparent,
          shadowColor: Colors.transparent,
          elevation: 0,
        ),
        onPressed: () => nextAction(),
      ),
    );
