// ignore_for_file: non_constant_identifier_names

import 'dart:ui';

import 'package:flutter/cupertino.dart';

T? cast<T>(x) => x is T ? x : null;

AspectRatio ImageProfile(
  BuildContext context,
  double outsideRadiusPercent,
  double insideRadiusPercent,
  double paddingPercent,
  Color borderColor,
  dynamic image,
) {
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
          child: image,
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
