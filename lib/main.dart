import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopingapi/view/screen/auth%20screen/forgot_password_screen.dart';
import 'package:shopingapi/view/screen/auth%20screen/login_screen.dart';
import 'package:shopingapi/view/screen/auth%20screen/signup_screen.dart';
import 'package:shopingapi/constant/colors_app.dart';
import 'package:shopingapi/constant/constants.dart';
import 'package:shopingapi/pref/shared_pref_controller.dart';
import 'package:shopingapi/view/screen/images_screen/images_screen.dart';
import 'package:shopingapi/view/screen/images_screen/upload_image_screen.dart';
import 'package:shopingapi/view/screen/main_home_screen/bottom_navigation_bar_admin.dart';
import 'package:shopingapi/view/screen/splash_screen/splash_screen.dart';
import 'package:shopingapi/view/screen/user_screen/users_screen.dart';
import 'package:shopingapi/view/screen/task_screen/view_task_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initPreferences();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: AppColors.KPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: AppColors.KPrimaryColor,
              shape: const StadiumBorder(),
              maximumSize: const Size(double.infinity, 56),
              minimumSize: const Size(double.infinity, 56),
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: AppColors.kPrimaryLightColor,
            iconColor: AppColors.KPrimaryColor,
            prefixIconColor: AppColors.KPrimaryColor,
            contentPadding: EdgeInsets.symmetric(
                horizontal: defaultPadding, vertical: defaultPadding),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide.none,
            ),
          )),
      initialRoute: '/splash_screen',
      routes: {
        '/splash_screen': (context) => const SplashScreen(),
        '/BottomNavigationBar_screen': (context) =>
            const BottomNavigationBarScreen(),
        '/users_screen': (context) => const UsersScreen(),
        '/login_screen': (context) => const LoginScreen(),
        '/signup_screen': (context) => const SignupScreen(),
        '/forgot_password_screen': (context) => const ForgotPasswordScreen(),
        '/images_screen': (context) => const ImagesScreen(),
        '/upload_image_screen': (context) => const UplaoadImageScreen(),
        '/view_task_screen': (context) => const ViewTaskScreen(),
      },
    );
  }
}
