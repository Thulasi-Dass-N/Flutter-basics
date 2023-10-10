import 'package:flutter/material.dart';
import 'package:flutter_learning/utils/input_styles.dart';

class AppInput extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final FormFieldValidator<String>? validator;
  final bool hidePassword;

  const AppInput(
      {super.key,
      required this.controller,
      required this.hintText,
      this.validator,
      this.hidePassword = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (validator != null) {
          return validator!(value);
        } else {
          return null;
        }
      },
      obscureText: hidePassword,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: InputStyles.loginTextStyle,
        contentPadding: const EdgeInsets.all(15),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}
