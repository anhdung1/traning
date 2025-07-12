import 'dart:ui';

extension CommonColors on Color {
  static BackgroundColor? _commonColors;
  static TextColors? _textColors;
  static BackgroundColor get backgroundColor =>
      _commonColors ??= BackgroundColor();
  static TextColors get textColors => _textColors ??= TextColors();
}

class BackgroundColor {
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color red = Color(0xFFFF0000);
  static const Color green = Color(0xFF00FF00);
  static const Color blue = Color(0xFF0000FF);
  static const Color yellow = Color(0xFFFFFF00);
  static const Color orange = Color(0xFFFFA500);
  static const Color purple = Color(0xFF800080);
  static const Color brown = Color(0xFFA52A2A);
  static const Color gray = Color(0xFF808080);
  static const Color lightGray = Color(0xFFD3D3D3);
  static const Color darkGray = Color(0xFFA9A9A9);
  static const Color teal = Color(0xFF008080);
  static const Color cyan = Color(0xFF00FFFF);
  static const Color pink = Color(0xFFFFC0CB);
  static const Color indigo = Color(0xFF4B0082);
}

class TextColors {
  static const Color primary = Color(0xFF212121);
  static const Color secondary = Color(0xFF757575);
  static const Color accent = Color(0xFF03A9F4);
  static const Color error = Color(0xFFF44336);
  static const Color warning = Color(0xFFFF9800);
  static const Color info = Color(0xFF2196F3);
  static const Color success = Color(0xFF4CAF50);
}
