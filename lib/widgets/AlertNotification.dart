// ignore_for_file: import_of_legacy_library_into_null_safe, non_constant_identifier_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gobat_app/widgets/FlexSpace.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> AlertNotification({
  required BuildContext context,
  required Color backgroundColor,
  required double aspectRatio,
  required double widthPercent,
  required String iconPath,
  required String textContent,
  required int flexContentVertical,
  required int flexIconHorizontal,
  required int flexTextHorizontal,
  required int textMaxLines,
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
              FlexSpace(24),
              Flexible(
                flex: flexContentVertical,
                child: Row(
                  children: [
                    FlexSpace(25),
                    Flexible(
                        flex: flexIconHorizontal,
                        child: AspectRatio(
                          aspectRatio: 1 / 1,
                          child: SvgPicture.asset(iconPath),
                        )),
                    FlexSpace(20),
                    Flexible(
                      flex: flexTextHorizontal,
                      child: AutoSizeText(
                        textContent,
                        maxLines: textMaxLines,
                        minFontSize: 1,
                        style: TextStyle(
                          fontFamily: "Folks",
                          fontSize: 100,
                        ),
                      ),
                    ),
                    FlexSpace(25),
                  ],
                ),
              ),
              FlexSpace(24),
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
      onVisible: nextAction,
    ),
  );
}
