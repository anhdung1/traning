import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training/core/constants/string_constants.dart';
import 'package:training/core/localization/app_locale_strings.dart';
import 'package:training/core/localization/app_locales.dart';
import 'package:training/core/localization/bloc/localization_bloc.dart';
import 'package:training/features/common/base_screen_view/base_screen_view.dart';
import 'package:training/features/common/labeled_input/labeled_input.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreenView(
      title: G.t.authSignInSignIn,
      body: _buildBody(context),
    );
  }
}

extension AuthScreenView on LoginScreen {
  _buildBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LabeledInput(
          label: G.t.authSignInUsername,
        ),
        InkWell(
          onTap: () => context
              .read<LocaltizationBloc>()
              .add(LocaltizationChanged(langName: AppLocales.english)),
          child: const Text(StringConstants.english),
        ),
        InkWell(
          onTap: () => context
              .read<LocaltizationBloc>()
              .add(LocaltizationChanged(langName: AppLocales.vietnamese)),
          child: const Text(StringConstants.vietnam),
        )
      ],
    );
  }
}
