import 'package:flutter/material.dart';

class CustomGridElement extends StatelessWidget {
  Function() onTap;
  Icon icon;

  CustomGridElement({
    super.key,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          onTap();
        },
        child: Container(
          color: Colors.transparent,
          child: icon,
        ),
      ),
    );
  }
}
