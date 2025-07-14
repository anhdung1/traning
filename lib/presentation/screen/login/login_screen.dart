import 'package:flutter/material.dart';
import 'package:training/presentation/common/base_screen_view/base_screen_view.dart';
import 'package:training/presentation/common/labeled_input/labeled_input.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreenView(
      title: 'Sign in',
      body: _buildBody(),
    );
  }
}

extension AuthScreenView on LoginScreen {
  _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // TODO: Need replace
        LabeledInput(
          label: 'User Name',
        )
      ],
    );
  }
}
