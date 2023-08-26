import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopingapi/api/controllers/auth_api_controller.dart';
import 'package:shopingapi/constant/colors_app.dart';
import 'package:shopingapi/model/list/list_icons.dart';
import 'package:shopingapi/model/list/list_page_view.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

bool unread = false;

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  var isDeviceConnected = false;
  bool isAlertSet = false;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: AppColors.KPrimaryColor,
        elevation: 0.0,
        title: const Text('My Task',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.whiteColor)),
        actions: [
          IconButton(
              onPressed: () async {
                await AuthApiController().logout(context);
                Get.offAllNamed('/splash_screen');
              },
              icon: const Icon(
                Icons.logout,
                color: AppColors.whiteColor,
              ))
        ],
        centerTitle: true,
      ),
      body: body[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        animationDuration: const Duration(milliseconds: 400),
        index: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        items: itemIcons,
        backgroundColor: Colors.transparent,
        color: AppColors.KPrimaryColor,
      ),
    );
  }
}
