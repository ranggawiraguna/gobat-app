// ignore_for_file: file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gobat_app/services/GlobalValue.dart';

class DialogFilterProduct extends StatefulWidget {
  const DialogFilterProduct({Key? key}) : super(key: key);

  @override
  _DialogFilterProductState createState() => _DialogFilterProductState();
}

class _DialogFilterProductState extends State<DialogFilterProduct> {
  @override
  Widget build(BuildContext context) {
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
            height: GlobalValue.getSizeConstraint(context, 1150),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: GlobalValue.getSizeConstraint(context, 930),
                    height: GlobalValue.getSizeConstraint(context, 1050),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            GlobalValue.getSizeConstraint(context, 20)),
                        color: const Color(0xFFF7FBFE),
                      ),
                      child: Column(
                        children: [],
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
