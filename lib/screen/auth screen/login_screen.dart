import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopingapi/api/controllers/auth_api_controller.dart';
import 'package:shopingapi/screen/auth%20screen/signup_screen.dart';
import 'package:shopingapi/constant/colors_app.dart';
import 'package:shopingapi/util/helper.dart';
import 'package:shopingapi/widgets/custom_form_button.dart';
import 'package:shopingapi/widgets/custom_text_field.dart';
import 'package:shopingapi/widgets/page_header.dart';
import 'package:shopingapi/widgets/page_heading.dart';
import 'package:shopingapi/widgets/widget_loadidng.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with Helper {
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
                                  fontSize: 14,
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
                                  fontSize: 13,
                                  color: AppColors.KSupColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextButton(
                          onPressed: () {
                            Get.toNamed('/forgot_password_screen');
                          },
                          child: Text('Forgot your password ?',
                              style: GoogleFonts.montserrat(
                                  color: AppColors.KSupColor, fontSize: 13)))
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
    if (emailContrroller.text.isNotEmpty &&
        passwordContrroller.text.isNotEmpty) {
      WidgetLoadding(context);
      var apiResponse = await AuthApiController().login(context,
          email: emailContrroller.text, password: passwordContrroller.text);
      Navigator.pop(context);
      if (apiResponse) Get.offNamed('/users_screen');
    } else {
      ShowSnackBar(context, title: 'ادخل البريد او كلمة المرور');
    }
  }
}
