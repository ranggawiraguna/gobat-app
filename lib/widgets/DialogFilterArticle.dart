// ignore_for_file: file_names, avoid_print

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gobat_app/services/GlobalValue.dart';
import 'package:gobat_app/widgets/FlexButton.dart';
import 'package:gobat_app/widgets/FlexSpace.dart';
import 'package:gobat_app/widgets/GeneralRadioItem.dart';

class DialogFilterArticle extends StatefulWidget {
  final void Function(String sort, String type) onConfirmed;
  final List<String> sortCriteria;

  const DialogFilterArticle({
    Key? key,
    required this.onConfirmed,
    required this.sortCriteria,
  }) : super(key: key);

  @override
  _DialogFilterArticleState createState() => _DialogFilterArticleState();
}

class _DialogFilterArticleState extends State<DialogFilterArticle> {
  List<String> _sortValues = [
        "Judul Artikel",
        "Paling Banyak Dilihat",
        "Paling Banyak Disukai",
      ],
      _typeValues = [
        "Menurun",
        "Menaik",
      ];

  String _sortValue = "", _typeValue = "";

  @override
  Widget build(BuildContext context) {
    if (_sortValue.isEmpty && _typeValue.isEmpty) {
      setState(() {
        _sortValue = widget.sortCriteria[0];
        _typeValue = widget.sortCriteria[1];
      });
    }

    return AlertDialog(
        backgroundColor: Colors.transparent,
        contentPadding: const EdgeInsets.all(0),
        insetPadding: const EdgeInsets.all(0),
        titlePadding: const EdgeInsets.all(0),
        buttonPadding: const EdgeInsets.all(0),
        actionsPadding: const EdgeInsets.all(0),
        content: SingleChildScrollView(
          reverse: true,
          child: SizedBox(
            width: GlobalValue.getSizeConstraint(context, 1030),
            height: GlobalValue.getSizeConstraint(context, 903),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: GlobalValue.getSizeConstraint(context, 930),
                    height: GlobalValue.getSizeConstraint(context, 803),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            GlobalValue.getSizeConstraint(context, 20)),
                        color: const Color(0xFFF7FBFE),
                      ),
                      child: Row(
                        children: [
                          FlexSpace(75),
                          Flexible(
                            flex: 780,
                            child: Column(
                              children: [
                                FlexSpace(75),
                                Flexible(
                                    flex: 52,
                                    child: SizedBox(
                                      width: double.infinity,
                                      height: double.infinity,
                                      child: AutoSizeText(
                                        "Urut Berdasarkan",
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
                                    )),
                                FlexSpace(20),
                                Flexible(
                                  flex: 176,
                                  child: GridView.count(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    crossAxisCount: 1,
                                    childAspectRatio: 780 / 42,
                                    mainAxisSpacing:
                                        GlobalValue.getSizeConstraint(
                                            context, 25),
                                    padding: EdgeInsets.all(0),
                                    shrinkWrap: true,
                                    children: _sortValues.map((value) {
                                      return GeneralRadioItem(
                                        label: value,
                                        value: value,
                                        groupValue: _sortValue,
                                        onChanged: (String newValue) {
                                          setState(() => _sortValue = newValue);
                                        },
                                      );
                                    }).toList(),
                                  ),
                                ),
                                FlexSpace(50),
                                Flexible(
                                    flex: 52,
                                    child: SizedBox(
                                      width: double.infinity,
                                      height: double.infinity,
                                      child: AutoSizeText(
                                        "Urut Berdasarkan",
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
                                    )),
                                FlexSpace(20),
                                Flexible(
                                  flex: 109,
                                  child: GridView.count(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    crossAxisCount: 1,
                                    childAspectRatio: 780 / 42,
                                    mainAxisSpacing:
                                        GlobalValue.getSizeConstraint(
                                            context, 25),
                                    padding: EdgeInsets.all(0),
                                    shrinkWrap: true,
                                    children: _typeValues.map((value) {
                                      return GeneralRadioItem(
                                        label: value,
                                        value: value,
                                        groupValue: _typeValue,
                                        onChanged: (String newValue) {
                                          setState(() => _typeValue = newValue);
                                        },
                                      );
                                    }).toList(),
                                  ),
                                ),
                                FlexSpace(75),
                                FlexButton(
                                  flexButton: 99,
                                  innerSpaceVertical: 20,
                                  innerSpaceHorizontal: 196,
                                  flexTextVertical: 59,
                                  flexTextHorizontal: 200,
                                  textContent: "Terapkan",
                                  textColor: Colors.white,
                                  buttonColor: Color(0xFFFF583C),
                                  buttonRadius:
                                      MediaQuery.of(context).size.width *
                                          (20 / 1080),
                                  action: () {
                                    widget.onConfirmed(_sortValue, _typeValue);
                                    Navigator.of(context, rootNavigator: true)
                                        .pop();
                                  },
                                ),
                                FlexSpace(75),
                              ],
                            ),
                          ),
                          FlexSpace(75),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 0.0,
                  top: 0.0,
                  child: SizedBox(
                    width: GlobalValue.getSizeConstraint(context, 100),
                    height: GlobalValue.getSizeConstraint(context, 100),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).pop();
                      },
                      padding: const EdgeInsets.all(0),
                      splashRadius: 1,
                      icon: SvgPicture.asset("assets/Icon_CloseDialog.svg"),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
