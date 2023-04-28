import 'package:care_mate/utils/validator.dart';
import 'package:flutter/material.dart';

class AuthFormField extends StatelessWidget {
  const AuthFormField({
    required this.onChanged,
    this.labelText,
    this.inputType,
    super.key,
  });

  final Function(String) onChanged;
  final String? labelText;
  final InputType? inputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      obscureText: inputType == InputType.password ? true : false,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
        errorStyle: const TextStyle(height: 0.3),
      ),
      validator: (value) {
        if (inputType == InputType.email) {
          String errorMessage = Validator.validate(value, inputType!);
          return errorMessage.isNotEmpty ? errorMessage : null;
        }
        return value!.isEmpty ? "This field cannot be empty" : null;
      },
    );
  }
}
