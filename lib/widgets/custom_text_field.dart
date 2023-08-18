import 'package:flutter/material.dart';
import 'package:shopingapi/constant/colors_app.dart';
import 'package:shopingapi/constant/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.textinputtype,
    required this.controller,
    required this.hinttext,
    required this.icon,
    this.obscureText = false,
  });
  final TextInputType textinputtype;
  final TextEditingController controller;
  final String hinttext;
  final IconData icon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        obscureText: obscureText,
        keyboardType: textinputtype,
        cursorColor: AppColors.KPrimaryColor,
        controller: controller,
        decoration: InputDecoration(
          hintText: hinttext,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Icon(icon),
          ),
        ),
      ),
    );
  }
}
