import 'package:drico_chat/features/authentication/data/auth_remote_data_source.dart';
import 'package:drico_chat/features/authentication/model/login_model.dart';
import 'package:drico_chat/features/authentication/model/sign_up_model.dart';
import 'package:drico_chat/features/authentication/presentation/sign_up.dart';
import 'package:injectable/injectable.dart';

abstract class IAuthRepo {
  Future<String> login(LoginModel loginModel);
  Future<String> signUp(SignUpModel signUpModel);
}

@LazySingleton(as: IAuthRepo)
class AuthRepo implements IAuthRepo {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepo({required this.remoteDataSource});

  @override
  Future<String> login(LoginModel loginModel) {
    return remoteDataSource.login(loginModel);
  }

  @override
  Future<String> signUp(SignUpModel signUpModel) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
