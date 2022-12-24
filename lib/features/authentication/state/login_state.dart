import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = InitialState;
  const factory LoginState.loading() = LoadingState;
  const factory LoginState.data(String token) = DataState;
  const factory LoginState.error(String message) = ErrorState;
}
