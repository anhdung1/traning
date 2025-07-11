import 'package:flutter/widgets.dart';

extension TextStyleExt on TextStyle {
  TextStyle copyWith(
      {FontStyle? fontStyle,
      FontWeight? fontWeight,
      double? fontSize,
      Color? color,
      double? letterSpacing,
      double? wordSpacing,
      double? height,
      Color? backgroundColor,
      List<Shadow>? shadows,
      TextDecoration? decoration,
      Color? decorationColor,
      TextDecorationStyle? decorationStyle,
      double? decorationThickness}) {
    return TextStyle(
      fontSize: fontSize ?? this.fontSize,
      fontWeight: fontWeight ?? this.fontWeight,
      color: color ?? this.color,
      letterSpacing: letterSpacing ?? this.letterSpacing,
      wordSpacing: wordSpacing ?? this.wordSpacing,
      height: height ?? this.height,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      shadows: shadows ?? this.shadows,
      fontStyle: fontStyle ?? this.fontStyle,
      decoration: decoration ?? this.decoration,
      decorationColor: decorationColor ?? this.decorationColor,
      decorationStyle: decorationStyle ?? this.decorationStyle,
      decorationThickness: decorationThickness ?? this.decorationThickness,
    );
  }
}
