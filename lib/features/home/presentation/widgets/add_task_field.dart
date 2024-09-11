import 'package:flutter/material.dart';
import 'package:tasky/core/components/custom_text_input_field.dart';
import 'package:tasky/core/helpers/text_style_helper.dart';

class AddTaskField extends StatelessWidget {
  const AddTaskField(
      {super.key,
        required this.label,
        this.controller,
        this.hintText,
        this.isMultiline,
        this.input});

  final String label;
  final Widget? input;
  final TextEditingController? controller;
  final String? hintText;
  final bool? isMultiline;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 16,
        ),
        Text(
          label,
          style: AppTextStyleHelper.font12RegularGrey,
        ),
        const SizedBox(height: 8),
        input ??
            CustomTextInputField(
              controller: controller!,
              hintText: hintText!,
              keyboardType: TextInputType.text,
              isMultiline: isMultiline,
            ),
      ],
    );
  }
}
