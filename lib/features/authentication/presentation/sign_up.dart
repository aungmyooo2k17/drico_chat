import 'package:drico_chat/common_widgets/app_icon_button_widget.dart';
import 'package:drico_chat/common_widgets/auth_input_widget.dart';
import 'package:drico_chat/constants/resources.dart';
import 'package:drico_chat/features/authentication/model/sign_up_model.dart';
import 'package:drico_chat/features/authentication/presentation/sign_in.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/auth_provider.dart';
import '../state/sign_up_state.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  static String name = "sign-up";

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  SignUpModel signUp = SignUpModel();
  final _formKey = GlobalKey<FormState>();
  String? pwdError;
  String? emailError;
  String? usernameError;
  AuthProvider? provider;

  @override
  void initState() {
    provider = context.read<AuthProvider>();
    provider?.addListener(listenerFun);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AuthProvider>(context);
    return Scaffold(
      backgroundColor: Resources.colors.container.background,
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Resources.dimensions.paddings.paddingLarge),
            child: Form(
              key: _formKey,
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
                    errorText: emailError,
                    icon: Icons.alternate_email,
                    hintText: Resources.strings.app.email,
                    validator: (value) {
                      if (value!.isEmpty) return "Enter your email";
                      _formKey.currentState?.save();
                      return null;
                    },
                    onSaved: (value) {
                      signUp = signUp.copyWith(email: value);
                    },
                  ),
                  SizedBox(
                    height: Resources.dimensions.margins.marginMediumLarge,
                  ),
                  AuthInput(
                    errorText: usernameError,
                    icon: Icons.person,
                    hintText: Resources.strings.app.username,
                    validator: (value) {
                      if (value!.isEmpty) return "Enter your username";
                      _formKey.currentState?.save();
                      return null;
                    },
                    onSaved: (value) {
                      signUp = signUp.copyWith(username: value);
                    },
                  ),
                  SizedBox(
                    height: Resources.dimensions.margins.marginMediumLarge,
                  ),
                  AuthInput(
                    errorText: pwdError,
                    obscureText: true,
                    icon: Icons.lock,
                    hintText: Resources.strings.app.password,
                    validator: (value) {
                      if (value!.isEmpty) return "Enter your password";
                      _formKey.currentState?.save();
                      return null;
                    },
                    onSaved: (value) {
                      signUp = signUp.copyWith(password: value);
                    },
                  ),
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
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState?.save();

                            provider?.signUp(signUp);
                          }
                        },
                        child: provider?.signUpState is LoadingState
                            ? const CircularProgressIndicator()
                            : Text(Resources.strings.app.signup)),
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
                          ..onTap = () =>
                              Navigator.of(context).pushNamed(SignIn.name),
                      ),
                    ])),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    provider?.removeListener(listenerFun);
  }

  void listenerFun() {
    if (provider?.signUpState is DataState) {
      goLogin(context);
    } else if (provider?.signUpState is ErrorState) {
      showErrorMessage();
    }
  }

  goLogin(context) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(SignIn.name, (Route<dynamic> route) => false);
  }

  showErrorMessage() {
    emailError = "Something went wrong";
    pwdError = "Something went wrong";
    usernameError = "Something went wrong";
  }
}
