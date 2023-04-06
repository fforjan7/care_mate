import 'package:flutter/material.dart';

class AuthFormField extends StatelessWidget {
  const AuthFormField({
    required this.onChanged,
    this.isObscured = false,
    super.key,
  });

  final Function(String) onChanged;
  final bool isObscured;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      obscureText: isObscured,
    );
  }
}
