import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    this.onChanged,
    required this.labelText,
    this.initialValue,
    super.key,
  });

  final Function(String)? onChanged;
  final String labelText;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      initialValue: initialValue,
      enabled: onChanged == null ? false : true,
      style:
          TextStyle(color: onChanged == null ? Colors.grey[400] : Colors.black),
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        return value!.isEmpty ? "This field cannot be empty" : null;
      },
      inputFormatters: [CapitalizeWordsTextInputFormatter()],
    );
  }
}

class CapitalizeWordsTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final List<String> words = newValue.text.split(' ');
    final StringBuffer formatted = StringBuffer();
    for (String word in words) {
      if (word.isNotEmpty) {
        formatted.write(word[0].toUpperCase());
        formatted.write(word.substring(1).toLowerCase());
        formatted.write(' ');
      }
    }
    return TextEditingValue(
      text: formatted.toString().trimRight(),
      selection: newValue.selection,
      composing: TextRange.empty,
    );
  }
}
