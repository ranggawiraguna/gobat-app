// ignore_for_file: import_of_legacy_library_into_null_safe, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'FlexSpace.dart';

AspectRatio RatioButtonRounded({
  required double aspectRatio,
  required int innerSpaceVertical,
  required int innerSpaceHorizontal,
  required int flexTextHeight,
  required int flexTextWidth,
  required String textContent,
  required Color textColor,
  required Color buttonColor,
  required Function()? action,
}) {
  return AspectRatio(
    aspectRatio: aspectRatio,
    child: SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: ElevatedButton(
        child: Column(
          children: [
            FlexSpace(innerSpaceVertical),
            Flexible(
              flex: flexTextHeight,
              child: Row(
                children: [
                  FlexSpace(innerSpaceHorizontal),
                  Flexible(
                    flex: flexTextWidth,
                    child: AutoSizeText(
                      textContent,
                      style: TextStyle(
                        fontSize: 100,
                        fontFamily: "Folks",
                        color: textColor,
                        fontWeight: FontWeight.bold,
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
            borderRadius: BorderRadius.circular(1000),
          ),
          shadowColor: Colors.transparent,
        ),
        onPressed: action,
      ),
    ),
  );
}
