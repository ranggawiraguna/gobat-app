import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'FlexSpace.dart';

// ignore: non_constant_identifier_names
AspectRatio RatioButtonRounded({
  double aspectRatio,
  int innerSpaceVertical,
  int innerSpaceHorizontal,
  int flexTextHeight,
  int flexTextWidth,
  String textContent,
  Color textColor,
  Color buttonColor,
  Function action,
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
