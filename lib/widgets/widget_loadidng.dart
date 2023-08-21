import 'package:flutter/material.dart';
import 'package:shopingapi/constant/colors_app.dart';

WidgetLoadding(context) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => Center(
      child: Container(
        color: AppColors.KPrimaryColor,
        child: const Padding(
          padding: EdgeInsets.all(20.0),
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}
