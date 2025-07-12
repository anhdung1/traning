import 'package:flutter/material.dart';
import 'package:training/presentation/common/base_screen_view/base_screen_view.dart';
import 'package:training/presentation/common/custom_text_form_field/custom_text_form_field.dart';
import 'package:training/foundation/extension/text_ext/text_ext.dart';
import 'package:training/presentation/common/labeled_input/labeled_input.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreenView(
      title: 'Sign in',
      body: _buildBody(),
    );
  }
}

extension AuthScreenView on AuthScreen {
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
