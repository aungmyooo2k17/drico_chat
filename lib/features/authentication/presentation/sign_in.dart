import 'package:drico_chat/common_widgets/app_icon_button_widget.dart';
import 'package:drico_chat/common_widgets/auth_input_widget.dart';
import 'package:drico_chat/constants/resources.dart';
import 'package:drico_chat/features/authentication/model/login_model.dart';
import 'package:drico_chat/features/authentication/presentation/sign_up.dart';
import 'package:drico_chat/features/authentication/provider/auth_provider.dart';
import 'package:drico_chat/features/authentication/state/login_state.dart';
import 'package:drico_chat/home_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  static String name = "login";

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  LoginModel loginModel = LoginModel();

  String? pwdError;
  String? emailError;

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
      body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Resources.dimensions.paddings.paddingLarge),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
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
                    type: TextInputType.emailAddress,
                    errorText: emailError,
                    icon: Icons.alternate_email,
                    hintText: Resources.strings.app.email,
                    validator: (value) {
                      if (value!.isEmpty) return "Enter your email";
                      return null;
                    },
                    onSaved: (value) {
                      loginModel = loginModel.copyWith(email: value);
                    },
                  ),
                  SizedBox(
                    height: Resources.dimensions.margins.marginMediumLarge,
                  ),
                  AuthInput(
                    obscureText: true,
                    errorText: pwdError,
                    icon: Icons.lock,
                    hintText: Resources.strings.app.password,
                    validator: (value) {
                      if (value!.isEmpty) return "Enter your password";
                      _formKey.currentState?.save();
                      return null;
                    },
                    onSaved: (value) {
                      loginModel = loginModel.copyWith(password: value);
                    },
                  ),
                  SizedBox(
                    height: Resources.dimensions.margins.marginMediumLarge,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                vertical:
                                    Resources.dimensions.paddings.paddingMedium,
                                horizontal: Resources
                                    .dimensions.paddings.paddingLarge)),
                        onPressed: () async {
                          goHome(context);
                          // if (_formKey.currentState!.validate()) {
                          //   _formKey.currentState?.save();

                          //   provider?.login(loginModel);

                          //   if (provider?.loginState is DataState) {
                          //     goHome(context);
                          //   } else if (provider?.loginState is ErrorState) {
                          //     showErrorMessage();
                          //   }
                          // }
                        },
                        child: provider?.loginState is LoadingState
                            ? const CircularProgressIndicator()
                            : Text(Resources.strings.app.login)),
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
                          ..onTap = () =>
                              Navigator.of(context).pushNamed(SignUp.name),
                      ),
                    ])),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  @override
  void dispose() {
    super.dispose();
    provider?.removeListener(listenerFun);
  }

  void listenerFun() {
    if (provider?.loginState is DataState) {
      goHome(context);
    } else if (provider?.loginState is ErrorState) {
      showErrorMessage();
    }
  }

  goHome(context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
        HomePage.name, (Route<dynamic> route) => false);
  }

  showErrorMessage() {
    emailError = "Something went wrong";
    pwdError = "Something went wrong";
  }
}
