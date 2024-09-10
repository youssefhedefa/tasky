import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tasky/core/helpers/color_helper.dart';


class CustomTextInputField extends StatelessWidget {
  const CustomTextInputField({super.key, required this.controller, required this.hintText, this.prefixWidget, this.suffixWidget, required this.keyboardType, this.inputFormatters, this.isObscure, this.validatorMessage});

  final TextEditingController controller;
  final String hintText;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool? isObscure;
  final String? validatorMessage;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      inputFormatters: inputFormatters,
      obscureText: isObscure ?? false,
      validator: (value) {
        if (value!.isEmpty) {
          return validatorMessage ?? 'This field is required';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hintText,
        border: getInputBorder(),
        enabledBorder: getInputBorder(),
        focusedBorder: getInputBorder(),
        prefixIcon: prefixWidget,
        suffixIcon: suffixWidget,
      ),
    );
  }

  OutlineInputBorder getInputBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(
        color: AppColorHelper.greyColor,
        width: 2,
      ),
    );
  }

}
