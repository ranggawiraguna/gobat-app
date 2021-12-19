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

GridView GridViewMainProducts(
    BuildContext context, User user, List<Product> products) {
  double fullWidth = MediaQuery.of(context).size.width;

  try {
    return GridView.count(
      key: ValueKey<int>(0),
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 440 / 540,
      mainAxisSpacing: fullWidth * 0.0345,
      crossAxisSpacing: fullWidth * 0.0345,
      shrinkWrap: true,
      padding: EdgeInsets.only(
        left: fullWidth * (75 / 1080),
        right: fullWidth * (75 / 1080),
      ),
      children: products.map((product) {
        return Card(
          elevation: fullWidth * 0.01,
          clipBehavior: Clip.hardEdge,
          color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(fullWidth * 0.0185)),
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
              child: Column(
                children: [
                  FlexSpace(50),
                  Flexible(
                      flex: 275,
                      child: SizedBox(
                        height: double.infinity,
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.02,
                            right: MediaQuery.of(context).size.width * 0.02,
                          ),
                          child:
                              Image.network(product.information['images'][0]),
                        ),
                      )),
                  FlexSpace(15),
                  Flexible(
                    flex: 100,
                    child: Row(
                      children: [
                        FlexSpace(50),
                        Flexible(
                          flex: 340,
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              product.information['name'],
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.clip,
                              maxLines: 2,
                              style: TextStyle(
                                overflow: TextOverflow.clip,
                                fontSize: MediaQuery.of(context).size.width *
                                    (37 / 1080),
                                fontFamily: "Folks",
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        FlexSpace(50),
                      ],
                    ),
                  ),
                  FlexSpace(25),
                  Flexible(
                    flex: 45,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AspectRatio(
                          aspectRatio: 1 / 1,
                          child: SvgPicture.asset("assets/Icon_Eye.svg"),
                        ),
                        AspectRatio(aspectRatio: 5 / 45),
                        Text(
                          product.counter['views'].toString(),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                          style: TextStyle(
                            overflow: TextOverflow.clip,
                            fontSize: MediaQuery.of(context).size.width * 0.028,
                            fontFamily: "Folks",
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        AspectRatio(aspectRatio: 25 / 45),
                        AspectRatio(
                          aspectRatio: 1 / 1,
                          child: SvgPicture.asset("assets/Icon_Love.svg"),
                        ),
                        Text(
                          product.counter['views'].toString(),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                          style: TextStyle(
                            overflow: TextOverflow.clip,
                            fontSize: MediaQuery.of(context).size.width * 0.028,
                            fontFamily: "Folks",
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        AspectRatio(aspectRatio: 50 / 45),
                      ],
                    ),
                  ),
                  FlexSpace(30),
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
      }).toList(),
    );
  } catch (e) {
    return GridView.count(crossAxisCount: 2);
  }
}
