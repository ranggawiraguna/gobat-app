// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:gobat_app/models/Product.dart';
import 'package:gobat_app/models/User.dart';
import 'package:gobat_app/pages/ProductCategory.dart';
import 'package:gobat_app/services/FirestoreService.dart';
import 'package:gobat_app/services/GlobalValue.dart';
import 'package:gobat_app/services/NavigatorServices.dart';
import 'package:provider/provider.dart';

Container LabelCategory(
    {required BuildContext context,
    required userId,
    required String iconPath,
    required String name}) {
  return Container(
    margin: EdgeInsets.only(right: GlobalValue.getSizeConstraint(context, 25)),
    child: Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.width * (3 / 1080),
        bottom: MediaQuery.of(context).size.width * (9 / 1080),
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(NavigatorSlide(
              child: MultiProvider(
                  providers: [
                    StreamProvider<User?>.value(
                        value: FirestoreService().user(userId),
                        initialData: User.empty),
                    StreamProvider<List<Product>>.value(
                        value: FirestoreService().products, initialData: []),
                    StreamProvider<List<Product>>.value(
                        value: FirestoreService().products, initialData: []),
                  ],
                  child: ProductCategory(
                    category: name,
                  )),
              direction: AxisDirection.right));
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(0),
          elevation: 0,
          primary: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            boxShadow: [
              BoxShadow(
                color: Color(0x26000000),
                offset:
                    Offset(0, MediaQuery.of(context).size.width * (3 / 1080)),
                blurRadius: MediaQuery.of(context).size.width * (6 / 1080),
              )
            ],
            borderRadius: BorderRadius.all(
              Radius.circular(MediaQuery.of(context).size.width * (20 / 1080)),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.width * 15 / 1080,
              bottom: MediaQuery.of(context).size.width * 15 / 1080,
              left: MediaQuery.of(context).size.width * 15 / 1080,
              right: MediaQuery.of(context).size.width * 30 / 1080,
            ),
            child: Row(
              children: [
                AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Image(
                    image: AssetImage(
                      iconPath,
                    ),
                  ),
                ),
                AspectRatio(aspectRatio: 30 / 80),
                Text(
                  name,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  style: TextStyle(
                    overflow: TextOverflow.clip,
                    fontSize: MediaQuery.of(context).size.width * (32 / 1080),
                    fontFamily: "Folks",
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
