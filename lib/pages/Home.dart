// ignore_for_file: unused_element

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gobat_app/models/Product.dart';
import 'package:gobat_app/models/User.dart';
import 'package:gobat_app/pages/MyAccount.dart';
import 'package:gobat_app/services/AccountSessionManager.dart';
import 'package:gobat_app/services/FirestoreService.dart';
import 'package:gobat_app/services/GlobalValue.dart';
import 'package:gobat_app/services/NavigatorServices.dart';
import 'package:gobat_app/widgets/CardProductPopular.dart';
import 'package:gobat_app/widgets/DialogFilterProduct.dart';
import 'package:gobat_app/widgets/FlexSpace.dart';
import 'package:gobat_app/widgets/GridViewMainProducts.dart';
import 'package:gobat_app/widgets/ImageProfileCircular.dart';
import 'package:gobat_app/widgets/LabelCategory.dart';
import 'package:gobat_app/widgets/TextFieldShadow.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _searchProductController =
      TextEditingController();

  final FocusNode _searchProductFocusNode = FocusNode(),
      _searchProductFocusNodeShadow = FocusNode();

  dynamic imageFile;
  bool _isSearchPage = false, _isSearchPageFocus = false;
  late User user;
  late List<Product> products, productsFilter, productsPopular;
  String _textEditingValue = "";
  List<String> sortCriterias = [
    "Nama Produk",
    "Menaik",
  ];

  _showDialogFilterProduct() {
    _searchProductFocusNodeShadow.unfocus();
    _searchProductFocusNode.unfocus();
    showGeneralDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 300),
      barrierDismissible: true,
      barrierLabel: '',
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      },
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return DialogFilterProduct(
          sortCriteria: sortCriterias,
          onConfirmed: (String sort, String type) {
            setState(() {
              sortCriterias = [sort, type];
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    user = Provider.of<User>(context);
    products = Provider.of<List<Product>>(context);

    List<String> categories = [];
    if (products.isNotEmpty) {
      for (var product in products) {
        if (!categories.contains(product.category)) {
          categories.add(product.category);
        }
      }
      categories.add("Lainnya");
    }

    productsFilter = products;
    if (products.isNotEmpty) {
      if (sortCriterias[0] == "Nama Produk" && sortCriterias[1] == 'Menaik') {
        productsFilter.sort(
            (a, b) => a.information['name'].compareTo(b.information['name']));
      } else if (sortCriterias[0] == "Nama Produk" &&
          sortCriterias[1] == 'Menurun') {
        productsFilter.sort(
            (a, b) => b.information['name'].compareTo(a.information['name']));
      } else if (sortCriterias[0] == "Paling Banyak Dilihat" &&
          sortCriterias[1] == 'Menurun') {
        productsFilter
            .sort((a, b) => b.counter['views']!.compareTo(a.counter['views']!));
      } else if (sortCriterias[0] == "Paling Banyak Dilihat" &&
          sortCriterias[1] == 'Menaik') {
        productsFilter
            .sort((a, b) => a.counter['views']!.compareTo(b.counter['views']!));
      } else if (sortCriterias[0] == "Paling Banyak Disukai" &&
          sortCriterias[1] == 'Menurun') {
        productsFilter.sort((a, b) =>
            b.counter['favorites']!.compareTo(a.counter['favorites']!));
      } else if (sortCriterias[0] == "Paling Banyak Disukai" &&
          sortCriterias[1] == 'Menaik') {
        productsFilter.sort((a, b) =>
            a.counter['favorites']!.compareTo(b.counter['favorites']!));
      }
    }

    if (_textEditingValue.isNotEmpty) {
      productsFilter = productsFilter
          .where((element) => element.information['name']
              .toString()
              .toLowerCase()
              .contains(_textEditingValue.toLowerCase()))
          .toList();
    }

    productsPopular = products.isEmpty ? products : products.sublist(0, 5);
    productsPopular.sort((a, b) =>
        (b.counter['views']! + b.counter['favorites']!)
            .compareTo((a.counter['views']! + a.counter['favorites']!)));

    List<Widget> listPopular = [];

    int order = 1;
    productsPopular.forEach((product) {
      listPopular.add(CardProductPopular(
        context: context,
        shapePath: "assets/Shape_ProductFav_" + order.toString() + ".svg",
        user: user,
        product: product,
      ));

      listPopular.add(AspectRatio(aspectRatio: 30 / 348));
      order++;
    });

    if (user.image != "")
      imageFile = Image(image: NetworkImage(user.image));
    else
      imageFile = null;

    if (_isSearchPage && !_isSearchPageFocus) {
      setState(() {
        _isSearchPageFocus = true;
      });
      _searchProductFocusNodeShadow.requestFocus();
      _searchProductFocusNode.requestFocus();
    }

    return Container(
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Stack(
          children: [
            AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(opacity: animation, child: child);
              },
              child: !_isSearchPage
                  ? Column(
                      children: [
                        AspectRatio(aspectRatio: 1080 / 50),
                        AspectRatio(
                          aspectRatio: 1080 / 136,
                          child: Row(
                            children: [
                              FlexSpace(75),
                              Flexible(
                                flex: 930,
                                child: Row(
                                  children: [
                                    Flexible(
                                      flex: 694,
                                      child: SizedBox(
                                        width: double.infinity,
                                        height: double.infinity,
                                        child: AutoSizeText(
                                          "Selamat Datang,\n" + user.fullname,
                                          textAlign: TextAlign.start,
                                          maxLines: 2,
                                          minFontSize: 1,
                                          style: TextStyle(
                                            overflow: TextOverflow.clip,
                                            fontSize: 100,
                                            fontFamily: "Folks",
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                    FlexSpace(100),
                                    Flexible(
                                      flex: 136,
                                      child: Center(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              AccountSessionManager()
                                                  .getActiveUserId()
                                                  .then(
                                                    (userId) =>
                                                        Navigator.of(context)
                                                            .push(
                                                      NavigatorSlide(
                                                          child: StreamProvider<
                                                              User>.value(
                                                            value:
                                                                FirestoreService()
                                                                    .user(
                                                                        userId ??
                                                                            ""),
                                                            initialData:
                                                                User.empty,
                                                            child: MyAccount(),
                                                          ),
                                                          direction:
                                                              AxisDirection
                                                                  .right),
                                                    ),
                                                  );
                                            },
                                            style: ElevatedButton.styleFrom(
                                              padding: EdgeInsets.all(0),
                                              primary: Colors.transparent,
                                              shadowColor: Colors.transparent,
                                            ),
                                            child: ImageProfileCircular(
                                              context,
                                              0.006,
                                              Color(0xFFE8E8E8),
                                              imageFile ??
                                                  Image.asset(
                                                      "assets/Photo_DefaultProfileUser.png"),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              FlexSpace(75),
                            ],
                          ),
                        ),
                        AspectRatio(aspectRatio: 1080 / 50),
                        AspectRatio(
                          aspectRatio: 1080 / 300,
                          child: Row(
                            children: [
                              FlexSpace(75),
                              Flexible(
                                flex: 930,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFF404040),
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          MediaQuery.of(context).size.width *
                                              0.03),
                                    ),
                                  ),
                                ),
                              ),
                              FlexSpace(75),
                            ],
                          ),
                        ),
                        AspectRatio(aspectRatio: 1080 / 50),
                        AspectRatio(
                          aspectRatio: 1080 / 100,
                          child: Row(
                            children: [
                              FlexSpace(75),
                              Flexible(
                                flex: 930,
                                child: Row(
                                  children: [
                                    Flexible(
                                      flex: 800,
                                      child: SizedBox(
                                          width: double.infinity,
                                          height: double.infinity,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              setState(() {
                                                _isSearchPage = true;
                                              });
                                            },
                                            style: ElevatedButton.styleFrom(
                                              padding: EdgeInsets.all(0),
                                              primary: Colors.transparent,
                                              shadowColor: Colors.transparent,
                                              elevation: 0,
                                            ),
                                            child: TextFieldShadow(
                                              labelText:
                                                  "Ketik nama dari produk yang ingin dicari",
                                              controller:
                                                  _searchProductController,
                                              borderSize: 10,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: GlobalValue
                                                          .getSizeConstraint(
                                                              context, 34),
                                                      horizontal: GlobalValue
                                                          .getSizeConstraint(
                                                              context, 30)),
                                              shadowBlur: 10,
                                              shadowSpread: 3,
                                              shadowColor:
                                                  const Color(0x40000000),
                                              textFieldBackground: Colors.white,
                                              fontSize: 36,
                                              enabled: false,
                                            ),
                                          )),
                                    ),
                                    FlexSpace(30),
                                    Flexible(
                                      flex: 100,
                                      child: Center(
                                        child: AspectRatio(
                                          aspectRatio: 1 / 1,
                                          child: SizedBox(
                                            width: double.infinity,
                                            height: double.infinity,
                                            child: IconButton(
                                              onPressed: () =>
                                                  _showDialogFilterProduct(),
                                              padding: EdgeInsets.all(0),
                                              icon: Image.asset(
                                                  "assets/Icon_FilterBox.png"),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              FlexSpace(75),
                            ],
                          ),
                        ),
                        AspectRatio(aspectRatio: 1080 / 75),
                        AspectRatio(
                          aspectRatio: 1080 / 59,
                          child: Row(
                            children: [
                              FlexSpace(75),
                              Flexible(
                                flex: 930,
                                child: AutoSizeText(
                                  "Kategori",
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                  minFontSize: 1,
                                  style: TextStyle(
                                    overflow: TextOverflow.clip,
                                    fontSize: 100,
                                    fontFamily: "Folks",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              FlexSpace(75),
                            ],
                          ),
                        ),
                        AspectRatio(aspectRatio: 1080 / 30),
                        AspectRatio(
                          aspectRatio: 1080 / 100,
                          child: SingleChildScrollView(
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.0695,
                              right: MediaQuery.of(context).size.width * 0.0695,
                            ),
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            child: Row(
                              children: categories.map((category) {
                                return LabelCategory(
                                  userId: user.id,
                                  context: context,
                                  iconPath: "assets/Icon_Category" +
                                      category.replaceAll(" ", "") +
                                      ".png",
                                  name: category,
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        AspectRatio(aspectRatio: 1080 / 75),
                        AspectRatio(
                          aspectRatio: 1080 / 59,
                          child: Row(
                            children: [
                              FlexSpace(75),
                              Flexible(
                                flex: 930,
                                child: AutoSizeText(
                                  "Produk Terpopuler",
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                  minFontSize: 1,
                                  style: TextStyle(
                                    overflow: TextOverflow.clip,
                                    fontSize: 100,
                                    fontFamily: "Folks",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              FlexSpace(75),
                            ],
                          ),
                        ),
                        AspectRatio(aspectRatio: 1080 / 30),
                        AspectRatio(
                          aspectRatio: 1080 / 348,
                          child: SingleChildScrollView(
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.0695,
                              right: MediaQuery.of(context).size.width * 0.0695,
                            ),
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            child: Row(
                              children: listPopular,
                            ),
                          ),
                        ),
                        AspectRatio(aspectRatio: 1080 / 75),
                        AspectRatio(
                          aspectRatio: 1080 / 59,
                          child: Row(
                            children: [
                              FlexSpace(75),
                              Flexible(
                                flex: 930,
                                child: AutoSizeText(
                                  "Semua Produk",
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                  minFontSize: 1,
                                  style: TextStyle(
                                    overflow: TextOverflow.clip,
                                    fontSize: 100,
                                    fontFamily: "Folks",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              FlexSpace(75),
                            ],
                          ),
                        ),
                        AspectRatio(aspectRatio: 1080 / 40),
                        GridViewMainProducts(context, user, productsFilter),
                        AspectRatio(aspectRatio: 1080 / 300),
                      ],
                    )
                  : Column(
                      children: [
                        AspectRatio(aspectRatio: 1080 / 50),
                        AspectRatio(
                          aspectRatio: 1080 / 100,
                          child: Row(
                            children: [
                              FlexSpace(75),
                              Flexible(
                                flex: 930,
                                child: Row(
                                  children: [
                                    Flexible(
                                      flex: 800,
                                      child: SizedBox(
                                          width: double.infinity,
                                          height: double.infinity,
                                          child: TextFieldShadow(
                                            labelText:
                                                "Ketik nama dari produk yang ingin dicari",
                                            controller:
                                                _searchProductController,
                                            borderSize: 10,
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: GlobalValue
                                                        .getSizeConstraint(
                                                            context, 34),
                                                    horizontal: GlobalValue
                                                        .getSizeConstraint(
                                                            context, 30)),
                                            shadowBlur: 10,
                                            shadowSpread: 3,
                                            shadowColor:
                                                const Color(0x40000000),
                                            textFieldBackground: Colors.white,
                                            fontSize: 36,
                                            focusNode: _searchProductFocusNode,
                                            focusNodeShadow:
                                                _searchProductFocusNodeShadow,
                                            onChanged: (String value) {
                                              setState(() {
                                                _textEditingValue = value;
                                              });
                                            },
                                          )),
                                    ),
                                    FlexSpace(30),
                                    Flexible(
                                      flex: 100,
                                      child: Center(
                                        child: AspectRatio(
                                          aspectRatio: 1 / 1,
                                          child: SizedBox(
                                            width: double.infinity,
                                            height: double.infinity,
                                            child: IconButton(
                                              onPressed: () =>
                                                  _showDialogFilterProduct(),
                                              padding: EdgeInsets.all(0),
                                              icon: Image.asset(
                                                  "assets/Icon_FilterBox.png"),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              FlexSpace(75),
                            ],
                          ),
                        ),
                        AspectRatio(aspectRatio: 1080 / 40),
                        GridViewMainProducts(context, user, productsFilter),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
