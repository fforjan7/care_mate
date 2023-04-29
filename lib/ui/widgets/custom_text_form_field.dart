import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    this.onChanged,
    required this.labelText,
    this.initialValue,
    this.textInputType = TextInputType.text,
    super.key,
  });

  final Function(String)? onChanged;
  final String labelText;
  final String? initialValue;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      initialValue: initialValue,
      enabled: onChanged == null ? false : true,
      style:
          TextStyle(color: onChanged == null ? Colors.grey[400] : Colors.black),
      keyboardType: textInputType,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
        errorStyle: const TextStyle(height: 0.3),
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
    for (int i = 0; i < words.length; i++) {
      String word = words[i];
      if (word.isNotEmpty) {
        formatted.write(word[0].toUpperCase());
        formatted.write(word.substring(1).toLowerCase());
        if (i < words.length - 1) {
          formatted.write(' ');
        }
      }
    }
    return TextEditingValue(
      text: formatted.toString(),
      selection: newValue.selection,
      composing: TextRange.empty,
    );
  }
}
