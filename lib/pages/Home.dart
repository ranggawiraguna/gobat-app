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
  dynamic imageFile;
  bool _isSearchPage = false;
  late User user;
  late List<Product> products;
  late List<Product> productsFilter;
  late List<String> sortCriterias;

  @override
  void initState() {
    sortCriterias = [
      "name",
      "ascending",
    ];

    super.initState();
  }

  _showDialogFilterProduct() {
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
        return DialogFilterProduct();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    user = Provider.of<User>(context);
    products = Provider.of<List<Product>>(context);

    List<String> categories = [];
    for (var product in products) {
      if (!categories.contains(product.category)) {
        categories.add(product.category);
      }
    }
    categories.add("Lainnya");

    productsFilter = products;
    if (sortCriterias[0] == "name" && sortCriterias[1] == 'ascending') {
      productsFilter.sort(
          (a, b) => a.information['name'].compareTo(b.information['name']));
    } else if (sortCriterias[0] == "name" && sortCriterias[1] == 'descending') {
      productsFilter.sort(
          (a, b) => b.information['name'].compareTo(a.information['name']));
    }

    if (user.image != "")
      imageFile = Image(image: NetworkImage(user.image));
    else
      imageFile = null;

    return AnimatedSwitcher(
      duration: Duration(milliseconds: 500),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: (MediaQuery.of(context).size.height -
              MediaQuery.of(context).padding.top),
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Stack(
              children: [
                Column(
                  children: [
                    !_isSearchPage
                        ? AspectRatio(aspectRatio: 1080 / 50)
                        : SizedBox.shrink(),
                    !_isSearchPage
                        ? AspectRatio(
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
                                                            child:
                                                                StreamProvider<
                                                                    User>.value(
                                                              value: FirestoreService()
                                                                  .user(
                                                                      userId ??
                                                                          ""),
                                                              initialData:
                                                                  User.empty,
                                                              child:
                                                                  MyAccount(),
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
                          )
                        : SizedBox.shrink(),
                    !_isSearchPage
                        ? AspectRatio(aspectRatio: 1080 / 50)
                        : SizedBox.shrink(),
                    !_isSearchPage
                        ? AspectRatio(
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
                          )
                        : SizedBox.shrink(),
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
                                        controller: _searchProductController,
                                        borderSize: 10,
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical:
                                                GlobalValue.getSizeConstraint(
                                                    context, 34),
                                            horizontal:
                                                GlobalValue.getSizeConstraint(
                                                    context, 30)),
                                        shadowBlur: 10,
                                        shadowSpread: 3,
                                        shadowColor: const Color(0x40000000),
                                        textFieldBackground: Colors.white,
                                        fontSize: 36,
                                        onTap: () {},
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
                    !_isSearchPage
                        ? AspectRatio(aspectRatio: 1080 / 75)
                        : SizedBox.shrink(),
                    !_isSearchPage
                        ? AspectRatio(
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
                          )
                        : SizedBox.shrink(),
                    !_isSearchPage
                        ? AspectRatio(aspectRatio: 1080 / 30)
                        : SizedBox.shrink(),
                    !_isSearchPage
                        ? AspectRatio(
                            aspectRatio: 1080 / 100,
                            child: SingleChildScrollView(
                              padding: EdgeInsets.only(
                                left:
                                    MediaQuery.of(context).size.width * 0.0695,
                                right:
                                    MediaQuery.of(context).size.width * 0.0695,
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
                          )
                        : SizedBox.shrink(),
                    !_isSearchPage
                        ? AspectRatio(aspectRatio: 1080 / 75)
                        : SizedBox.shrink(),
                    !_isSearchPage
                        ? AspectRatio(
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
                          )
                        : SizedBox.shrink(),
                    !_isSearchPage
                        ? AspectRatio(aspectRatio: 1080 / 30)
                        : SizedBox.shrink(),
                    !_isSearchPage
                        ? AspectRatio(
                            aspectRatio: 1080 / 348,
                            child: SingleChildScrollView(
                              padding: EdgeInsets.only(
                                left:
                                    MediaQuery.of(context).size.width * 0.0695,
                                right:
                                    MediaQuery.of(context).size.width * 0.0695,
                              ),
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              child: Row(
                                children: [
                                  CardProductPopular(
                                    context: context,
                                    shapePath: "assets/Shape_ProductFav_1.svg",
                                    user: user,
                                    product: productsFilter.length != 0
                                        ? productsFilter[0]
                                        : Product.empty,
                                  ),
                                  AspectRatio(aspectRatio: 30 / 348),
                                  CardProductPopular(
                                    context: context,
                                    shapePath: "assets/Shape_ProductFav_2.svg",
                                    user: user,
                                    product: productsFilter.length != 0
                                        ? productsFilter[1]
                                        : Product.empty,
                                  ),
                                  AspectRatio(aspectRatio: 30 / 348),
                                  AspectRatio(aspectRatio: 30 / 348),
                                  CardProductPopular(
                                    context: context,
                                    shapePath: "assets/Shape_ProductFav_3.svg",
                                    user: user,
                                    product: productsFilter.length != 0
                                        ? productsFilter[2]
                                        : Product.empty,
                                  ),
                                  AspectRatio(aspectRatio: 30 / 348),
                                  AspectRatio(aspectRatio: 30 / 348),
                                  CardProductPopular(
                                    context: context,
                                    shapePath: "assets/Shape_ProductFav_4.svg",
                                    user: user,
                                    product: productsFilter.length != 0
                                        ? productsFilter[3]
                                        : Product.empty,
                                  ),
                                  AspectRatio(aspectRatio: 30 / 348),
                                  AspectRatio(aspectRatio: 30 / 348),
                                  CardProductPopular(
                                    context: context,
                                    shapePath: "assets/Shape_ProductFav_5.svg",
                                    user: user,
                                    product: productsFilter.length != 0
                                        ? productsFilter[4]
                                        : Product.empty,
                                  ),
                                  AspectRatio(aspectRatio: 30 / 348),
                                ],
                              ),
                            ),
                          )
                        : SizedBox.shrink(),
                    !_isSearchPage
                        ? AspectRatio(aspectRatio: 1080 / 75)
                        : SizedBox.shrink(),
                    !_isSearchPage
                        ? AspectRatio(
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
                          )
                        : SizedBox.shrink(),
                    AspectRatio(aspectRatio: 1080 / 40),
                    GridViewMainProducts(context, user, productsFilter),
                    AspectRatio(aspectRatio: 1080 / 300),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
