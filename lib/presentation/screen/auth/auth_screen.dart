import 'package:flutter/material.dart';
import 'package:training/presentation/common/base_screen_view/base_screen_view.dart';
class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreenView(title: 'Sign in', body: _buildBody(),);
  }
}
extension AuthScreenView on AuthScreen {
  _buildBody() {
    return Column(
      children: [
        Text('')
      ],
    );
  }
}