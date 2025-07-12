import 'package:flutter/material.dart';
import 'package:training/contants/string_contants/size_contants.dart';
import 'package:training/foundation/extension/widget_ext/widget_ext.dart';

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
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: widget.body.padding(
            left: SizeContants.paddingMedium,
            right: SizeContants.paddingMedium));
  }
}
