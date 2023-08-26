import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopingapi/api/controllers/auth_api_controller.dart';
import 'package:shopingapi/constant/colors_app.dart';
import 'package:shopingapi/model/student.dart';
import 'package:shopingapi/util/helper.dart';
import 'package:shopingapi/widgets/custom_form_button.dart';
import 'package:shopingapi/widgets/custom_text_field.dart';
import 'package:shopingapi/widgets/page_header.dart';
import 'package:shopingapi/widgets/page_heading.dart';
import 'package:shopingapi/widgets/widget_loadidng.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> with Helper {
  TextEditingController fullNameContrroller = TextEditingController();
  TextEditingController emailContrroller = TextEditingController();
  TextEditingController passwordContrroller = TextEditingController();
  String _gender = 'M';

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
                        title: 'Sign-up',
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextField(
                          textinputtype: TextInputType.name,
                          controller: fullNameContrroller,
                          hinttext: "Your name",
                          icon: Icons.person),
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
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: RadioListTile(
                              activeColor: AppColors.KPrimaryColor,
                              title: const Text('Male'),
                              value: 'M',
                              groupValue: _gender,
                              onChanged: (String? value) {
                                if (value != null) {
                                  setState(
                                    () => _gender = 'M',
                                  );
                                }
                              },
                            ),
                          ),
                          Expanded(
                            child: RadioListTile(
                              activeColor: AppColors.KPrimaryColor,
                              title: const Text('Female'),
                              value: 'F',
                              groupValue: _gender,
                              onChanged: (String? value) {
                                if (value != null) {
                                  setState(
                                    () => _gender = 'F',
                                  );
                                }
                              },
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomFormButton(
                          innerText: 'Signup'.toUpperCase(),
                          onPressed: _signup),
                      const SizedBox(
                        height: 18,
                      ),
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'Already have an account ? ',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: AppColors.KFontColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                              onTap: () => {
                                Get.back(),
                              },
                              child: const Text(
                                'Log-in',
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
                        height: 30,
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

  Future _signup() async {
    if (emailContrroller.text.isNotEmpty &&
        passwordContrroller.text.isNotEmpty &&
        fullNameContrroller.text.isNotEmpty) {
      WidgetLoadding(context);
      bool apiResponse =
          await AuthApiController().register(context, student: student);
      Navigator.pop(context);
      if (apiResponse) Get.offNamed('/login_screen');
    } else {
      ShowSnackBar(context, title: 'ادخل البريد او كلمة المرور');
    }
  }

  Student get student {
    Student student = Student();
    student.fullName = fullNameContrroller.text;
    student.email = emailContrroller.text;
    student.password = passwordContrroller.text;
    student.gender = _gender;
    return student;
  }
}
