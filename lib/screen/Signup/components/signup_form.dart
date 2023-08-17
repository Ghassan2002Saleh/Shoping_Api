import 'package:flutter/material.dart';
import 'package:shopingapi/constant/colors_app.dart';
import 'package:shopingapi/widgets/custom_text_field.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../../constant/constants.dart';
import '../../Login/login_screen.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CustomTextField(
              textinputtype: TextInputType.name,
              onChange: (val) {},
              hinttext: "Your name",
              icon: Icons.person),
          Padding(
            padding: const EdgeInsets.only(top: defaultPadding),
            child: CustomTextField(
                textinputtype: TextInputType.emailAddress,
                onChange: (val) {},
                hinttext: "Your email",
                icon: Icons.person),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: CustomTextField(
                obscureText: true,
                textinputtype: TextInputType.visiblePassword,
                onChange: (val) {},
                hinttext: "Your password",
                icon: Icons.lock),
          ),
          const SizedBox(height: defaultPadding / 2),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              "Sign Up".toUpperCase(),
              style: const TextStyle(color: AppColors.kPrimaryLightColor),
            ),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const LoginScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
