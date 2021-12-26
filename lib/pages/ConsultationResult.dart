// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:gobat_app/models/Product.dart';
import 'package:gobat_app/models/User.dart';
import 'package:gobat_app/pages/ProductDetail.dart';
import 'package:gobat_app/services/FirestoreService.dart';
import 'package:gobat_app/services/GlobalValue.dart';
import 'package:gobat_app/services/NavigatorServices.dart';
import 'package:gobat_app/widgets/FlexSpace.dart';
import 'package:gobat_app/widgets/SubProfileContainer.dart';
import 'package:provider/provider.dart';

class ConsultationResult extends StatefulWidget {
  final String resultCode;

  const ConsultationResult({
    Key? key,
    required this.resultCode,
  }) : super(key: key);

  @override
  _ConsultationResultState createState() => _ConsultationResultState();
}

class _ConsultationResultState extends State<ConsultationResult> {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    List<Product> products = Provider.of<List<Product>>(context);

    return SubProfileContainer(
      context: context,
      userId: null,
      title: "Hasil Analisa",
      withAppBar: false,
      child: Column(
        children: [
          AspectRatio(aspectRatio: 1080 / 75),
          Row(
            children: [
              FlexSpace(75),
              Flexible(
                flex: 930,
                child: Center(
                  child: Text(
                    "Halo,\n" + user.fullname,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: TextStyle(
                      overflow: TextOverflow.clip,
                      fontSize: GlobalValue.getSizeConstraint(context, 72),
                      fontFamily: "Folks",
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              FlexSpace(75),
            ],
          ),
          AspectRatio(aspectRatio: 1080 / 50),
          Row(
            children: [
              FlexSpace(75),
              Flexible(
                flex: 930,
                child: Center(
                  child: Text(
                    "Berikut hasil analisa berdasarkan\ngejala yang kamu alami",
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: TextStyle(
                      overflow: TextOverflow.clip,
                      fontSize: GlobalValue.getSizeConstraint(context, 42),
                      fontFamily: "Folks",
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              FlexSpace(75),
            ],
          ),
          AspectRatio(aspectRatio: 1080 / 100),
          Row(
            children: [
              FlexSpace(80),
              Flexible(
                flex: 925,
                child: Text(
                  "Rincian Penyakit",
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  style: TextStyle(
                    overflow: TextOverflow.clip,
                    fontSize: GlobalValue.getSizeConstraint(context, 48),
                    fontFamily: "Folks",
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              FlexSpace(75),
            ],
          ),
          AspectRatio(aspectRatio: 1080 / 30),
          Row(
            children: [
              FlexSpace(75),
              Flexible(
                  flex: 930,
                  child: Container(
                    padding: EdgeInsets.all(
                        GlobalValue.getSizeConstraint(context, 30)),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(
                          MediaQuery.of(context).size.width * (20 / 1080))),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius:
                              (MediaQuery.of(context).size.width * (10 / 1080)),
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Text(
                      GlobalValue
                          .resultConsultation[widget.resultCode]!['result']
                          .toString(),
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        overflow: TextOverflow.clip,
                        fontSize: GlobalValue.getSizeConstraint(context, 42),
                        fontFamily: "Folks",
                        color: Colors.black,
                      ),
                    ),
                  )),
              FlexSpace(75),
            ],
          ),
          AspectRatio(aspectRatio: 1080 / 100),
          Row(
            children: [
              FlexSpace(80),
              Flexible(
                flex: 925,
                child: Text(
                  "Solusi",
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  style: TextStyle(
                    overflow: TextOverflow.clip,
                    fontSize: GlobalValue.getSizeConstraint(context, 48),
                    fontFamily: "Folks",
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              FlexSpace(75),
            ],
          ),
          AspectRatio(aspectRatio: 1080 / 30),
          Row(
            children: [
              FlexSpace(75),
              Flexible(
                  flex: 930,
                  child: SizedBox(
                    width: double.infinity,
                    child: Container(
                        padding: EdgeInsets.only(
                            left: GlobalValue.getSizeConstraint(context, 30),
                            right: GlobalValue.getSizeConstraint(context, 30),
                            top: GlobalValue.getSizeConstraint(context, 20),
                            bottom: GlobalValue.getSizeConstraint(context, 20)),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(
                              MediaQuery.of(context).size.width * (20 / 1080))),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              blurRadius: (MediaQuery.of(context).size.width *
                                  (10 / 1080)),
                              offset:
                                  Offset(0, 0), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List<String>.from(
                                  GlobalValue.resultConsultation[
                                          widget.resultCode]!['solution'] ??
                                      [])
                              .map(
                                (e) => Column(
                                  children: [
                                    SizedBox(
                                        height: GlobalValue.getSizeConstraint(
                                            context, 10)),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "•  ",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            overflow: TextOverflow.clip,
                                            fontSize:
                                                GlobalValue.getSizeConstraint(
                                                    context, 42),
                                            fontFamily: "Folks",
                                            color: Colors.black,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            e.toString(),
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              overflow: TextOverflow.clip,
                                              fontSize:
                                                  GlobalValue.getSizeConstraint(
                                                      context, 42),
                                              fontFamily: "Folks",
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                        height: GlobalValue.getSizeConstraint(
                                            context, 10)),
                                  ],
                                ),
                              )
                              .toList(),
                        )),
                  )),
              FlexSpace(75),
            ],
          ),
          AspectRatio(aspectRatio: 1080 / 75),
          Row(
            children: [
              FlexSpace(80),
              Flexible(
                flex: 925,
                child: Text(
                  "Obat yang disarankan ",
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  style: TextStyle(
                    overflow: TextOverflow.clip,
                    fontSize: GlobalValue.getSizeConstraint(context, 48),
                    fontFamily: "Folks",
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              FlexSpace(75),
            ],
          ),
          AspectRatio(aspectRatio: 1080 / 30),
          AspectRatio(
            aspectRatio: 1080 / 420,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                left: GlobalValue.getSizeConstraint(context, 80),
                right: GlobalValue.getSizeConstraint(context, 30),
                top: GlobalValue.getSizeConstraint(context, 10),
                bottom: GlobalValue.getSizeConstraint(context, 10),
              ),
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              child: Row(
                children: products.isNotEmpty
                    ? List<Widget>.from(GlobalValue
                        .resultConsultation[widget.resultCode]!['suggestion']
                        .map((productId) {
                        Product product = products
                            .singleWhere((element) => element.id == productId);
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            shadowColor: Colors.transparent,
                            elevation: 0,
                            padding: EdgeInsets.all(0),
                          ),
                          child: AspectRatio(
                            aspectRatio: 400 / 420,
                            child: Container(
                              margin: EdgeInsets.only(
                                  right: GlobalValue.getSizeConstraint(
                                      context, 50)),
                              padding: EdgeInsets.all(
                                  GlobalValue.getSizeConstraint(context, 25)),
                              decoration: BoxDecoration(
                                color: Color(0xFFFCF3D9),
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.all(Radius.circular(
                                    MediaQuery.of(context).size.width *
                                        (20 / 1080))),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.25),
                                    blurRadius:
                                        (MediaQuery.of(context).size.width *
                                            (10 / 1080)),
                                    offset: Offset(
                                        0,
                                        GlobalValue.getSizeConstraint(context,
                                            10)), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Flexible(
                                      flex: 70,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                GlobalValue.getSizeConstraint(
                                                    context, 20)),
                                        decoration: BoxDecoration(
                                          color: Color(0xFFFFC100),
                                          shape: BoxShape.rectangle,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                  MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      (10 / 1080))),
                                        ),
                                        child: Center(
                                          child: Text(
                                            product.information['name'],
                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                            style: TextStyle(
                                              overflow: TextOverflow.clip,
                                              fontSize:
                                                  GlobalValue.getSizeConstraint(
                                                      context, 25),
                                              fontFamily: "Folks",
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      )),
                                  FlexSpace(15),
                                  Flexible(
                                      flex: 285,
                                      child: Center(
                                        child: Image.network(
                                            product.information['images'][0]),
                                      )),
                                ],
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              NavigatorSlide(
                                direction: AxisDirection.right,
                                child: MultiProvider(providers: [
                                  StreamProvider<User?>.value(
                                      value: FirestoreService().user(user.id),
                                      initialData: User.empty),
                                  StreamProvider<Product>.value(
                                      value: FirestoreService()
                                          .product(product.id),
                                      initialData: Product.empty),
                                ], child: ProductDetail()),
                              ),
                            );
                          },
                        );
                      }).toList())
                    : [],
              ),
            ),
          ),
        ],
      ),
      makeClearFocus: false,
    );
  }
}
