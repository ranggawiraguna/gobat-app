// ignore_for_file: non_constant_identifier_names

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:gobat_app/models/Article.dart';
import 'package:gobat_app/models/User.dart';

ListView ListViewFavoriteArticles(
    BuildContext context, User user, List<Article> articles) {
  return ListView.builder(
      key: ValueKey<int>(1),
      itemCount: user.favorites["articles"]!.length,
      itemBuilder: (context, index) {
        double fullWidth = MediaQuery.of(context).size.width;
        List<double> padding = [fullWidth * 0.0463, fullWidth * 0.02315];

        return Padding(
          padding: EdgeInsets.only(
            top: (index == 0) ? padding[0] : padding[1],
            left: padding[0],
            right: padding[0],
            bottom: (index == (user.favorites["articles"]!.length - 1))
                ? padding[0]
                : padding[1],
          ),
          child: AspectRatio(
            aspectRatio: 980 / 300,
            child: Container(
              decoration: BoxDecoration(
                color:
                    Colors.primaries[Random().nextInt(Colors.primaries.length)],
                borderRadius: BorderRadius.circular(fullWidth * 0.0185),
              ),
            ),
          ),
        );
      });
}
