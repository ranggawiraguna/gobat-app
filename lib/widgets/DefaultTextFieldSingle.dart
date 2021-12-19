// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

SizedBox DefaultTextFieldSingle({
  required String label,
  required TextEditingController controller,
  required TextInputType textInputType,
  required TextInputAction textInputAction,
  bool obscureText = false,
  Function(String)? onChanged,
}) {
  return SizedBox(
    width: double.infinity,
    child: TextFormField(
      textAlign: TextAlign.center,
      obscureText: obscureText,
      scrollPadding: EdgeInsets.all(0),
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        label: SizedBox(
          width: double.infinity,
          child: Center(
              child: Text(
            label,
            style: TextStyle(fontFamily: "Folks"),
          )),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(),
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
