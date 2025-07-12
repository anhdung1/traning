import 'package:flutter/material.dart';
import 'package:training/core/constants/key_constants.dart';
import 'package:training/data/local/prefs/shared_prefs.dart';
import 'package:training/presentation/screen/login/auth_screen.dart';
import 'package:training/presentation/screen/home/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sharedPrefs.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: sharedPrefs.get(KeyConstants.isLoggedIn) ?? false
          ? const Home()
          : const AuthScreen(),
    );
  }
}
