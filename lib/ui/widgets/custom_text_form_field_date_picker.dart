import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomTextFormFieldDatePicker extends StatefulWidget {
  const CustomTextFormFieldDatePicker({
    this.setDate,
    this.initialValueString = "",
    this.isFullDateTimeFormat = false,
    required this.lableText,
    super.key,
  });

  final Function(String)? setDate;
  final String initialValueString;
  final bool isFullDateTimeFormat;
  final String lableText;

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
    _dateController.text = widget.initialValueString;
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: widget.initialValueString.isNotEmpty
          ? DateFormat('dd/MM/yyyy').parse(widget.initialValueString)
          : DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      if (widget.isFullDateTimeFormat) {
        TimeOfDay? pickedTime = await showTimePicker(
          context: context,
          initialTime:
              TimeOfDay(hour: pickedDate.hour, minute: pickedDate.minute),
        );

        if (pickedTime != null) {
          pickedDate = DateTime(pickedDate.year, pickedDate.month,
              pickedDate.day, pickedTime.hour, pickedTime.minute);
        }
      }

      setState(() {
        _dateController.text = widget.isFullDateTimeFormat
            ? DateFormat('dd/MM/yyyy HH:mm').format(pickedDate!)
            : DateFormat('dd/MM/yyyy').format(pickedDate!);
        widget.setDate!(_dateController.text);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _dateController,
      readOnly: true,
      enabled: widget.setDate != null ? true : false,
      onTap: () {
        _selectDate(context);
      },
      style: TextStyle(
          color: widget.setDate == null ? Colors.grey[400] : Colors.black),
      decoration: InputDecoration(
        labelText: widget.lableText,
        border: const OutlineInputBorder(),
        suffixIcon: const Icon(Icons.calendar_today),
        errorStyle: const TextStyle(height: 0.3),
      ),
      validator: (value) {
        return value!.isEmpty ? "This field cannot be empty" : null;
      },
    );
  }
}
