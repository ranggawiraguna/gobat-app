import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
AspectRatio DefaultTextField(
    {double aspectRatio,
    String label,
    TextEditingController controller,
    TextInputType textInputType,
    TextInputAction textInputAction,
    bool obscureText,
    IconButton iconSuffix}) {
  return AspectRatio(
    aspectRatio: aspectRatio,
    child: AutoSizeTextField(
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        suffixIcon: iconSuffix != null ? iconSuffix : null,
      ),
      keyboardType: textInputType,
      textInputAction: textInputAction,
      style: TextStyle(
        fontFamily: "Folks",
        color: Colors.black,
      ),
    ),
  );
}
