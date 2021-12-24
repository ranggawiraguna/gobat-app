// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:gobat_app/services/GlobalValue.dart';

class TextFieldShadow extends StatefulWidget {
  final TextEditingController controller;
  final double borderSize;
  final String labelText;
  final Color textFieldBackground;
  final EdgeInsetsGeometry contentPadding;
  final double shadowBlur;
  final double shadowSpread;
  final Color shadowColor;
  final double fontSize;
  final bool? enabled;
  final FocusNode? focusNode;
  final FocusNode? focusNodeShadow;
  final void Function(String value)? onChanged;

  const TextFieldShadow({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.borderSize,
    required this.textFieldBackground,
    required this.contentPadding,
    required this.shadowBlur,
    required this.shadowSpread,
    required this.shadowColor,
    required this.fontSize,
    this.enabled,
    this.focusNode,
    this.focusNodeShadow,
    this.onChanged,
  }) : super(key: key);

  @override
  _TextFieldShadowState createState() => _TextFieldShadowState();
}

class _TextFieldShadowState extends State<TextFieldShadow> {
  late Color shadowColor;

  @override
  void initState() {
    shadowColor = widget.shadowColor;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
                GlobalValue.getSizeConstraint(context, widget.borderSize)),
            boxShadow: [
              BoxShadow(
                color: shadowColor,
                blurRadius:
                    GlobalValue.getSizeConstraint(context, widget.shadowBlur),
                spreadRadius:
                    GlobalValue.getSizeConstraint(context, widget.shadowSpread),
              )
            ]),
        child: Focus(
          focusNode: widget.focusNodeShadow,
          onFocusChange: (hasFocus) {
            setState(() {
              shadowColor =
                  hasFocus ? const Color(0xFF2C98F0) : const Color(0x40000000);
            });
          },
          child: TextField(
            focusNode: widget.focusNode,
            enabled: widget.enabled ?? true,
            controller: widget.controller,
            onChanged: (String value) {
              if (widget.onChanged != null) {
                widget.onChanged!(value);
              }
            },
            decoration: InputDecoration(
              isDense: true,
              labelText: widget.labelText,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              contentPadding: widget.contentPadding,
              filled: true,
              fillColor: widget.textFieldBackground,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                    GlobalValue.getSizeConstraint(context, widget.borderSize)),
                borderSide: BorderSide.none,
              ),
            ),
            textAlign: TextAlign.start,
            maxLines: 1,
            style: TextStyle(
              fontFamily: 'Folks',
              fontSize: GlobalValue.getSizeConstraint(context, widget.fontSize),
            ),
          ),
        ));
  }
}
