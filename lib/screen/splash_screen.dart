import 'package:flutter/material.dart';
import 'package:shopingapi/constant/colors_app.dart';
import 'package:get/get.dart';
import 'package:shopingapi/pref/shared_pref_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), (() {
      String route =
          SharedPrefController().loggedIn ? '/users_screen' : '/login_screen';
      Get.offNamed(route);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: AlignmentDirectional.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd,
              colors: [AppColors.KPrimaryColor, AppColors.KSupColor]),
        ),
        child: const Text('Shoping',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
