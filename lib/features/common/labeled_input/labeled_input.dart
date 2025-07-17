import 'package:flutter/material.dart';
import 'package:training/contants/string_contants/size_contants.dart';
import 'package:training/foundation/extension/text_ext/text_ext.dart';
import 'package:training/foundation/extension/widget_ext/widget_ext.dart';
import 'package:training/features/common/custom_text_form_field/custom_text_form_field.dart';
import 'package:training/features/common/gap/gap.dart';

class LabeledInput extends StatelessWidget {
  const LabeledInput({
    super.key,
    required this.label,
    this.hintText,
    this.marginBottom = 0,
    this.onChanged,
    this.validator,
  });
  final String label;
  final String? hintText;
  final double marginBottom;
  final Function(String value)? onChanged;
  final String Function(String? value)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label).s16w400(),
        const Gap(SizeContants.spacingMedium),
        CustomTextFormField(
          hintText: hintText,
          onChanged: onChanged,
          validator: validator,
        ),
      ],
    ).marginBottom(marginBottom);
  }
}
