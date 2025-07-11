import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.authenticated() = _Authenticated;
  const factory LoginState.unauthenticated() = _Unauthenticated;
  const factory LoginState.loading() = _Loading;
  const factory LoginState.error(String message) = _Error;
}
