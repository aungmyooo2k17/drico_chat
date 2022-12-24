import 'package:drico_chat/constants/resources.dart';
import 'package:drico_chat/data/network/api_service.dart';
import 'package:drico_chat/features/authentication/model/login_model.dart';
import 'package:drico_chat/features/authentication/model/sign_up_model.dart';
import 'package:injectable/injectable.dart';

abstract class AuthRemoteDataSource {
  Future<String> login(LoginModel loginModel);
  Future<String> signUp(SignUpModel signInModel);
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient apiClient;

  AuthRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<String> login(LoginModel loginModel) async {
    final response = await apiClient.post(
        path: Resources.strings.apis.login,
        body: loginModel.toJson(),
        auth: "");
    return response["token"];
  }

  @override
  Future<String> signUp(SignUpModel signInModel) async {
    final response = await apiClient.post(
        path: Resources.strings.apis.register,
        body: signInModel.toJson(),
        auth: "");
    print("RESP");
    print(response["message"]);
    return response["message"];
  }
}
