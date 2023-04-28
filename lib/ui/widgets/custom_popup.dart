import 'package:care_mate/ui/widgets/custom_text_form_field.dart';
import 'package:care_mate/ui/widgets/custom_text_form_field_date_picker.dart';
import 'package:flutter/material.dart';

class CustomPopupForm extends StatelessWidget {
  final Function() onPressed;
  final String title1;
  final String? title2;
  final Function(String) onChanged1;
  final Function(String)? onChanged2;
  final Function(String)? setDate;

  const CustomPopupForm({
    required this.onPressed,
    required this.title1,
    this.title2,
    required this.onChanged1,
    this.onChanged2,
    this.setDate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Enter details:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CustomTextFormField(
                  labelText: title1,
                  onChanged: onChanged1,
                ),
              ),
              if (title2 != null && onChanged2 != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: CustomTextFormField(
                    labelText: title2!,
                    onChanged: onChanged2!,
                  ),
                ),
              if (setDate != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: CustomTextFormFieldDatePicker(
                    setDate: setDate,
                  ),
                ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  TextButton(
                    child: const Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  ElevatedButton(
                    child: const Text('Add'),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        onPressed();
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
