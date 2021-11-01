// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gobat_app/widgets/RatioButton.dart';

Container ProfileIllustrationEmpty(
    BuildContext context,
    int key,
    String illPath,
    int innerSpaceHorizontal,
    int flexTextWidth,
    String buttonText,
    Function() buttonAction) {
  return Container(
    key: ValueKey<int>(key),
    child: Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * (780 / 1080),
        child: AspectRatio(
            aspectRatio: 780 / 897,
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 780 / 721,
                  child: SvgPicture.asset(illPath),
                ),
                AspectRatio(aspectRatio: 780 / 50),
                RatioButton(
                  aspectRatio: 780 / 126,
                  borderRadius: MediaQuery.of(context).size.width * (20 / 1080),
                  innerSpaceVertical: 30,
                  innerSpaceHorizontal: innerSpaceHorizontal,
                  flexTextHeight: 66,
                  flexTextWidth: flexTextWidth,
                  textContent: buttonText,
                  textColor: Colors.white,
                  buttonColor: Color(0xFFFF583C),
                  action: buttonAction,
                )
              ],
            )),
      ),
    ),
  );
}
