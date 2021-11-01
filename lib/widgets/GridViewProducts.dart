// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gobat_app/models/Product.dart';
import 'package:gobat_app/models/User.dart';
import 'package:gobat_app/widgets/FlexSpace.dart';

GridView GridViewProducts(
    BuildContext context, User user, List<Product> products) {
  double fullWidth = MediaQuery.of(context).size.width;
  int index = -1;

  try {
    return GridView.count(
      key: ValueKey<int>(0),
      crossAxisCount: 2,
      padding: EdgeInsets.only(
        top: fullWidth * 0.0463,
        left: fullWidth * 0.0463,
        right: fullWidth * 0.0463,
        bottom: fullWidth * 0.0926,
      ),
      childAspectRatio: 460 / 494,
      mainAxisSpacing: fullWidth * 0.0463,
      crossAxisSpacing: fullWidth * 0.0463,
      shrinkWrap: false,
      children: user.views["products"]!.map((e) {
        index++;

        Product product = (products.firstWhere(
            (element) => element.id.contains(user.views["products"]![index])));

        return Card(
          elevation: fullWidth * 0.02,
          clipBehavior: Clip.hardEdge,
          color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(fullWidth * 0.0185)),
          child: Column(
            children: [
              Flexible(
                flex: 469,
                child: Row(
                  children: [
                    FlexSpace(25),
                    Flexible(
                        flex: 410,
                        child: Column(
                          children: [
                            FlexSpace(25),
                            Flexible(
                              flex: 342,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xBFF5F5F5F5),
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            fullWidth * (20 / 1080)))),
                                child: Stack(
                                  children: [
                                    SizedBox(
                                      width: double.infinity,
                                      height: double.infinity,
                                      child: Container(
                                        margin:
                                            EdgeInsets.all(fullWidth * 0.03),
                                        child: Image(
                                          image: NetworkImage(
                                            product.information["images"][0],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Wrap(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: fullWidth * 0.005,
                                                    horizontal:
                                                        fullWidth * 0.01),
                                                decoration: BoxDecoration(
                                                    color: Color(0x4D000000),
                                                    shape: BoxShape.rectangle,
                                                    borderRadius: BorderRadius
                                                        .all(Radius.circular(
                                                            fullWidth *
                                                                (5 / 1080)))),
                                                margin: EdgeInsets.only(
                                                  bottom:
                                                      fullWidth * (20 / 1080),
                                                  right:
                                                      fullWidth * (20 / 1080),
                                                ),
                                                child: Wrap(
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.center,
                                                  spacing: fullWidth * 0.01,
                                                  children: [
                                                    Text(
                                                      product.counter["views"]
                                                          .toString(),
                                                      maxLines: 1,
                                                      style: TextStyle(
                                                        fontSize: fullWidth *
                                                            (28 / 1080),
                                                        fontFamily: "Folks",
                                                        color:
                                                            Color(0xFFFFFFFF),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        height: fullWidth *
                                                            (16 / 1080),
                                                        width: fullWidth *
                                                            (28.57 / 1080),
                                                        child: SvgPicture.asset(
                                                            "assets/Icon_EyeView.svg")),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: fullWidth * 0.005,
                                                    horizontal:
                                                        fullWidth * 0.01),
                                                decoration: BoxDecoration(
                                                    color: Color(0x4D000000),
                                                    shape: BoxShape.rectangle,
                                                    borderRadius: BorderRadius
                                                        .all(Radius.circular(
                                                            fullWidth *
                                                                (5 / 1080)))),
                                                margin: EdgeInsets.only(
                                                  bottom:
                                                      fullWidth * (20 / 1080),
                                                  right:
                                                      fullWidth * (20 / 1080),
                                                ),
                                                child: Wrap(
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.center,
                                                  spacing: fullWidth * 0.01,
                                                  children: [
                                                    Text(
                                                      product
                                                          .counter["favorites"]
                                                          .toString(),
                                                      maxLines: 1,
                                                      style: TextStyle(
                                                        fontSize: fullWidth *
                                                            (28 / 1080),
                                                        fontFamily: "Folks",
                                                        color:
                                                            Color(0xFFFFFFFF),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        height: fullWidth *
                                                            (22 / 1080),
                                                        width: fullWidth *
                                                            (23.98 / 1080),
                                                        child: SvgPicture.asset(
                                                            "assets/Icon_FavItem.svg")),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            FlexSpace(25),
                            Flexible(
                                flex: 79,
                                child: Column(
                                  children: [
                                    Flexible(
                                      flex: 38,
                                      child: SizedBox(
                                        width: double.infinity,
                                        height: double.infinity,
                                        child: Text(
                                          product.information["name"],
                                          overflow: TextOverflow.clip,
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          style: TextStyle(
                                            overflow: TextOverflow.clip,
                                            fontSize: fullWidth * (32 / 1080),
                                            fontFamily: "Folks",
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                    FlexSpace(5),
                                    Flexible(
                                      flex: 31,
                                      child: SizedBox(
                                          width: double.infinity,
                                          height: double.infinity,
                                          child: Wrap(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.blueGrey,
                                                    shape: BoxShape.rectangle,
                                                    borderRadius: BorderRadius
                                                        .all(Radius.circular(
                                                            fullWidth *
                                                                (5 / 1080)))),
                                                padding: EdgeInsets.symmetric(
                                                    vertical:
                                                        fullWidth * (5 / 1080),
                                                    horizontal: fullWidth *
                                                        (15 / 1080)),
                                                child: Text(
                                                  product.category,
                                                  overflow: TextOverflow.clip,
                                                  textAlign: TextAlign.start,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                    overflow: TextOverflow.clip,
                                                    fontSize:
                                                        fullWidth * (24 / 1080),
                                                    fontFamily: "Folks",
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )),
                                    ),
                                  ],
                                )),
                            FlexSpace(25),
                          ],
                        )),
                    FlexSpace(25),
                  ],
                ),
              ),
              AspectRatio(aspectRatio: 200 / 5),
            ],
          ),
        );
      }).toList(),
    );
  } catch (e) {
    return GridView.count(crossAxisCount: 2);
  }
}
