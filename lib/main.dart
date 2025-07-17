import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training/core/constants/key_constants.dart';
import 'package:training/core/localization/bloc/localization_bloc.dart';
import 'package:training/core/localization/bloc/localization_state.dart';
import 'package:training/data/local/prefs/shared_prefs.dart';
import 'package:training/features/login/login_screen.dart';
import 'package:training/features/home/home.dart';

import 'core/dependency_injector/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sharedPrefs.init();
  setupLocalization();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LocaltizationBloc>(
        create: (context) => getIt<LocaltizationBloc>(),
        child: BlocBuilder<LocaltizationBloc, LocalizationState>(
            builder: (context, state) => MaterialApp(
                  key: UniqueKey(),
                  debugShowCheckedModeBanner: false,
                  home: sharedPrefs.get(KeyConstants.isLoggedIn) ?? false
                      ? const Home()
                      : const LoginScreen(),
                )));
  }
}
