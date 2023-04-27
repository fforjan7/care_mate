import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomTextFormFieldDatePicker extends StatefulWidget {
  const CustomTextFormFieldDatePicker({
    required this.setDate,
    this.initialValueString = "",
    super.key,
  });

  final Function(String) setDate;
  final String initialValueString;

  @override
  State<CustomTextFormFieldDatePicker> createState() =>
      _CustomTextFormFieldDatePickerState();
}

class _CustomTextFormFieldDatePickerState
    extends State<CustomTextFormFieldDatePicker> {
  final TextEditingController _dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: widget.initialValueString != ""
          ? DateFormat('dd/MM/yyyy').parse(widget.initialValueString)
          : DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        _dateController.text = DateFormat('dd/MM/yyyy').format(picked);
        widget.setDate(_dateController.text);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _dateController,
      readOnly: true,
      onTap: () {
        _selectDate(context);
      },
      decoration: const InputDecoration(
        hintText: 'Select date',
        border: OutlineInputBorder(),
        suffixIcon: Icon(Icons.calendar_today),
      ),
      validator: (value) {
        return value!.isEmpty ? "This field cannot be empty" : null;
      },
    );
  }
}
