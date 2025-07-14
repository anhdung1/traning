import 'package:flutter/material.dart';
import 'package:training/foundation/extension/common_colors/common_colors.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
            child: ColoredBox(color: CommonColors.backgroundColor.loadingColor))
      ],
    );
  }
}
