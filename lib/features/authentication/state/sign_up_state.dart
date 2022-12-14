import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_state.freezed.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState.initial() = InitialState;
  const factory SignUpState.loading() = LoadingState;
  const factory SignUpState.data(String token) = DataState;
  const factory SignUpState.error(String message) = ErrorState;
}
