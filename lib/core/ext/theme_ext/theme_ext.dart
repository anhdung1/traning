import 'package:flutter/material.dart';

extension ExtTheme on ThemeData {}

abstract class A {
  late String a;
}

class B implements A {
  @override
  String a = '';
}
