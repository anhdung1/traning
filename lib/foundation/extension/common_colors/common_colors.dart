import 'dart:ui';

class CommonColors {
  static BackgroundColor? _commonColors;
  static TextColors? _textColors;
  static BackgroundColor get backgroundColor =>
      _commonColors ??= BackgroundColor();
  static TextColors get textColors => _textColors ??= TextColors();
}

class BackgroundColor {
  final Color black = const Color(0xFF000000);
  final Color white = const Color(0xFFFFFFFF);
  final Color red = const Color(0xFFFF0000);
  final Color green = const Color(0xFF00FF00);
  final Color blue = const Color(0xFF0000FF);
  final Color yellow = const Color(0xFFFFFF00);
  final Color orange = const Color(0xFFFFA500);
  final Color purple = const Color(0xFF800080);
  final Color brown = const Color(0xFFA52A2A);
  final Color gray = const Color(0xFF808080);
  final Color lightGray = const Color(0xFFD3D3D3);
  final Color darkGray = const Color(0xFFA9A9A9);
  final Color teal = const Color.fromARGB(255, 0, 128, 128);
  final Color cyan = const Color(0xFF00FFFF);
  final Color pink = const Color(0xFFFFC0CB);
  final Color indigo = const Color(0xFF4B0082);
  final Color loadingColor = const Color.fromRGBO(218, 218, 218, 0.212);
}

class TextColors {
  final Color primary = const Color(0xFF212121);
  final Color secondary = const Color(0xFF757575);
  final Color accent = const Color(0xFF03A9F4);
  final Color error = const Color(0xFFF44336);
  final Color warning = const Color(0xFFFF9800);
  final Color info = const Color(0xFF2196F3);
  final Color success = const Color(0xFF4CAF50);
}
