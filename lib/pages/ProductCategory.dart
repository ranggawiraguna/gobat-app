// ignore_for_file: non_constant_identifier_names, unused_element

import 'package:flutter/material.dart';
import 'package:gobat_app/models/Product.dart';
import 'package:gobat_app/models/User.dart';
import 'package:gobat_app/services/GlobalValue.dart';
import 'package:gobat_app/widgets/DialogFilterProduct.dart';
import 'package:gobat_app/widgets/FlexSpace.dart';
import 'package:gobat_app/widgets/GridViewMainProducts.dart';
import 'package:gobat_app/widgets/SubProfileContainer.dart';
import 'package:gobat_app/widgets/TextFieldShadow.dart';
import 'package:provider/provider.dart';

class ProductCategory extends StatefulWidget {
  final String category;

  ProductCategory({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  _ProductCategoryState createState() => _ProductCategoryState();
}

class _ProductCategoryState extends State<ProductCategory> {
  final TextEditingController _searchProductController =
      TextEditingController();

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
    user = Provider.of<User?>(context) ?? User.empty;
    products = Provider.of<List<Product>>(context)
        .where((element) => element.category == widget.category)
        .toList();

    productsFilter = products;
    if (sortCriterias[0] == "name" && sortCriterias[1] == 'ascending') {
      productsFilter.sort(
          (a, b) => a.information['name'].compareTo(b.information['name']));
    } else if (sortCriterias[0] == "name" && sortCriterias[1] == 'descending') {
      productsFilter.sort(
          (a, b) => b.information['name'].compareTo(a.information['name']));
    }

    return SubProfileContainer(
      context: context,
      withAppBar: false,
      userId: user.id,
      title: widget.category,
      child: Column(
        children: [
          AspectRatio(aspectRatio: 1080 / 75),
          AspectRatio(
            aspectRatio: 1080 / 100,
            child: Row(
              children: [
                FlexSpace(85),
                Flexible(
                  flex: 910,
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
                                  vertical: GlobalValue.getSizeConstraint(
                                      context, 34),
                                  horizontal: GlobalValue.getSizeConstraint(
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
                                onPressed: () => _showDialogFilterProduct(),
                                padding: EdgeInsets.all(0),
                                icon: Image.asset("assets/Icon_FilterBox.png"),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                FlexSpace(85),
              ],
            ),
          ),
          AspectRatio(aspectRatio: 1080 / 75),
          GridViewMainProducts(context, user, productsFilter),
        ],
      ),
      makeClearFocus: false,
    );
  }
}
