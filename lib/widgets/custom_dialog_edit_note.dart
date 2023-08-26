import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Column CustomInputField({
  required String hintText,
  bool? isDense,
  bool obscureText = false,
  required TextInputType textInputType,
  required void Function(String) onchange,
  TextEditingController? controller,
}) {
  return Column(
    children: [
      TextField(
        onChanged: onchange,
        controller: controller,
        keyboardType: textInputType,
        decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          isDense: (isDense != null) ? isDense : false,
          hintText: hintText,
          suffixIconConstraints:
              (isDense != null) ? const BoxConstraints(maxHeight: 33) : null,
        ),
      ),
    ],
  );
}
