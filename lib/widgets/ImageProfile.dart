// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

AspectRatio ImageProfile(
    BuildContext context,
    double outsideRadiusPercent,
    double insideRadiusPercent,
    double paddingPercent,
    Color borderColor,
    String imagePath) {
  return AspectRatio(
    aspectRatio: 1 / 1,
    child: ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(
          MediaQuery.of(context).size.width * outsideRadiusPercent)),
      child: Container(
        color: borderColor,
        child: Container(
          clipBehavior: Clip.hardEdge,
          margin: EdgeInsets.all(
              MediaQuery.of(context).size.width * paddingPercent),
          child: SvgPicture.asset(imagePath),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(
                MediaQuery.of(context).size.width * insideRadiusPercent)),
          ),
        ),
      ),
    ),
  );
}
