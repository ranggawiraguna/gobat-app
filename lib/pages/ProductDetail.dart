// ignore_for_file: unused_field

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gobat_app/models/Product.dart';
import 'package:gobat_app/models/User.dart';
import 'package:gobat_app/services/GlobalValue.dart';
import 'package:gobat_app/widgets/FlexSpace.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    Product product = Provider.of<Product>(context);

    return SafeArea(
      child: Container(
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 0,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          body: Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: (MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top),
                child: Column(
                  children: [
                    AspectRatio(
                        aspectRatio: 1080 / 120,
                        child: Container(
                          color: Color(0xFF404040),
                          child: Row(
                            children: [
                              FlexSpace(40),
                              Flexible(
                                flex: 60,
                                child: Column(
                                  children: [
                                    FlexSpace(35),
                                    Flexible(
                                      flex: 50,
                                      child: Center(
                                        child: AspectRatio(
                                          aspectRatio: 1 / 1,
                                          child: ElevatedButton(
                                            child: SvgPicture.asset(
                                                "assets/Icon_ArrowBack.svg"),
                                            style: ElevatedButton.styleFrom(
                                              padding: EdgeInsets.all(0),
                                              primary: Colors.transparent,
                                              shadowColor: Colors.transparent,
                                            ),
                                            onPressed: () =>
                                                Navigator.of(context)
                                                    .pop(context),
                                          ),
                                        ),
                                      ),
                                    ),
                                    FlexSpace(35),
                                  ],
                                ),
                              ),
                              FlexSpace(50),
                              Flexible(
                                  flex: 780,
                                  child: Column(
                                    children: [
                                      FlexSpace(30),
                                      Flexible(
                                        flex: 60,
                                        child: Center(
                                          child: AutoSizeText(
                                            "Produk",
                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                            minFontSize: 1,
                                            style: TextStyle(
                                              fontSize: 100,
                                              fontFamily: "Folks",
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      FlexSpace(30),
                                    ],
                                  )),
                              FlexSpace(150),
                            ],
                          ),
                        )),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: ClampingScrollPhysics(),
                        child: Column(
                          children: [
                            AspectRatio(
                              aspectRatio: 1080 / 800,
                              child: SizedBox(
                                width: double.infinity,
                                height: double.infinity,
                                child: Stack(
                                  children: [
                                    Column(
                                      children: [
                                        FlexSpace(100),
                                        Flexible(
                                            flex: 600,
                                            child: product.id != "" ?
                                            Image.network(product
                                                .information['images'][0]) : SizedBox.shrink()),
                                        FlexSpace(100),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.rectangle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x26000000),
                                    offset: Offset(
                                        0,
                                        MediaQuery.of(context).size.width *
                                            (4 / 1080)),
                                    blurRadius:
                                        MediaQuery.of(context).size.width *
                                            (100 / 1080),
                                  )
                                ],
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(
                                      MediaQuery.of(context).size.width *
                                          (100 / 1080)),
                                  topRight: Radius.circular(
                                      MediaQuery.of(context).size.width *
                                          (100 / 1080)),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      FlexSpace(75),
                                      Flexible(
                                          flex: 930,
                                          child: Column(
                                            children: [
                                              AspectRatio(
                                                  aspectRatio: 930 / 50),
                                              Center(
                                                child: Text(
                                                  product.information['name'],
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: GlobalValue
                                                        .getSizeConstraint(
                                                            context, 54),
                                                    fontFamily: "Folks",
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              AspectRatio(
                                                  aspectRatio: 930 / 15),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFF404040),
                                                      shape: BoxShape.rectangle,
                                                      borderRadius: BorderRadius
                                                          .all(Radius.circular(
                                                              MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  (8 / 1080))),
                                                    ),
                                                    child: Padding(
                                                      padding: EdgeInsets.symmetric(
                                                          vertical: GlobalValue
                                                              .getSizeConstraint(
                                                                  context, 10),
                                                          horizontal: GlobalValue
                                                              .getSizeConstraint(
                                                                  context, 30)),
                                                      child: Text(
                                                        product.category,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          fontSize: GlobalValue
                                                              .getSizeConstraint(
                                                                  context, 32),
                                                          fontFamily: "Folks",
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              AspectRatio(
                                                  aspectRatio: 930 / 100),
                                              Row(
                                                children: [
                                                  Text(
                                                    "Deskripsi",
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                      fontSize: GlobalValue
                                                          .getSizeConstraint(
                                                              context, 42),
                                                      fontFamily: "Folks",
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              AspectRatio(
                                                  aspectRatio: 930 / 20),
                                              SizedBox(
                                                width: double.infinity,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFF8F5F5),
                                                    shape: BoxShape.rectangle,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color:
                                                            Color(0x40000000),
                                                        offset: Offset(
                                                            0,
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                (10 / 1080)),
                                                        blurRadius:
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                (10 / 1080),
                                                      )
                                                    ],
                                                    borderRadius: BorderRadius
                                                        .all(Radius.circular(
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                (15 / 1080))),
                                                  ),
                                                  child: Padding(
                                                    padding: EdgeInsets.all(
                                                        GlobalValue
                                                            .getSizeConstraint(
                                                                context, 50)),
                                                    child: Text(
                                                      product.information[
                                                          'description'],
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: TextStyle(
                                                        fontSize: GlobalValue
                                                            .getSizeConstraint(
                                                                context, 32),
                                                        fontFamily: "Folks",
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              AspectRatio(
                                                  aspectRatio: 930 / 75),
                                              Row(
                                                children: [
                                                  Text(
                                                    "Komposisi",
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                      fontSize: GlobalValue
                                                          .getSizeConstraint(
                                                              context, 42),
                                                      fontFamily: "Folks",
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              AspectRatio(
                                                  aspectRatio: 930 / 20),
                                              SizedBox(
                                                width: double.infinity,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFF8F5F5),
                                                    shape: BoxShape.rectangle,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color:
                                                            Color(0x40000000),
                                                        offset: Offset(
                                                            0,
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                (10 / 1080)),
                                                        blurRadius:
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                (10 / 1080),
                                                      )
                                                    ],
                                                    borderRadius: BorderRadius
                                                        .all(Radius.circular(
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                (15 / 1080))),
                                                  ),
                                                  child: Padding(
                                                    padding: EdgeInsets.all(
                                                        GlobalValue
                                                            .getSizeConstraint(
                                                                context, 50)),
                                                    child: Text(
                                                      product.information[
                                                          'composition'],
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: TextStyle(
                                                        fontSize: GlobalValue
                                                            .getSizeConstraint(
                                                                context, 32),
                                                        fontFamily: "Folks",
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              AspectRatio(
                                                  aspectRatio: 930 / 75),
                                              Row(
                                                children: [
                                                  Text(
                                                    "Dosis",
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                      fontSize: GlobalValue
                                                          .getSizeConstraint(
                                                              context, 42),
                                                      fontFamily: "Folks",
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              AspectRatio(
                                                  aspectRatio: 930 / 20),
                                              SizedBox(
                                                width: double.infinity,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFF8F5F5),
                                                    shape: BoxShape.rectangle,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color:
                                                            Color(0x40000000),
                                                        offset: Offset(
                                                            0,
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                (10 / 1080)),
                                                        blurRadius:
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                (10 / 1080),
                                                      )
                                                    ],
                                                    borderRadius: BorderRadius
                                                        .all(Radius.circular(
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                (15 / 1080))),
                                                  ),
                                                  child: Padding(
                                                    padding: EdgeInsets.all(
                                                        GlobalValue
                                                            .getSizeConstraint(
                                                                context, 50)),
                                                    child: Text(
                                                      product
                                                          .information['dose'],
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: TextStyle(
                                                        fontSize: GlobalValue
                                                            .getSizeConstraint(
                                                                context, 32),
                                                        fontFamily: "Folks",
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              AspectRatio(
                                                  aspectRatio: 930 / 75),
                                              Row(
                                                children: [
                                                  Text(
                                                    "Indikasi",
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                      fontSize: GlobalValue
                                                          .getSizeConstraint(
                                                              context, 42),
                                                      fontFamily: "Folks",
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              AspectRatio(
                                                  aspectRatio: 930 / 20),
                                              SizedBox(
                                                width: double.infinity,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFF8F5F5),
                                                    shape: BoxShape.rectangle,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color:
                                                            Color(0x40000000),
                                                        offset: Offset(
                                                            0,
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                (10 / 1080)),
                                                        blurRadius:
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                (10 / 1080),
                                                      )
                                                    ],
                                                    borderRadius: BorderRadius
                                                        .all(Radius.circular(
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                (15 / 1080))),
                                                  ),
                                                  child: Padding(
                                                    padding: EdgeInsets.all(
                                                        GlobalValue
                                                            .getSizeConstraint(
                                                                context, 50)),
                                                    child: Text(
                                                      product.information[
                                                          'indication'],
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: TextStyle(
                                                        fontSize: GlobalValue
                                                            .getSizeConstraint(
                                                                context, 32),
                                                        fontFamily: "Folks",
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              AspectRatio(
                                                  aspectRatio: 930 / 75),
                                              Row(
                                                children: [
                                                  Text(
                                                    "Aturan Pakai",
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                      fontSize: GlobalValue
                                                          .getSizeConstraint(
                                                              context, 42),
                                                      fontFamily: "Folks",
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              AspectRatio(
                                                  aspectRatio: 930 / 20),
                                              SizedBox(
                                                width: double.infinity,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFF8F5F5),
                                                    shape: BoxShape.rectangle,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color:
                                                            Color(0x40000000),
                                                        offset: Offset(
                                                            0,
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                (10 / 1080)),
                                                        blurRadius:
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                (10 / 1080),
                                                      )
                                                    ],
                                                    borderRadius: BorderRadius
                                                        .all(Radius.circular(
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                (15 / 1080))),
                                                  ),
                                                  child: Padding(
                                                    padding: EdgeInsets.all(
                                                        GlobalValue
                                                            .getSizeConstraint(
                                                                context, 50)),
                                                    child: Text(
                                                      product.information[
                                                          'usage_rules'],
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: TextStyle(
                                                        fontSize: GlobalValue
                                                            .getSizeConstraint(
                                                                context, 32),
                                                        fontFamily: "Folks",
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              AspectRatio(
                                                  aspectRatio: 930 / 75),
                                              Row(
                                                children: [
                                                  Text(
                                                    "Rekomendasi Produk",
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                      fontSize: GlobalValue
                                                          .getSizeConstraint(
                                                              context, 42),
                                                      fontFamily: "Folks",
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              AspectRatio(
                                                  aspectRatio: 930 / 20),
                                            ],
                                          )),
                                      FlexSpace(75),
                                    ],
                                  ),
                                  AspectRatio(
                                    aspectRatio: 1080 / 326,
                                    child: SingleChildScrollView(
                                      physics: BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      padding: EdgeInsets.only(
                                        left: GlobalValue.getSizeConstraint(
                                            context, 75),
                                        right: GlobalValue.getSizeConstraint(
                                            context, 75),
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                right: GlobalValue
                                                    .getSizeConstraint(
                                                        context, 50)),
                                            child: AspectRatio(
                                              aspectRatio: 300 / 250,
                                              child: ElevatedButton(
                                                  onPressed: () => launch(
                                                      "https://www.farmaku.com/search?keyword=" +
                                                          product.information[
                                                              'name']),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          elevation: 0,
                                                          padding:
                                                              EdgeInsets.all(0),
                                                          primary: Colors
                                                              .transparent,
                                                          shadowColor: Colors
                                                              .transparent),
                                                  child: Image.asset(
                                                      "assets/Card_Recomendation_1.png")),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                right: GlobalValue
                                                    .getSizeConstraint(
                                                        context, 50)),
                                            child: AspectRatio(
                                              aspectRatio: 300 / 250,
                                              child: ElevatedButton(
                                                  onPressed: () => launch(
                                                      "https://www.k24klik.com/cariObat/" +
                                                          product.information[
                                                              'name']),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          elevation: 0,
                                                          padding:
                                                              EdgeInsets.all(0),
                                                          primary: Colors
                                                              .transparent,
                                                          shadowColor: Colors
                                                              .transparent),
                                                  child: Image.asset(
                                                      "assets/Card_Recomendation_2.png")),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                right: GlobalValue
                                                    .getSizeConstraint(
                                                        context, 50)),
                                            child: AspectRatio(
                                              aspectRatio: 300 / 250,
                                              child: ElevatedButton(
                                                  onPressed: () => launch(
                                                      "https://shopee.co.id/mall/search?keyword=" +
                                                          product.information[
                                                              'name'] +
                                                          "&shop=121791179"),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          elevation: 0,
                                                          padding:
                                                              EdgeInsets.all(0),
                                                          primary: Colors
                                                              .transparent,
                                                          shadowColor: Colors
                                                              .transparent),
                                                  child: Image.asset(
                                                      "assets/Card_Recomendation_3.png")),
                                            ),
                                          ),
                                          Container(
                                            child: AspectRatio(
                                              aspectRatio: 300 / 250,
                                              child: ElevatedButton(
                                                  onPressed: () => launch(
                                                      "https://www.goapotik.com/search?category=all&terms=" +
                                                          product.information[
                                                              'name']),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          elevation: 0,
                                                          padding:
                                                              EdgeInsets.all(0),
                                                          primary: Colors
                                                              .transparent,
                                                          shadowColor: Colors
                                                              .transparent),
                                                  child: Image.asset(
                                                      "assets/Card_Recomendation_4.png")),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  AspectRatio(aspectRatio: 1080 / 100),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          backgroundColor: Color(0xFFF9F9F9),
        ),
      ),
    );
  }
}
