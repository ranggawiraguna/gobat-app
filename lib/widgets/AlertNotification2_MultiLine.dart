// ignore_for_file: import_of_legacy_library_into_null_safe, non_constant_identifier_names

import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gobat_app/widgets/FlexSpace.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
    AlertNotification2_MultiLine({
  required BuildContext context,
  required Color backgroundColor,
  required double aspectRatio,
  required double widthPercent,
  required String textContent,
  required int flexContentVertical,
  required int flexTextHorizontal,
  required int duration,
  Function()? nextAction,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: AspectRatio(
        aspectRatio: aspectRatio,
        child: Center(
          child: Column(
            children: [
              FlexSpace(30),
              Flexible(
                flex: flexContentVertical,
                child: Row(
                  children: [
                    FlexSpace(30),
                    Flexible(
                      flex: ((flexTextHorizontal / 2).round()) - 3,
                      child: Center(
                        child: AutoSizeText(
                          textContent.split("\n")[0],
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          minFontSize: 1,
                          style: TextStyle(
                            fontFamily: "Folks",
                            fontSize: 100,
                          ),
                        ),
                      ),
                    ),
                    FlexSpace(30),
                  ],
                ),
              ),
              FlexSpace(6),
              Flexible(
                flex: flexContentVertical,
                child: Row(
                  children: [
                    FlexSpace(30),
                    Flexible(
                      flex: ((flexTextHorizontal / 2).round()) - 3,
                      child: Center(
                        child: AutoSizeText(
                          textContent.split("\n")[1],
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          minFontSize: 1,
                          style: TextStyle(
                            fontFamily: "Folks",
                            fontSize: 100,
                          ),
                        ),
                      ),
                    ),
                    FlexSpace(30),
                  ],
                ),
              ),
              FlexSpace(30),
            ],
          ),
        ),
      ),
      duration: Duration(milliseconds: duration), // Width of the SnackBar.
      padding: EdgeInsets.all(0),
      backgroundColor: backgroundColor,
      width: (MediaQuery.of(context).size.width) * widthPercent,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      onVisible: () {
        Timer(Duration(milliseconds: duration), nextAction ?? () {});
      },
    ),
  );
}
