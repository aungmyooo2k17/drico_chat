import 'package:drico_chat/common_widgets/app_icon_button_widget.dart';
import 'package:drico_chat/common_widgets/auth_input_widget.dart';
import 'package:drico_chat/constants/resources.dart';
import 'package:drico_chat/features/authentication/presentation/sign_up.dart';
import 'package:drico_chat/home_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  static String name = "login";

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Resources.colors.container.background,
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Resources.dimensions.paddings.paddingLarge),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Resources.dimensions.margins.marginMediumLarge,
            ),
            Center(
              child: Image.asset(
                height: MediaQuery.of(context).size.height / 3,
                "assets/images/login.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Text(
              Resources.strings.app.login,
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(
              height: Resources.dimensions.margins.marginMediumLarge,
            ),
            AuthInput(
                hintText: Resources.strings.app.email,
                controller: emailController),
            SizedBox(
              height: Resources.dimensions.margins.marginMediumLarge,
            ),
            AuthInput(
                hintText: Resources.strings.app.password,
                controller: passwordController),
            SizedBox(
              height: Resources.dimensions.margins.marginMediumLarge,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(HomePage.name);
                  },
                  child: Text(Resources.strings.app.login)),
            ),
            SizedBox(
              height: Resources.dimensions.margins.marginExtraLarge,
            ),
            Center(
              child: Text.rich(TextSpan(children: [
                const TextSpan(text: "New to DrioChat?"),
                TextSpan(
                  text: " Register",
                  style: const TextStyle(color: Colors.blue),
                  recognizer: TapGestureRecognizer()
                    ..onTap =
                        () => Navigator.of(context).pushNamed(SignUp.name),
                ),
              ])),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
