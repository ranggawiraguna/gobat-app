import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'FlexSpace.dart';

// ignore: non_constant_identifier_names
Flexible FlexButton({
  int flexButton,
  int innerSpaceVertical,
  int innerSpaceHorizontal,
  int flexTextVertical,
  int flexTextHorizontal,
  String textContent,
  Color textColor,
  Color buttonColor,
  double buttonRadius,
  Function action,
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
                    flex: flexTextHorizontal,
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
            borderRadius: BorderRadius.circular(buttonRadius),
          ),
          shadowColor: Colors.transparent,
        ),
        onPressed: action,
      ),
    ),
  );
}
