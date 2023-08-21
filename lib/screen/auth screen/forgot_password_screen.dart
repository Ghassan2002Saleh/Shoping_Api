import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopingapi/api/controllers/auth_api_controller.dart';
import 'package:shopingapi/constant/colors_app.dart';
import 'package:shopingapi/screen/auth%20screen/reset_password_screen.dart';
import 'package:shopingapi/util/helper.dart';
import 'package:shopingapi/widgets/custom_form_button.dart';
import 'package:shopingapi/widgets/custom_text_field.dart';
import 'package:shopingapi/widgets/page_header.dart';
import 'package:shopingapi/widgets/page_heading.dart';
import 'package:shopingapi/widgets/widget_loadidng.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen>
    with Helper {
  TextEditingController emailContrroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                        title: 'Forget Password',
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
                        height: 40,
                      ),
                      CustomFormButton(
                          innerText: 'Login'.toUpperCase(),
                          onPressed: _forgotPassword),
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

  Future<void> _forgotPassword() async {
    if (emailContrroller.text.isNotEmpty) {
      WidgetLoadding(context);
      var apiResponse = await AuthApiController()
          .forgotPassword(context, email: emailContrroller.text);
      Navigator.pop(context);
      if (apiResponse) {
        Get.to(() => ResetPasswordScreen(
              email: emailContrroller.text,
            ));
      }
    } else {
      ShowSnackBar(context, title: 'ادخل البريد او كلمة المرور', isError: true);
    }
  }
}
