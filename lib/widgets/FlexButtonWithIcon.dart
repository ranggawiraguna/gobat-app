// ignore_for_file: import_of_legacy_library_into_null_safe, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'FlexSpace.dart';

Flexible FlexButtonWithIcon({
  required int flexButton,
  required int innerSpaceVertical,
  required int innerSpaceHorizontal,
  required int flexTextVertical,
  required int flexTextHorizontal,
  required int flexIconHorizontal,
  required int flexSpaceContent,
  required String iconPath,
  required String textContent,
  required Color textColor,
  required Color buttonColor,
  required double buttonRadius,
  required Function() action,
}) {
  return Flexible(
    flex: flexButton,
    child: SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: ElevatedButton(
        child: Column(
          children: [
            FlexSpace(innerSpaceVertical),
            Flexible(
              flex: flexTextVertical,
              child: Row(
                children: [
                  FlexSpace(innerSpaceHorizontal),
                  Flexible(
                      flex: flexIconHorizontal,
                      child: SvgPicture.asset(iconPath)),
                  FlexSpace(flexSpaceContent),
                  Flexible(
                    flex: flexTextHorizontal,
                    child: Center(
                      child: AutoSizeText(
                        textContent,
                        minFontSize: 1,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 100,
                          fontFamily: "Folks",
                          color: textColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  FlexSpace(innerSpaceHorizontal),
                ],
              ),
            ),
            FlexSpace(innerSpaceVertical),
          ],
        ),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(0),
          primary: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(buttonRadius),
          ),
          shadowColor: Colors.transparent,
        ),
        onPressed: action,
      ),
    ),
  );
}
