import 'package:flutter/material.dart';
import 'package:gobat_app/services/GlobalValue.dart';
import 'package:gobat_app/widgets/FlexSpace.dart';
import 'package:gobat_app/widgets/TextFieldShadow.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Stack(
          children: [
            Column(
              children: [
                AspectRatio(aspectRatio: 1080 / 50),
                AspectRatio(
                  aspectRatio: 1080 / 100,
                  child: Row(
                    children: [
                      FlexSpace(75),
                      Flexible(
                        flex: 930,
                        child: SizedBox(
                            width: double.infinity,
                            height: double.infinity,
                            child: TextFieldShadow(
                              labelText:
                                  "Ketik nama produk atau judul artikel yang ingin dicari",
                              controller: _searchController,
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
                      FlexSpace(75),
                    ],
                  ),
                ),
                AspectRatio(aspectRatio: 1080 / 50),
                //Contents
                AspectRatio(aspectRatio: 1080 / 300),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
