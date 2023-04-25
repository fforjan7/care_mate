import 'package:flutter/material.dart';

class CustomPopupForm extends StatelessWidget {
  final Function() onPressed;
  final String title1;
  final String? title2;
  final String? title3;
  final Function(String) onChanged1;
  final Function(String)? onChanged2;
  final Function(String)? onChanged3;

  const CustomPopupForm({
    required this.onPressed,
    required this.title1,
    this.title2,
    this.title3,
    required this.onChanged1,
    this.onChanged2,
    this.onChanged3,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: title1,
                ),
                onChanged: onChanged1,
              ),
            ),
            if (title2 != null && onChanged2 != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: title2,
                  ),
                  onChanged: onChanged2,
                ),
              ),
            if (title3 != null && onChanged3 != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: title3,
                  ),
                  onChanged: onChanged3,
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
                    // Add item logic here
                    onPressed();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
