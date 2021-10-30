// ignore_for_file: non_constant_identifier_names

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:gobat_app/models/Product.dart';
import 'package:gobat_app/models/User.dart';

GridView GridViewProducts(
    BuildContext context, User user, List<Product> products) {
  return GridView.builder(
      key: ValueKey<int>(0),
      itemCount: user.views["products"]!.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        double fullWidth = MediaQuery.of(context).size.width;
        List<double> padding = [fullWidth * 0.0463, fullWidth * 0.02315];

        return Padding(
          padding: EdgeInsets.only(
            top: (index <= 1) ? padding[0] : padding[1],
            left: (index % 2 == 0) ? padding[0] : padding[1],
            right: (index % 2 == 1) ? padding[0] : padding[1],
            bottom: (index >= (user.views["products"]!.length - 2))
                ? padding[0]
                : padding[1],
          ),
          child: Card(
            color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(fullWidth * 0.0185)),
          ),
        );
      });
}
