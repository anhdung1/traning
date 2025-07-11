import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_state.dart';

part 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState.initial()) {
    on<LoginSubmitEvent>(_login);
  }

  FutureOr<void> _login(LoginSubmitEvent event, Emitter<LoginState> emit) {
    emit(const LoginState.loading());
    if (event.email == 'admin' && event.password == 'admin') {
      emit(const LoginState.authenticated());
    } else {
      emit(const LoginState.error('Invalid email or password'));
    }
  }
}
