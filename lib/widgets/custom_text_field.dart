import 'package:flutter/material.dart';
import 'package:shopingapi/constant/colors_app.dart';
import 'package:shopingapi/constant/constants.dart';

TextField CustomTextField({
  required TextInputType textinputtype,
  required Function(String) onChange,
  required String hinttext,
  required IconData icon,
  bool obscureText = false,
}) {
  return TextField(
    obscureText: obscureText,
    keyboardType: textinputtype,
    cursorColor: AppColors.KPrimaryColor,
    onChanged: onChange,
    decoration: InputDecoration(
      hintText: hinttext,
      prefixIcon: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Icon(icon),
      ),
    ),
  );
}
