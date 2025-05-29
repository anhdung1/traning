


import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';
class AuthBloc extends Bloc<AuthEvent,AuthState>{
  AuthBloc() : super(AuthInitial()){
    on<AuthLoginEvent>(_login);
  }


  FutureOr<void> _login(AuthLoginEvent event, Emitter<AuthState> emit) {
    emit(AuthLoading());
    if(event.email == 'admin' && event.password == 'admin'){
      emit(AuthSuccess(message: 'Login Success'));
    }else{
      emit(AuthFailure(message: 'Login Failed'));
    }
  }
}