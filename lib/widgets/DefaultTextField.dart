// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

SizedBox DefaultTextField({
  required String label,
  required TextEditingController controller,
  required TextInputType textInputType,
  required TextInputAction textInputAction,
  bool obscureText = false,
  IconButton? iconSuffix,
  Function(String)? onChanged,
  String? errorText,
  bool? readOnly,
}) {
  return SizedBox(
    width: double.infinity,
    child: TextFormField(
      readOnly: readOnly ?? false,
      obscureText: obscureText,
      scrollPadding: EdgeInsets.all(0),
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        labelText: label,
        labelStyle: TextStyle(fontFamily: "Folks"),
        errorStyle: TextStyle(fontFamily: "Folks"),
        errorText: errorText,
        border: OutlineInputBorder(),
        suffixIcon: iconSuffix,
      ),
      keyboardType: textInputType,
      textInputAction: textInputAction,
      style: TextStyle(
        fontSize: 15,
        fontFamily: "Folks",
        color: Colors.black,
      ),
      onChanged: onChanged,
    ),
  );
}
