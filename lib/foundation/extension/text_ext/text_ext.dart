import 'package:flutter/widgets.dart';

extension TextExt on Text {
  Text s14w400() => copyWith(
      style: const TextStyle()
          .copyWith(fontSize: 14, fontWeight: FontWeight.w400));
  Text s16w400() => copyWith(
      style: const TextStyle()
          .copyWith(fontSize: 16, fontWeight: FontWeight.w400));
  Text s18w700() => copyWith(
      style: const TextStyle()
          .copyWith(fontSize: 18, fontWeight: FontWeight.w700));

  Text copyWith(
      {Key? key,
      String? data,
      StrutStyle? strutStyle,
      TextAlign? textAlign,
      TextDirection? textDirection,
      Locale? locale,
      bool? softWrap,
      TextOverflow? overflow,
      TextScaler? textScaler,
      int? maxLines,
      String? semanticsLabel,
      TextWidthBasis? textWidthBasis,
      TextStyle? style}) {
    return Text(
      data ?? this.data ?? '',
      key: key,
      style: style ?? this.style,
      textAlign: textAlign ?? this.textAlign,
      textDirection: textDirection ?? this.textDirection,
      locale: locale ?? this.locale,
      softWrap: softWrap ?? this.softWrap,
      overflow: overflow ?? this.overflow,
      maxLines: maxLines ?? this.maxLines,
      semanticsLabel: semanticsLabel ?? this.semanticsLabel,
      textWidthBasis: textWidthBasis ?? this.textWidthBasis,
    );
  }
}
