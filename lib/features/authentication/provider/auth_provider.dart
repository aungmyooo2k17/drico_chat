import 'package:drico_chat/features/authentication/data/auth_remote_data_source.dart';
import 'package:drico_chat/features/authentication/model/login_model.dart';
import 'package:drico_chat/features/authentication/model/sign_up_model.dart';
import 'package:drico_chat/features/authentication/state/login_state.dart';
import 'package:drico_chat/features/authentication/state/sign_up_state.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRemoteDataSource repo;

  LoginState loginState = const LoginState.initial();
  SignUpState signUpState = const SignUpState.initial();

  AuthProvider({required this.repo});

  void login(LoginModel loginModel) async {
    try {
      loginState = const LoginState.loading();
      notifyListeners();
      final result = await repo.login(loginModel);
      loginState = LoginState.data(result);
    } catch (e) {
      loginState = LoginState.error(e.toString());
    }
    notifyListeners();
  }

  void signUp(SignUpModel signUpModel) async {
    try {
      signUpState = const SignUpState.loading();
      notifyListeners();
      final result = await repo.signUp(signUpModel);
      signUpState = SignUpState.data(result);
    } catch (e) {
      signUpState = SignUpState.error(e.toString());
    }
    notifyListeners();
  }
}
