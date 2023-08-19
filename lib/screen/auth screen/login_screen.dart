import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopingapi/api/api_response.dart';
import 'package:shopingapi/api/controllers/auth_api_controller.dart';
import 'package:shopingapi/screen/auth%20screen/signup_screen.dart';

import 'package:shopingapi/constant/colors_app.dart';
import 'package:shopingapi/widgets/custom_form_button.dart';
import 'package:shopingapi/widgets/custom_text_field.dart';
import 'package:shopingapi/widgets/page_header.dart';
import 'package:shopingapi/widgets/page_heading.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailContrroller = TextEditingController();
  TextEditingController passwordContrroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kPrimaryLightColor,
        body: Column(
          children: [
            const PageHeader(),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const PageHeading(
                        title: 'Log-in',
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextField(
                          textinputtype: TextInputType.emailAddress,
                          controller: emailContrroller,
                          hinttext: "Your email",
                          icon: Icons.person),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextField(
                          obscureText: true,
                          textinputtype: TextInputType.visiblePassword,
                          controller: passwordContrroller,
                          hinttext: "Your password",
                          icon: Icons.lock),
                      const SizedBox(
                        height: 40,
                      ),
                      CustomFormButton(
                          innerText: 'Login'.toUpperCase(), onPressed: _login),
                      const SizedBox(
                        height: 18,
                      ),
                      SizedBox(
                        width: size.width * 0.8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Don\'t have an account ? ',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: AppColors.KFontColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                              onTap: () => {
                                Get.to(() => const SignupScreen()),
                              },
                              child: const Text(
                                'Sign-up',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: AppColors.KSupColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _login() async {
    var apiResponse = await AuthApiController().login(context,
        email: emailContrroller.text, password: passwordContrroller.text);
    if (apiResponse) Get.offNamed('/users_screen');
  }
}
