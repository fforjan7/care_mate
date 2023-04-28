import 'package:care_mate/ui/widgets/custom_text_form_field.dart';
import 'package:care_mate/ui/widgets/custom_text_form_field_date_picker.dart';
import 'package:flutter/material.dart';

class CustomPopupForm extends StatelessWidget {
  const CustomPopupForm({
    required this.popupTitle,
    required this.onPressed,
    required this.title1,
    this.title2,
    required this.onChanged1,
    this.onChanged2,
    this.setDate,
    this.textInputType = TextInputType.text,
    this.isFullDateTimeFormat = false,
    super.key,
  });

  final String popupTitle;
  final Function() onPressed;
  final String title1;
  final String? title2;
  final Function(String) onChanged1;
  final Function(String)? onChanged2;
  final Function(String)? setDate;
  final TextInputType textInputType;
  final bool isFullDateTimeFormat;

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
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  popupTitle,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 3),
                child: CustomTextFormField(
                  textInputType: textInputType,
                  labelText: title1,
                  onChanged: onChanged1,
                ),
              ),
              if (title2 != null && onChanged2 != null)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 3),
                  child: CustomTextFormField(
                    textInputType: textInputType,
                    labelText: title2!,
                    onChanged: onChanged2!,
                  ),
                ),
              if (setDate != null)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 3),
                  child: CustomTextFormFieldDatePicker(
                    lableText: "Measurement time",
                    isFullDateTimeFormat: isFullDateTimeFormat,
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
