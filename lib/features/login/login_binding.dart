import 'package:training/core/dependency_injector/app_binding.dart';
import 'package:training/core/dependency_injector/injector.dart';
import 'package:training/domain/usecase/login/login_usecase.dart';
import 'package:training/features/login/login_bloc/login_bloc.dart';

class LoginBinding extends AppBinding {
  @override
  void setup() {
    getIt
      ..registerLazySingleton(() => LoginBloc())
      ..registerLazySingleton(() => LoginUsecase());
  }
}
