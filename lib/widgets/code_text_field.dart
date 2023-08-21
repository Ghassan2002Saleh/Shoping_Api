import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CodeTextField extends StatelessWidget {
  const CodeTextField({
    super.key,
    required this.controller,
    required this.onChange,
    required this.onSubmitted,
    required this.focusNode,
  });
  final FocusNode focusNode;
  final TextEditingController controller;
  final Function(String value) onChange;
  final Function(String value) onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: TextField(
      focusNode: focusNode,
      controller: controller,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.done,
      maxLength: 1,
      style: GoogleFonts.montserrat(fontSize: 20),
      textAlign: TextAlign.center,
      onChanged: onChange,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
          counterText: '',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 1))),
    ));
  }
}
