import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopingapi/api/controllers/auth_api_controller.dart';
import 'package:shopingapi/constant/colors_app.dart';
import 'package:shopingapi/util/helper.dart';
import 'package:shopingapi/widgets/code_text_field.dart';
import 'package:shopingapi/widgets/custom_form_button.dart';
import 'package:shopingapi/widgets/custom_text_field.dart';
import 'package:shopingapi/widgets/page_header.dart';
import 'package:shopingapi/widgets/page_heading.dart';
import 'package:shopingapi/widgets/widget_loadidng.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key, required this.email}) : super(key: key);
  final String email;

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> with Helper {
  TextEditingController passwordContrroller = TextEditingController();
  TextEditingController passwordConfirmationContrroller =
      TextEditingController();
  TextEditingController firstContrroller = TextEditingController();
  TextEditingController secondContrroller = TextEditingController();
  TextEditingController thirdContrroller = TextEditingController();
  TextEditingController fourthContrroller = TextEditingController();

  FocusNode fistFocusNode = FocusNode();
  FocusNode secondFocusNode = FocusNode();
  FocusNode thirdFocusNode = FocusNode();
  FocusNode fourthFocusNode = FocusNode();
  String code = '';

  getcode() async {
    var sharedPrf = await SharedPreferences.getInstance();
    showMyDiloag(text: "${sharedPrf.getString('code')}");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getcode();
  }

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
                        title: 'Reset Password',
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          children: [
                            CodeTextField(
                              controller: firstContrroller,
                              focusNode: fistFocusNode,
                              onChange: (value) {
                                if (value.isNotEmpty) {
                                  secondFocusNode.requestFocus();
                                }
                              },
                              onSubmitted: (value) {
                                // if (value.isNotEmpty) {
                                //   secondFocusNode.requestFocus();
                                // }
                              },
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            CodeTextField(
                              controller: secondContrroller,
                              focusNode: secondFocusNode,
                              onChange: (value) {
                                value.isNotEmpty
                                    ? thirdFocusNode.requestFocus()
                                    : fistFocusNode.requestFocus();
                              },
                              onSubmitted: (value) {
                                // value.isNotEmpty
                                //     ? thirdFocusNode.requestFocus()
                                //     : fistFocusNode.requestFocus();
                              },
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            CodeTextField(
                              controller: thirdContrroller,
                              focusNode: thirdFocusNode,
                              onChange: (value) {
                                value.isNotEmpty
                                    ? fourthFocusNode.requestFocus()
                                    : secondFocusNode.requestFocus();
                              },
                              onSubmitted: (value) {
                                // value.isNotEmpty
                                //     ? fourthFocusNode.requestFocus()
                                //     : secondFocusNode.requestFocus();
                              },
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            CodeTextField(
                              controller: fourthContrroller,
                              focusNode: fourthFocusNode,
                              onChange: (value) {
                                if (value.isEmpty) {
                                  thirdFocusNode.requestFocus();
                                }
                              },
                              onSubmitted: (value) {
                                // if (value.isEmpty) {
                                //   thirdFocusNode.requestFocus();
                                // }
                              },
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                          textinputtype: TextInputType.emailAddress,
                          controller: passwordContrroller,
                          hinttext: "Your password",
                          icon: Icons.person),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextField(
                          obscureText: true,
                          textinputtype: TextInputType.visiblePassword,
                          controller: passwordConfirmationContrroller,
                          hinttext: "password confirmation",
                          icon: Icons.lock),
                      const SizedBox(
                        height: 40,
                      ),
                      CustomFormButton(
                          innerText: 'Save'.toUpperCase(),
                          onPressed: _resetPassword),
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

  bool checkCode() {
    code = firstContrroller.text +
        secondContrroller.text +
        thirdContrroller.text +
        fourthContrroller.text;
    if (code.length == 4) {
      print(code.length);
      return true;
    }

    return false;
  }

  Future<void> _resetPassword() async {
    checkCode();
    if (passwordConfirmationContrroller.text.isNotEmpty &&
        passwordContrroller.text.isNotEmpty) {
      WidgetLoadding(context);
      var apiResponse = await AuthApiController().resetPassword(context,
          email: widget.email,
          code: code,
          password_confirmation: passwordConfirmationContrroller.text,
          password: passwordContrroller.text);
      Navigator.pop(context);
      if (apiResponse) Get.offNamed('/login_screen');
    } else {
      ShowSnackBar(context, title: 'ادخل البريد او كلمة المرور');
    }
  }
}
