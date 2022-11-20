import 'package:drico_chat/common_widgets/app_icon_button_widget.dart';
import 'package:drico_chat/common_widgets/auth_input_widget.dart';
import 'package:drico_chat/constants/resources.dart';
import 'package:drico_chat/features/authentication/presentation/sign_in.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  static String name = "sign-up";

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Resources.colors.container.background,
      body: SingleChildScrollView(
        child: Padding(
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
                  "assets/images/signup.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                "Sign up",
                style: Theme.of(context).textTheme.headline4,
              ),
              SizedBox(
                height: Resources.dimensions.margins.marginMediumLarge,
              ),
              AuthInput(
                  icon: Icons.alternate_email,
                  hintText: Resources.strings.app.email,
                  controller: emailController),
              SizedBox(
                height: Resources.dimensions.margins.marginMediumLarge,
              ),
              AuthInput(
                icon: Icons.person,
                hintText: Resources.strings.app.username,
                controller: usernameController,
              ),
              SizedBox(
                height: Resources.dimensions.margins.marginMediumLarge,
              ),
              AuthInput(
                  icon: Icons.lock,
                  hintText: Resources.strings.app.password,
                  controller: passwordController),
              SizedBox(
                height: Resources.dimensions.margins.marginMediumLarge,
              ),
              const Text.rich(TextSpan(children: [
                TextSpan(text: "By signing up your are agree to our"),
                TextSpan(
                    text: " Terms & Conditions",
                    style: TextStyle(color: Colors.blue)),
                TextSpan(text: " and "),
                TextSpan(
                    text: "Privacy Policy",
                    style: TextStyle(color: Colors.blue)),
              ])),
              SizedBox(
                height: Resources.dimensions.margins.marginMediumLarge,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {},
                    child: Text(Resources.strings.app.signup)),
              ),
              SizedBox(
                height: Resources.dimensions.margins.marginExtraLarge,
              ),
              Center(
                child: Text.rich(TextSpan(children: [
                  const TextSpan(text: "Joined us before?"),
                  TextSpan(
                    text: " Login",
                    style: const TextStyle(color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap =
                          () => Navigator.of(context).pushNamed(SignIn.name),
                  ),
                ])),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
