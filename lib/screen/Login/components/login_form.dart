import 'package:flutter/material.dart';
import 'package:shopingapi/constant/colors_app.dart';
import 'package:shopingapi/widgets/custom_text_field.dart';
import '../../../components/already_have_an_account_acheck.dart';
import '../../../constant/constants.dart';
import '../../Signup/signup_screen.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CustomTextField(
          textinputtype: TextInputType.emailAddress,
          onChange: (val) {},
          hinttext: "Your email",
          icon: Icons.person),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: defaultPadding),
        child: CustomTextField(
            obscureText: true,
            textinputtype: TextInputType.visiblePassword,
            onChange: (val) {},
            hinttext: "Your password",
            icon: Icons.lock),
      ),
      const SizedBox(height: defaultPadding),
      Hero(
        tag: "login_btn",
        child: ElevatedButton(
          onPressed: () {},
          child: Text(
            "Login".toUpperCase(),
            style: const TextStyle(color: AppColors.kPrimaryLightColor),
          ),
        ),
      ),
      const SizedBox(height: defaultPadding),
      AlreadyHaveAnAccountCheck(
        press: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const SignUpScreen();
              },
            ),
          );
        },
      ),
    ]);
  }
}
