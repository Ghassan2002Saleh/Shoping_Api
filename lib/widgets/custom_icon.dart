import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    super.key,
    this.icon = Icons.search,
  });
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 46,
        width: 46,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color.fromARGB(255, 56, 56, 56),
        ),
        child: Center(
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ));
  }
}
