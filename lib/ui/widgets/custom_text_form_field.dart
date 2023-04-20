import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    required this.onChanged,
    required this.hintText,
    this.initialValue,
    super.key,
  });

  final Function(String) onChanged;
  final String hintText;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      initialValue: initialValue,
      decoration: InputDecoration(
        hintText: hintText,
      ),
      validator: (value) {
        return value!.isEmpty ? "This field cannot be empty" : null;
      },
    );
  }
}
