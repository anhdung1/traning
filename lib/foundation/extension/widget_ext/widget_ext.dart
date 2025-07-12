import 'package:flutter/widgets.dart';

extension WidgetExt on Widget {
  Widget marginBottom(double value) => Container(
        margin: EdgeInsets.only(bottom: value),
        child: this,
      );
  Widget marginTop(double value) => Container(
        margin: EdgeInsets.only(top: value),
        child: this,
      );

  Widget marginLeft(double value) => Container(
        margin: EdgeInsets.only(left: value),
        child: this,
      );

  Widget marginRight(double value) => Container(
        margin: EdgeInsets.only(right: value),
        child: this,
      );
  Widget margin(double value) => Container(
        margin: EdgeInsets.all(value),
        child: this,
      );
  Widget marginHorizontal(double value) => Container(
        margin: EdgeInsets.symmetric(horizontal: value),
        child: this,
      );
  Widget marginVertical(double value) => Container(
        margin: EdgeInsets.symmetric(vertical: value),
        child: this,
      );
  Widget padding({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) =>
      Padding(
        padding:
            EdgeInsets.only(left: left, top: top, right: right, bottom: bottom),
        child: this,
      );
  Widget paddingHorizontal(double value) => Padding(
        padding: EdgeInsets.symmetric(horizontal: value),
        child: this,
      );
  Widget paddingVertical(double value) => Padding(
        padding: EdgeInsets.symmetric(vertical: value),
        child: this,
      );
  Widget paddingAll(double value) => Padding(
        padding: EdgeInsets.all(value),
        child: this,
      );
}
