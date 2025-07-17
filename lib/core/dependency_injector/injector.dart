import 'package:get_it/get_it.dart';
import 'package:training/data/repositories/app_repository.dart';

import '../localization/app_locales.dart';
import '../localization/bloc/localization_bloc.dart';

final getIt = GetIt.instance;

void setupLocalization() {
  getIt.registerSingleton(LocaltizationBloc(AppLocales.vietnamese));
}

void setupDependency() {
  getIt.registerLazySingleton<AppRepository>(() => AppRepositoryImpl());
}
