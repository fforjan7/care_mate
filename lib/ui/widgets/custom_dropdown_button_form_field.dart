import 'package:flutter/material.dart';

import '../../common/enums/gender_enum.dart';

class CustomDropdownButtonFormField extends StatelessWidget {
  final String? initialValue;
  final void Function(String?)? onChanged;

  const CustomDropdownButtonFormField({
    super.key,
    this.initialValue,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: initialValue,
      onChanged: onChanged,
      decoration: const InputDecoration(
        labelText: 'Gender',
        border: OutlineInputBorder(),
      ),
      items: Gender.values
          .map((gender) => DropdownMenuItem<String>(
                value: gender.toString().split('.').last,
                child: Text(gender.toString().split('.').last),
              ))
          .toList(),
      validator: (value) {
        if (value == null) {
          return 'Please select a gender';
        }
        return null;
      },
    );
  }
}
