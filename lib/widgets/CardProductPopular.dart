// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gobat_app/models/Product.dart';
import 'package:gobat_app/models/User.dart';
import 'package:gobat_app/pages/ProductDetail.dart';
import 'package:gobat_app/services/FirestoreService.dart';
import 'package:gobat_app/services/NavigatorServices.dart';
import 'package:gobat_app/widgets/FlexSpace.dart';
import 'package:provider/provider.dart';

AspectRatio CardProductPopular({
  required BuildContext context,
  required User user,
  required Product product,
  required shapePath,
}) {
  return AspectRatio(
    aspectRatio: 290 / 348,
    child: SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(0),
          primary: Colors.transparent,
          shadowColor: Colors.transparent,
          elevation: 0,
        ),
        child: Stack(
          children: [
            SvgPicture.asset(shapePath),
            Row(
              children: [
                FlexSpace(20),
                Flexible(
                  flex: 250,
                  child: Column(
                    children: [
                      FlexSpace(10),
                      Flexible(
                        flex: 150,
                        child: SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: Row(
                            children: [
                              Flexible(
                                  flex: 80,
                                  child: Column(
                                    children: [
                                      FlexSpace(30),
                                      Flexible(
                                          flex: 60,
                                          child: Row(
                                            children: [
                                              AspectRatio(
                                                aspectRatio: 1 / 1,
                                                child: SvgPicture.asset(
                                                    "assets/Icon_StarFavProduct.svg"),
                                              ),
                                            ],
                                          )),
                                      FlexSpace(18),
                                      Flexible(
                                          flex: 4,
                                          child: AspectRatio(
                                            aspectRatio: 20 / 1,
                                            child: SvgPicture.asset(
                                                "assets/Icon_LineProductPopular.svg"),
                                          )),
                                      FlexSpace(18),
                                      Flexible(
                                          flex: 20,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              AspectRatio(
                                                aspectRatio: 1 / 1,
                                                child: SvgPicture.asset(
                                                    "assets/Icon_TrafficActivityProduct.svg"),
                                              ),
                                              AspectRatio(aspectRatio: 5 / 20),
                                              Text(
                                                (product.counter['views']! +
                                                        product.counter[
                                                            'favorites']!)
                                                    .toString(),
                                                textAlign: TextAlign.start,
                                                maxLines: 1,
                                                style: TextStyle(
                                                  overflow: TextOverflow.clip,
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          (18 / 1080),
                                                  fontFamily: "Folks",
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ))
                                    ],
                                  )),
                              FlexSpace(20),
                              Flexible(
                                flex: 150,
                                child: product.information['images'].length != 0
                                    ? Image(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          product.information['images'][0],
                                        ))
                                    : Container(),
                              ),
                            ],
                          ),
                        ),
                      ),
                      FlexSpace(20),
                      Flexible(
                        flex: 34,
                        child: SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: Text(
                            product.information['name'],
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            style: TextStyle(
                              overflow: TextOverflow.clip,
                              fontSize: MediaQuery.of(context).size.width *
                                  (28 / 1080),
                              fontFamily: "Folks",
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      FlexSpace(20),
                      Flexible(
                        flex: 84,
                        child: SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: Text(
                            product.information['description'],
                            textAlign: TextAlign.start,
                            maxLines: 4,
                            style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: MediaQuery.of(context).size.width *
                                  (18 / 1080),
                              fontFamily: "Folks",
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      FlexSpace(40),
                    ],
                  ),
                ),
                FlexSpace(20),
              ],
            )
          ],
        ),
        onPressed: () {
          Navigator.of(context).push(
            NavigatorScale(
              child: MultiProvider(providers: [
                StreamProvider<User?>.value(
                    value: FirestoreService().user(user.id),
                    initialData: User.empty),
                StreamProvider<Product>.value(
                    value: FirestoreService().product(product.id),
                    initialData: Product.empty),
              ], child: ProductDetail()),
            ),
          );
        },
      ),
    ),
  );
}
