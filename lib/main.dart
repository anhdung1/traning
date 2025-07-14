import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:training/core/constants/key_constants.dart';
import 'package:training/core/localization/app_locales.dart';
import 'package:training/core/localization/bloc/localization_bloc.dart';
import 'package:training/data/local/prefs/shared_prefs.dart';
import 'package:training/presentation/screen/login/login_screen.dart';
import 'package:training/presentation/screen/home/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sharedPrefs.init();
  final getIt = GetIt.instance;
  runApp(BlocProvider<LocaltizationBloc>(
    create: (context) => getIt.registerSingleton(
        LocaltizationBloc(AppLocales.vietnamese)),
        child: BlocBuilder(builder:(context, state) {
          return SizedBox();
          // switch(state){
          //   case LocaltizationState.
          // }
        },
        ),
        
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: sharedPrefs.get(KeyConstants.isLoggedIn) ?? false
          ? const Home()
          : const LoginScreen(),
    );
  }
}
