import 'package:flutter/widgets.dart';

class Gap extends StatelessWidget {
  const Gap(this.value, {super.key});
  final double value;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: value, top: value),
    );
  }
}
