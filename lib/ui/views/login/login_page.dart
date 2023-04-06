import 'package:care_mate/ui/views/login/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Care Mate'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: CustomTextFormField(),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: CustomTextFormField(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Button"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
