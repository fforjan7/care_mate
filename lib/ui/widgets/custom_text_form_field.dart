import 'package:flutter/material.dart';

class CutomTextFormField extends StatelessWidget {
  const CutomTextFormField({
    required this.onChanged,
    super.key,
  });

  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
    );
  }
}
