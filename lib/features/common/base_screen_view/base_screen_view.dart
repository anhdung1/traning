import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training/contants/string_contants/size_contants.dart';
import 'package:training/core/localization/bloc/localization_bloc.dart';
import 'package:training/core/localization/bloc/localization_state.dart';
import 'package:training/foundation/extension/widget_ext/widget_ext.dart';
import 'package:training/features/common/app_loading/app_loading.dart';

class BaseScreenView extends StatefulWidget {
  const BaseScreenView(
      {super.key, required this.title, this.onBackPressed, required this.body});

  @override
  State<BaseScreenView> createState() => _BaseScreenViewState();

  final String title;
  final Function? onBackPressed;
  final Widget body;
}

class _BaseScreenViewState extends State<BaseScreenView> {
  @override
  Widget build(BuildContext context) {
    LocalizationState state = context.watch<LocaltizationBloc>().state;
    return Stack(
      children: [
        Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: widget.body.padding(
                left: SizeContants.paddingMedium,
                right: SizeContants.paddingMedium)),
        state.maybeWhen(
          orElse: () => const SizedBox(),
          loading: () => const AppLoading(),
        )
      ],
    );
  }
}
